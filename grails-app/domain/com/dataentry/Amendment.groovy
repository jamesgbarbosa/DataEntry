package com.dataentry

class Amendment implements Serializable {

    String amendmentType
    Date filingDate
    Date effectiveDate
    String approvedBy

    static belongsTo = [plan: Plan]

    def bindParams(Map params) {
        params.filingDate = params.filingDate ? Date.parse( 'MM/dd/yyyy', params.filingDate ) : null
        params.effectiveDate = params.effectiveDate ? Date.parse( 'MM/dd/yyyy', params.effectiveDate ) : null
        this.properties = params
    }

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
