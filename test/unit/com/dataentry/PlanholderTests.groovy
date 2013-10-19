package com.dataentry



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Planholder)
class PlanholderTests {
    
    def planHolder
    
    @Before
    void setUp() {
        planHolder = new Planholder()
        planHolder.firstName = "James"
        planHolder.lastName = "Barbosa"
        planHolder.clientType = "Agent"
        planHolder.birthdate = new Date()
        planHolder.gender = "Male"
        planHolder.firstName = "James"
        planHolder.lastName = "Barbosa"
        planHolder.clientType = "Agent"
        planHolder.birthdate = new Date()
        planHolder.gender = "Male"
        planHolder.address1 = "test"
        planHolder.address2 = "test"
        planHolder.address3 = "test"
        planHolder.address4 = "test"
        planHolder.address5 = "test"
        planHolder.address6 = "test"
        planHolder.email = "myemail@gmail.com"
        planHolder.landline = "test"
        planHolder.mobile = "test"
        
    }
    void testSuccessfulValidate() {
        assertTrue planHolder.validate()
    }
}
