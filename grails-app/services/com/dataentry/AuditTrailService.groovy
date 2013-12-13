package com.dataentry

import com.dataentry.logs.AuditTrail

class AuditTrailService {

    def springSecurityService

    def addToLogs(String transaction) {
        def currentUser = springSecurityService.getCurrentUser() as UserAccount
        def today = new Date()

        new AuditTrail(transaction: transaction, username: currentUser.username, timeStamp: today).save(flush:true)

    }
}
