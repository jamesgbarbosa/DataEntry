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
        designation blank:  false, nullable:  false
        relationship blank:  false, nullable:  false
        clientProfile: nullable: false
    }
}
