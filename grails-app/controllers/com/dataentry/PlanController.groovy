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
                flow.zzz = "asd"

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
                Planholder planHolder = new Planholder()
                if(params.planHolder.id) {
                    def client =  Client.get(params.planHolder.id)
                    def error = planClientValidation("planholder",client, flow.agentInstance, flow.planholderInstance, flow.beneficiaries)
                    if(error == "") {
                        planHolder.clientProfile = client
                    } else {
                        flow.duplicateClientError = error
                        planHolder.clientProfile = client
                        flow.planholderInstance = planHolder
                        return no()
                    }

                } else {
                    planHolder = null
                }

                Plan plan = new Plan()
                plan.bindParams(params)
                flow.planInstance = plan
                if(!plan.validate()) {
                    return no()
                }

                flow.planholderInstance = planHolder

                return yes()
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

            }.to("validateBeneficiary")

            on("return"){
                flow.duplicateClientError = ""
//                //TODO beneficiary fields
//                flow.planInstance.beneficiaries = new ArrayList<Beneficiary>()
//                params.list("benId")?.each {
//                    def beneficiary = new Beneficiary()
//                    beneficiary.clientProfile = Client.get(it)
//                    flow.beneficiaries.add(beneficiary)
//                }

            }.to("createPlan")

            on("createBeneficiary") {
                flow.duplicateClientError = ""
                //TODO beneficiary fields
                flow.beneficiaryInstance = new Beneficiary()
//                flow.planInstance.beneficiaries = new ArrayList<Beneficiary>()
//                params.list("benId")?.each {
//                    def beneficiary = new Beneficiary()
//                    beneficiary.clientProfile = Client.get(it)
//                    flow.beneficiaries.add(beneficiary)
//                }
            }.to("createBeneficiary")

            on("next") {
                flow.duplicateClientError = ""
//                //TODO beneficiary fields
//                flow.planInstance.beneficiaries = new ArrayList<Beneficiary>()
//                params.list("benId")?.each {
//                    def beneficiary = new Beneficiary()
//                    beneficiary.clientProfile = Client.get(it)
//                    flow.beneficiaries.add(beneficiary)
//                }
            }.to("agent")
        }

        //Action
        validateBeneficiary {
            action {
                flow.duplicateClientError = ""
                def beneficiaryInstance = new Beneficiary()
                beneficiaryInstance.clientProfile = Client.get(params.beneficiary.id)
                flow.beneficiaryInstance = beneficiaryInstance
                if(beneficiaryInstance.validate()) {
                    def error = planClientValidation("beneficiary",beneficiaryInstance.clientProfile, flow.agentInstance, flow.planholderInstance, flow.beneficiaries)
                    if(error == "") {
                        flow.beneficiaries.add(beneficiaryInstance)
                        return yes()
                    } else {
                        flow.duplicateClientError = error
                        return yes()
                    }
                } else {
                    return yes()
                }
            }
            on("yes").to "beneficiaries"
        }

        //State 2a
        createBeneficiary {
            on("return"){
            }.to("beneficiaries")

            on('saveBeneficiary'){
                def beneficiaryInstance = new Beneficiary()
                beneficiaryInstance.clientProfile.bindParams(params)
                if(beneficiaryInstance.clientProfile.validate()) {
                    if(!beneficiaryInstance.clientProfile.validateClientUniqueness()) {
                        flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                        return error()
                    }
                    if (!beneficiaryInstance.clientProfile.save()) {
                        return error()
                    }
                } else {
                    return error()
                }
            }.to('beneficiaries')
        }

        //State 3
        agent {
            on("return"){
                def agent = new Agent()
                if(params.agent.id) {
                    //TODO agent fields
                    agent.clientProfile = Client.get(params.agent.id)
                } else {
                    agent = null
                }
                flow.agentInstance = agent
            }.to("beneficiaries")

            on("createAgent") {
                def agent = new Agent()
                flow.createAgentDto = new Agent()
                if(params.agent.id) {
                    //TODO agent fields
                    agent.clientProfile = Client.get(params.agent.id)
                } else {
                    agent = null
                }
                flow.agentInstance = agent
            }.to("createAgent")

            on("next") {
                def agent = new Agent(params)

                if(params.agent.id) {
                    //TODO agent fields
                    agent.clientProfile = Client.get(params.agent.id)
                    flow.agentInstance = agent
                    if(agent.validate()) {
                        def error = planClientValidation("agent",agent.clientProfile, flow.agentInstance, flow.planholderInstance, flow.beneficiaries)
                        if(error == "") {
                        } else {
                            flow.duplicateClientError = error
                            return error()
                        }
                    } else {
                        return error()
                    }
                } else {
                    agent = null
                }

                flow.agentInstance = agent
            }.to("validateAgent")
        }

        validateAgent() {
            action {
                []
            }
            on("success").to "amendments"
            on("error").to "amendments"
            on(Exception).to "last"
        }

        //State 3a
        createAgent {
            on("return"){
            }.to("agent")

            on('saveAgent'){
                def agentInstance = new Agent()
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
            }.to("validateAmendment")
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

        //Action
        validateAmendment {
            action {
                []
            }
            on("success").to "amendments"
            on("error").to "amendments"
            on(Exception).to "last"
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
