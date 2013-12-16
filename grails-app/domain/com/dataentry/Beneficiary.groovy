package com.dataentry

class Beneficiary implements Serializable {

    Client clientProfile
    Company company
    String designation
    String relationship

    Beneficiary() {
        clientProfile = new Client()
        company = new Company()
    }
//    static belongsTo = [plan: Plan]
    static constraints = {
        designation blank:  false, nullable:  false
        relationship blank:  false, nullable:  false
        clientProfile nullable: true, validator: { val,obj ->
            if(obj.company == null && val == null) {
                return false
            }
        }
        company nullable: true,  validator: { val,obj ->
            if(obj.clientProfile == null && val == null) {
                return false
            }
        }
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

    String toString() {
        return name() + ":" + designation
    }
}
