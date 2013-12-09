package com.dateentry.reftables

class ZipCodes {

    int id
    String province
    String code
    String city

    static constraints = {
        id(blank: false)
        province(blank: false)
        code(blank: false)
        city(blank: false)
    }
}
