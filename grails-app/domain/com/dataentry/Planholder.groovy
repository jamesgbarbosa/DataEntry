package com.dataentry

class Planholder extends Client implements Serializable {

    static constraints = {
    }

    String toString() {
        "${firstName} ${lastName}"
    }
}
