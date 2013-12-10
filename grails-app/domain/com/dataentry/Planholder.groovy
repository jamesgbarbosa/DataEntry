package com.dataentry

class Planholder implements Serializable {

    Client clientProfile
    Company company

    Planholder() {

    }

    static constraints = {
        clientProfile nullable: true
        company nullable: true
    }

}
