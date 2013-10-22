package com.dataentry

class Plan implements Serializable {

    Long planNumber
    String product
    int payingPeriod
    int maturityPeriod
    BigDecimal pnpPrice
    BigDecimal modalInstallment
    int numberOfUnits
    Date origIssueDate
    Date currentIssueDate
    String paymentMode
    String planStatus
    Date applicableDate
    boolean withInsurance

    Planholder planHolder
    Agent agent

    static hasMany = [ beneficiaries: Beneficiary, amendments: Amendment]

    static constraints = {
        planNumber blank:  true, nullable:  true
        product blank:  true, nullable:  true
        payingPeriod blank:  true, nullable:  true
        maturityPeriod blank:  true, nullable:  true
        pnpPrice blank:  true, nullable:  true
        modalInstallment blank:  true, nullable:  true
        numberOfUnits blank:  true, nullable:  true
        origIssueDate blank:  true, nullable:  true
        currentIssueDate blank:  true, nullable:  true
        paymentMode blank:  true, nullable:  true
        planStatus blank:  true, nullable:  true
        applicableDate blank:  true, nullable:  true
        withInsurance blank:  true, nullable:  true
        planHolder nullable:  true
        agent nullable:  true
        beneficiaries nullable: true
        amendments nullable: true
    }

    String toString() {
        product
    }
}
