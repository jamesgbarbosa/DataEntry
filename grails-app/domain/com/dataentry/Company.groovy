package com.dataentry

class Company implements Serializable {

    static auditable  = [ignore:['version']]
    String name
    String address1
    String address2
    String address3
    String email
    String landline
    String mobile
    String zipcode
    String city
    String province


    static constraints = {
        name blank: false, nulalble: false, unique: true
        address1 blank: true, nullable: true
        address2 blank: true, nullable: true
        address3 blank: true, nullable: true
        email blank: true, nullable: true
        landline blank: true, nullable: true
        mobile blank: true, nullable: true
        zipcode blank: true, nullable: true
        city blank: true, nullable: true
        province blank: true, nullable: true
    }

    def beforeInsert = {
        name = name.toUpperCase()
    }

    def beforeUpdate() {
        name = name.toUpperCase()
    }

//    def onChange = { oldMap,newMap ->
//        def action
//        action += "Company Update\n"
//        oldMap.each({ key, oldVal ->
//            if(oldVal != newMap[key]) {
//                action += " * $key changed from $oldVal to " + newMap[key] + "\n"
//            }
//        })
//    }//*/
    String toString() {
        return name
    }

    boolean equals(o) {
        if (this.is(o)) return true
        if (getClass() != o.class) return false

        Company company = (Company) o

        if (address1 != company.address1) return false
        if (address2 != company.address2) return false
        if (address3 != company.address3) return false
        if (id != company.id) return false
        if (name != company.name) return false
        if (version != company.version) return false

        return true
    }

    int hashCode() {
        int result
        result = name.hashCode()
        result = 31 * result + (address1 != null ? address1.hashCode() : 0)
        result = 31 * result + (address2 != null ? address2.hashCode() : 0)
        result = 31 * result + (address3 != null ? address3.hashCode() : 0)
        result = 31 * result + (id != null ? id.hashCode() : 0)
        result = 31 * result + (version != null ? version.hashCode() : 0)
        return result
    }
}
