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
        params.max = Math.min(max ?: 10, 100)
        [planInstanceList: Plan.list(params), planInstanceTotal: Plan.count()]
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
            }
            on('success').to('createPlan')
        }

        //1st state
        createPlan {
            on('createAgent'){
//                flow.book.properties = params
//                if(!flow.book.validate()) {
//                    error()
//                }
            }.to('createAgent')
        }

        //2st state
        createAgent {
            on("return"){
                // flow.book.id = params.book.id
            }.to("createPlan")

            on('saveAgent'){
//                flow.author.properties = params
//                if(!flow.author.validate()) {
//                    error()
//                }
            }.to('createPlan')
        }


        last {
            action {
                try {
                    //throw new Exception()
                    RequestContextHolder.currentRequestAttributes().flashScope.message = 'Success'
                    createPlan()
                } catch(Exception e) {
                    RequestContextHolder.currentRequestAttributes().flashScope.error = 'Service not available'
                    createAgent()
                }
            }
//            on("second").to("second")
//            on("buy").to("buy")
        }

        //End State
//        buy {
//            redirect(action: "list")
//        }
    }

    def agentslist = {
            params.clientType = "Agent"
            render autoCompleteService.clientList(params) as JSON
    }

    def planholderslist = {
        params.clientType = "Plan Holder"
        render autoCompleteService.clientList(params) as JSON
    }

//    def create() {
//        [planInstance: new Plan(params)]
//    }

    def save() {
        if(params) {
            params.origIssueDate = Date.parse( 'MM/dd/yyyy', params.origIssueDate )
            params.currentIssueDate = Date.parse( 'MM/dd/yyyy', params.currentIssueDate )
            params.applicableDate = Date.parse( 'MM/dd/yyyy', params.applicableDate )
        }
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
        if(params) {
            params.origIssueDate = Date.parse( 'MM/dd/yyyy', params.origIssueDate )
            params.currentIssueDate = Date.parse( 'MM/dd/yyyy', params.currentIssueDate )
            params.applicableDate = Date.parse( 'MM/dd/yyyy', params.applicableDate )
        }
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
