package com.dataentry

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import org.springframework.web.context.request.RequestContextHolder

class PlanController {
    def autoCompleteService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        if(params.planID || params.productID || params.planholderName) {
            def plans = Plan.withCriteria {
                and {
                    if(params.productID!='') {
                        eq("product","${params.productID}")
                    }
                    if(params.planID!=''){
                        eq("planNumber","${params.planID}")

                    }
                    if(params.planholderName!=''){
                        planHolder {
                            ilike("firstName","${params.planholderName}%")
                        }
                    }
                }
            }
            params.max = Math.min(max ?: 10, 100)
            [planInstanceList: plans, planInstanceTotal: plans.size()]
        } else {
            params.max = Math.min(max ?: 10, 100)
            [planInstanceList: Plan.list(params), planInstanceTotal: Plan.count()]
        }

    }

    def String planClientValidation(String page, Client clientToInsert, Agent agent, Planholder planholder, ArrayList<Beneficiary> beneficiaries) {
        if((clientToInsert == agent?.clientProfile) && page!="agent" ) {
            return "Client already added as agent."
        } else if ((clientToInsert == planholder?.clientProfile)&& page!="planholder" ) {
            return "Client already added as plan holder."
        } else if (beneficiaries?.clientProfile?.contains(clientToInsert) )  {
            return "Client already added as beneficiary."
        } else {
            return ""
        }
    }

    def createFlow = {
        startup {
            action {
            }
            on('success').to('init')
        }

        init {
            action {
                flow.planInstance =  new Plan()
                flow.agentInstance =  new Agent()
                flow.planholderInstance =  new Planholder()

                flow.createPlanHolderDto = new Planholder()
                flow.createAgentDto = new Agent()

                flow.beneficiaries =  new ArrayList<Beneficiary>()
                flow.amendments = new ArrayList<Amendment>()
                flow.duplicateClientError = ""

            }
            on('success').to('createPlan')
        }

        //State 1
        createPlan {
            on('createPlanHolder'){
                flow.duplicateClientError = ""
                flow.createPlanHolderDto = new Planholder()

                Planholder planHolder = new Planholder()
                if(params.planHolder.id) {
                    planHolder.clientProfile = Client.get(params.planHolder.id)
                }
                Plan plan = new Plan()
                plan.bindParams(params)
                flow.planInstance = plan
                flow.planholderInstance = planHolder
            }.to('createPlanHolder')

            on('beneficiaries'){

            }.to('validatePlan')
        }

            validatePlan() {
                action {
                    flow.duplicateClientError = ""

                    Plan plan = new Plan()
                    plan.bindParams(params)
                    Client client
                    if(params.planHolder.id) {
                        client = Client.get(params.planHolder.id)
                        plan.planHolder.clientProfile = client
                    } else {
                        plan.planHolder = null
                    }
                    flow.planholderInstance = plan.planHolder
                    if(plan.validate()) {
                        def errorCode
                        def page = "planholder"
                        if((flow.planholderInstance.clientProfile == flow.planInstance.agent?.clientProfile) && page!="agent" ) {
                            errorCode = "Client already added as agent."
                        }  else if ( flow.planInstance.beneficiaries?.clientProfile?.contains(flow.planholderInstance.clientProfile) )  {
                            errorCode = "Client already added as beneficiary."
                        } else {
                            errorCode = ""
                        }
                            if(errorCode == "") {
                                flow.planInstance = plan

                                return yes()
                            } else {
                                flow.duplicateClientError = errorCode
                                flow.planInstance = plan
                                return no()
                            }

                    } else {
                        flow.planInstance = plan
                        return no()
                    }
                }

                on("yes").to "beneficiaries"
                on("no").to "createPlan"
            }

        //State  1.a
        createPlanHolder {
            on("return"){
            }.to("createPlan")

            on('savePlanHolder'){
                def planHolderInstance = new Planholder()
                planHolderInstance.clientProfile.bindParams(params)
                flow.createPlanHolderDto = planHolderInstance
                if(planHolderInstance.clientProfile.validate()) {
                    if(!planHolderInstance.clientProfile.validateClientUniqueness()) {
                        flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                        return error()
                    }
                    if (!planHolderInstance.clientProfile.save()) {
                        return error()
                    } else {
                        flow.planholderInstance = planHolderInstance
                    }
                } else {
                    return error()
                }
            }.to('createPlan')
        }

        // State 2
        beneficiaries {
            on("add") {
                flow.duplicateClientError = ""
                def beneficiaryInstance = new Beneficiary(params)
                beneficiaryInstance.clientProfile = Client.get(params.beneficiary.id)
                flow.beneficiaryInstance = beneficiaryInstance
                if(beneficiaryInstance.validate()) {
                    def errorCode
                    def page = "beneficiary"
                    if((beneficiaryInstance.clientProfile == flow.planInstance.agent?.clientProfile) && page!="agent" ) {
                        errorCode = "Client already added as agent."
                    } else if ((beneficiaryInstance.clientProfile == flow.planInstance.planHolder?.clientProfile)&& page!="planholder" ) {
                        errorCode = "Client already added as plan holder."
                    } else if ( flow.planInstance.beneficiaries?.clientProfile?.contains(beneficiaryInstance.clientProfile) )  {
                        errorCode = "Client already added as beneficiary."
                    } else {
                        errorCode = ""
                    }
                    if(errorCode == "") {
                        flow.beneficiaries.add(beneficiaryInstance)
                        flow.planInstance.beneficiaries = flow.beneficiaries
                        flow.beneficiaryInstance = null
                    } else {
                        flow.beneficiaryInstance = beneficiaryInstance
                        flow.duplicateClientError = errorCode
                        return yes()
                    }
                } else {
                    flow.beneficiaryInstance = beneficiaryInstance
                    return error()
                }
            }.to("beneficiaries")

            on("return"){
                flow.duplicateClientError = ""
            }.to("createPlan")

            on("createBeneficiary") {
                flow.duplicateClientError = ""
                flow.beneficiaryInstance = new Beneficiary(params)
            }.to("createBeneficiary")

            on("next") {
                flow.duplicateClientError = ""
            }.to("agent")
        }


        //State 2a
        createBeneficiary {
            on("return"){
            }.to("beneficiaries")

            on('saveBeneficiary'){
                def beneficiaryInstance = flow.beneficiaryInstance
                beneficiaryInstance.clientProfile.bindParams(params)
                if(beneficiaryInstance.clientProfile.validate()) {
                    if(!beneficiaryInstance.clientProfile.validateClientUniqueness()) {
                        flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                        return error()
                    }
                    if (!beneficiaryInstance.clientProfile.save()) {
                        return error()
                    } else {
                        flow.beneficiaryInstance = beneficiaryInstance
                    }

                } else {
                    return error()
                }
            }.to('beneficiaries')
        }

        //State 3
        agent {
            on("return"){
                flow.duplicateClientError = ""
                def agent = new Agent(params)
                if(params.agent.id) {
                    //TODO agent fields
                    agent.clientProfile = Client.get(params.agent.id)
                } else {
                    agent = null
                }
                flow.agentInstance = agent
            }.to("beneficiaries")

            on("createAgent") {
                flow.agentInstance = new Agent(params)
            }.to("createAgent")

            on("next") {
                flow.duplicateClientError = ""
                def agentInstance = new Agent(params)
                agentInstance.clientProfile = Client.get(params.agent.id)
                flow.agentInstance = agentInstance
                if(agentInstance.validate()) {
                    def errorCode
                    def page = "agent"
                    if ((agentInstance.clientProfile == flow.planInstance.planHolder?.clientProfile)&& page!="planholder" ) {
                        errorCode = "Client already added as plan holder."
                    } else if ( flow.planInstance.beneficiaries?.clientProfile?.contains(agentInstance.clientProfile) )  {
                        errorCode = "Client already added as beneficiary."
                    } else {
                        errorCode = ""
                    }
                    if(errorCode == "") {
                        flow.planInstance.agent = agentInstance
                    } else {
                        flow.duplicateClientError = errorCode
                    }
                } else {
                    flow.agentInstance = agentInstance
                    return error()
                }
            }.to{
                if(flow.duplicateClientError != "") {
                    return "agent"
                } else {
                    return "amendments"
                }
            }
        }

        //State 3a
        createAgent {
            on("return"){
            }.to("agent")

            on('saveAgent'){
                def agentInstance = flow.agentInstance
                agentInstance.clientProfile.bindParams(params)
                flow.createAgentDto = agentInstance
                if(agentInstance.clientProfile.validate()) {
                    if(!agentInstance.clientProfile.validateClientUniqueness()) {
                        flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                        return error()
                    }
                    if (!agentInstance?.clientProfile.save()) {
                        return error()
                    } else {
                        flow.agentInstance = agentInstance
                    }
                } else {
                    return error()
                }
            }.to('agent')
        }

        //State 4
        amendments {
            on("return"){
            }.to("agent")

            on("add") {
                def amendmentInstance = new Amendment()
                amendmentInstance.bindParams(params)
                flow.amendmentInstance = amendmentInstance
                if(amendmentInstance.validate()) {
                    flow.amendments.add(amendmentInstance)
                } else {
                    return error()
                }
            }.to("amendments")
            on('savePlan') {
                def plan = new Plan(flow.planInstance.properties)
                def beneficiaries = flow.beneficiaries
                def planholder = flow.planholderInstance
                def agent = flow.agentInstance
                def amendments = flow.amendments

                if(planholder) {
                    planholder.save()
                    plan.planHolder = planholder
                } else {
                    plan.planHolder = null
                }

                if(agent) {
                    agent.save()
                    plan.agent = agent
                } else {
                    plan.agent = null
                }

                beneficiaries.each {
                    it.save()
                    plan.addToBeneficiaries(it)
                }

                amendments.each {
                    it.save()
                    plan.addToAmendments(it)
                }

                if (!plan.save(flush: true)) {
                    return error()
                }
                flow.myMessage = "Plan ${plan?.id} created."
            }.to('last')
        }

        //End State
        last {
            redirect(action: "show", id: flow.planInstance?.id, params:[message: flow.myMessage])
        }
    }

    def clientsList = {
        render autoCompleteService.clientList(params) as JSON
    }

//    def create() {
//        [planInstance: new Plan(params)]
//    }

    def save() {
        params.origIssueDate = params.origIssueDate ? Date.parse( 'MM/dd/yyyy', params.origIssueDate ) : null
        params.currentIssueDate = params.currentIssueDate? Date.parse( 'MM/dd/yyyy', params.currentIssueDate ) : null
        params.applicableDate = params.applicableDate ? Date.parse( 'MM/dd/yyyy', params.applicableDate ) : null
        def planInstance = new Plan(params)
        if (!planInstance.save(flush: true)) {
            render(view: "create", model: [planInstance: planInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'plan.label', default: 'Plan'), planInstance.id])
        redirect(action: "show", id: planInstance.id)
    }

    def show(Long id) {
        def planInstance = Plan.get(id)
        if (!planInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), id])
            redirect(action: "list")
            return
        }

        [planInstance: planInstance]
    }

    def edit(Long id) {
        def planInstance = Plan.get(id)
        if (!planInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), id])
            redirect(action: "list")
            return
        }

        [planInstance: planInstance]
    }

    def update(Long id, Long version) {
        def planInstance = Plan.get(id)
        if (!planInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (planInstance.version > version) {
                planInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'plan.label', default: 'Plan')] as Object[],
                          "Another user has updated this Plan while you were editing")
                render(view: "edit", model: [planInstance: planInstance])
                return
            }
        }
        params.origIssueDate = params.origIssueDate ? Date.parse( 'MM/dd/yyyy', params.origIssueDate ) : null
        params.currentIssueDate = params.currentIssueDate? Date.parse( 'MM/dd/yyyy', params.currentIssueDate ) : null
        params.applicableDate = params.applicableDate ? Date.parse( 'MM/dd/yyyy', params.applicableDate ) : null
        planInstance.properties = params

        if (!planInstance.save(flush: true)) {
            render(view: "edit", model: [planInstance: planInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'plan.label', default: 'Plan'), planInstance.id])
        redirect(action: "show", id: planInstance.id)
    }

    def delete(Long id) {
        def planInstance = Plan.get(id)
        if (!planInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), id])
            redirect(action: "list")
            return
        }

        try {
            planInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'plan.label', default: 'Plan'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'plan.label', default: 'Plan'), id])
            redirect(action: "show", id: id)
        }
    }

}
