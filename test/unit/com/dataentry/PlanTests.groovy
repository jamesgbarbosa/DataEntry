package com.dataentry



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Plan)
class PlanTests {
    def plan

    @Before
    void setUp() {
        plan = new Plan()
        plan.agent = null
        plan.amendments = []
        plan.applicableDate = new Date()
        plan.beneficiaries = []
        plan.currentIssueDate = new Date()
        plan.maturityPeriod = 1
        plan.modalInstallment = new BigDecimal("1")
        plan.pnpPrice = new BigDecimal("1")
        plan.numberOfUnits = 2
        plan.origIssueDate = new Date()
        plan.payingPeriod = 1
        plan.paymentMode = "test"
        plan.planHolder = null
        plan.planStatus = "test"
        plan.product = "Test"
        plan.payingPeriod = 1

    }
    void testSucccessfulValidate() {
        assertTrue plan.validate()
    }
}
