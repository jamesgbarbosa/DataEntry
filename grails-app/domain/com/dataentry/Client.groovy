package com.dataentry

class Client implements Serializable {

    String clientType
    String lastName
    String firstName
    String middleName
    Date birthdate
    String address1
    String address2
    String address3
    String address4
    String address5
    String address6
    String landline
    String mobile
    String officenumber
    String email
    String gender
    String fullName

    def beforeInsert = {
        fullName = fullName()
    }

    def beforeUpdate() {
        fullName = fullName()
    }


    static constraints = {
        clientType blank:  true, nullable:  true, inList:['Plan Holder','Beneficiary','Agent' ]
        lastName blank:  false, nullable:  false
        firstName blank:  false, nullable:  false
        middleName blank:  true, nullable:  true
        gender blank:  false, nullable:  false, inList: ['Male','Female']
        birthdate blank:  false, nullable:  false
        email blank:  true, nullable:  true
        address1 blank:  true, nullable:  true
        address2 blank:  true, nullable:  true
        address3 blank:  true, nullable:  true
        address4 blank:  true, nullable:  true
        address5 blank:  true, nullable:  true
        address6 blank:  true, nullable:  true
        landline blank:  true, nullable:  true
        mobile blank:  true, nullable:  true
        officenumber blank:  true, nullable:  true
        fullName  blank: true, nullable:  true


    }

    boolean validateClientUniqueness() {
        if(this.firstName && this.lastName && this.birthdate && this.gender ){
            def clients = Client.withCriteria {
                eq("firstName",this.firstName)
                eq("lastName", this.lastName)
                eq("birthdate", this.birthdate)
                eq("gender", this.gender)
            }

            if(clients) {
                return false
            }

            return true
        }
    }

    String fullName() {
        return "${firstName}${middleName? " ${middleName}": ''} ${lastName}"
    }
}
