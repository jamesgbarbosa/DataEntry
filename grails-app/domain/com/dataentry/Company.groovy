package com.dataentry

class Company implements Serializable {

    String name
    String address

    static constraints = {
        name blank: false, nulalble: false
        address blank: true, nullable: true
    }
}
