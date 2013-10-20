package com.dataentry

import org.springframework.dao.DataIntegrityViolationException

class AgentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [agentInstanceList: Agent.list(params), agentInstanceTotal: Agent.count()]
    }

    def create() {
        [agentInstance: new Agent(params)]
    }

    def save() {
        if(params) {
            params.birthdate = Date.parse( 'MM/dd/yyyy', params.birthdate )
            params.appointmentDate = Date.parse( 'MM/dd/yyyy', params.appointmentDate )
        }
        def agentInstance = new Agent(params)
        agentInstance.clientType = 'Agent'
        if(agentInstance.validate()) {
            if(!agentInstance.validateClientUniqueness()) {
                flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                render(view: "create", model: [agentInstance: agentInstance])
                return
            }
            if (!agentInstance.save(flush: true)) {
                render(view: "create", model: [agentInstance: agentInstance])
                return
            }
        } else {
            render(view: "create", model: [agentInstance: agentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'agent.label', default: 'Agent'), agentInstance.id])
        redirect(action: "show", id: agentInstance.id)
    }

    def show(Long id) {
        def agentInstance = Agent.get(id)
        if (!agentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'Agent'), id])
            redirect(action: "list")
            return
        }

        [agentInstance: agentInstance]
    }

    def edit(Long id) {
        def agentInstance = Agent.get(id)
        if (!agentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'Agent'), id])
            redirect(action: "list")
            return
        }

        [agentInstance: agentInstance]
    }

    def update(Long id, Long version) {

        def agentInstance = Agent.get(id)
        if (!agentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'Agent'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (agentInstance.version > version) {
                agentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'agent.label', default: 'Agent')] as Object[],
                          "Another user has updated this Agent while you were editing")
                render(view: "edit", model: [agentInstance: agentInstance])
                return
            }
        }
        params.birthdate = Date.parse( 'MM/dd/yyyy', params.birthdate )
        params.appointmentDate = Date.parse( 'MM/dd/yyyy', params.appointmentDate )
        agentInstance.properties = params

        if (!agentInstance.save(flush: true)) {
            render(view: "edit", model: [agentInstance: agentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'agent.label', default: 'Agent'), agentInstance.id])
        redirect(action: "show", id: agentInstance.id)
    }

    def delete(Long id) {
        def agentInstance = Agent.get(id)
        if (!agentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'Agent'), id])
            redirect(action: "list")
            return
        }

        try {
            agentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'agent.label', default: 'Agent'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'agent.label', default: 'Agent'), id])
            redirect(action: "show", id: id)
        }
    }
}
