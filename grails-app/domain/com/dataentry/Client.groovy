package com.dataentry

class Client {

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

    static constraints = {
        clientType blank:  true, nullable:  true
        lastName blank:  true, nullable:  true
        firstName blank:  true, nullable:  true
        middleName blank:  true, nullable:  true
        birthdate blank:  true, nullable:  true
        address1 blank:  true, nullable:  true
        address2 blank:  true, nullable:  true
        address3 blank:  true, nullable:  true
        address4 blank:  true, nullable:  true
        address5 blank:  true, nullable:  true
        address6 blank:  true, nullable:  true
        landline blank:  true, nullable:  true
        mobile blank:  true, nullable:  true
        officenumber blank:  true, nullable:  true
        email blank:  true, nullable:  true
        gender blank:  true, nullable:  true
    }
}
