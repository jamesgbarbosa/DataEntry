package com.dataentry



import org.junit.*
import grails.test.mixin.*

@TestFor(ClientController)
@Mock(Client)
class ClientControllerTests {

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

        assert model.clientInstanceList.size() == 0
        assert model.clientInstanceTotal == 0
    }
}
