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
                    eq("product","${params.productID}")
                    eq("planNumber", params.planID)
                    planHolder {
                        ilike("firstName","${params.planholderName}%")
                    }
//                ilike("planHolder.firstName","${params.planholderName}%")

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
                flow.planInstance =  new Plan(params)
                flow.agentInstance =  new Agent(params)
                flow.planholderInstance =  new Planholder(params)
            }
            on('success').to('createPlan')
        }

        //State 1
        createPlan {
            on('createPlanHolder'){ Plan plan ->
                plan.origIssueDate =n
                n
                params.origIssueDate ? Date.parse( 'MM/dd/yyyy', params.origIssueDate ) : null
                plan.currentIssueDate = params.currentIssueDate? Date.parse( 'MM/dd/yyyy', params.currentIssueDate ) : null
                plan.applicableDate  = params.applicableDate ? Date.parse( 'MM/dd/yyyy', params.applicableDate ) : null
                flow.planInstance = plan

                flow.planholderInstance = new Planholder()
            }.to('createPlanHolder')

            on('createAgent'){ Plan plan ->
                plan.origIssueDate = params.origIssueDate ? Date.parse( 'MM/dd/yyyy', params.origIssueDate ) : null
                plan.currentIssueDate = params.currentIssueDate? Date.parse( 'MM/dd/yyyy', params.currentIssueDate ) : null
                plan.applicableDate  = params.applicableDate ? Date.parse( 'MM/dd/yyyy', params.applicableDate ) : null
                flow.planInstance = plan

                flow.agentInstance = new Agent()
            }.to('createAgent')

            on('createBeneficiary'){ Plan plan ->
                plan.origIssueDate = params.origIssueDate ? Date.parse( 'MM/dd/yyyy', params.origIssueDate ) : null
                plan.currentIssueDate = params.currentIssueDate? Date.parse( 'MM/dd/yyyy', params.currentIssueDate ) : null
                plan.applicableDate  = params.applicableDate ? Date.parse( 'MM/dd/yyyy', params.applicableDate ) : null
                flow.planInstance = plan

                flow.beneficiaryInstance = new Beneficiary()
            }.to('createBeneficiary')

            on('savePlan') { Plan plan ->
                plan.origIssueDate = params.origIssueDate ? Date.parse( 'MM/dd/yyyy', params.origIssueDate ) : null
                plan.currentIssueDate = params.currentIssueDate? Date.parse( 'MM/dd/yyyy', params.currentIssueDate ) : null
                plan.applicableDate  = params.applicableDate ? Date.parse( 'MM/dd/yyyy', params.applicableDate ) : null
                flow.planInstance = plan

                if (!plan.save(flush: true)) {
                    return error()
                }
                flow.myMessage = "Plan ${plan?.id} created."
            }.to('last')

        }

        //State  2.a
        createAgent {
            on("return"){
            }.to("createPlan")

            on('saveAgent'){
                params.birthdate = params.birthdate ? Date.parse( 'MM/dd/yyyy', params.birthdate ) : null
                params.appointmentDate = params.appointmentDate ? Date.parse( 'MM/dd/yyyy', params.appointmentDate ) : null
                def agentInstance = new Agent(params)
                agentInstance.clientType = 'Agent'
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
            }.to('createPlan')
        }

        //State  2.b
        createPlanHolder {
            on("return"){
            }.to("createPlan")

            on('savePlanHolder'){
                params.birthdate = params.birthdate ? Date.parse( 'MM/dd/yyyy', params.birthdate ) : null
                def planHolderInstance = new Planholder(params)
                planHolderInstance.clientType = 'Plan Holder'
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

        //State  2.c
        createBeneficiary {
            on("return"){
            }.to("createPlan")

            on('saveBeneficiary'){
                params.birthdate = params.birthdate ? Date.parse( 'MM/dd/yyyy', params.birthdate ) : null
                def beneficiaryInstance = new Beneficiary(params)
                beneficiaryInstance.clientType = 'Beneficiary'
                flow.beneficiaryInstance = beneficiaryInstance
                if(beneficiaryInstance.validate()) {
                    if(!beneficiaryInstance.validateClientUniqueness()) {
                        flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                        return error()
                    }
                    if (!beneficiaryInstance.save(flush: true)) {
                        return error()
                    }
                    flow.planInstance.beneficiary = beneficiaryInstance
                } else {
                    return error()
                }
            }.to('createPlan')
        }

        //End State
        last {
            redirect(action: "show", id: flow.planInstance?.id, params:[message: flow.myMessage])
        }

    }

    def agentslist = {
            params.clientType = "Agent"
            render autoCompleteService.clientList(params) as JSON
    }

    def planholderslist = {
        params.clientType = "Plan Holder"
        render autoCompleteService.clientList(params) as JSON
    }

    def beneficiarieslist = {
        params.clientType = "Beneficiary"
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
