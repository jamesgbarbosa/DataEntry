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

    String toString() {
        return name()
    }

    boolean equals(o) {
        if (this.is(o)) return true
        if (getClass() != o.class) return false

        Planholder that = (Planholder) o
        if(clientProfile) {
            if (clientProfile.id != that.clientProfile.id) return false
        } else if(company) {
            if (company.id != that.company.id) return false

        }

        return true
    }

    int hashCode() {
        int result
        result = (clientProfile != null ? clientProfile.hashCode() : 0)
        result = 31 * result + (company != null ? company.hashCode() : 0)
        result = 31 * result + (id != null ? id.hashCode() : 0)
        result = 31 * result + (version != null ? version.hashCode() : 0)
        return result
    }
}
