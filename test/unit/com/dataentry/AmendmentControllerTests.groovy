package com.dataentry



import org.junit.*
import grails.test.mixin.*

@TestFor(AmendmentController)
@Mock(Amendment)
class AmendmentControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        params.amendmentType = "test"
        params.approvedBy = "test"
        params.effectiveDate = new Date()
        params.filingDate = new Date()
        params.plan = new Plan()
    }

    void testIndex() {
        controller.index()
        assert "/amendment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.amendmentInstanceList.size() == 0
        assert model.amendmentInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.amendmentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.amendmentInstance != null
        assert view == '/amendment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/amendment/show/1'
        assert controller.flash.message != null
        assert Amendment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/amendment/list'

        populateValidParams(params)
        def amendment = new Amendment(params)

        assert amendment.save() != null

        params.id = amendment.id

        def model = controller.show()

        assert model.amendmentInstance == amendment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/amendment/list'

        populateValidParams(params)
        def amendment = new Amendment(params)

        assert amendment.save() != null

        params.id = amendment.id

        def model = controller.edit()

        assert model.amendmentInstance == amendment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/amendment/list'

        response.reset()

        populateValidParams(params)
        def amendment = new Amendment(params)

        assert amendment.save() != null

        // test invalid parameters in update
        params.id = amendment.id
        params.plan = null

        controller.update()

        assert view == "/amendment/edit"
        assert model.amendmentInstance != null

        amendment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/amendment/show/$amendment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        amendment.clearErrors()

        populateValidParams(params)
        params.id = amendment.id
        params.version = -1
        controller.update()

        assert view == "/amendment/edit"
        assert model.amendmentInstance != null
        assert model.amendmentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/amendment/list'

        response.reset()

        populateValidParams(params)
        def amendment = new Amendment(params)

        assert amendment.save() != null
        assert Amendment.count() == 1

        params.id = amendment.id

        controller.delete()

        assert Amendment.count() == 0
        assert Amendment.get(amendment.id) == null
        assert response.redirectedUrl == '/amendment/list'
    }
}
