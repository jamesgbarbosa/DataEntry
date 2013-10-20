
<%@ page import="com.dataentry.Agent" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'agent.label', default: 'Agent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-agent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-agent" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list agent">
			
				<g:if test="${agentInstance?.clientType}">
				<li class="fieldcontain">
					<span id="clientType-label" class="property-label"><g:message code="agent.clientType.label" default="Client Type" /></span>
					
						<span class="property-value" aria-labelledby="clientType-label"><g:fieldValue bean="${agentInstance}" field="clientType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="agent.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${agentInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="agent.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${agentInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.middleName}">
				<li class="fieldcontain">
					<span id="middleName-label" class="property-label"><g:message code="agent.middleName.label" default="Middle Name" /></span>
					
						<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${agentInstance}" field="middleName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="agent.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${agentInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.birthdate}">
				<li class="fieldcontain">
					<span id="birthdate-label" class="property-label"><g:message code="agent.birthdate.label" default="Birthdate" /></span>
					
						<span class="property-value" aria-labelledby="birthdate-label"><g:formatDate date="${agentInstance?.birthdate}" format="MM/dd/yyyy" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="agent.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${agentInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.address1}">
				<li class="fieldcontain">
					<span id="address1-label" class="property-label"><g:message code="agent.address1.label" default="Address1" /></span>
					
						<span class="property-value" aria-labelledby="address1-label"><g:fieldValue bean="${agentInstance}" field="address1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.address2}">
				<li class="fieldcontain">
					<span id="address2-label" class="property-label"><g:message code="agent.address2.label" default="Address2" /></span>
					
						<span class="property-value" aria-labelledby="address2-label"><g:fieldValue bean="${agentInstance}" field="address2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.address3}">
				<li class="fieldcontain">
					<span id="address3-label" class="property-label"><g:message code="agent.address3.label" default="Address3" /></span>
					
						<span class="property-value" aria-labelledby="address3-label"><g:fieldValue bean="${agentInstance}" field="address3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.address4}">
				<li class="fieldcontain">
					<span id="address4-label" class="property-label"><g:message code="agent.address4.label" default="Address4" /></span>
					
						<span class="property-value" aria-labelledby="address4-label"><g:fieldValue bean="${agentInstance}" field="address4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.address5}">
				<li class="fieldcontain">
					<span id="address5-label" class="property-label"><g:message code="agent.address5.label" default="Address5" /></span>
					
						<span class="property-value" aria-labelledby="address5-label"><g:fieldValue bean="${agentInstance}" field="address5"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.address6}">
				<li class="fieldcontain">
					<span id="address6-label" class="property-label"><g:message code="agent.address6.label" default="Address6" /></span>
					
						<span class="property-value" aria-labelledby="address6-label"><g:fieldValue bean="${agentInstance}" field="address6"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.landline}">
				<li class="fieldcontain">
					<span id="landline-label" class="property-label"><g:message code="agent.landline.label" default="Landline" /></span>
					
						<span class="property-value" aria-labelledby="landline-label"><g:fieldValue bean="${agentInstance}" field="landline"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.mobile}">
				<li class="fieldcontain">
					<span id="mobile-label" class="property-label"><g:message code="agent.mobile.label" default="Mobile" /></span>
					
						<span class="property-value" aria-labelledby="mobile-label"><g:fieldValue bean="${agentInstance}" field="mobile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.officenumber}">
				<li class="fieldcontain">
					<span id="officenumber-label" class="property-label"><g:message code="agent.officenumber.label" default="Officenumber" /></span>
					
						<span class="property-value" aria-labelledby="officenumber-label"><g:fieldValue bean="${agentInstance}" field="officenumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.agentCode}">
				<li class="fieldcontain">
					<span id="agentCode-label" class="property-label"><g:message code="agent.agentCode.label" default="Agent Code" /></span>
					
						<span class="property-value" aria-labelledby="agentCode-label"><g:fieldValue bean="${agentInstance}" field="agentCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.position}">
				<li class="fieldcontain">
					<span id="position-label" class="property-label"><g:message code="agent.position.label" default="Position" /></span>
					
						<span class="property-value" aria-labelledby="position-label"><g:fieldValue bean="${agentInstance}" field="position"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.appointmentDate}">
				<li class="fieldcontain">
					<span id="appointmentDate-label" class="property-label"><g:message code="agent.appointmentDate.label" default="Appointment Date" /></span>
					
						<span class="property-value" aria-labelledby="appointmentDate-label"><g:formatDate date="${agentInstance?.appointmentDate}" format="MM/dd/yyyy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.agency}">
				<li class="fieldcontain">
					<span id="agency-label" class="property-label"><g:message code="agent.agency.label" default="Agency" /></span>
					
						<span class="property-value" aria-labelledby="agency-label"><g:fieldValue bean="${agentInstance}" field="agency"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.groupName}">
				<li class="fieldcontain">
					<span id="groupName-label" class="property-label"><g:message code="agent.groupName.label" default="Group Name" /></span>
					
						<span class="property-value" aria-labelledby="groupName-label"><g:fieldValue bean="${agentInstance}" field="groupName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agentInstance?.unit}">
				<li class="fieldcontain">
					<span id="unit-label" class="property-label"><g:message code="agent.unit.label" default="Unit" /></span>
					
						<span class="property-value" aria-labelledby="unit-label"><g:fieldValue bean="${agentInstance}" field="unit"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${agentInstance?.id}" />
					<g:link class="edit" action="edit" id="${agentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
