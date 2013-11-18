package com.dataentry

import java.text.DateFormat
import java.text.SimpleDateFormat

class AutoCompleteService {

    def clientList(params) {
        def query = {
            or {
                ilike("fullName", "${params.term}%")
            }
            projections {
                property("id")
//                property("nasdaqSymbol")
                property("fullName")
                property("birthdate")
                property("gender")
            }
        }
        def clientList
//        if(params.clientType == 'Agent') {
//            clientList = Agent.createCriteria().list(query)
//        }
//        if(params.clientType == 'Plan Holder') {
//            clientList = Planholder.createCriteria().list(query)
//        }
//        if(params.clientType == 'Beneficiary') {
//            clientList = Beneficiary.createCriteria().list(query)
//        }
        clientList = Client.createCriteria().list(query)
        def clientsSelectionList = []
        String sdf = new SimpleDateFormat("MM/dd/yyyy")
        clientList.each {
            def clientMap = [:]
            clientMap.put("id", it[0] )

//            clientMap.put("value", it[1] + " : " + String.format("%1\$TD", it[2]) + " : " + it[3])
            clientMap.put("value", it[1])
            clientsSelectionList.add(clientMap)
        }
        return clientsSelectionList
    }
}
