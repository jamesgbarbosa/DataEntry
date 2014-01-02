package com.dataentry

import grails.validation.Validateable
import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils


class UserAccountController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def springSecurityService
    def auditTrailService

    @Secured(['ROLE_ADMIN'])
    def index() {
        redirect(action: "list", params: params)
    }

    @Secured(['ROLE_ADMIN'])
    def list(Integer max) {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def x = params
        if(params.username || params.name) {
            def users = UserAccount.createCriteria().list(max: params.max, offset: params.offset, sort: params.sort, order: params.order) {
                if(params.username) { ilike("username","${params.username}%") }
                if(params.name) { ilike("name","${params.name}%")}
            }
            [userAccountInstanceList: users, userAccountInstanceTotal: users.getTotalCount()]
        } else {
            params.max = Math.min(max ?: 10, 100)
            [userAccountInstanceList: UserAccount.list(params), userAccountInstanceTotal: UserAccount.count()]
        }


    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        [command: new RegisterCommand()]
    }


//    def password() {
//        [command: new ChangePasswordCommand(userId: params.id)]
//    }

    @Secured(['ROLE_ADMIN'])
    def save = {  RegisterCommand command ->
        command.username = command?.username?.trim()
        command.name = command?.name?.trim()
        command.password = command?.password?.trim()
        command.password2 = command?.password2?.trim()
        if (command.hasErrors()) {
            render view: 'create', model: [command: command]
            return
        }
        params.enabled = true
        def userAccountInstance = new UserAccount(params)
        if (!userAccountInstance.save(flush: true)) {
            render(view: "create", model: [userAccountInstance: userAccountInstance])
            return
        }

        def userRole = Role.findByAuthority('ROLE_USER')
        UserAccountRole.create(userAccountInstance, userRole, true)
        flash.message = "User ${userAccountInstance.username} successfully created."
        redirect(action: "show", id: userAccountInstance.id)
    }


    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def show(Long id) {
        def currentUser = (UserAccount)springSecurityService.getCurrentUser()
        def currentRole = UserAccountRole.findByUserAccount(currentUser).role

        if(currentRole.authority == 'ROLE_USER') {
            if(currentUser.id != id) {
                redirect(controller: 'login', action: 'denied')
                return
            }
        }

        def userAccountInstance = UserAccount.get(id)
        if (!userAccountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), id])
            redirect(action: "list")
            return
        }

        [userAccountInstance: userAccountInstance]
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def edit(Long id) {
        def currentUser = (UserAccount)springSecurityService.getCurrentUser()
        def currentRole = UserAccountRole.findByUserAccount(currentUser).role

        if(currentRole.authority == 'ROLE_USER') {
            if(currentUser.id != id) {
                redirect(controller: 'login', action: 'denied')
                return
            }
        }

        def userAccountInstance = UserAccount.get(id)
        if (!userAccountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), id])
            redirect(action: "list")
            return
        }

        def command = new RegisterCommand()
        command.username = userAccountInstance.username
        command.name = userAccountInstance.name
        command.userId = userAccountInstance.id

        def pcommand = new ChangePasswordCommand()
        pcommand.userId = id

        [command: command, pcommand: pcommand]
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def changePassword = {

        def x = params
        def currentUser = (UserAccount)springSecurityService.getCurrentUser()
        def currentRole = UserAccountRole.findByUserAccount(currentUser).role

        if(currentRole.authority == 'ROLE_USER') {
            if(currentUser.id.toString() != params.userId) {
                redirect(controller: 'login', action: 'denied')
                return
            }
        }

        def command = new ChangePasswordCommand()
        command.userId = params.userId
        command.password = params.password
        command.password2 = params.password2
        command.oldPassword = springSecurityService.encodePassword(params.oldPassword)
        def userAccountInstance = UserAccount.get(params.id)
        if (!userAccountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), params.id])
            redirect(action: "list")
            return
        }

        command.userId = userAccountInstance.id

        if (!command.validate()) {
            UserAccount user = UserAccount.get(params.userId)
            render view: 'edit', model: [pcommand: command, command: new RegisterCommand(userId: params.userId, username: user.username)]
            return
        }

        userAccountInstance.password = command.password
        userAccountInstance.save()

//        auditTrailService.addToLogs("Change Password: ${userAccountInstance.username}")
        flash.message = "Change password success."
        redirect(action: "show", id: userAccountInstance.id)

    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def update(Long id, Long version) {
        def currentUser = (UserAccount)springSecurityService.getCurrentUser()
        def currentRole = UserAccountRole.findByUserAccount(currentUser).role

        if(currentRole.authority == 'ROLE_USER') {
            if(currentUser.id != id) {
                redirect(controller: 'login', action: 'denied')
                return
            }
        }

        def userAccountInstance = UserAccount.get(id)
        if (!userAccountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userAccountInstance.version > version) {
                userAccountInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'userAccount.label', default: 'UserAccount')] as Object[],
                        "Another user has updated this UserAccount while you were editing")
                render(view: "edit", model: [userAccountInstance: userAccountInstance])
                return
            }
        }

        userAccountInstance.properties = params
        def command = new RegisterCommand()
        command.username = userAccountInstance.username
        command.name = userAccountInstance.name
        command.userId = userAccountInstance.id


        if (!userAccountInstance.save(flush: true)) {
            render(view: "edit", model: [command: command, pcommand: new ChangePasswordCommand(userId: id)])
            return
        }

//        auditTrailService.addToLogs("Update User: ${userAccountInstance.username}")
        flash.message = "User ${userAccountInstance.username} successfully updated."
        redirect(action: "show", id: userAccountInstance.id)
    }

    @Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def userAccountInstance = UserAccount.get(id)
        if (!userAccountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), id])
            redirect(action: "list")
            return
        }

        try {
            userAccountInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), id])
            redirect(action: "show", id: id)
        }
    }

    static final passwordValidator = { String password, command ->
        if (command.username && command.username.equals(password)) {
            return 'command.password.error.username'
        }

//        if (!checkPasswordMinLength(password, command) ||
//                !checkPasswordMaxLength(password, command) ||
//                !checkPasswordRegex(password, command)) {
//            return 'command.password.error.strength'
//        }
    }

    static boolean checkPasswordMinLength(String password, command) {
        def conf = SpringSecurityUtils.securityConfig

        int minLength = conf.ui.password.minLength instanceof Number ? conf.ui.password.minLength : 8

        password && password.length() >= minLength
    }

    static boolean checkPasswordMaxLength(String password, command) {
        def conf = SpringSecurityUtils.securityConfig

        int maxLength = conf.ui.password.maxLength instanceof Number ? conf.ui.password.maxLength : 64

        password && password.length() <= maxLength
    }

    static boolean checkPasswordRegex(String password, command) {
        def conf = SpringSecurityUtils.securityConfig

        String passValidationRegex = conf.ui.password.validationRegex ?:
            '^.*(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&]).*$'

        password && password.matches(passValidationRegex)
    }

    static final password2Validator = { value, command ->
        if (command.password != command.password2) {
            return 'command.password2.error.mismatch'
        }
    }

}

class RegisterCommand {

    String userId
    String username
    String name
    String password
    String password2

    def grailsApplication

    static constraints = {
        username blank: false, nullable: false, validator: { value, command ->
            if (value) {
                def User = command.grailsApplication.getDomainClass(
                        SpringSecurityUtils.securityConfig.userLookup.userDomainClassName).clazz
                if (UserAccount.findByUsername(value)) {
                    return 'registerCommand.username.unique'
                }
            }
        }
//        email blank: false, nullable: false, email: true
        password blank: false, nullable: false
        password2 validator: UserAccountController.password2Validator
        name blank: true, nullable: true
        userId blank: true, nullable: true
    }
}

@Validateable
class ChangePasswordCommand {

    String userId
    String oldPassword
    String password
    String password2

    transient springSecurityService
    def grailsApplication

    static constraints = {
//        email blank: false, nullable: false, email: true
        oldPassword blank: false  , nullable: false, validator:{ val, obj ->
            def user = UserAccount.get(obj?.userId)
            if(val != user.password)  {
                return 'oldPassword.incorrect'
            }
        }
        password blank: false, nullable: false
        password2 validator: UserAccountController.password2Validator
    }
}
