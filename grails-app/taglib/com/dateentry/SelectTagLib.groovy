package com.dateentry

import com.dateentry.reftables.Product
import com.dateentry.reftables.AmendmentTypes

class SelectTagLib {

    static namespace = 'select'

    void product = { attrs ->

        out << g.select(name: 'product', id: 'product' , from: Product.list(), optionKey: 'name', optionValue: 'name', value: attrs.value)

    }

    void amendmentTypes = { attrs ->

        out << g.select(name: 'amendmentType', id: 'amendmentType' , from: AmendmentTypes.list(), optionKey: 'name', optionValue: 'name', value: attrs.value)

    }

}
