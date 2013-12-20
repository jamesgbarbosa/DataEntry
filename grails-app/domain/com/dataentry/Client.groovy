package com.dataentry

import java.text.SimpleDateFormat
import java.text.ParseException

class Client implements Serializable {

    String lastName
    String firstName
    String middleName
    String alias
    Date birthdate
    String address1
    String address2
    String address3
    String city
    String province
    String zipcode
    String landline
    String mobile
    String officenumber
    String email
    String gender
    String fullName

    def bindParams(Map params) {
        params.birthdate = DateUtil.isValidDate(params.birthdate)? Date.parse( 'MM/dd/yyyy', params.birthdate ) : params.birthdate
        lastName = params.lastName?.trim()
        firstName = params.firstName?.trim()
        middleName = params.middleName?.trim()
        alias = params.alias?.trim()
        address1 = params.address1?.trim()
        address2 = params.address2?.trim()
        address3 = params.address3?.trim()
        city = params.city?.trim()
        province = params.province?.trim()
        zipcode = params.zipcode?.trim()
        landline = params.landline?.trim()
        mobile = params.mobile?.trim()
        officenumber = params.officenumber?.trim()
        email = params.email?.trim()
        gender = params.gender?.trim()
        fullName = params.fullName?.trim()
    }

    def beforeInsert = {
        firstName = firstName?.toUpperCase()
        middleName = middleName?.toUpperCase()
        lastName = lastName?.toUpperCase()
        fullName = fullName()
    }

    def beforeUpdate() {
        firstName = firstName?.toUpperCase()
        middleName = middleName?.toUpperCase()
        lastName = lastName?.toUpperCase()
        fullName = fullName()
    }


    static constraints = {
        lastName blank:  false, nullable:  false
        firstName blank:  false, nullable:  false
        middleName blank:  true, nullable:  true
        gender blank:  false, nullable:  false
        birthdate blank:  false, nullable:  false
        email blank:  true, nullable:  true
        address1 blank:  true, nullable:  true
        address2 blank:  true, nullable:  true
        address3 blank:  true, nullable:  true
        city blank:  true, nullable:  true
        province blank:  true, nullable:  true
        zipcode blank:  true, nullable:  true
        landline blank:  true, nullable:  true
        mobile blank:  true, nullable:  true
        officenumber blank:  true, nullable:  true
        fullName  blank: true, nullable:  true
        alias  blank: true, nullable:  true


    }

    boolean validateClientUniqueness() {
        if(this.firstName && this.lastName && this.birthdate && this.gender ){
            def clients = Client.withCriteria {
                eq("firstName",this.firstName.toUpperCase())
                eq("middleName",this.middleName?.toUpperCase())
                eq("lastName", this.lastName.toUpperCase())
                eq("birthdate", this.birthdate)
                eq("gender", this.gender)
            }

            if(clients) {
                return false
            }

            return true
        }
    }

    String fullName() {
//        return "${firstName}${middleName? " ${middleName}": ''} ${lastName}" .toUpperCase()
        return "${lastName}, ${firstName} ${middleName ? "${middleName}":''}".toUpperCase()
    }

    String fullNameBirthdateAndGender() {
        return "${lastName}, ${firstName} ${middleName ? "${middleName}":''}".toUpperCase() + " : " +  String.format("%1\$TD", birthdate) + " : " + gender
    }

    String toString() {
        return fullNameBirthdateAndGender()
    }

    boolean equals(o) {
        if (this.is(o)) return true
        if (getClass() != o.class) return false

        Client client = (Client) o

        if (address1 != client.address1) return false
        if (address2 != client.address2) return false
        if (address3 != client.address3) return false
        if (alias != client.alias) return false
        if (beforeInsert != client.beforeInsert) return false
        if (birthdate != client.birthdate) return false
        if (city != client.city) return false
        if (email != client.email) return false
        if (firstName != client.firstName) return false
        if (fullName != client.fullName) return false
        if (gender != client.gender) return false
        if (id != client.id) return false
        if (landline != client.landline) return false
        if (lastName != client.lastName) return false
        if (middleName != client.middleName) return false
        if (mobile != client.mobile) return false
        if (officenumber != client.officenumber) return false
        if (province != client.province) return false
        if (version != client.version) return false
        if (zipcode != client.zipcode) return false

        return true
    }

    int hashCode() {
        int result
        result = lastName.hashCode()
        result = 31 * result + firstName.hashCode()
        result = 31 * result + (middleName != null ? middleName.hashCode() : 0)
        result = 31 * result + (alias != null ? alias.hashCode() : 0)
        result = 31 * result + birthdate.hashCode()
        result = 31 * result + (address1 != null ? address1.hashCode() : 0)
        result = 31 * result + (address2 != null ? address2.hashCode() : 0)
        result = 31 * result + (address3 != null ? address3.hashCode() : 0)
        result = 31 * result + (city != null ? city.hashCode() : 0)
        result = 31 * result + (province != null ? province.hashCode() : 0)
        result = 31 * result + (zipcode != null ? zipcode.hashCode() : 0)
        result = 31 * result + (landline != null ? landline.hashCode() : 0)
        result = 31 * result + (mobile != null ? mobile.hashCode() : 0)
        result = 31 * result + (officenumber != null ? officenumber.hashCode() : 0)
        result = 31 * result + (email != null ? email.hashCode() : 0)
        result = 31 * result + gender.hashCode()
        result = 31 * result + (fullName != null ? fullName.hashCode() : 0)
        result = 31 * result + (beforeInsert != null ? beforeInsert.hashCode() : 0)
        result = 31 * result + (id != null ? id.hashCode() : 0)
        result = 31 * result + (version != null ? version.hashCode() : 0)
        return result
    }
}
