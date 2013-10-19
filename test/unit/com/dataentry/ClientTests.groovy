package com.dataentry



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Client)
class ClientTests {
    def client
    @Before
    void setUp() {

        client = new Client()
        client.firstName = "James"
        client.lastName = "Barbosa"
        client.clientType = "Beneficiary"
        client.birthdate = new Date()
        client.gender = "Male"
        client.address1 = "test"
        client.address2 = "test"
        client.address3 = "test"
        client.address4 = "test"
        client.address5 = "test"
        client.address6 = "test"
        client.email = "myemail@gmail.com"
        client.landline = "test"
        client.mobile = "test"
    }
    
    void testSuccessfulValidation (){
        assertTrue client.validate()
    }

    void testClientTypeNotInListFailedValidation() {
        client.clientType = "Not in the list for sure"
        assertFalse client.validate()
    }

    void testNameBirthdateGenderUniqueness() {
        def newClient = client
        client.save()
        assertFalse newClient.validateClientUniqueness()


    }
}
