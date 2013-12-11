package com.dataentry

import grails.plugins.springsecurity.Secured
@Secured(['ROLE_ADMIN','ROLE_USER'])
class HomeController {

    def index =  {
        render(view: "index")
    }
}
