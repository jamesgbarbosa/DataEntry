package com.dataentry



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@Ignore
@TestFor(Agent)
class AgentTests {
    def agent
    
    @Before
    void setUp() {
        agent = new Agent()
        agent.agency = "test"
        agent.agentCode = "test"
        agent.appointmentDate = new Date()
        agent.groupName = "test"
        agent.firstName = "James"
        agent.lastName = "Barbosa"
        agent.clientType = "Agent"
        agent.birthdate = new Date()
        agent.gender = "Male"
        agent.firstName = "James"
        agent.lastName = "Barbosa"
        agent.clientType = "Agent"
        agent.birthdate = new Date()
        agent.gender = "Male"
        agent.address1 = "test"
        agent.address2 = "test"
        agent.address3 = "test"
        agent.address4 = "test"
        agent.address5 = "test"
        agent.address6 = "test"
        agent.email = "myemail@gmail.com"
        agent.landline = "test"
        agent.mobile = "test"
    }
    void testSuccessfulValidate() {
        assertTrue agent.validate()

    }
}
