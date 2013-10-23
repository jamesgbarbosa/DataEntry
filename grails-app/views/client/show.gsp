
<%@ page import="com.dataentry.Client" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-client" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list client">
			
				<g:if test="${clientInstance?.clientType}">
				<li class="fieldcontain">
					<span id="clientType-label" class="property-label"><g:message code="client.clientType.label" default="Client Type" /></span>
					
						<span class="property-value" aria-labelledby="clientType-label"><g:fieldValue bean="${clientInstance}" field="clientType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="client.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${clientInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="client.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${clientInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.middleName}">
				<li class="fieldcontain">
					<span id="middleName-label" class="property-label"><g:message code="client.middleName.label" default="Middle Name" /></span>
					
						<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${clientInstance}" field="middleName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="client.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${clientInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.birthdate}">
				<li class="fieldcontain">
					<span id="birthdate-label" class="property-label"><g:message code="client.birthdate.label" default="Birthdate" /></span>
					
						<span class="property-value" aria-labelledby="birthdate-label"><g:formatDate date="${clientInstance?.birthdate}" format="MM/dd/yyyy"  /></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="client.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${clientInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.address1}">
				<li class="fieldcontain">
					<span id="address1-label" class="property-label"><g:message code="client.address1.label" default="Address1" /></span>
					
						<span class="property-value" aria-labelledby="address1-label"><g:fieldValue bean="${clientInstance}" field="address1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.address2}">
				<li class="fieldcontain">
					<span id="address2-label" class="property-label"><g:message code="client.address2.label" default="Address2" /></span>
					
						<span class="property-value" aria-labelledby="address2-label"><g:fieldValue bean="${clientInstance}" field="address2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.address3}">
				<li class="fieldcontain">
					<span id="address3-label" class="property-label"><g:message code="client.address3.label" default="Address3" /></span>
					
						<span class="property-value" aria-labelledby="address3-label"><g:fieldValue bean="${clientInstance}" field="address3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.address4}">
				<li class="fieldcontain">
					<span id="address4-label" class="property-label"><g:message code="client.address4.label" default="Address4" /></span>
					
						<span class="property-value" aria-labelledby="address4-label"><g:fieldValue bean="${clientInstance}" field="address4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.address5}">
				<li class="fieldcontain">
					<span id="address5-label" class="property-label"><g:message code="client.address5.label" default="Address5" /></span>
					
						<span class="property-value" aria-labelledby="address5-label"><g:fieldValue bean="${clientInstance}" field="address5"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.address6}">
				<li class="fieldcontain">
					<span id="address6-label" class="property-label"><g:message code="client.address6.label" default="Address6" /></span>
					
						<span class="property-value" aria-labelledby="address6-label"><g:fieldValue bean="${clientInstance}" field="address6"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.landline}">
				<li class="fieldcontain">
					<span id="landline-label" class="property-label"><g:message code="client.landline.label" default="Landline" /></span>
					
						<span class="property-value" aria-labelledby="landline-label"><g:fieldValue bean="${clientInstance}" field="landline"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.mobile}">
				<li class="fieldcontain">
					<span id="mobile-label" class="property-label"><g:message code="client.mobile.label" default="Mobile" /></span>
					
						<span class="property-value" aria-labelledby="mobile-label"><g:fieldValue bean="${clientInstance}" field="mobile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.officenumber}">
				<li class="fieldcontain">
					<span id="officenumber-label" class="property-label"><g:message code="client.officenumber.label" default="Officenumber" /></span>
					
						<span class="property-value" aria-labelledby="officenumber-label"><g:fieldValue bean="${clientInstance}" field="officenumber"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${clientInstance?.id}" />
                    <g:if test="${clientInstance.clientType == 'Agent'}">
                        <g:link class="edit" controller="agent" action="edit" id="${clientInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    </g:if>
                    <g:if test="${clientInstance.clientType == 'Beneficiary'}">
                        <g:link class="edit" controller="beneficiary" action="edit" id="${clientInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    </g:if>
                    <g:if test="${clientInstance.clientType == 'Plan Holder'}">
                        <g:link class="edit" controller="planHolder" action="edit" id="${clientInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    </g:if>
                    <g:else>
                        <g:link class="edit" controller="client" action="edit" id="${clientInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    </g:else>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
