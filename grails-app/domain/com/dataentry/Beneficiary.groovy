package com.dataentry

class Beneficiary extends Client {

    String designation
    String relationship


    static belongsTo = [plan: Plan]
    static constraints = {
        designation blank:  true, nullable:  true
        relationship blank:  true, nullable:  true
    }
}
