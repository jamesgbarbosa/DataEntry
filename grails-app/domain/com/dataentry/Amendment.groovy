package com.dataentry

class Amendment implements Serializable {

    String amendmentType
    Date filingDate
    Date effectiveDate
    String approvedBy

    static belongsTo = [plan: Plan]

    static constraints = {
        amendmentType nullable: false, blank: false
        filingDate nullable: false, blank: false
        effectiveDate nullable: false, blank: false
        approvedBy nullable: true, blank: true
        plan nullable: true, blank: true
    }

    String toString() {
        amendmentType
    }
}
