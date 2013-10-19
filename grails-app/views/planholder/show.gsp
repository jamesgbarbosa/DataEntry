
<%@ page import="com.dataentry.Planholder" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'planholder.label', default: 'Planholder')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-planholder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-planholder" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list planholder">
			
				<g:if test="${planholderInstance?.clientType}">
				<li class="fieldcontain">
					<span id="clientType-label" class="property-label"><g:message code="planholder.clientType.label" default="Client Type" /></span>
					
						<span class="property-value" aria-labelledby="clientType-label"><g:fieldValue bean="${planholderInstance}" field="clientType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planholderInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="planholder.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${planholderInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planholderInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="planholder.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${planholderInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planholderInstance?.middleName}">
				<li class="fieldcontain">
					<span id="middleName-label" class="property-label"><g:message code="planholder.middleName.label" default="Middle Name" /></span>
					
						<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${planholderInstance}" field="middleName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planholderInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="planholder.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${planholderInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planholderInstance?.birthdate}">
				<li class="fieldcontain">
					<span id="birthdate-label" class="property-label"><g:message code="planholder.birthdate.label" default="Birthdate" /></span>
					
						<span class="property-value" aria-labelledby="birthdate-label"><g:formatDate date="${planholderInstance?.birthdate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${planholderInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="planholder.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${planholderInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planholderInstance?.address1}">
				<li class="fieldcontain">
					<span id="address1-label" class="property-label"><g:message code="planholder.address1.label" default="Address1" /></span>
					
						<span class="property-value" aria-labelledby="address1-label"><g:fieldValue bean="${planholderInstance}" field="address1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planholderInstance?.address2}">
				<li class="fieldcontain">
					<span id="address2-label" class="property-label"><g:message code="planholder.address2.label" default="Address2" /></span>
					
						<span class="property-value" aria-labelledby="address2-label"><g:fieldValue bean="${planholderInstance}" field="address2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planholderInstance?.address3}">
				<li class="fieldcontain">
					<span id="address3-label" class="property-label"><g:message code="planholder.address3.label" default="Address3" /></span>
					
						<span class="property-value" aria-labelledby="address3-label"><g:fieldValue bean="${planholderInstance}" field="address3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planholderInstance?.address4}">
				<li class="fieldcontain">
					<span id="address4-label" class="property-label"><g:message code="planholder.address4.label" default="Address4" /></span>
					
						<span class="property-value" aria-labelledby="address4-label"><g:fieldValue bean="${planholderInstance}" field="address4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planholderInstance?.address5}">
				<li class="fieldcontain">
					<span id="address5-label" class="property-label"><g:message code="planholder.address5.label" default="Address5" /></span>
					
						<span class="property-value" aria-labelledby="address5-label"><g:fieldValue bean="${planholderInstance}" field="address5"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planholderInstance?.address6}">
				<li class="fieldcontain">
					<span id="address6-label" class="property-label"><g:message code="planholder.address6.label" default="Address6" /></span>
					
						<span class="property-value" aria-labelledby="address6-label"><g:fieldValue bean="${planholderInstance}" field="address6"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planholderInstance?.landline}">
				<li class="fieldcontain">
					<span id="landline-label" class="property-label"><g:message code="planholder.landline.label" default="Landline" /></span>
					
						<span class="property-value" aria-labelledby="landline-label"><g:fieldValue bean="${planholderInstance}" field="landline"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planholderInstance?.mobile}">
				<li class="fieldcontain">
					<span id="mobile-label" class="property-label"><g:message code="planholder.mobile.label" default="Mobile" /></span>
					
						<span class="property-value" aria-labelledby="mobile-label"><g:fieldValue bean="${planholderInstance}" field="mobile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planholderInstance?.officenumber}">
				<li class="fieldcontain">
					<span id="officenumber-label" class="property-label"><g:message code="planholder.officenumber.label" default="Officenumber" /></span>
					
						<span class="property-value" aria-labelledby="officenumber-label"><g:fieldValue bean="${planholderInstance}" field="officenumber"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${planholderInstance?.id}" />
					<g:link class="edit" action="edit" id="${planholderInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
