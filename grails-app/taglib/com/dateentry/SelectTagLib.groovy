package com.dateentry

import com.dateentry.reftables.Product
import com.dateentry.reftables.AmendmentTypes
import com.dateentry.reftables.PaymentMode
import com.dateentry.reftables.PlanStatus
import com.dateentry.reftables.Relationship
import com.dateentry.reftables.Designation

class SelectTagLib {

    static namespace = 'select'

    void product = { attrs ->

        out << g.select(name: 'product', id: 'product' , from: Product.list(), optionKey: 'name', optionValue: 'name', value: attrs.value, noSelection: ['': 'Please select...'])

    }

    void paymentMode = { attrs ->

        out << g.select(name: 'paymentMode', id: 'paymentMode' , from: PaymentMode.list(), optionKey: 'name', optionValue: 'name', value: attrs.value, noSelection: ['': 'Please select...'])

    }

    void planStatus = { attrs ->

        out << g.select(name: 'planStatus', id: 'planStatus' , from: PlanStatus.list(), optionKey: 'name', optionValue: 'name', value: attrs.value, noSelection: ['': 'Please select...'])

    }

    void designation = { attrs ->

        out << g.select(name: 'designation', id: 'designation' , from: Designation.list(), optionKey: 'name', optionValue: 'name', value: attrs.value, noSelection: ['': 'Please select...'])

    }

    void relationship = { attrs ->

        out << g.select(name: 'relationship', id: 'relationship' , from: Relationship.list(), optionKey: 'name', optionValue: 'name', value: attrs.value, noSelection: ['': 'Please select...'])

    }

    void amendmentTypes = { attrs ->

        out << g.select(name: 'amendmentType', id: 'amendmentType' , from: AmendmentTypes.list(), optionKey: 'name', optionValue: 'name', value: attrs.value, noSelection: ['': 'Please select...'])

    }

}
