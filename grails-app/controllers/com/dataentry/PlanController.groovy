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

    def createFlow = {
        startup {
            action {
            }
            on('success').to('init')
        }

        init {
            action {
                flow.planInstance =  new Plan()
                flow.agentInstance =  new Client()
                flow.planholderInstance =  new Client()
                flow.beneficiaryInstance =  new Client()
                flow.amendments = new ArrayList<Amendment>()
            }
            on('success').to('createPlan')
        }

        //State 1
        createPlan {
            on('createPlanHolder'){
                Plan plan = new Plan()
                plan.bindParams(params)
                def beneficiaries = flow.planInstance.beneficiaries

                //Clear errors, cause its not a validation state yet
                plan.errors = null
                flow.planInstance = plan
                flow.planInstance.agent = flow.agentInstance ? flow.agentInstance : null
                if(beneficiaries!=null) {
                    flow.planInstance.beneficiaries = beneficiaries
                }

                flow.planholderInstance = new Client()
            }.to('createPlanHolder')

            on('beneficiaries'){

                Plan plan = new Plan()
                plan.bindParams(params)
                flow.planInstance = plan
                if(!plan.validate()) {
                    return error()
                }

                def beneficiaries = flow.planInstance.beneficiaries
                flow.planInstance.agent = flow.agentInstance ? flow.agentInstance : null
                if(beneficiaries!=null) {
                    flow.planInstance.beneficiaries = beneficiaries
                }
            }.to('beneficiaries')
        }

        //State  1.a
        createPlanHolder {
            on("return"){
            }.to("createPlan")

            on('savePlanHolder'){
                def planHolderInstance = new Client()
                planHolderInstance.bindParams(params)
                flow.planholderInstance = planHolderInstance
                if(planHolderInstance.validate()) {
                    if(!planHolderInstance.validateClientUniqueness()) {
                        flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                        return error()
                    }
                    if (!planHolderInstance.save(flush: true)) {
                        return error()
                    }
                    flow.planInstance.planHolder = planHolderInstance
                } else {
                    return error()
                }
            }.to('createPlan')
        }

        // State 2
        beneficiaries {
            on("return"){
                flow.beneficiaryInstance = new Client()
                flow.planInstance.beneficiaries = new ArrayList<Client>()

                params.list("benId")?.each {
                    flow.planInstance.beneficiaries.add(Client.get(it))
                }
            }.to("createPlan")

            on("createBeneficiary") {
            }.to("createBeneficiary")

            on("next") {
                flow.beneficiaryInstance = new Client()
                flow.planInstance.beneficiaries = new ArrayList<Client>()

                params.list("benId")?.each {
                    flow.planInstance.beneficiaries.add(Client.get(it))
                }
            }.to("agent")
        }

        //State 2a
        createBeneficiary {
            on("return"){
            }.to("beneficiaries")

            on('saveBeneficiary'){
                def beneficiaryInstance = new Client()
                beneficiaryInstance.bindParams(params)
                flow.beneficiaryInstance = beneficiaryInstance
                if(beneficiaryInstance.validate()) {
                    if(!beneficiaryInstance.validateClientUniqueness()) {
                        flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                        return error()
                    }
                    if (!beneficiaryInstance.save(flush: true)) {
                        return error()
                    }
                    flow.beneficiaryInstance = beneficiaryInstance
                } else {
                    return error()
                }
            }.to('beneficiaries')
        }

        //State 3
        agent {
            on("return"){
                if(params.agent.id) {
                    flow.agentInstance = Client.get(params.agent.id)
                    flow.planInstance.agent = flow.agentInstance
                } else {
                    flow.planInstance.agent = null
                }

            }.to("beneficiaries")

            on("createAgent") {
            }.to("createAgent")

            on("next") {
                if(params.agent.id) {
                    flow.agentInstance = Client.get(params.agent.id)
                    flow.planInstance.agent = flow.agentInstance
                }  else {
                    flow.planInstance.agent = null
                }
            }.to("amendments")
        }

        //State 3a
        createAgent {
            on("return"){
            }.to("agent")

            on('saveAgent'){
                def agentInstance = new Client()
                agentInstance.bindParams(params)
                flow.agentInstance = agentInstance
                if(agentInstance.validate()) {
                    if(!agentInstance.validateClientUniqueness()) {
                        flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                        return error()
                    }
                    if (!agentInstance.save(flush: true)) {
                        return error()
                    }
                    flow.planInstance.agent = agentInstance
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
                def beneficiaries = flow.planInstance.beneficiaries
                def amendments = flow.amendments

                amendments.each {
                    it.save()
                    plan.addToAmendments(it)
                }

                if(beneficiaries) {
                    plan.beneficiaries = beneficiaries
                } else {
                    plan.beneficiaries = null
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
            on(Exception).to "agent"
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
