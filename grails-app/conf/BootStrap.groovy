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
import com.dataentry.Amendment

class BootStrap {

    def init = { servletContext ->
//        Environment.executeForCurrentEnvironment {
//            development {
                def product = new Product(name: 'PENSION MEGA').save(flush: true, failOnError: true)
                def product1 = new Product(name: 'PENSION VALUE').save(flush: true, failOnError: true)
                def product2 = new Product(name: 'MASTERFUND BASIC').save(flush: true, failOnError: true)
                def product3 = new Product(name: 'MASTERFUND ADVANCE').save(flush: true, failOnError: true)
                def product4 = new Product(name: 'MASTERFUND PRIME').save(flush: true, failOnError: true)

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
                new AmendmentTypes(name: 'Update Birthday').save(flush: true, failOnError: true)

                new PaymentMode(name: 'SPOT-CASH').save(flush: true, failOnError: true)
                new PaymentMode(name: 'MONTHLY').save(flush: true, failOnError: true)
                new PaymentMode(name: 'QUARTERLY').save(flush: true, failOnError: true)
                new PaymentMode(name: 'SEMI-ANNUAL').save(flush: true, failOnError: true)
                new PaymentMode(name: 'ANNUAL').save(flush: true, failOnError: true)

                new PlanStatus(name: 'ACTIVE').save(flush: true, failOnError: true)
                new PlanStatus(name: 'LAPSED').save(flush: true, failOnError: true)
                new PlanStatus(name: 'FULLY PAID').save(flush: true, failOnError: true)
                new PlanStatus(name: 'FULLY AVAILED').save(flush: true, failOnError: true)
                new PlanStatus(name: 'CANCELLED').save(flush: true, failOnError: true)
                new PlanStatus(name: 'DTV').save(flush: true, failOnError: true)
                new PlanStatus(name: 'PTV').save(flush: true, failOnError: true)
                new PlanStatus(name: 'SERVICED').save(flush: true, failOnError: true)
                new PlanStatus(name: 'CANCELLED POLICY PLAN').save(flush: true, failOnError: true)

                new Designation(name: 'INSURANCE - PRIMARY').save(flush: true, failOnError: true)
                new Designation(name: 'INSURANCE - SECONDARY').save(flush: true, failOnError: true)
                new Designation(name: 'PENSION BENEFICIARY').save(flush: true, failOnError: true)
                new Designation(name: 'INSURANCE / PENSION BENEFICIARY').save(flush: true, failOnError: true)
                new Designation(name: 'SCHOLAR').save(flush: true, failOnError: true)
                new Designation(name: 'OTHERS').save(flush: true, failOnError: true)

                new Relationship(name: 'SPOUSE').save(flush: true, failOnError: true)
                new Relationship(name: 'CHILDREN').save(flush: true, failOnError: true)
                new Relationship(name: 'PARENT').save(flush: true, failOnError: true)
                new Relationship(name: 'SIBLING').save(flush: true, failOnError: true)
                new Relationship(name: 'GRANDCHILD').save(flush: true, failOnError: true)
                new Relationship(name: 'COUSIN').save(flush: true, failOnError: true)
                new Relationship(name: 'FIANCEE').save(flush: true, failOnError: true)
                new Relationship(name: 'NEPHEW / NIECE').save(flush: true, failOnError: true)
                new Relationship(name: 'OTHERS').save(flush: true, failOnError: true)

                def firstNames = ['George', 'Jin','Ben','John','Katie','Joey','James','Armand','Joel','Jimmy','Donna','Anne','Ricky']
                def lastNames = ['Smith', 'Kelly','Verdine','Lowrance','Curhan','Alfred','Marvulli','Borris','Estrella','Diaz','Gonzales','Isenstein','Isenheim']

                def client1 = new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                def client2 = new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                def client3 = new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Male' ).save(flush: true, failOnError: true)
                new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)

                new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12),middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)
                new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Male').save(flush: true, failOnError: true)

                new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Female').save(flush: true, failOnError: true)
                new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Female').save(flush: true, failOnError: true)
                new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Female').save(flush: true, failOnError: true)
                new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Female').save(flush: true, failOnError: true)
                new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Female').save(flush: true, failOnError: true)
                new Client(firstName: firstNames.get((int)Math.random()*12), lastName: lastNames.get((int)Math.random()*12) ,middleName: 'X' , birthdate: new Date(), gender: 'Female').save(flush: true, failOnError: true)

                def p = new Planholder(clientProfile: client1).save(flush: true, failOnError: true)
                def b = new Beneficiary(clientProfile: client2, designation: 'INSURANCE - PRIMARY', relationship: 'GRANDCHILD').save(flush: true, failOnError: true)
                def a = new Agent(clientProfile: client3, agency: 'test', appointmentDate: new Date(),groupName: 'test', unit: 'test' ).save(flush: true, failOnError: true)
                def beneficiaries = new ArrayList<Beneficiary>()
                beneficiaries.add(b)



        new Plan(planNumber: 'p100', beneficiaries: b, agent: a, planHolder: p, product: 'MASTERFUND PRIME', currentIssueDate: new Date(), payingPeriod: 1, maturityPeriod: 1, pnpPrice: 1
                ,paymentMode: 'ANNUAL', modalInstallment: 1, numberOfUnits: 1, planStatus: 'ACTIVE', withInsurance: false).save(flush:true, failOnError: true)



//            }
//        }


    }
    def destroy = {
    }
}
