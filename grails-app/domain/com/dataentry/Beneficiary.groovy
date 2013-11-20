package com.dataentry

class Beneficiary implements Serializable {

    Client clientProfile
    String designation
    String relationship

    Beneficiary() {
        clientProfile = new Client()
    }
//    static belongsTo = [plan: Plan]
    static constraints = {
        designation blank:  true, nullable:  true
        relationship blank:  true, nullable:  true
        clientProfile: nullable: false
    }
}
