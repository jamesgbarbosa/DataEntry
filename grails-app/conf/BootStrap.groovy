import com.dataentry.Agent
import com.dataentry.Beneficiary
import com.dataentry.Plan
import com.dataentry.Planholder
import com.dateentry.reftables.Product
import com.dateentry.reftables.AmendmentTypes
import com.dataentry.Client
import com.dateentry.reftables.PaymentMode
import com.dateentry.reftables.PlanStatus
import grails.util.Environment
import com.dateentry.reftables.Designation
import com.dateentry.reftables.Relationship

class BootStrap {

    def init = { servletContext ->
//        Environment.executeForCurrentEnvironment {
//            development {
                def product = new Product(name: 'Sample1').save(flush: true, failOnError: true)
                def product1 = new Product(name: 'Sample2').save(flush: true, failOnError: true)
                def product2 = new Product(name: 'Sample3').save(flush: true, failOnError: true)
                def product3 = new Product(name: 'Sample4').save(flush: true, failOnError: true)
                def product4 = new Product(name: 'Sample5').save(flush: true, failOnError: true)
                def product5 = new Product(name: 'Sample6').save(flush: true, failOnError: true)

                new AmendmentTypes(name: 'Transfer').save(flush: true, failOnError: true)
                new AmendmentTypes(name: 'Change Name').save(flush: true, failOnError: true)
                new AmendmentTypes(name: 'Change Address').save(flush: true, failOnError: true)
                new AmendmentTypes(name: 'Change Beneficiary').save(flush: true, failOnError: true)
                new AmendmentTypes(name: 'Reinstatement').save(flush: true, failOnError: true)
                new AmendmentTypes(name: 'Plan Upgrade').save(flush: true, failOnError: true)
                new AmendmentTypes(name: 'Change Payment Mode').save(flush: true, failOnError: true)
                new AmendmentTypes(name: 'Replacement Policy Contract').save(flush: true, failOnError: true)
                new AmendmentTypes(name: 'Replacement CFP').save(flush: true, failOnError: true)
                new AmendmentTypes(name: 'Initial CFP Request').save(flush: true, failOnError: true)
                new AmendmentTypes(name: 'Replacement Policy Contract / CFP').save(flush: true, failOnError: true)
                new AmendmentTypes(name: 'Update Birthdate').save(flush: true, failOnError: true)

                new PaymentMode(name: 'Sample1').save(flush: true, failOnError: true)
                new PaymentMode(name: 'Sample2').save(flush: true, failOnError: true)
                new PaymentMode(name: 'Sample3').save(flush: true, failOnError: true)
                new PaymentMode(name: 'Sample4').save(flush: true, failOnError: true)
                new PaymentMode(name: 'Sample5').save(flush: true, failOnError: true)
                new PaymentMode(name: 'Sample6').save(flush: true, failOnError: true)

                new PlanStatus(name: 'Sample1').save(flush: true, failOnError: true)
                new PlanStatus(name: 'Sample2').save(flush: true, failOnError: true)
                new PlanStatus(name: 'Sample3').save(flush: true, failOnError: true)
                new PlanStatus(name: 'Sample4').save(flush: true, failOnError: true)
                new PlanStatus(name: 'Sample5').save(flush: true, failOnError: true)
                new PlanStatus(name: 'Sample6').save(flush: true, failOnError: true)

                new Designation(name: 'Sample1').save(flush: true, failOnError: true)
                new Designation(name: 'Sample2').save(flush: true, failOnError: true)
                new Designation(name: 'Sample3').save(flush: true, failOnError: true)
                new Designation(name: 'Sample4').save(flush: true, failOnError: true)
                new Designation(name: 'Sample5').save(flush: true, failOnError: true)
                new Designation(name: 'Sample6').save(flush: true, failOnError: true)

                new Relationship(name: 'Sample1').save(flush: true, failOnError: true)
                new Relationship(name: 'Sample2').save(flush: true, failOnError: true)
                new Relationship(name: 'Sample3').save(flush: true, failOnError: true)
                new Relationship(name: 'Sample4').save(flush: true, failOnError: true)
                new Relationship(name: 'Sample5').save(flush: true, failOnError: true)
                new Relationship(name: 'Sample6').save(flush: true, failOnError: true)



                def client1 = new Client(firstName: 'Agent1', lastName: 'test' ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                def client2 = new Client(firstName: 'Agent2', lastName: 'apple' ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                def client3 = new Client(firstName: 'Agent3', lastName: 'hello' ,middleName: 'X' , birthdate: new Date(), gender: 'Male' ).save(flush: true, failOnError: true)
                new Client(firstName: 'Agent4', lastName: 'orange' ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                new Client(firstName: 'Agent5', lastName: 'red' ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                new Client(firstName: 'Agent6', lastName: 'blue' ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)

                new Client(firstName: 'John', lastName: 'test' ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                new Client(firstName: 'James', lastName: 'apple' ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                new Client(firstName: 'Edward', lastName: 'hello' ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                new Client(firstName: 'Richard', lastName: 'orange' ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                new Client(firstName: 'Ben', lastName: 'red' ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                new Client(firstName: 'Michael', lastName: 'blue' ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)

                new Client(firstName: 'Diana', lastName: 'test' ,middleName: 'X' , birthdate: new Date(), gender: 'Female').save(flush: true, failOnError: true)
                new Client(firstName: 'Rona', lastName: 'apple' ,middleName: 'X' , birthdate: new Date(), gender: 'Female').save(flush: true, failOnError: true)
                new Client(firstName: 'Angelica', lastName: 'hello' ,middleName: 'X' , birthdate: new Date(), gender: 'Female').save(flush: true, failOnError: true)
                new Client(firstName: 'Elena', lastName: 'orange' ,middleName: 'X' , birthdate: new Date(), gender: 'Female').save(flush: true, failOnError: true)
                new Client(firstName: 'Zafina', lastName: 'red' ,middleName: 'X' , birthdate: new Date(), gender: 'Female').save(flush: true, failOnError: true)
                new Client(firstName: 'Anne', lastName: 'blue' ,middleName: 'X' , birthdate: new Date(), gender: 'Female').save(flush: true, failOnError: true)

                def p = new Planholder(clientProfile: client1).save(flush: true, failOnError: true)
                def b = new Beneficiary(clientProfile: client2, designation: 'Sample1', relationship: 'tae').save(flush: true, failOnError: true)
                def a = new Agent(clientProfile: client3, agency: 'test', appointmentDate: new Date(),groupName: 'test', unit: 'test' ).save(flush: true, failOnError: true)
                def beneficiaries = new ArrayList<Beneficiary>()
                beneficiaries.add(b)
                new Plan(planNumber: 'p100', beneficiaries: b, agent: a, planHolder: p, product: 'Sample1', currentIssueDate: new Date(), payingPeriod: 1, maturityPeriod: 1, pnpPrice: 1
                ,paymentMode: 'Sample1', modalInstallment: 1, numberOfUnits: 1, planStatus: 'Sample1', withInsurance: false).save(flush:true, failOnError: true)



//            }
//        }


    }
    def destroy = {
    }
}
