import com.dataentry.Agent
import com.dataentry.Beneficiary
import com.dataentry.Planholder
import com.dateentry.reftables.Product

class BootStrap {

    def init = { servletContext ->
        def product = new Product(name: 'Sample1').save(flush: true)
        def product1 = new Product(name: 'Sample2').save(flush: true)
        def product2 = new Product(name: 'Sample3').save(flush: true)
        def product3 = new Product(name: 'Sample4').save(flush: true)
        def product4 = new Product(name: 'Sample5').save(flush: true)
        def product5 = new Product(name: 'Sample6').save(flush: true)

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
    def destroy = {
    }
}
