package com.dataentry

import org.springframework.dao.DataIntegrityViolationException

class ClientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        if(params.firstName || params.lastName) {
            def clients = Client.withCriteria {
                ilike("firstName","${params.firstName}%")
                ilike("lastName", "${params.lastName}%")
            }
            params.max = Math.min(max ?: 10, 100)
            [clientInstanceList: clients, clientInstanceTotal: clients.size()]
        } else {
            params.max = Math.min(max ?: 10, 100)
            [clientInstanceList: Client.list(params), clientInstanceTotal: Client.count()]
        }
    }

    def create() {
        [clientInstance: new Client(params)]
    }

    def save() {
        params.birthdate = params.birthdate ? Date.parse( 'MM/dd/yyyy', params.birthdate ) : null
        def clientInstance = new Client(params)
        if (!clientInstance.save(flush: true)) {
            render(view: "create", model: [clientInstance: clientInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'client.label', default: 'Client'), clientInstance.id])
        redirect(action: "show", id: clientInstance.id)
    }

    def show(Long id) {
        def clientInstance = Client.get(id)
        if (!clientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), id])
            redirect(action: "list")
            return
        }

        [clientInstance: clientInstance]
    }

    def edit(Long id) {
        def clientInstance = Client.get(id)
        if (!clientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), id])
            redirect(action: "list")
            return
        }

        [clientInstance: clientInstance]
    }

    def update(Long id, Long version) {
        def clientInstance = Client.get(id)
        if (!clientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (clientInstance.version > version) {
                clientInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'client.label', default: 'Client')] as Object[],
                        "Another user has updated this Client while you were editing")
                render(view: "edit", model: [clientInstance: clientInstance])
                return
            }
        }
        params.birthdate = params.birthdate ? Date.parse( 'MM/dd/yyyy', params.birthdate ) : null
        clientInstance.properties = params

        if (!clientInstance.save(flush: true)) {
            render(view: "edit", model: [clientInstance: clientInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'client.label', default: 'Client'), clientInstance.id])
        redirect(action: "show", id: clientInstance.id)
    }

    def delete(Long id) {
        def clientInstance = Client.get(id)
        if (!clientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), id])
            redirect(action: "list")
            return
        }

        try {
            clientInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'client.label', default: 'Client'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'client.label', default: 'Client'), id])
            redirect(action: "show", id: id)
        }
    }
}
