package com.dataentry

class Planholder implements Serializable {

    Client clientProfile
    Company company

    Planholder() {
        clientProfile = new Client()
        company = new Company()
    }

    static constraints = {
        clientProfile: nullable: true
        company: nullable: true
    }

}
