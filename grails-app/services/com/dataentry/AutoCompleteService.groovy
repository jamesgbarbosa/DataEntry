package com.dataentry

import java.text.DateFormat
import java.text.SimpleDateFormat
import com.dateentry.reftables.ZipCodes

class AutoCompleteService {

    def clientList(params) {

        def query = {
            or {
                ilike("fullName", "${params.term}%")
                ilike("firstName", "${params.term}%")
                ilike("lastName", "${params.term}%")
            }

            and {
                if(params.agentId) {
                    ne("id", Long.parseLong(params.agentId))
                }
                if(params.beneficiaryIds) {
                        Arrays.asList(params.beneficiaryIds.split(",")).each {
                        ne("id", Long.parseLong(it))
                    }
                }
                if(params.planholderId) {
                    ne("id", Long.parseLong(params.planholderId))
                }
            }

            projections {
                property("id")
                property("fullName")
                property("birthdate")
                property("gender")
            }
        }




        def clientList = Client.createCriteria().list(query)
        def clientsSelectionList = []
        clientList.each {
            def clientMap = [:]
            clientMap.put("id", it[0] )

            clientMap.put("value", it[1] + " : " + String.format("%1\$TD", it[2]) + " : " + it[3])
            clientsSelectionList.add(clientMap)
        }

        def companyList
        def companySelectionList = []
        if(params.planholder) {
            def companyQuery = {
                or {
                    ilike("name", "${params.term}%")
                }
                projections {
                    property("id")
                    property("name")
                }
            }

            companyList = Company.createCriteria().list(companyQuery)

            companyList.each {
                def companyMap = [:]
                companyMap.put("companyId", it[0] )
                companyMap.put("value", it[1])
                companySelectionList.add(companyMap)
            }
            clientsSelectionList.addAll(companySelectionList)
        }

        return clientsSelectionList
    }

    def planholdersList(Map params) {
        def query = {
            clientProfile {
                or {
                    ilike("fullName", "${params.term}%")
                    ilike("firstName", "${params.term}%")
                    ilike("lastName", "${params.term}%")
                }

                projections {
                    property("id")
//                property("nasdaqSymbol")
                    property("fullName")
                    property("birthdate")
                    property("gender")
                }
            }
        }
        def clientList = Planholder.createCriteria().list(query)
        def clientsSelectionList = []

        clientList.each {
            def clientMap = [:]
            clientMap.put("id", it[0] )

            clientMap.put("value", it[1] + " : " + String.format("%1\$TD", it[2]) + " : " + it[3])
//            clientMap.put("value", it[1])
            clientsSelectionList.add(clientMap)
        }

        def companyList
        def companySelectionList = []
            def companyQuery = {
                or {
                    ilike("name", "${params.term}%")
                }
                projections {
                    property("id")
                    property("name")
                }
            }

            companyList = Company.createCriteria().list(companyQuery)

            companyList.each {
                def companyMap = [:]
                companyMap.put("companyId", it[0] )
                companyMap.put("value", it[1])
                companySelectionList.add(companyMap)
            }
            clientsSelectionList.addAll(companySelectionList)

        return clientsSelectionList as Set
    }
    def zipcodesList(Map params) {
        def query = {
                or {
                    ilike("code", "${params.term}%")
                }

                projections {
                    property("id")
//                property("nasdaqSymbol")
                    property("code")
                    property("province")
                    property("city")
                }
        }
        def zipcodesList = ZipCodes.createCriteria().list(query)
        def zipCodeSelectionList = []
        zipcodesList.each {
            def clientMap = [:]
            clientMap.put("id", it[0] )
            clientMap.put("code", it[1] )
            clientMap.put("value", it[1] + " : " +  it[2] + " : " + it[3])
            clientMap.put("province", it[2])
            clientMap.put("city", it[3])
            zipCodeSelectionList.add(clientMap)
        }
        return zipCodeSelectionList as Set
    }
}
