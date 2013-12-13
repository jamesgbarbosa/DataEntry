
<%@ page import="com.dataentry.Company" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list">Search Companies</g:link></li>
				<li><g:link class="create" action="create">Create Company</g:link></li>
			</ul>
		</div>
		<div id="show-company" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list company">
			
				<g:if test="${companyInstance?.name}">
				<li class="fieldcontain">
                        <span id="address1-label" class="property-label">Company Name</span>
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${companyInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.address1}">
				<li class="fieldcontain">
					<span id="address1-label" class="property-label"><g:message code="company.address1.label" default="Address1" /></span>
					
						<span class="property-value" aria-labelledby="address1-label"><g:fieldValue bean="${companyInstance}" field="address1"/></span>
					
				</li>
				</g:if>

                <g:if test="${companyInstance?.address2}">
                    <li class="fieldcontain">
                        <span id="address2-label" class="property-label"><g:message code="company.address2.label" default="Address2" /></span>

                        <span class="property-value" aria-labelledby="address2-label"><g:fieldValue bean="${companyInstance}" field="address2"/></span>

                    </li>
                </g:if>

                <g:if test="${companyInstance?.address3}">
                    <li class="fieldcontain">
                        <span id="address3-label" class="property-label"><g:message code="company.address3.label" default="Address3" /></span>

                        <span class="property-value" aria-labelledby="address3-label"><g:fieldValue bean="${companyInstance}" field="address3"/></span>

                    </li>
                </g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${companyInstance?.id}" />
					<g:link class="edit button-border" action="edit" id="${companyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
