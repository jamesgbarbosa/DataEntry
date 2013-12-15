package com.dataentry.logs

class AuditTrail implements Serializable {

    String username
    String transaction
    Date timeStamp
    static constraints = {
        username nullable: true, blank: true
        transaction nullable: true, blank: true
        timeStamp nullable: true, blank: true
    }
}
