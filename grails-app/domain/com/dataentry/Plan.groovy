package com.dataentry

import java.text.SimpleDateFormat
import java.text.ParseException

class Plan implements Serializable {

    String planNumber
    String product
    String payingPeriod
    String maturityPeriod
    BigDecimal pnpPrice
    BigDecimal modalInstallment
    String numberOfUnits
//    Date origIssueDate
    Date currentIssueDate
    String paymentMode
    String planStatus
    Date applicableDate
    boolean withInsurance

    Planholder planHolder
    Agent agent

    static hasMany = [beneficiaries: Beneficiary,amendments: Amendment]

    def bindParams(Map params) {
        params.currentIssueDate = isValidDate(params.currentIssueDate)? Date.parse( 'MM/dd/yyyy', params.currentIssueDate ) : params.currentIssueDate
        params.applicableDate  = isValidDate(params.applicableDate) ? Date.parse( 'MM/dd/yyyy', params.applicableDate ) : params.applicableDate
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
        planNumber blank:  false, nullable:  false, unique: true
        product blank:  false, nullable:  false
        payingPeriod blank:  false, nullable:  false, matches: numeric(),  minSize: 0
        maturityPeriod blank:  false, nullable:  false, matches: numeric(), minSize: 0
        pnpPrice blank:  false, nullable:  false,  min: 0.0, max: 99999999.99, scale: 2
        modalInstallment blank:  false, nullable:  false
        numberOfUnits blank:  false, nullable:  false, matches: numeric(), minSize: 0
//        origIssueDate blank:  true, nullable:  true
        currentIssueDate blank:  false, nullable:  false
        paymentMode blank:  false, nullable:  false
        planStatus blank:  false, nullable:  false
        applicableDate blank:  true, nullable:  true
        withInsurance blank:  false, nullable:  false
        planHolder nullable:  false
        agent nullable:  true
        beneficiaries nullable: true
        amendments nullable: true
    }

    public static String numeric() {
        return "^[0-9]+\$"
    }

    String toString() {
        product
    }
}
