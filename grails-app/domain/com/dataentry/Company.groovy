package com.dataentry

class Company implements Serializable {

//    static auditable  = [ignore:['version']]
    String name
    String address1
    String address2
    String address3

    static constraints = {
        name blank: false, nulalble: false, unique: true
        address1 blank: true, nullable: true
        address2 blank: true, nullable: true
        address3 blank: true, nullable: true
    }

//    def onChange = { oldMap,newMap ->
//        def action
//        action += "Company Update\n"
//        oldMap.each({ key, oldVal ->
//            if(oldVal != newMap[key]) {
//                action += " * $key changed from $oldVal to " + newMap[key] + "\n"
//            }
//        })
//    }//*/
}
