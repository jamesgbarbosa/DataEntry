package com.dateentry

import com.dateentry.reftables.*

class UtilTagLib {

    static namespace = 'util'

    def beneficiaryIdsHiddenField = { attrs ->
        def temp = "0"
        attrs.beneficiaries.each {
            temp += ",${it?.clientProfile?.id}"
        }
        out << g.hiddenField(name: 'beneficiaryIds', value: temp)
    }

}
