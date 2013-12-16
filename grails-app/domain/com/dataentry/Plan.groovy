package com.dataentry

import java.text.SimpleDateFormat
import java.text.ParseException
import org.codehaus.groovy.runtime.DateGroovyMethods

class Plan implements Serializable {

    static auditable  = [ignore:['version']]

    String planNumber
    String product
    int payingPeriod
    int maturityPeriod
    BigDecimal pnpPrice
    BigDecimal modalInstallment
    int numberOfUnits
//    Date origIssueDate
    Date currentIssueDate
    String paymentMode
    String planStatus
    Date applicableDate
    boolean withInsurance

    Planholder planHolder
    Agent agent
    Date dateCreated

    static hasMany = [beneficiaries: Beneficiary,amendments: Amendment]

    def bindParams(Map params) {
        params.currentIssueDate = DateUtil.isValidDate(params.currentIssueDate)? Date.parse( 'MM/dd/yyyy', params.currentIssueDate ) : params.currentIssueDate
        params.applicableDate  = DateUtil.isValidDate(params.applicableDate) ? Date.parse( 'MM/dd/yyyy', params.applicableDate ) : params.applicableDate
        this.properties = params
    }

    def beforeInsert = {
        dateCreated = DateGroovyMethods.clearTime(new Date())
    }

    static constraints = {
        planNumber blank:  false, nullable:  false, unique: true
        product blank:  false, nullable:  false
        payingPeriod blank:  false, nullable:  false, matches: numeric(),  min: 0
        maturityPeriod blank:  false, nullable:  false, matches: numeric(), min: 0
        pnpPrice blank:  false, nullable:  false,  min: 0.0, max: 99999999.99, scale: 2
        modalInstallment blank:  false, nullable:  false, min: 0.0, max: 99999999.99, scale: 2
        numberOfUnits blank:  false, nullable:  false, matches: numeric(), min: 0
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
        dateCreated nullable: true
    }

    static mapping = {
        autoTimestamp false
    }


    public static String numeric() {
        return "^[0-9]+\$"
    }

    String toString() {
        product
    }
}
