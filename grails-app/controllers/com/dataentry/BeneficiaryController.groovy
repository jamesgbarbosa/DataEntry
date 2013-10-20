package com.dataentry

import org.springframework.dao.DataIntegrityViolationException

class BeneficiaryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [beneficiaryInstanceList: Beneficiary.list(params), beneficiaryInstanceTotal: Beneficiary.count()]
    }

    def create() {
        [beneficiaryInstance: new Beneficiary(params)]
    }

    def save() {
        if(params) {
            params.birthdate = Date.parse( 'MM/dd/yyyy', params.birthdate )
        }
        def beneficiaryInstance = new Beneficiary(params)
        //validate uniqeness
        beneficiaryInstance.clientType = 'Beneficiary'

        if (params.planId) {
            def planInstance = Plan.get(params.planId)
            planInstance.addToBeneficiaries(beneficiaryInstance)
        }

        if(beneficiaryInstance.validate()) {
            if(!beneficiaryInstance.validateClientUniqueness()) {
                flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                render(view: "create", model: [beneficiaryInstance: beneficiaryInstance])
                return
            }
            if (!beneficiaryInstance.save(flush: true)) {
                render(view: "create", model: [beneficiaryInstance: beneficiaryInstance])
                return
            }
        } else {
            render(view: "create", model: [beneficiaryInstance: beneficiaryInstance])
            return
        }




        flash.message = message(code: 'default.created.message', args: [message(code: 'beneficiary.label', default: 'Beneficiary'), beneficiaryInstance.id])
        redirect(action: "show", id: beneficiaryInstance.id)
    }

    def show(Long id) {
        def beneficiaryInstance = Beneficiary.get(id)
        if (!beneficiaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beneficiary.label', default: 'Beneficiary'), id])
            redirect(action: "list")
            return
        }

        [beneficiaryInstance: beneficiaryInstance]
    }

    def edit(Long id) {
        def beneficiaryInstance = Beneficiary.get(id)
        if (!beneficiaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beneficiary.label', default: 'Beneficiary'), id])
            redirect(action: "list")
            return
        }

        [beneficiaryInstance: beneficiaryInstance]
    }

    def update(Long id, Long version) {
        def beneficiaryInstance = Beneficiary.get(id)
        if (!beneficiaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beneficiary.label', default: 'Beneficiary'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (beneficiaryInstance.version > version) {
                beneficiaryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'beneficiary.label', default: 'Beneficiary')] as Object[],
                          "Another user has updated this Beneficiary while you were editing")
                render(view: "edit", model: [beneficiaryInstance: beneficiaryInstance])
                return
            }
        }
        if(params) {
            params.birthdate = Date.parse( 'MM/dd/yyyy', params.birthdate )
        }
        beneficiaryInstance.properties = params

        if (!beneficiaryInstance.save(flush: true)) {
            render(view: "edit", model: [beneficiaryInstance: beneficiaryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'beneficiary.label', default: 'Beneficiary'), beneficiaryInstance.id])
        redirect(action: "show", id: beneficiaryInstance.id)
    }

    def delete(Long id) {
        def beneficiaryInstance = Beneficiary.get(id)
        if (!beneficiaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beneficiary.label', default: 'Beneficiary'), id])
            redirect(action: "list")
            return
        }

        try {
            beneficiaryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'beneficiary.label', default: 'Beneficiary'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'beneficiary.label', default: 'Beneficiary'), id])
            redirect(action: "show", id: id)
        }
    }
}
