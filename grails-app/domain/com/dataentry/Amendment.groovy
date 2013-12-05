package com.dataentry

import java.text.ParseException
import java.text.SimpleDateFormat

class Amendment implements Serializable {
    static transients = ['tempId']
    String amendmentType
    Date filingDate
    Date effectiveDate
    String approvedBy
    Long tempId

    static belongsTo = [plan: Plan]



    def bindParams(Map params) {
        params.filingDate  = DateUtil.isValidDate(params.filingDate) ? Date.parse( 'MM/dd/yyyy', params.filingDate ) : params.filingDate
        params.effectiveDate  = DateUtil.isValidDate(params.effectiveDate) ? Date.parse( 'MM/dd/yyyy', params.effectiveDate ) : params.effectiveDate

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
