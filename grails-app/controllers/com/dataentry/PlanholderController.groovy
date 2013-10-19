package com.dataentry

import org.springframework.dao.DataIntegrityViolationException

class PlanholderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [planholderInstanceList: Planholder.list(params), planholderInstanceTotal: Planholder.count()]
    }

    def create() {
        [planholderInstance: new Planholder(params)]
    }

    def save() {
        def planholderInstance = new Planholder(params)
        planholderInstance.clientType = 'Plan Holder'
        if(planholderInstance.validate()) {
            if(!planholderInstance.validateClientUniqueness()) {
                flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                render(view: "create", model: [planholderInstance: planholderInstance])
                return
            }
            if (!planholderInstance.save(flush: true)) {
                render(view: "create", model: [planholderInstance: planholderInstance])
                return
            }
        } else {
            render(view: "create", model: [planholderInstance: planholderInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'planholder.label', default: 'Planholder'), planholderInstance.id])
        redirect(action: "show", id: planholderInstance.id)
    }

    def show(Long id) {
        def planholderInstance = Planholder.get(id)
        if (!planholderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'planholder.label', default: 'Planholder'), id])
            redirect(action: "list")
            return
        }

        [planholderInstance: planholderInstance]
    }

    def edit(Long id) {
        def planholderInstance = Planholder.get(id)
        if (!planholderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'planholder.label', default: 'Planholder'), id])
            redirect(action: "list")
            return
        }

        [planholderInstance: planholderInstance]
    }

    def update(Long id, Long version) {
        def planholderInstance = Planholder.get(id)
        if (!planholderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'planholder.label', default: 'Planholder'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (planholderInstance.version > version) {
                planholderInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'planholder.label', default: 'Planholder')] as Object[],
                        "Another user has updated this Planholder while you were editing")
                render(view: "edit", model: [planholderInstance: planholderInstance])
                return
            }
        }

        planholderInstance.properties = params

        if (!planholderInstance.save(flush: true)) {
            render(view: "edit", model: [planholderInstance: planholderInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'planholder.label', default: 'Planholder'), planholderInstance.id])
        redirect(action: "show", id: planholderInstance.id)
    }

    def delete(Long id) {
        def planholderInstance = Planholder.get(id)
        if (!planholderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'planholder.label', default: 'Planholder'), id])
            redirect(action: "list")
            return
        }

        try {
            planholderInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'planholder.label', default: 'Planholder'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'planholder.label', default: 'Planholder'), id])
            redirect(action: "show", id: id)
        }
    }
}
