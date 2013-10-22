package com.dataentry

class Agent extends Client implements Serializable {

    String agentCode
    String position
    Date appointmentDate
    String agency
    String groupName
    String unit

    static constraints = {
        agentCode blank:  true, nullable:  true
        position blank:  true, nullable:  true
        appointmentDate blank:  true, nullable:  true
        agency blank:  true, nullable:  true
        groupName blank:  true, nullable:  true
        unit blank:  true, nullable:  true
    }

    String toString() {
        "${firstName} ${lastName}"
    }
}
