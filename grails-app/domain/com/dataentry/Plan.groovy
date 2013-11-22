package com.dataentry

class Plan implements Serializable {

    String planNumber
    String product
    String payingPeriod
    String maturityPeriod
    BigDecimal pnpPrice
    BigDecimal modalInstallment
    String numberOfUnits
    Date origIssueDate
    Date currentIssueDate
    String paymentMode
    String planStatus
    Date applicableDate
    boolean withInsurance

    Planholder planHolder
    Agent agent

    static hasMany = [beneficiaries: Beneficiary,amendments: Amendment]

    def bindParams(Map params) {
        params.origIssueDate = params.origIssueDate ? Date.parse( 'MM/dd/yyyy', params.origIssueDate ) : null
        params.currentIssueDate = params.currentIssueDate? Date.parse( 'MM/dd/yyyy', params.currentIssueDate ) : null
        params.applicableDate  = params.applicableDate ? Date.parse( 'MM/dd/yyyy', params.applicableDate ) : null
        this.properties = params
    }

    static constraints = {
        planNumber blank:  false, nullable:  false
        product blank:  false, nullable:  false
        payingPeriod blank:  false, nullable:  false, matches: numeric()
        maturityPeriod blank:  false, nullable:  false, matches: numeric()
        pnpPrice blank:  false, nullable:  false
        modalInstallment blank:  false, nullable:  false
        numberOfUnits blank:  false, nullable:  false, matches: numeric()
        origIssueDate blank:  true, nullable:  true
        currentIssueDate blank:  false, nullable:  false
        paymentMode blank:  true, nullable:  true
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
