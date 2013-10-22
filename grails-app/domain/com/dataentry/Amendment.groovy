package com.dataentry

class Amendment implements Serializable {

    String amendmentType
    Date filingDate
    Date effectiveDate
    String approvedBy

    static belongsTo = [plan: Plan]

    static constraints = {
    }

    String toString() {
        amendmentType
    }
}
