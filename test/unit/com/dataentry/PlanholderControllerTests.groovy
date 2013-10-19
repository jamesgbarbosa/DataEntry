package com.dataentry



import org.junit.*
import grails.test.mixin.*

@TestFor(PlanholderController)
@Mock([Planholder, Client])
class PlanholderControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        params.firstName = "James"
        params.lastName = "Barbosa"
        params.clientType = "Plan Holder"
        params.birthdate = new Date()
        params.gender = "Male"
        params.address1 = "test"
        params.address2 = "test"
        params.address3 = "test"
        params.address4 = "test"
        params.address5 = "test"
        params.address6 = "test"
        params.email = "myemail@gmail.com"
        params.landline = "test"
        params.mobile = "test"
    }

    void testIndex() {
        controller.index()
        assert "/planholder/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.planholderInstanceList.size() == 0
        assert model.planholderInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.planholderInstance != null
    }

    void testSave() {
        controller.save()

        assert model.planholderInstance != null
        assert view == '/planholder/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/planholder/show/1'
        assert controller.flash.message != null
        assert Planholder.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/planholder/list'

        populateValidParams(params)
        def planholder = new Planholder(params)

        assert planholder.save() != null

        params.id = planholder.id

        def model = controller.show()

        assert model.planholderInstance == planholder
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/planholder/list'

        populateValidParams(params)
        def planholder = new Planholder(params)

        assert planholder.save() != null

        params.id = planholder.id

        def model = controller.edit()

        assert model.planholderInstance == planholder
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/planholder/list'

        response.reset()

        populateValidParams(params)
        def planholder = new Planholder(params)

        assert planholder.save() != null

        // test invalid parameters in update
//        params.id = planholder.id
        //TODO: add invalid values to params object

//        controller.update()
//
//        assert view == "/planholder/edit"
//        assert model.planholderInstance != null
//
//        planholder.clearErrors()
//
//        populateValidParams(params)
//        controller.update()
//
//        assert response.redirectedUrl == "/planholder/show/$planholder.id"
//        assert flash.message != null
//
//        //test outdated version number
//        response.reset()
//        planholder.clearErrors()
//
//        populateValidParams(params)
//        params.id = planholder.id
//        params.version = -1
//        controller.update()
//
//        assert view == "/planholder/edit"
//        assert model.planholderInstance != null
//        assert model.planholderInstance.errors.getFieldError('version')
//        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/planholder/list'

        response.reset()

        populateValidParams(params)
        def planholder = new Planholder(params)

        assert planholder.save() != null
        assert Planholder.count() == 1

        params.id = planholder.id

        controller.delete()

        assert Planholder.count() == 0
        assert Planholder.get(planholder.id) == null
        assert response.redirectedUrl == '/planholder/list'
    }
}
