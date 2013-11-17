
<%@ page import="com.dataentry.Beneficiary" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'beneficiary.label', default: 'Beneficiary')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-beneficiary" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-beneficiary" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list beneficiary">

				<g:if test="${beneficiaryInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="beneficiary.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${beneficiaryInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beneficiaryInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="beneficiary.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${beneficiaryInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beneficiaryInstance?.middleName}">
				<li class="fieldcontain">
					<span id="middleName-label" class="property-label"><g:message code="beneficiary.middleName.label" default="Middle Name" /></span>
					
						<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${beneficiaryInstance}" field="middleName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beneficiaryInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="beneficiary.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${beneficiaryInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beneficiaryInstance?.birthdate}">
				<li class="fieldcontain">
					<span id="birthdate-label" class="property-label"><g:message code="beneficiary.birthdate.label" default="Birthdate" /></span>
					
						<span class="property-value" aria-labelledby="birthdate-label"><g:formatDate date="${beneficiaryInstance?.birthdate}" format="MM/dd/yyyy" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${beneficiaryInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="beneficiary.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${beneficiaryInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beneficiaryInstance?.address1}">
				<li class="fieldcontain">
					<span id="address1-label" class="property-label"><g:message code="beneficiary.address1.label" default="Address1" /></span>
					
						<span class="property-value" aria-labelledby="address1-label"><g:fieldValue bean="${beneficiaryInstance}" field="address1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beneficiaryInstance?.address2}">
				<li class="fieldcontain">
					<span id="address2-label" class="property-label"><g:message code="beneficiary.address2.label" default="Address2" /></span>
					
						<span class="property-value" aria-labelledby="address2-label"><g:fieldValue bean="${beneficiaryInstance}" field="address2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beneficiaryInstance?.address3}">
				<li class="fieldcontain">
					<span id="address3-label" class="property-label"><g:message code="beneficiary.address3.label" default="Address3" /></span>
					
						<span class="property-value" aria-labelledby="address3-label"><g:fieldValue bean="${beneficiaryInstance}" field="address3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beneficiaryInstance?.address4}">
				<li class="fieldcontain">
					<span id="address4-label" class="property-label"><g:message code="beneficiary.address4.label" default="Address4" /></span>
					
						<span class="property-value" aria-labelledby="address4-label"><g:fieldValue bean="${beneficiaryInstance}" field="address4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beneficiaryInstance?.address5}">
				<li class="fieldcontain">
					<span id="address5-label" class="property-label"><g:message code="beneficiary.address5.label" default="Address5" /></span>
					
						<span class="property-value" aria-labelledby="address5-label"><g:fieldValue bean="${beneficiaryInstance}" field="address5"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beneficiaryInstance?.address6}">
				<li class="fieldcontain">
					<span id="address6-label" class="property-label"><g:message code="beneficiary.address6.label" default="Address6" /></span>
					
						<span class="property-value" aria-labelledby="address6-label"><g:fieldValue bean="${beneficiaryInstance}" field="address6"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beneficiaryInstance?.landline}">
				<li class="fieldcontain">
					<span id="landline-label" class="property-label"><g:message code="beneficiary.landline.label" default="Landline" /></span>
					
						<span class="property-value" aria-labelledby="landline-label"><g:fieldValue bean="${beneficiaryInstance}" field="landline"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beneficiaryInstance?.mobile}">
				<li class="fieldcontain">
					<span id="mobile-label" class="property-label"><g:message code="beneficiary.mobile.label" default="Mobile" /></span>
					
						<span class="property-value" aria-labelledby="mobile-label"><g:fieldValue bean="${beneficiaryInstance}" field="mobile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beneficiaryInstance?.officenumber}">
				<li class="fieldcontain">
					<span id="officenumber-label" class="property-label"><g:message code="beneficiary.officenumber.label" default="Officenumber" /></span>
					
						<span class="property-value" aria-labelledby="officenumber-label"><g:fieldValue bean="${beneficiaryInstance}" field="officenumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beneficiaryInstance?.designation}">
				<li class="fieldcontain">
					<span id="designation-label" class="property-label"><g:message code="beneficiary.designation.label" default="Designation" /></span>
					
						<span class="property-value" aria-labelledby="designation-label"><g:fieldValue bean="${beneficiaryInstance}" field="designation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beneficiaryInstance?.relationship}">
				<li class="fieldcontain">
					<span id="relationship-label" class="property-label"><g:message code="beneficiary.relationship.label" default="Relationship" /></span>
					
						<span class="property-value" aria-labelledby="relationship-label"><g:fieldValue bean="${beneficiaryInstance}" field="relationship"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${beneficiaryInstance?.id}" />
					<g:link class="edit" action="edit" id="${beneficiaryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
