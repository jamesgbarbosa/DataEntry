package com.dataentry

class Company {

    String name
    String address

    static constraints = {
        name blank: false, nulalble: false
        address blank: true, nullable: true
    }
}
