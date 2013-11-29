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
        params.filingDate  = isValidDate(params.filingDate) ? Date.parse( 'MM/dd/yyyy', params.filingDate ) : params.filingDate
        params.effectiveDate  = isValidDate(params.effectiveDate) ? Date.parse( 'MM/dd/yyyy', params.effectiveDate ) : params.effectiveDate

        this.properties = params
    }

    boolean isValidDate(String date) {
        if(date == null) {
            return false
        }
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Date testDate = null;
        try {
            testDate = sdf.parse(date);
        } // if the format of the string provided doesn't match the format we
        // declared in SimpleDateFormat() we will get an exception
        catch (ParseException e) {
            return false;
        }

        if (!sdf.format(testDate).equals(date)) {
            return false;
        }

        return true;

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
