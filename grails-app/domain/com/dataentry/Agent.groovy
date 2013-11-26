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

    Agent() {
        clientProfile = new Client()
    }

    def bindParams(Map params) {
        params.appointmentDate = isValidDate(params.appointmentDate)? Date.parse( 'MM/dd/yyyy', params.appointmentDate ) : params.appointmentDate
        this.properties = params
    }

    boolean isValidDate(String date) {
        if(date == null) {
            return false
        }
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Date testDate = null;
        try {
            testDate = sdf.parse(date);
        } // if the format of the string provided doesn't match the format we
        // declared in SimpleDateFormat() we will get an exception
        catch (ParseException e) {
            return false;
        }

        if (!sdf.format(testDate).equals(date)) {
            return false;
        }

        return true;

    }


    static constraints = {
//        agentCode blank:  true, nullable:  true
        position blank:  true, nullable:  true
        appointmentDate blank:  true, nullable:  true
        agency blank:  false, nullable:  false
        groupName blank:  false, nullable:  false
        unit blank:  false, nullable:  false
        clientProfile: nullable: false
    }

}
