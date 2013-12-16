import com.dataentry.Agent
import com.dataentry.Beneficiary
import com.dataentry.Company
import com.dataentry.Plan
import com.dataentry.Planholder
import com.dataentry.Role
import com.dataentry.UserAccount
import com.dataentry.UserAccountRole
import com.dateentry.reftables.Gender
import com.dateentry.reftables.Product
import com.dateentry.reftables.AmendmentTypes
import com.dataentry.Client
import com.dateentry.reftables.PaymentMode
import com.dateentry.reftables.PlanStatus
import grails.util.Environment
import com.dateentry.reftables.Designation
import com.dateentry.reftables.Relationship
import com.dataentry.Amendment
import com.dateentry.reftables.ZipCodes

class BootStrap {
    def springSecurityService

    def init = { servletContext ->
//        Environment.executeForCurrentEnvironment {
//            development {
                def adminRole = Role.findByAuthority("ROLE_ADMIN")
                if (!adminRole) {
                    adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
                }

                def userRole = Role.findByAuthority("ROLE_USER")
                if (!userRole) {
                    userRole = new Role(authority: 'ROLE_USER').save(flush: true)
                }

                if (!UserAccount.findByUsername("admin")){
                    def superUserAccount = new UserAccount(username: 'admin', enabled: true
                            , password: "admin", confirmPassword: "admin"
                            )
                    superUserAccount.save(flush: true, failOnError: true)

                    UserAccountRole.create(superUserAccount, adminRole, true)
                }

                if (!UserAccount.findByUsername("user")){
                    def user = new UserAccount(username: "user", enabled: true,
                            password: "user", confirmPassword: "user")
                    user.save(flush: true, failOnError: true)

                    UserAccountRole.create(user, userRole, true)
                }

                if(Product.list().size() == 0) {
                        def product = new Product(name: 'PENSION MEGA').save(flush: true, failOnError: true)
                        def product1 = new Product(name: 'PENSION VALUE').save(flush: true, failOnError: true)
                        def product2 = new Product(name: 'MASTERFUND BASIC').save(flush: true, failOnError: true)
                        def product3 = new Product(name: 'MASTERFUND ADVANCE').save(flush: true, failOnError: true)
                        def product4 = new Product(name: 'MASTERFUND PRIME').save(flush: true, failOnError: true)
                }

                if(AmendmentTypes.list().size() == 0) {
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
                    new AmendmentTypes(name: 'Re-dating').save(flush: true, failOnError: true)
                    new AmendmentTypes(name: 'Transfer/Group Business').save(flush: true, failOnError: true)
                }

                if(PaymentMode.list().size() == 0) {
                        new PaymentMode(name: 'SPOT-CASH').save(flush: true, failOnError: true)
                        new PaymentMode(name: 'MONTHLY').save(flush: true, failOnError: true)
                        new PaymentMode(name: 'QUARTERLY').save(flush: true, failOnError: true)
                        new PaymentMode(name: 'SEMI-ANNUAL').save(flush: true, failOnError: true)
                        new PaymentMode(name: 'ANNUAL').save(flush: true, failOnError: true)
                }

                if(Gender.list().size() == 0) {
                    new Gender(name: 'TBD').save(flush: true, failOnError: true)
                    new Gender(name: 'Male').save(flush: true, failOnError: true)
                    new Gender(name: 'Female').save(flush: true, failOnError: true)
                }

                if(PlanStatus.list().size() == 0) {
                        new PlanStatus(name: 'ACTIVE').save(flush: true, failOnError: true)
                        new PlanStatus(name: 'LAPSED').save(flush: true, failOnError: true)
                        new PlanStatus(name: 'FULLY PAID').save(flush: true, failOnError: true)
                        new PlanStatus(name: 'FULLY AVAILED').save(flush: true, failOnError: true)
                        new PlanStatus(name: 'CANCELLED').save(flush: true, failOnError: true)
                        new PlanStatus(name: 'DTV').save(flush: true, failOnError: true)
                        new PlanStatus(name: 'PTV').save(flush: true, failOnError: true)
                        new PlanStatus(name: 'SERVICED').save(flush: true, failOnError: true)
                        new PlanStatus(name: 'CANCELLED POLICY PLAN').save(flush: true, failOnError: true)
                }

                if(Designation.list().size() == 0) {
                        new Designation(name: 'CO-ASSURED').save(flush: true, failOnError: true)
                        new Designation(name: 'INSURANCE - PRIMARY').save(flush: true, failOnError: true)
                        new Designation(name: 'INSURANCE - SECONDARY').save(flush: true, failOnError: true)
                        new Designation(name: 'PENSION BENEFICIARY').save(flush: true, failOnError: true)
                        new Designation(name: 'INSURANCE / PENSION BENEFICIARY').save(flush: true, failOnError: true)
                        new Designation(name: 'SCHOLAR').save(flush: true, failOnError: true)
                        new Designation(name: 'OTHERS').save(flush: true, failOnError: true)
                }

                if(Relationship.list().size() == 0) {
                        new Relationship(name: 'SPOUSE').save(flush: true, failOnError: true)
                        new Relationship(name: 'CHILDREN').save(flush: true, failOnError: true)
                        new Relationship(name: 'PARENT').save(flush: true, failOnError: true)
                        new Relationship(name: 'SIBLING').save(flush: true, failOnError: true)
                        new Relationship(name: 'GRANDCHILD').save(flush: true, failOnError: true)
                        new Relationship(name: 'COUSIN').save(flush: true, failOnError: true)
                        new Relationship(name: 'FIANCEE').save(flush: true, failOnError: true)
                        new Relationship(name: 'NEPHEW / NIECE').save(flush: true, failOnError: true)
                        new Relationship(name: 'OTHERS').save(flush: true, failOnError: true)
                }

                if(ZipCodes.list().size() == 0) {
                    new ZipCodes(code: '1123', city: 'Quezon City', province: 'Test Province').save(flush: true, failOnError: true)
                    new ZipCodes(code: '1133', city: 'Makati City', province: 'A Province').save(flush: true, failOnError: true)
                    new ZipCodes(code: '1143', city: 'Cebu City', province: 'B Province').save(flush: true, failOnError: true)
                    new ZipCodes(code: '1234', city: 'Bohol City', province: 'C Province').save(flush: true, failOnError: true)
                    new ZipCodes(code: '1523', city: 'Laguna City', province: 'D Province').save(flush: true, failOnError: true)
                    new ZipCodes(code: '1646', city: 'New York City', province: 'E Province').save(flush: true, failOnError: true)
                    new ZipCodes(code: '1252', city: 'Test City', province: 'F Province').save(flush: true, failOnError: true)
                    new ZipCodes(code: '1776', city: 'My City', province: 'G Province8').save(flush: true, failOnError: true)
                    new ZipCodes(code: '6421', city: 'Caloocan City', province: 'H Province').save(flush: true, failOnError: true)
                }


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

                def p = new Planholder(clientProfile: client1, company: null).save(flush: true, failOnError: true)
                def b = new Beneficiary(clientProfile: client2, designation: 'INSURANCE - PRIMARY', relationship: 'GRANDCHILD', company: null).save(flush: true, failOnError: true)
                def a = new Agent(clientProfile: client3, agency: 'test', appointmentDate: new Date(),groupName: 'test', unit: 'test', counselorCode: 'Testr' ).save(flush: true, failOnError: true)
                def beneficiaries = new ArrayList<Beneficiary>()
                beneficiaries.add(b)

        int i = 3
        2.times {

            new Plan(planNumber: "P" + i++, beneficiaries: b, agent: a, planHolder: p, product: 'MASTERFUND PRIME', currentIssueDate: new Date(), payingPeriod: 1, maturityPeriod: 1, pnpPrice: 1
                    ,paymentMode: 'ANNUAL', modalInstallment: 1, numberOfUnits: 1, planStatus: 'ACTIVE', withInsurance: false).save(flush:true, failOnError: true)
        }


               new Company(name: 'TEST1', address1: 'ASDASD').save(flush: true)
               new Company(name: 'TEST2', address1: 'AasdaSD').save(flush: true)
               new Company(name: 'TEST3', address1: '24123').save(flush: true)
               new Company(name: 'TEST4', address1: 'j5675d').save(flush: true)


//            }
//        }


    }
    def destroy = {
    }
}
