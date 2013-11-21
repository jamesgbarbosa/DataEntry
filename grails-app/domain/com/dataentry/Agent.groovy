package com.dataentry

class Agent implements Serializable {

    Client clientProfile
    String agentCode
    String position
    Date appointmentDate
    String agency
    String groupName
    String unit

    Agent() {
        clientProfile = new Client()
    }

    static constraints = {
        agentCode blank:  false, nullable:  false
        position blank:  true, nullable:  true
        appointmentDate blank:  true, nullable:  true
        agency blank:  false, nullable:  false
        groupName blank:  false, nullable:  false
        unit blank:  false, nullable:  false
        clientProfile: nullable: false
    }

}
