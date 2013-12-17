package com.dataentry

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import org.springframework.web.context.request.RequestContextHolder
import org.apache.commons.lang.time.DateUtils
import org.codehaus.groovy.runtime.DateGroovyMethods
import grails.plugins.springsecurity.Secured
import com.dataentry.logs.AuditLog
//
@Secured(['ROLE_ADMIN','ROLE_USER'])
class PlanController {
    def autoCompleteService
    def auditTrailService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if(params.planID || params.product || params.planHolder || params.fromDate || params.toDate || params.planHolderCompany) {
            params.fromDate = DateUtil.isValidDate(params.fromDate)? Date.parse( 'MM/dd/yyyy', params.fromDate ) : params.fromDate
            params.toDate = DateUtil.isValidDate(params.toDate)? Date.parse( 'MM/dd/yyyy', params.toDate ) : params.toDate
            def criteria = Plan.createCriteria()
            def plans = criteria.list(max: params.max, offset: params.offset, sort: params.sort, order: params.order) {
                and {
                    if(params.product!='') {
                        eq("product","${params.product}")
                    }
                    if(params.planID!=''){
                        eq("planNumber","${params.planID}")

                    }
                    if(params.fromDate && params.toDate){
                        between("dateCreated",DateGroovyMethods.clearTime(params.fromDate),DateGroovyMethods.clearTime(params.toDate))
                    }
                    planHolder {
                        if(params.planHolder!=''){
                                clientProfile {
                                    if(params.planHolder) {
                                        eq("id",Long.parseLong(params.planHolder))

                                    }
                             }
                        }
                        if(params.planHolderCompany!='') {
                            company {
                                if(params.planHolderCompany) {
                                    eq("id",Long.parseLong(params.planHolderCompany))

                                }
                            }
                        }
                    }

                }
            }

            def planHolder
            if(params.planHolder) {
                planHolder = Planholder.findByClientProfile(Client.get(params.planHolder))
            } else if(params.planHolderCompany) {
                planHolder = Planholder.findByCompany(Company.get(params.planHolderCompany))
            }
            [planInstanceList: plans, planInstanceTotal: plans.getTotalCount(), planHolder:planHolder]
        } else {
            params.max = Math.min(max ?: 10, 100)
            [planInstanceList: Plan.list(params), planInstanceTotal: Plan.count()]
        }

    }

    def createFlow = {
        startup {
            action {
            }
            on('success').to('init')
        }

        init {
            action {
                conversation.readOnly = false
                conversation.planInstance =  new Plan()
                conversation.agentInstance =  new Agent()
                conversation.planholderInstance =  new Planholder()
                conversation.amendmentInstance = new Amendment()
                conversation.beneficiaryInstance = new Beneficiary()

                flow.createPlanHolderDto = new Planholder()
                flow.createAgentDto = new Agent()

                conversation.beneficiaries =  new ArrayList<Beneficiary>()
                conversation.amendments = new ArrayList<Amendment>()
                flow.duplicateClientError = ""

                conversation.page1link = ""
                conversation.page2link = ""
                conversation.page3link = ""
                conversation.page4link = ""

            }
            on('success').to('createPlan')
        }

        //State 1
        createPlan {
            on('createPlanHolder'){
                flow.duplicateClientError = ""
                flow.createPlanHolderDto = new Planholder()

                Planholder planHolder = new Planholder()
                if(params.planHolder.id) {
                    planHolder.clientProfile = Client.get(params.planHolder.id)
                } else if(params.planHolderCompany.id){
                    planHolder.company = Company.get(params.planHolderCompany.id)
                }
                Plan plan = new Plan()
                plan.bindParams(params)
                conversation.planInstance = plan
                conversation.planholderInstance = planHolder
                conversation.page1link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to('createPlanHolder')

            on('createPlanholderCompany'){
                flow.duplicateClientError = ""
                flow.createPlanHolderDto = new Planholder()

                Planholder planHolder = new Planholder()
                if(params.planHolder.id) {
                    planHolder.clientProfile = Client.get(params.planHolder.id)
                } else if(params.planHolderCompany.id){
                    planHolder.company = Company.get(params.planHolderCompany.id)
                }
                Plan plan = new Plan()
                plan.bindParams(params)
                conversation.planInstance = plan
                conversation.planholderInstance = planHolder
                conversation.page1link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to('createPlanholderCompany')

            on('beneficiaries'){
                flow.duplicateClientError = ""
                Plan plan = new Plan()
                Planholder planHolder = new Planholder()
                plan.bindParams(params)
                Client client

                flow.returnCode = ""

                if(params.planHolder.id) {
                    planHolder.clientProfile = Client.get(params.planHolder.id)
                    planHolder.company = null
                } else if(params.planHolderCompany.id){
                    planHolder.company = Company.get(params.planHolderCompany.id)
                    planHolder.clientProfile = null
                } else {
                    planHolder = null
                }
                plan.planHolder = planHolder
                conversation.planholderInstance = planHolder
                if(!conversation.readOnly) {
                    if(plan.validate()) {
                        def errorCode
//                        if((conversation.planholderInstance.clientProfile?.id == conversation.planInstance.agent?.clientProfile?.id) ) {
//                            errorCode = "Client already added as agent."
//                        } else
                        if ( conversation.beneficiaries?.clientProfile?.id?.contains(conversation.planholderInstance.clientProfile?.id) )  {
                            errorCode = "Client already added as beneficiary."
                        } else if(conversation.beneficiaries?.company?.id?.contains(conversation.planholderInstance.company?.id)) {
                            errorCode = "Client already added as beneficiary."
                        }else {
                            errorCode = ""
                        }
                        if(errorCode == "") {
                            conversation.planInstance = plan
                            flow.returnCode = "yes"
                        } else {
                            flow.duplicateClientError = errorCode
                            conversation.planInstance = plan
                            flow.returnCode= "no"
                        }

                    } else {
                        conversation.planInstance = plan
                        flow.returnCode = "no"
                    }
                } else {
                    flow.returnCode = "yes"
                }

                flash.red = "true"

            }.to {
              if(flow.returnCode == "yes") {
                  conversation.page1link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution[0]])
                  return "beneficiaries"
              } else {
                    return "createPlan"
              }
            }
        }


        //State  1.a
        createPlanHolder {
            on("return"){
            }.to("createPlan")

            on('savePlanHolder'){
                def planHolderInstance = new Planholder()
                planHolderInstance.clientProfile.bindParams(params)
                flow.createPlanHolderDto = planHolderInstance
                if(planHolderInstance.clientProfile.validate()) {
                    if(!planHolderInstance.clientProfile.validateClientUniqueness()) {
                        flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                        return error()
                    } else {}
                    if (!planHolderInstance.clientProfile.save(flush: true)) {
                        return error()
                    } else {
                        conversation.planholderInstance = planHolderInstance
                    }
                } else {
                    return error()
                }
            }.to('createPlan')
        }

        // state 1.b
        createPlanholderCompany {
            on("return"){
            }.to("createPlan")

            on('saveCompany'){
                def planHolderInstance = new Planholder()
                params.name = params.name.toUpperCase()
                planHolderInstance.company.properties = params
                flow.createPlanHolderDto = planHolderInstance
                if(planHolderInstance.company.validate()) {
                    if (!planHolderInstance.company.save(flush: true)) {
                        return error()
                    } else {
                        conversation.planholderInstance = planHolderInstance
                    }
                } else {
                    return error()
                }
            }.to('createPlan')
        }

        // State 2
        beneficiaries {
            on("add") {
                flow.duplicateClientError = ""
//                conversation.page2link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
                def beneficiaryInstance = new Beneficiary(params)


                if(params.beneficiary.id) {
                    beneficiaryInstance.clientProfile = Client.get(params.beneficiary.id)
                    beneficiaryInstance.company = null
                } else if(params.beneficiaryCompany.id){
                    beneficiaryInstance.company = Company.get(params.beneficiaryCompany.id)
                    beneficiaryInstance.clientProfile = null
                } else {
                    beneficiaryInstance.company = null
                    beneficiaryInstance.clientProfile = null
                }

                conversation.beneficiaryInstance = beneficiaryInstance
                if(beneficiaryInstance.validate()) {
                    def errorCode
                    if ( conversation.beneficiaries?.clientProfile?.id?.contains(beneficiaryInstance.clientProfile?.id) &&
                            (conversation.beneficiaries?.designation.contains(beneficiaryInstance.designation)) )  {
                        errorCode = "Client already added as beneficiary."
                    } else if ( conversation.beneficiaries?.company?.id?.contains(beneficiaryInstance.company?.id) &&
                            (conversation.beneficiaries?.designation.contains(beneficiaryInstance.designation)) )  {
                        errorCode = "Client already added as beneficiary."
                    } else {
                        errorCode = ""
                    }
                    if(errorCode == "") {
                        conversation.beneficiaries.add(beneficiaryInstance)
                        conversation.planInstance.beneficiaries = conversation.beneficiaries
                        flow.beneficiaryInstance = null
                    } else {
                        flow.beneficiaryInstance = beneficiaryInstance
                        flow.duplicateClientError = errorCode
                        return yes()
                    }
                } else {
                    flow.beneficiaryInstance = beneficiaryInstance
                    return error()
                }
            }.to("beneficiaries")

            on("delete") {
                def iterator =  conversation.beneficiaries.iterator()
                while(iterator.hasNext()) {
                    def obj = iterator.next()
                    if(params?."deleteBeneficiary_${obj.clientProfile?.id}client${obj.designation}") {
                        iterator.remove()
                    }
                    if(params?."deleteBeneficiary_${obj.company?.id}company${obj.designation}") {
                        iterator.remove()
                    }
                }
               conversation.planInstance.beneficiaries = conversation.beneficiaries
            }.to("beneficiaries")

            on("return"){
                flow.duplicateClientError = ""
                conversation.beneficiaryInstance = new Beneficiary()
                flash.red = "true"
//                conversation.page2link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to("createPlan")

            on("createBeneficiary") {
                flow.duplicateClientError = ""
                flow.beneficiaryInstance = new Beneficiary(params)
                conversation.page2link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to("createBeneficiary")

            on('createBeneficiaryCompany'){
                flow.duplicateClientError = ""
                flow.beneficiaryInstance = new Beneficiary(params)
                conversation.page2link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to('createBeneficiaryCompany')

            on("next") {
                flow.duplicateClientError = ""
                conversation.page2link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to {
                if(conversation.beneficiaries.size() == 0) {
                    flow.duplicateClientError = "Please add atleast one beneficiary."
                    return "beneficiaries"
                } else {
                    flash.red = "true"
                    return "agent"
                }
            }
        }


        //State 2a
        createBeneficiary {
            on("return"){
            }.to("beneficiaries")

            on('saveBeneficiary'){
                def beneficiaryInstance = flow.beneficiaryInstance
                beneficiaryInstance.clientProfile.bindParams(params)
                if(beneficiaryInstance.clientProfile.validate()) {
                    if(!beneficiaryInstance.clientProfile.validateClientUniqueness()) {
                        flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                        return error()
                    }
                    if (!beneficiaryInstance.clientProfile.save(flush: true)) {
                        return error()
                    } else {
                        flow.beneficiaryInstance = beneficiaryInstance
                    }

                } else {
                    return error()
                }
                flash.red = "true"
            }.to('beneficiaries')
        }

        // state 2.b
        createBeneficiaryCompany {
            on("return"){
            }.to("beneficiaries")

            on('saveCompany'){
                def beneficiaryInstance = new Beneficiary()
                params.name = params.name.toUpperCase()
                beneficiaryInstance.company.properties = params
                flow.beneficiaryInstance = beneficiaryInstance
                if(beneficiaryInstance.company.validate()) {
                    if (!beneficiaryInstance.company.save(flush: true)) {
                        return error()
                    } else {
                        flow.beneficiaryInstance = beneficiaryInstance
                    }
                } else {
                    return error()
                }
            }.to('beneficiaries')
        }

        //State 3
        agent {
            on("return"){
                flow.duplicateClientError = ""
                def agent = new Agent(params)
                if(params.agent.id) {
                    agent.clientProfile = Client.get(params.agent.id)
                } else {
                    agent = null
                }
                conversation.agentInstance = agent
                flash.red = "true"
//                conversation.page3link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to("beneficiaries")

            on("createAgent") {
                def agentInstance = new Agent(params)
                if(params.agent?.id) {
                    agentInstance.clientProfile = Client.get(params.agent?.id)
                }
                conversation.agentInstance = agentInstance
                conversation.page3link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to("createAgent")

            on("next") {
                flow.duplicateClientError = ""
                conversation.page3link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
                def agentInstance = new Agent()
                agentInstance.bindParams(params)
                agentInstance.clientProfile = Client.get(params.agent.id)
                conversation.agentInstance = agentInstance
                if(agentInstance.validate()) {
                    conversation.planInstance.agent = agentInstance
                } else {
                    conversation.agentInstance = agentInstance
                    return error()
                }
                flash.red = "true"
            }.to{
                if(flow.duplicateClientError != "") {
                    return "agent"
                } else {
                    return "amendments"
                }
            }
        }

        //State 3a
        createAgent {
            on("return"){
            }.to("agent")

            on('saveAgent'){
                def agentInstance = conversation.agentInstance
                agentInstance.clientProfile.bindParams(params)
                flow.createAgentDto = agentInstance
                if(agentInstance.clientProfile.validate()) {
                    if(!agentInstance.clientProfile.validateClientUniqueness()) {
                        flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                        return error()
                    }
                    if (!agentInstance?.clientProfile.save(flush: true)) {
                        return error()
                    } else {
                        conversation.agentInstance = agentInstance
                    }
                } else {
                    return error()
                }
            }.to('agent')
        }

        //State 4
        amendments {
            on("return"){
              conversation.amendmentInstance = new Amendment(params)
//              conversation.page4link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to("agent")

            on("next") {
            }.to("show")

            on("add") {
                def amendmentInstance = new Amendment()
                amendmentInstance.bindParams(params)
                amendmentInstance.tempId = conversation.amendments.size()==0 ? 1 : conversation.amendments.last().tempId + 1
                conversation.amendmentInstance = amendmentInstance
                if(amendmentInstance.validate()) {
                    conversation.amendments.add(amendmentInstance)
                    conversation.amendmentInstance = null
                } else {
                    return error()
                }
//                conversation.page4link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to("amendments")

            on("delete") {
                def iterator =  conversation.amendments.iterator()
                while(iterator.hasNext()) {
                    def obj = iterator.next()
                    if(params?."deleteAmendment_${obj.tempId}") {
                        iterator.remove()
                    }
                }
            }.to("amendments")

            on('savePlan') {
                def plan = new Plan(conversation.planInstance.properties)
                plan.amendments = new ArrayList<Amendment>()
                def beneficiaries = conversation.beneficiaries
                def planholder = conversation.planholderInstance
                def agent = conversation.agentInstance
                def amendments = conversation.amendments

                if(planholder) {
                    planholder.save()
                    plan.planHolder = planholder
                } else {
                    plan.planHolder = null
                }

                if(agent) {
                    agent.save()
                    plan.agent = agent
                } else {
                    plan.agent = null
                }

                beneficiaries.each {
                    it.save()
                    plan.addToBeneficiaries(it)
                }

                amendments.each {
                    it.save()
                    plan.addToAmendments(it)
                }

                if (!plan.save(flush: true)) {
                    return error()
                }
                flash.myMessage = "Plan ${plan?.planNumber} successfully created."
                conversation.planInstance = plan
            }.to('show')
        }

        show {
            on("return"){
                conversation.readOnly = true
//              conversation.page4link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to("amendments")

            on("finish") {

            }.to("last")
        }

        //End State
        last {
//            redirect(action: "show", id: conversation.planInstance?.id, params:[message: flow.myMessage])
              redirect(action: "list")
        }
    }

    def editFlow = {
        startup {
            action {
            }
            on('success').to('init')
        }

        init {
            action {
                def planInstance = Plan.get(params.id)
                conversation.planId = params.id
                conversation.readOnly = false
                conversation.planInstance =  planInstance
                conversation.agentInstance =  planInstance?.agent
                conversation.planholderInstance =  planInstance?.planHolder
                conversation.amendmentInstance = new Amendment()
                conversation.beneficiaryInstance = new Beneficiary()

                flow.createPlanHolderDto = new Planholder()
                flow.createAgentDto = new Agent()

                conversation.beneficiaries =  planInstance?.beneficiaries
                conversation.oldBeneficiaries =  planInstance?.beneficiaries

                planInstance?.amendments.eachWithIndex { val, idx ->
                    val.tempId = idx + 1
                }
                conversation.amendments =  planInstance?.amendments
                flow.duplicateClientError = ""

                conversation.page1link = ""
                conversation.page2link = ""
                conversation.page3link = ""
                conversation.page4link = ""

            }
            on('success').to('createPlan')
        }

        //State 1
        createPlan {
            on('createPlanHolder'){
                flow.duplicateClientError = ""
                flow.createPlanHolderDto = new Planholder()

                Planholder planHolder = new Planholder()
                if(params.planHolder.id) {
                    planHolder.clientProfile = Client.get(params.planHolder.id)
                }  else if(params.planHolderCompany.id){
                    planHolder.company = Company.get(params.planHolderCompany.id)
                }
                Plan plan = conversation.planInstance
                plan.bindParams(params)
                conversation.planInstance = plan
                conversation.planholderInstance = planHolder
                conversation.page1link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to('createPlanHolder')

            on('createPlanholderCompany'){
                flow.duplicateClientError = ""
                flow.createPlanHolderDto = new Planholder()

                Planholder planHolder = new Planholder()
                if(params.planHolder.id) {
                    planHolder.clientProfile = Client.get(params.planHolder.id)
                } else if(params.planHolderCompany.id){
                    planHolder.company = Company.get(params.planHolderCompany.id)
                }
                Plan plan = conversation.planInstance
                plan.bindParams(params)
                conversation.planInstance = plan
                conversation.planholderInstance = planHolder
                conversation.page1link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to('createPlanholderCompany')

            on('beneficiaries'){
                flow.duplicateClientError = ""
                Plan plan = conversation.planInstance
                Planholder planHolder = new Planholder()
                plan.bindParams(params)
                flow.planDetails = plan
                Client client

                flow.returnCode = ""

                if(params.planHolder.id) {
                    planHolder.clientProfile = Client.get(params.planHolder.id)
                    planHolder.company = null
                } else if(params.planHolderCompany.id){
                    planHolder.company = Company.get(params.planHolderCompany.id)
                    planHolder.clientProfile = null
                } else {
                    planHolder = null
                }
                plan.planHolder = planHolder
                conversation.planholderInstance = planHolder
                if(!conversation.readOnly) {
                    if(plan.validate()) {
                        def errorCode
//                        if((conversation.planholderInstance.clientProfile?.id == conversation.planInstance.agent?.clientProfile?.id) ) {
//                            errorCode = "Client already added as agent."
//                        } else
                        if ( conversation.beneficiaries?.clientProfile?.id?.contains(conversation.planholderInstance.clientProfile?.id) )  {
                            errorCode = "Client already added as beneficiary."
                        }  else {
                            errorCode = ""
                        }
                        if(errorCode == "") {
                            conversation.planInstance = plan
                            flow.returnCode = "yes"
                        } else {
                            flow.duplicateClientError = errorCode
                            conversation.planInstance = plan
                            flow.returnCode= "no"
                        }

                    } else {
                        conversation.planInstance = plan
                        flow.returnCode = "no"
                    }
                } else {
                    flow.returnCode = "yes"
                }

                flash.red = "true"

            }.to {
                if(flow.returnCode == "yes") {
                    conversation.page1link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution[0]])
                    return "beneficiaries"
                } else {
                    return "createPlan"
                }
            }
        }


        //State  1.a
        createPlanHolder {
            on("return"){
            }.to("createPlan")

            on('savePlanHolder'){
                def planHolderInstance = new Planholder()
                planHolderInstance.clientProfile.bindParams(params)
                flow.createPlanHolderDto = planHolderInstance
                if(planHolderInstance.clientProfile.validate()) {
                    if(!planHolderInstance.clientProfile.validateClientUniqueness()) {
                        flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                        return error()
                    }
                    if (!planHolderInstance.clientProfile.save()) {
                        return error()
                    } else {
                        conversation.planholderInstance = planHolderInstance
                    }
                } else {
                    return error()
                }
            }.to('createPlan')
        }

        // state 1.b
        createPlanholderCompany {
            on("return"){
            }.to("createPlan")

            on('saveCompany'){
                def planHolderInstance = new Planholder()
                params.name = params.name.toUpperCase()
                planHolderInstance.company.properties = params
                flow.createPlanHolderDto = planHolderInstance
                if(planHolderInstance.company.validate()) {
                    if (!planHolderInstance.company.save(flush: true)) {
                        return error()
                    } else {
                        conversation.planholderInstance = planHolderInstance
                    }
                } else {
                    return error()
                }
            }.to('createPlan')
        }

        // State 2
        beneficiaries {
            on("add") {
                flow.duplicateClientError = ""
//                conversation.page2link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
                def beneficiaryInstance = new Beneficiary(params)


                if(params.beneficiary.id) {
                    beneficiaryInstance.clientProfile = Client.get(params.beneficiary.id)
                    beneficiaryInstance.company = null
                } else if(params.beneficiaryCompany.id){
                    beneficiaryInstance.company = Company.get(params.beneficiaryCompany.id)
                    beneficiaryInstance.clientProfile = null
                } else {
                    beneficiaryInstance.company = null
                    beneficiaryInstance.clientProfile = null
                }

                conversation.beneficiaryInstance = beneficiaryInstance
                if(beneficiaryInstance.validate()) {
                    def errorCode
                    if ( conversation.beneficiaries?.clientProfile?.id?.contains(beneficiaryInstance.clientProfile?.id) &&
                            (conversation.beneficiaries?.designation.contains(beneficiaryInstance.designation)) )  {
                        errorCode = "Client already added as beneficiary."
                    } else if ( conversation.beneficiaries?.company?.id?.contains(beneficiaryInstance.company?.id) &&
                            (conversation.beneficiaries?.designation.contains(beneficiaryInstance.designation)) )  {
                        errorCode = "Client already added as beneficiary."
                    } else {
                        errorCode = ""
                    }
                    if(errorCode == "") {
                        conversation.beneficiaries.add(beneficiaryInstance)
//                        conversation.planInstance.beneficiaries = conversation.beneficiaries
                        flow.beneficiaryInstance = null
                    } else {
                        flow.beneficiaryInstance = beneficiaryInstance
                        flow.duplicateClientError = errorCode
                        return yes()
                    }
                } else {
                    flow.beneficiaryInstance = beneficiaryInstance
                    return error()
                }
            }.to("beneficiaries")

            on("delete") {
                def iterator =  conversation.beneficiaries.iterator()
                while(iterator.hasNext()) {
                    def obj = iterator.next()
                    if(params?."deleteBeneficiary_${obj.clientProfile?.id}client${obj.designation}") {
                        iterator.remove()
                    }
                    if(params?."deleteBeneficiary_${obj.company?.id}company${obj.designation}") {
                        iterator.remove()
                    }
                }
                conversation.planInstance.beneficiaries = conversation.beneficiaries
            }.to("beneficiaries")

            on("return"){
                flow.duplicateClientError = ""
                conversation.beneficiaryInstance = new Beneficiary()
                flash.red = "true"
//                conversation.page2link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to("createPlan")

            on("createBeneficiary") {
                flow.duplicateClientError = ""
                flow.beneficiaryInstance = new Beneficiary(params)
                conversation.page2link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to("createBeneficiary")

            on('createBeneficiaryCompany'){
                flow.duplicateClientError = ""
                flow.beneficiaryInstance = new Beneficiary(params)
                conversation.page2link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to('createBeneficiaryCompany')

            on("next") {
                flow.duplicateClientError = ""
                conversation.page2link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to {
                if(conversation.beneficiaries.size() == 0) {
                    flow.duplicateClientError = "Please add atleast one beneficiary."
                    return "beneficiaries"
                } else {
                    flash.red = "true"
                    return "agent"
                }
            }
        }


        //State 2a
        createBeneficiary {
            on("return"){
            }.to("beneficiaries")

            on('saveBeneficiary'){
                def beneficiaryInstance = flow.beneficiaryInstance
                beneficiaryInstance.clientProfile.bindParams(params)
                if(beneficiaryInstance.clientProfile.validate()) {
                    if(!beneficiaryInstance.clientProfile.validateClientUniqueness()) {
                        flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                        return error()
                    }
                    if (!beneficiaryInstance.clientProfile.save()) {
                        return error()
                    } else {
                        flow.beneficiaryInstance = beneficiaryInstance
                    }

                } else {
                    return error()
                }
                flash.red = "true"
            }.to('beneficiaries')
        }

        // state 2.b
        createBeneficiaryCompany {
            on("return"){
            }.to("beneficiaries")

            on('saveCompany'){
                def beneficiaryInstance = new Beneficiary()
                params.name = params.name.toUpperCase()
                beneficiaryInstance.company.properties = params
                flow.beneficiaryInstance = beneficiaryInstance
                if(beneficiaryInstance.company.validate()) {
                    if (!beneficiaryInstance.company.save(flush: true)) {
                        return error()
                    } else {
                        flow.beneficiaryInstance = beneficiaryInstance
                    }
                } else {
                    return error()
                }
            }.to('beneficiaries')
        }

        //State 3
        agent {
            on("return"){
                flow.duplicateClientError = ""
                def agent = new Agent(params)
                if(params.agent.id) {
                    agent.clientProfile = Client.get(params.agent.id)
                } else {
                    agent = null
                }
                conversation.agentInstance = agent
                flash.red = "true"
//                conversation.page3link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to("beneficiaries")

            on("createAgent") {
                def agentInstance = new Agent(params)
                if(params.agent?.id) {
                    agentInstance.clientProfile = Client.get(params.agent?.id)
                }
                conversation.agentInstance = agentInstance
                conversation.page3link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to("createAgent")

            on("next") {
                flow.duplicateClientError = ""
                conversation.page3link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
                def agentInstance = new Agent()
                agentInstance.bindParams(params)
                agentInstance.clientProfile = Client.get(params.agent.id)
                conversation.agentInstance = agentInstance
                if(agentInstance.validate()) {
                    conversation.planInstance.agent = agentInstance
                } else {
                    conversation.agentInstance = agentInstance
                    return error()
                }
                flash.red = "true"
            }.to{
                if(flow.duplicateClientError != "") {
                    return "agent"
                } else {
                    return "amendments"
                }
            }
        }

        //State 3a
        createAgent {
            on("return"){
            }.to("agent")

            on('saveAgent'){
                def agentInstance = conversation.agentInstance
                agentInstance.clientProfile.bindParams(params)
                flow.createAgentDto = agentInstance
                if(agentInstance.clientProfile.validate()) {
                    if(!agentInstance.clientProfile.validateClientUniqueness()) {
                        flash.error = g.message(code:"client.name.gender.birthdate.should.be.unique.error")
                        return error()
                    }
                    if (!agentInstance?.clientProfile.save()) {
                        return error()
                    } else {
                        conversation.agentInstance = agentInstance
                    }
                } else {
                    return error()
                }
            }.to('agent')
        }

        //State 4
        amendments {
            on("return"){
                conversation.amendmentInstance = new Amendment(params)
//              conversation.page4link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to("agent")

            on("next") {
            }.to("show")

            on("add") {
                def amendmentInstance = new Amendment()
                amendmentInstance.bindParams(params)
                amendmentInstance.tempId = conversation.amendments.size()==0 ? 1 : conversation.amendments.last().tempId + 1
                conversation.amendmentInstance = amendmentInstance
                if(amendmentInstance.validate()) {
                    conversation.amendments.add(amendmentInstance)
                    conversation.amendmentInstance = null
                } else {
                    return error()
                }
//                conversation.page4link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to("amendments")

            on("delete") {
                def iterator =  conversation.amendments.iterator()
                while(iterator.hasNext()) {
                    def obj = iterator.next()
                    if(params?."deleteAmendment_${obj.tempId}") {
                        iterator.remove()
                    }
                }
            }.to("amendments")

            on('savePlan') {
                def plan = Plan.get(conversation.planId)
                plan.currentIssueDate = flow.planDetails.currentIssueDate
                plan.applicableDate = flow.planDetails.applicableDate
                plan.planNumber = flow.planDetails.planNumber
                plan.product = flow.planDetails.product
                plan.payingPeriod = flow.planDetails.payingPeriod
                plan.maturityPeriod = flow.planDetails.maturityPeriod
                plan.pnpPrice =flow.planDetails.pnpPrice
                plan.modalInstallment = flow.planDetails.modalInstallment
                plan.numberOfUnits = flow.planDetails.numberOfUnits
                plan.paymentMode = flow.planDetails.paymentMode
                plan.planStatus = flow.planDetails.planStatus
                plan.withInsurance = flow.planDetails.withInsurance

                def beneficiaryList = conversation.beneficiaries
                def planholder = conversation.planholderInstance
                def oldPlanholder = plan.planHolder
                def agent = conversation.agentInstance
                def oldAgent =  plan.agent
                def amendments = conversation.amendments
                def oldAmendments = plan.amendments ? plan.amendments : new ArrayList<Amendment>()
                def oldBeneficiaries = plan.beneficiaries ? plan.beneficiaries : new ArrayList<Beneficiary>()

                Plan.withTransaction { status ->
                    if(planholder!=oldPlanholder) {
                        planholder.save()
                        plan.planHolder = planholder
                    }

                    if(oldPlanholder?.clientProfile?.id!=planholder?.clientProfile?.id ||
                            oldPlanholder?.company?.id!=planholder?.company?.id) {
                        if(Plan.findAllByPlanHolder(oldPlanholder).size()== 0) {
                            oldPlanholder.delete()
                        }
                    }

                    if(agent!=oldAgent) {
                        agent.save()
                        plan.agent = agent
                    }

                    if(oldAgent.clientProfile.id!=agent.clientProfile.id) {
                        if(Plan.findAllByAgent(oldAgent).size()== 0) {
                            oldAgent.delete()
                        }
                    }

                    def tempb = []
                    tempb.addAll(oldBeneficiaries)

                    tempb.each {
                        def ben = it
                        if(!beneficiaryList.id.contains(ben.id)) {
                            plan.removeFromBeneficiaries(ben)
//
                            def plans = Plan.createCriteria().list() {
                                beneficiaries {
                                    eq("id",ben.id)
                                }
                            }
                            if(plans.size()== 0) {
                                ben.delete()
                            }
                        }
                    }

                    beneficiaryList.each {
                        if(!oldBeneficiaries.id.contains(it.id)) {
                            it.save()
                            plan.addToBeneficiaries(it)
                        }
                    }


                    def temp = []
                    temp.addAll(oldAmendments)

                    temp.each {
                        if(!amendments.tempId.contains(it.tempId)) {
                            plan.removeFromAmendments(it)
                            it.delete()
                        }
                    }
                    if(amendments.size() > 0) {
                        amendments.each {
                            if(!oldAmendments.tempId.contains(it.tempId)) {
                                it.save()
                                plan.addToAmendments(it)
                            }
                        }
                    } else {
                        amendments = null
                    }


                    if (!plan.save(flush: true)) {
                        return error()
                    }

                }
                flash.myMessage = "Plan ${plan?.planNumber} successfully updated."
//                auditTrailService.addToLogs("Update Plan: ${plan.planNumber}")
                conversation.planInstance = plan
            }.to('show')
        }

        show {
            on("return"){
                conversation.readOnly = true
//              conversation.page4link = g.createLink(action: 'create', controller:  'plan', params: [execution: params.execution])
            }.to("amendments")

            on("finish") {

            }.to("last")
        }

        //End State
        last {
//            redirect(action: "show", id: conversation.planInstance?.id, params:[message: flow.myMessage])
            redirect(action: "list")
        }
    }

    def clientsList = {
        render autoCompleteService.clientList(params) as JSON
    }

    def planholdersList = {
        render autoCompleteService.planholdersList(params) as JSON
    }

    def zipcodesList = {
        render autoCompleteService.zipcodesList(params) as JSON
    }

//    def create() {
//        [planInstance: new Plan(params)]
//    }

    def save() {
        params.origIssueDate = params.origIssueDate ? Date.parse( 'MM/dd/yyyy', params.origIssueDate ) : null
        params.currentIssueDate = params.currentIssueDate? Date.parse( 'MM/dd/yyyy', params.currentIssueDate ) : null
        params.applicableDate = params.applicableDate ? Date.parse( 'MM/dd/yyyy', params.applicableDate ) : null
        def planInstance = new Plan(params)
        if (!planInstance.save(flush: true)) {
            render(view: "create", model: [planInstance: planInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'plan.label', default: 'Plan'), planInstance.id])
        redirect(action: "show", id: planInstance.id)
    }

    def show(Long id) {
        def planInstance = Plan.get(id)
        if (!planInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), id])
            redirect(action: "list")
            return
        }

        [planInstance: planInstance]
    }

//    def edit(Long id) {
//        def planInstance = Plan.get(id)
//        if (!planInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), id])
//            redirect(action: "list")
//            return
//        }
//
//        [planInstance: planInstance]
//    }

    def update(Long id, Long version) {
        def planInstance = Plan.get(id)
        if (!planInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (planInstance.version > version) {
                planInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'plan.label', default: 'Plan')] as Object[],
                          "Another user has updated this Plan while you were editing")
                render(view: "edit", model: [planInstance: planInstance])
                return
            }
        }
        params.origIssueDate = params.origIssueDate ? Date.parse( 'MM/dd/yyyy', params.origIssueDate ) : null
        params.currentIssueDate = params.currentIssueDate? Date.parse( 'MM/dd/yyyy', params.currentIssueDate ) : null
        params.applicableDate = params.applicableDate ? Date.parse( 'MM/dd/yyyy', params.applicableDate ) : null
        planInstance.properties = params

        if (!planInstance.save(flush: true)) {
            render(view: "edit", model: [planInstance: planInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'plan.label', default: 'Plan'), planInstance.id])
        redirect(action: "show", id: planInstance.id)
    }

    def delete(Long id) {
        def planInstance = Plan.get(id)
        if (!planInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), id])
            redirect(action: "list")
            return
        }

        try {
            planInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'plan.label', default: 'Plan'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'plan.label', default: 'Plan'), id])
            redirect(action: "show", id: id)
        }
    }

    def test = {
        def x = AuditLog.list()
        render x
    }
}
