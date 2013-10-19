package com.dataentry

class Planholder extends Client {

    static constraints = {
    }

    String toString() {
        "${firstName} ${lastName}"
    }
}
