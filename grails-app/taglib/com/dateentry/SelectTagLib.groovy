package com.dateentry

import com.dateentry.reftables.Product

class SelectTagLib {

    static namespace = 'select'

    void product = { attrs ->

        out << g.select(name: 'product', id: 'product' , from: Product.list(), optionKey: 'name', optionValue: 'name', value: attrs.value)

    }

}
