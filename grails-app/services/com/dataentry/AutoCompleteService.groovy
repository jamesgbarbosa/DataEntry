package com.dataentry

class AutoCompleteService {

    def clientList(params) {
        def query = {
            or {
                like("firstName", "${params.term}%")
                like("lastName", "${params.term}%")
            }
            projections {
                property("id")
//                property("nasdaqSymbol")
                property("firstName")
                property("lastName")
            }
        }
        def clientList
        if(params.clientType == 'Agent') {
            clientList = Agent.createCriteria().list(query)
        }
        if(params.clientType == 'Plan Holder') {
            clientList = Planholder.createCriteria().list(query)
        }
        if(params.clientType == 'Beneficiary') {
            clientList = Beneficiary.createCriteria().list(query)
        }
        def clientsSelectionList = []
        clientList.each {
            def clientMap = [:]
            clientMap.put("id", it[0])
            clientMap.put("value", it[1] + " " +it[2])
            clientsSelectionList.add(clientMap)
        }
        return clientsSelectionList
    }
}
