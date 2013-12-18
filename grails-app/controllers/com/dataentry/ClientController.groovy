package com.dataentry

import org.hibernate.Criteria
import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

import java.text.DateFormat
import java.text.SimpleDateFormat

@Secured(['ROLE_ADMIN','ROLE_USER'])
class ClientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def auditTrailService
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
            if(!params.term) params.term = ''
            DateFormat sdf= new SimpleDateFormat("MM/dd/yyyy")
            def query = {
                or {
                    ilike("fullName", "${params.term}%")
                    ilike("firstName", "${params.term}%")
                    ilike("lastName", "${params.term}%")
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
                clientMap.put("name", it[1] )
                clientMap.put("gender", it[3] )
                clientMap.put("birthdate", sdf.format(it[2]) )

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
                companyMap.put("id", it[0] )
                companyMap.put("name", it[1])
                companyMap.put("gender", "")
                companyMap.put("birthdate", "")
                companySelectionList.add(companyMap)
            }
        clientsSelectionList.addAll(companySelectionList)

        def total =  clientsSelectionList.size()
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        params.offset = params.offset ? Integer.parseInt(params.offset) : 0
        clientsSelectionList = clientsSelectionList.sort { it.name}
        clientsSelectionList = clientsSelectionList.subList(params.offset, Math.min(params.offset + params.max, clientsSelectionList.size()))

                    [clientInstanceList: clientsSelectionList, clientInstanceTotal: total]
    }

    def create() {
        [clientInstance: new Client(params)]
    }

    def save() {
        params.birthdate = params.birthdate ? Date.parse( 'MM/dd/yyyy', params.birthdate ) : null
        def clientInstance = new Client(params)
        if (!clientInstance.save(flush: true)) {
            render(view: "create", model: [clientInstance: clientInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'client.label', default: 'Client'), clientInstance.id])
        redirect(action: "show", id: clientInstance.id)
    }

    def show(Long id) {
        def clientInstance = Client.get(id)
        if (!clientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), id])
            redirect(action: "list")
            return
        }

        def plans = Plan.createCriteria().list() {
//            projections {
//                property("id")
//                property("planNumber")
////                property("planHolder")
////                property("agent")
////                property("beneficiaries")
//            }
            or{
                planHolder {
                    clientProfile {
                        eq("id",id)
                    }
                }
                agent {
                    clientProfile {
                        eq("id",id)
                    }
                }
                beneficiaries {
                    clientProfile {
                        eq("id",id)
                    }
                }
            }
            resultTransformer Criteria.DISTINCT_ROOT_ENTITY
            order("id","asc")

        }
        [clientInstance: clientInstance, plans:plans]
    }

    def edit(Long id) {
        def clientInstance = Client.get(id)
        if (!clientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), id])
            redirect(action: "list")
            return
        }

        [clientInstance: clientInstance]
    }

    def update(Long id, Long version) {
        def clientInstance = Client.get(id)
        if (!clientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (clientInstance.version > version) {
                clientInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'client.label', default: 'Client')] as Object[],
                        "Another user has updated this Client while you were editing")
                render(view: "edit", model: [clientInstance: clientInstance])
                return
            }
        }
        params.birthdate = params.birthdate ? Date.parse( 'MM/dd/yyyy', params.birthdate ) : null
        clientInstance.properties = params

        if (!clientInstance.save(flush: true)) {
            render(view: "edit", model: [clientInstance: clientInstance])
            return
        }

//        auditTrailService.addToLogs("Update Client: ${clientInstance.fullNameBirthdateAndGender()}")
        flash.message = message(code: 'default.updated.message', args: [message(code: 'client.label', default: 'Client'), clientInstance.id])
        redirect(action: "show", id: clientInstance.id)
    }

    def delete(Long id) {
        def clientInstance = Client.get(id)
        if (!clientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), id])
            redirect(action: "list")
            return
        }

            try {
                clientInstance.delete(flush: true)
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'client.label', default: 'Client'), id])
                redirect(action: "list")
            }
            catch (DataIntegrityViolationException e) {
                flash.error = "Client can't be deleted because it is currently assigned to a plan."
                redirect(action: "show", id: id)
            }

    }
}
