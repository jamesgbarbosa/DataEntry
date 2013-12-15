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
                <g:if test="${page2link!=''}"><a href="${page2link}&red=true"> Create Beneficiary </a> > </g:if>
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
                    <div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.company, field: 'name', 'error')} required">
                        <label for="name">
                            <sup><span class="required-indicator">*</span></sup>
                            Company Name
                        </label>
                        <g:textField name="name" value="${beneficiaryInstance?.company?.name}"/>
                        <g:hasErrors bean="${beneficiaryInstance?.company}"
                                     field="name">
                            <g:eachError bean="${beneficiaryInstance?.company}" field="name">
                                <span class="inlineErrors">
                                    <g:message  error="${it}" />
                                </span>
                            </g:eachError>
                        </g:hasErrors>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.company, field: 'address1', 'error')} ">
                        <label for="address1">
                            <g:message code="company.address1.label" default="Address1" />

                        </label>
                        <g:textField name="address1" value="${beneficiaryInstance?.company?.address1}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.company, field: 'address2', 'error')} ">
                        <label for="address2">
                            <g:message code="company.address2.label" default="Address2" />

                        </label>
                        <g:textField name="address2" value="${beneficiaryInstance?.company?.address2}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.company, field: 'address3', 'error')} ">
                        <label for="address3">
                            <g:message code="company.address3.label" default="Address3" />

                        </label>
                        <g:textField name="address3" value="${beneficiaryInstance?.company?.address3}"/>
                    </div>
				</fieldset>
				<fieldset class="buttons">
					%{--<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
                    <g:submitButton name="return" event="return" value="Back" />
                    <g:submitButton class="save" name="saveCompany" event="saveCompany" value="Create" />
                </fieldset>
			</g:form>
		</div>
    </body>
</html>