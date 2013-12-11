package com.dataentry

class Company implements Serializable {

    String name
    String address1
    String address2
    String address3

    static constraints = {
        name blank: false, nulalble: false
        address1 blank: true, nullable: true
        address2 blank: true, nullable: true
        address3 blank: true, nullable: true
    }
}
