import com.dateentry.reftables.Product

class BootStrap {

    def init = { servletContext ->
        def product = new Product(name: 'Sample1').save(flush: true)
        def product1 = new Product(name: 'Sample2').save(flush: true)
        def product2 = new Product(name: 'Sample3').save(flush: true)
        def product3 = new Product(name: 'Sample4').save(flush: true)
        def product4 = new Product(name: 'Sample5').save(flush: true)
        def product5 = new Product(name: 'Sample6').save(flush: true)
    }
    def destroy = {
    }
}
