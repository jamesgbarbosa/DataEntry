package com.dataentry

class Client implements Serializable {

    String lastName
    String firstName
    String middleName
    Date birthdate
    String address1
    String address2
    String address3
    String city
    String province
    String zipcode
    String landline
    String mobile
    String officenumber
    String email
    String gender
    String fullName

    def bindParams(Map params) {
        params.birthdate = params.birthdate ? Date.parse( 'MM/dd/yyyy', params.birthdate ) : null
//        params.appointmentDate = params.appointmentDate ? Date.parse( 'MM/dd/yyyy', params.appointmentDate ) : null
        this.properties = params
    }

    def beforeInsert = {
        firstName = firstName?.toUpperCase()
        middleName = middleName?.toUpperCase()
        lastName = lastName?.toUpperCase()
        fullName = fullName()
    }

    def beforeUpdate() {
        firstName = firstName?.toUpperCase()
        middleName = middleName?.toUpperCase()
        lastName = lastName?.toUpperCase()
        fullName = fullName()
    }


    static constraints = {
        lastName blank:  false, nullable:  false
        firstName blank:  false, nullable:  false
        middleName blank:  false, nullable:  false
        gender blank:  false, nullable:  false, inList: ['Male','Female']
        birthdate blank:  false, nullable:  false
        email blank:  true, nullable:  true
        address1 blank:  true, nullable:  true
        address2 blank:  true, nullable:  true
        address3 blank:  true, nullable:  true
        city blank:  true, nullable:  true
        province blank:  true, nullable:  true
        zipcode blank:  true, nullable:  true
        landline blank:  true, nullable:  true
        mobile blank:  true, nullable:  true
        officenumber blank:  true, nullable:  true
        fullName  blank: true, nullable:  true


    }

    boolean validateClientUniqueness() {
        if(this.firstName && this.lastName && this.birthdate && this.gender ){
            def clients = Client.withCriteria {
                eq("firstName",this.firstName)
                eq("middleName",this.middleName)
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
//        return "${firstName}${middleName? " ${middleName}": ''} ${lastName}" .toUpperCase()
        return "${lastName}, ${firstName} ${middleName ? "${middleName}":''}".toUpperCase()
    }

    String fullNameBirthdateAndGender() {
        return "${lastName}, ${firstName} ${middleName ? "${middleName}":''}".toUpperCase() + " : " +  String.format("%1\$TD", birthdate) + " : " + gender
    }
}
