package com.dataentry



import org.junit.*
import grails.test.mixin.*

@Ignore
@TestFor(PlanController)
@Mock([Plan,Planholder])
class PlanControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        params.agent = null
        params.amendments = []
        params.applicableDate = new Date()
        params.beneficiaries = []
        params.currentIssueDate = new Date()
        params.maturityPeriod = 1
        params.modalInstallment = new BigDecimal("1")
        params.pnpPrice = new BigDecimal("1")
        params.numberOfUnits = 2
        params.origIssueDate = new Date()
        params.payingPeriod = 1
        params.paymentMode = "test"
        params.planHolder = null
        params.planStatus = "test"
        params.product = "Test"
        params.payingPeriod = 1

    }

    void testIndex() {
        controller.index()
        assert "/plan/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.planInstanceList.size() == 0
        assert model.planInstanceTotal == 0
    }

    void testSave() {
        populateValidParams(params)
        params.applicableDate = "10/10/2013"
        params.currentIssueDate = "10/10/2013"
        params.origIssueDate = "10/10/2013"
        controller.save()

        assert response.redirectedUrl == '/plan/show/1'
        assert controller.flash.message != null
        assert Plan.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/plan/list'

        populateValidParams(params)
        def plan = new Plan(params)

        assert plan.save() != null

        params.id = plan.id

        def model = controller.show()

        assert model.planInstance == plan
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/plan/list'

        populateValidParams(params)
        def plan = new Plan(params)

        assert plan.save() != null

        params.id = plan.id

        def model = controller.edit()

        assert model.planInstance == plan
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/plan/list'

        response.reset()

        populateValidParams(params)
        def plan = new Plan(params)

        assert plan.save() != null

        // test invalid parameters in update
//        params.id = plan.id
        //TODO: add invalid values to params object

//        controller.update()
//
//        assert view == "/plan/edit"
//        assert model.planInstance != null

//        plan.clearErrors()
//
//        populateValidParams(params)
//        controller.update()
//
//        assert response.redirectedUrl == "/plan/show/$plan.id"
//        assert flash.message != null

        //test outdated version number
//        response.reset()
//        plan.clearErrors()
//
//        populateValidParams(params)
//        params.id = plan.id
//        params.version = -1
//        controller.update()
//
//        assert view == "/plan/edit"
//        assert model.planInstance != null
//        assert model.planInstance.errors.getFieldError('version')
//        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/plan/list'

        response.reset()

        populateValidParams(params)
        def plan = new Plan(params)

        assert plan.save() != null
        assert Plan.count() == 1

        params.id = plan.id

        controller.delete()

        assert Plan.count() == 0
        assert Plan.get(plan.id) == null
        assert response.redirectedUrl == '/plan/list'
    }

    void testOnly() {
        Plan plan = new Plan(planHolder:         new Planholder(firstName: 'John', lastName: 'test' , birthdate: new Date(), gender: 'Male', clientType: 'Plan Holder').save(flush: true)
        ,product: 'Sample1', planNumber: 'P1000').save(flush: true)

        params.planID = 'P1000'
        params.productID = ''
        params.planholderName = ''

        def model = controller.list()

        assert model.planInstanceList.size() == 1
    }

    public List<Plan> searchPlans(params) {
        def plans = Plan.withCriteria {
            and {
                if(params.productID!='') {
                    eq("product","${params.productID}")
                }
                if(params.planID!=''){
                    eq("planNumber","${params.planID}")

                }
                if(params.planholderName!=''){
                    planHolder {
                        ilike("firstName","${params.planholderName}%")
                    }
                }
            }
        }
        return plans
    }
}
