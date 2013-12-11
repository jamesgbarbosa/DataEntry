package com.dataentry

import org.apache.commons.lang.builder.HashCodeBuilder

class UserAccountRole implements Serializable {

    private static final long serialVersionUID = 1

    UserAccount userAccount
    Role role

    boolean equals(other) {
        if (!(other instanceof UserAccountRole)) {
            return false
        }

        other.userAccount?.id == userAccount?.id &&
                other.role?.id == role?.id
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        if (userAccount) builder.append(userAccount.id)
        if (role) builder.append(role.id)
        builder.toHashCode()
    }

    static UserAccountRole get(long userAccountId, long roleId) {
        UserAccountRole.where {
            userAccount == UserAccount.load(userAccountId) &&
                    role == Role.load(roleId)
        }.get()
    }

    static UserAccountRole create(UserAccount userAccount, Role role, boolean flush = false) {
        new UserAccountRole(userAccount: userAccount, role: role).save(flush: flush, insert: true)
    }

    static boolean remove(UserAccount u, Role r, boolean flush = false) {

        int rowCount = UserAccountRole.where {
            userAccount == UserAccount.load(u.id) &&
                    role == Role.load(r.id)
        }.deleteAll()

        rowCount > 0
    }

    static void removeAll(UserAccount u) {
        UserAccountRole.where {
            userAccount == UserAccount.load(u.id)
        }.deleteAll()
    }

    static void removeAll(Role r) {
        UserAccountRole.where {
            role == Role.load(r.id)
        }.deleteAll()
    }

    static mapping = {
        id composite: ['role', 'userAccount']
        version false
    }
}
