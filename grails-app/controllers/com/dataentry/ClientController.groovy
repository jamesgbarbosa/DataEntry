package com.dataentry

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
@Secured(['ROLE_ADMIN','ROLE_USER'])
class ClientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def auditTrailService
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        if(params.fullName) {
            def clients = Client.createCriteria().list(max: params.max, offset: params.offset, sort: params.sort, order: params.order) {
                ilike("fullName","${params.fullName}%")
            }
            [clientInstanceList: clients, clientInstanceTotal: clients.getTotalCount()]
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

//        auditTrailService.addToLogs("Update Client: ${clientInstance.fullNameBirthdateAndGender()}")
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
                flash.error = "Client can't be deleted because it is currently assigned to a plan."
                redirect(action: "show", id: id)
            }

    }
}
