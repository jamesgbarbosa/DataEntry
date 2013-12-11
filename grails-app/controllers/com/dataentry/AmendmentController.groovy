package com.dataentry

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN','ROLE_USER'])
class AmendmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [amendmentInstanceList: Amendment.list(params), amendmentInstanceTotal: Amendment.count()]
    }

    def create() {
        [amendmentInstance: new Amendment(params)]
    }

    def save() {
        def amendmentInstance = new Amendment(params)
        if (!amendmentInstance.save(flush: true)) {
            render(view: "create", model: [amendmentInstance: amendmentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'amendment.label', default: 'Amendment'), amendmentInstance.id])
        redirect(action: "show", id: amendmentInstance.id)
    }

    def show(Long id) {
        def amendmentInstance = Amendment.get(id)
        if (!amendmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'amendment.label', default: 'Amendment'), id])
            redirect(action: "list")
            return
        }

        [amendmentInstance: amendmentInstance]
    }

    def edit(Long id) {
        def amendmentInstance = Amendment.get(id)
        if (!amendmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'amendment.label', default: 'Amendment'), id])
            redirect(action: "list")
            return
        }

        [amendmentInstance: amendmentInstance]
    }

    def update(Long id, Long version) {
        def amendmentInstance = Amendment.get(id)
        if (!amendmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'amendment.label', default: 'Amendment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (amendmentInstance.version > version) {
                amendmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'amendment.label', default: 'Amendment')] as Object[],
                        "Another user has updated this Amendment while you were editing")
                render(view: "edit", model: [amendmentInstance: amendmentInstance])
                return
            }
        }

        amendmentInstance.properties = params

        if (!amendmentInstance.save(flush: true)) {
            render(view: "edit", model: [amendmentInstance: amendmentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'amendment.label', default: 'Amendment'), amendmentInstance.id])
        redirect(action: "show", id: amendmentInstance.id)
    }

    def delete(Long id) {
        def amendmentInstance = Amendment.get(id)
        if (!amendmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'amendment.label', default: 'Amendment'), id])
            redirect(action: "list")
            return
        }

        try {
            amendmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'amendment.label', default: 'Amendment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'amendment.label', default: 'Amendment'), id])
            redirect(action: "show", id: id)
        }
    }
}
