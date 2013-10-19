package com.dataentry



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Amendment)
class AmendmentTests {

    def amendment

    @Before
    public void setUp() {
        amendment = new Amendment()
        amendment.amendmentType = "test"
        amendment.approvedBy = "test"
        amendment.effectiveDate = new Date()
        amendment.filingDate = new Date()
        amendment.plan = new Plan()
    }

    void testSuccessfulValidate() {
        assertTrue amendment.validate()
    }
}
