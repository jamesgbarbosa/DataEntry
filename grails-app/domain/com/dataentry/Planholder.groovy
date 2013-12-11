package com.dataentry

class Planholder implements Serializable {

    Client clientProfile
    Company company

    Planholder() {
        clientProfile = new Client()
        company = new Company()
    }

    static constraints = {
        clientProfile nullable: true
        company nullable: true
    }

    String name() {
        if(clientProfile?.firstName) {
            return clientProfile.fullNameBirthdateAndGender()
        } else if(company) {
            return company.name
        } else {
            return ""
        }
    }

}
