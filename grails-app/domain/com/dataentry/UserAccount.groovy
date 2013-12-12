package com.dataentry

class UserAccount {

	transient springSecurityService

	String username
	String password
    String name
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password blank: false
        name blank: true, nullable: true
    }

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserAccountRole.findAllByUserAccount(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
