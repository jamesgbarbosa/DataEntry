package com.dataentry



import org.junit.*
import grails.test.mixin.*

@TestFor(ClientController)
@Mock([Client, Agent, Planholder, Beneficiary])
class ClientControllerTests {

    @Before
    void setUp() {
        new Agent(firstName: 'Agent1', lastName: 'test' , birthdate: new Date(), gender: 'Male', clientType: 'Agent').save(flush: true)
        new Agent(firstName: 'Agent2', lastName: 'apple' , birthdate: new Date(), gender: 'Male', clientType: 'Agent').save(flush: true)
        new Agent(firstName: 'Agent3', lastName: 'hello' , birthdate: new Date(), gender: 'Male', clientType: 'Agent').save(flush: true)
        new Agent(firstName: 'Agent4', lastName: 'orange' , birthdate: new Date(), gender: 'Male', clientType: 'Agent').save(flush: true)
        new Agent(firstName: 'Agent5', lastName: 'red' , birthdate: new Date(), gender: 'Male', clientType: 'Agent').save(flush: true)
        new Agent(firstName: 'Agent6', lastName: 'blue' , birthdate: new Date(), gender: 'Male', clientType: 'Agent').save(flush: true)

        new Planholder(firstName: 'John', lastName: 'test' , birthdate: new Date(), gender: 'Male', clientType: 'Plan Holder').save(flush: true)
        new Planholder(firstName: 'James', lastName: 'apple' , birthdate: new Date(), gender: 'Male', clientType: 'Plan Holder').save(flush: true)
        new Planholder(firstName: 'Edward', lastName: 'hello' , birthdate: new Date(), gender: 'Male', clientType: 'Plan Holder').save(flush: true)
        new Planholder(firstName: 'Richard', lastName: 'orange' , birthdate: new Date(), gender: 'Male', clientType: 'Plan Holder').save(flush: true)
        new Planholder(firstName: 'Ben', lastName: 'red' , birthdate: new Date(), gender: 'Male', clientType: 'Plan Holder').save(flush: true)
        new Planholder(firstName: 'Michael', lastName: 'blue' , birthdate: new Date(), gender: 'Male', clientType: 'Plan Holder').save(flush: true)

        new Beneficiary(firstName: 'Diana', lastName: 'test' , birthdate: new Date(), gender: 'Female', clientType: 'Beneficiary').save(flush: true)
        new Beneficiary(firstName: 'Rona', lastName: 'apple' , birthdate: new Date(), gender: 'Female', clientType: 'Beneficiary').save(flush: true)
        new Beneficiary(firstName: 'Angelica', lastName: 'hello' , birthdate: new Date(), gender: 'Female', clientType: 'Beneficiary').save(flush: true)
        new Beneficiary(firstName: 'Elena', lastName: 'orange' , birthdate: new Date(), gender: 'Female', clientType: 'Beneficiary').save(flush: true)
        new Beneficiary(firstName: 'Zafina', lastName: 'red' , birthdate: new Date(), gender: 'Female', clientType: 'Beneficiary').save(flush: true)
        new Beneficiary(firstName: 'Anne', lastName: 'blue' , birthdate: new Date(), gender: 'Female', clientType: 'Beneficiary').save(flush: true)
    }

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/client/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.clientInstanceList.size() == 10
        assert model.clientInstanceTotal == 18
    }

    void testSearchClients() {
        params.firstName = 'A'
        params.lastName = ''
        def model = controller.list()

        assert model.clientInstanceList.size() == 8
        assert model.clientInstanceList!=null
    }
}
