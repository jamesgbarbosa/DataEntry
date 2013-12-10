package com.dataentry

import java.text.ParseException
import java.text.SimpleDateFormat

class Agent implements Serializable {

    Client clientProfile
//    String agentCode
    String position
    Date appointmentDate
    String agency
    String groupName
    String unit
    String counselorCode

    Agent() {
        clientProfile = new Client()
    }

    def bindParams(Map params) {
        params.appointmentDate = DateUtil.isValidDate(params.appointmentDate)? Date.parse( 'MM/dd/yyyy', params.appointmentDate ) : params.appointmentDate
        this.properties = params
    }

    static constraints = {
//        agentCode blank:  true, nullable:  true
        position blank:  true, nullable:  true
        appointmentDate blank:  true, nullable:  true
        agency blank:  true, nullable:  true
        groupName blank:  false, nullable:  false
        unit blank:  false, nullable:  false
        counselorCode blank:  false, nullable:  false
        clientProfile: nullable: false
    }

}
