<%@ page import="com.dataentry.Company" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="create-company" class="content scaffold-create" role="main">
            <h4>
                <g:if test="${page1link!=''}"><a href="${page1link}&red=true"> Create Plan </a> > </g:if>
                Create Company
            </h4>
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
            <g:if test="${flash.error}">
                <div class="errors" role="status">${flash.error}</div>
            </g:if>
            <g:if test="${request.error}">
                <div class="errors" role="status">${request.error}</div>
            </g:if>
			<g:form action="create" >
				<fieldset class="form">
                    <div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.company, field: 'name', 'error')} required">
                        <label for="name">
                            <sup><span class="required-indicator">*</span></sup>
                            Company Name
                        </label>
                        <g:textField name="name" value="${createPlanHolderDto?.company?.name}"/>
                        <g:hasErrors bean="${createPlanHolderDto?.company}"
                                     field="name">
                            <g:eachError bean="${createPlanHolderDto?.company}" field="name">
                                <span class="inlineErrors">
                                    <g:message  error="${it}" />
                                </span>
                            </g:eachError>
                        </g:hasErrors>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.company, field: 'email', 'error')} ">
                        <label for="email">
                            <g:message code="company.email.label" default="Email" />

                        </label>
                        <g:textField name="email" value="${createPlanHolderDto?.company?.email}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.company, field: 'address1', 'error')} ">
                        <label for="address1">
                            <g:message code="company.address1.label" default="Address1" />

                        </label>
                        <g:textField name="address1" value="${createPlanHolderDto?.company?.address1}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.company, field: 'address2', 'error')} ">
                        <label for="address2">
                            <g:message code="company.address2.label" default="Address2" />

                        </label>
                        <g:textField name="address2" value="${createPlanHolderDto?.company?.address2}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.company, field: 'address3', 'error')} ">
                        <label for="address3">
                            <g:message code="company.address3.label" default="Address3" />

                        </label>
                        <g:textField name="address3" value="${createPlanHolderDto?.company?.address3}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.company, field: 'zipcode', 'error')} ">
                        <label for="zipcode">
                            ZIP Code
                        </label>
                        <g:textField class='autocomplete-field' name="zipcodes-autocomplete" value="${createPlanHolderDto?.company?.zipcode}" placeholder="Search zipcode..."/>
                        <g:hiddenField name="zipcode" id="zipcode.id" value="${createPlanHolderDto?.company?.zipcode}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.company, field: 'city', 'error')} ">
                        <label for="city">
                            <g:message code="company.city.label" default="City" />

                        </label>
                        <g:textField name="city" value="${createPlanHolderDto?.company?.city}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.company, field: 'province', 'error')} ">
                        <label for="province">
                            <g:message code="company.province.label" default="Province" />

                        </label>
                        <g:textField name="province" value="${createPlanHolderDto?.company?.province}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.company, field: 'landline', 'error')} ">
                        <label for="landline">
                            <g:message code="company.landline.label" default="Landline" />

                        </label>
                        <g:textField name="landline" value="${createPlanHolderDto?.company?.landline}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.company, field: 'mobile', 'error')} ">
                        <label for="mobile">
                            <g:message code="company.mobile.label" default="Mobile" />

                        </label>
                        <g:textField name="mobile" value="${createPlanHolderDto?.company?.mobile}"/>
                    </div>
				</fieldset>
				<fieldset class="buttons">
					%{--<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
                    <g:submitButton name="return" event="return" value="Back" />
                    <g:submitButton class="save" name="saveCompany" event="saveCompany" value="Create" />
                </fieldset>
			</g:form>
		</div>
        <g:hiddenField name="zipcodesListLink" value="${createLink(controller: 'plan', action: 'zipcodesList')}"/>
    </body>
</html>
