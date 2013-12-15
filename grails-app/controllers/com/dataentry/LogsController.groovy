package com.dataentry

import com.dataentry.logs.AuditLog
import com.dataentry.logs.AuditTrail
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class LogsController {

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [logsList: AuditTrail.list(params), logsTotal: AuditTrail.count()]
    }
}
