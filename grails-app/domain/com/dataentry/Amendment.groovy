package com.dataentry

class Amendment {

    String amendmentType
    Date filingDate
    Date effectiveDate
    String approvedBy

    static belongsTo = [plan: Plan]

    static constraints = {
    }
}
