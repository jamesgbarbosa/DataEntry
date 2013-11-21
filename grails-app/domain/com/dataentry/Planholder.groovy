package com.dataentry

class Planholder implements Serializable {

    Client clientProfile

    Planholder() {
        clientProfile = new Client()
    }

    static constraints = {
        clientProfile: nullable: false
    }

}
