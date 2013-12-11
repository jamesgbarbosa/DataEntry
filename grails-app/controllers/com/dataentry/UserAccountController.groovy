package com.dataentry

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_ADMIN'])
class UserAccountController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userAccountInstanceList: UserAccount.list(params), userAccountInstanceTotal: UserAccount.count()]
    }

    def create() {
        [command: new RegisterCommand()]
    }

    def save = {  RegisterCommand command ->

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

        flash.message = "User ${userAccountInstance.username} successfully created."
        redirect(action: "show", id: userAccountInstance.id)
    }

    def show(Long id) {
        def userAccountInstance = UserAccount.get(id)
        if (!userAccountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), id])
            redirect(action: "list")
            return
        }

        [userAccountInstance: userAccountInstance]
    }

    def edit(Long id) {
        def userAccountInstance = UserAccount.get(id)
        if (!userAccountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), id])
            redirect(action: "list")
            return
        }

        [userAccountInstance: userAccountInstance]
    }

    def update(Long id, Long version) {
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

        if (!userAccountInstance.save(flush: true)) {
            render(view: "edit", model: [userAccountInstance: userAccountInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), userAccountInstance.id])
        redirect(action: "show", id: userAccountInstance.id)
    }

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

    String username
//    String email
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
        password blank: false, nullable: false, validator: UserAccountController.passwordValidator
        password2 validator: UserAccountController.password2Validator
    }
}
