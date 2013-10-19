package com.dataentry



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Beneficiary)
class BeneficiaryTests {

    def beneficiary

    @Before
    void setUp() {

        beneficiary = new Beneficiary()
        beneficiary.designation = "test"
        beneficiary.relationship = "test"
        beneficiary.firstName = "James"
        beneficiary.lastName = "Barbosa"
        beneficiary.clientType = "Beneficiary"
        beneficiary.birthdate = new Date()
        beneficiary.gender = "Male"
    }


    void testSuccessfulValidation() {
        assertTrue beneficiary.validate()
    }

}
