
<%@ page import="com.dataentry.Client" %>
<!DOCTYPE html>
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
            <g:if test="${flash.error}">
                <div class="errors" role="status">${flash.error}</div>
            </g:if>
			<ol class="property-list client">
			
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

			    <g:if test="${clientInstance?.alias}">
				<li class="fieldcontain">
					<span id="alias-label" class="property-label"><g:message code="client.alias.label" default="Alias" /></span>

						<span class="property-value" aria-labelledby="alias-label"><g:fieldValue bean="${clientInstance}" field="alias"/></span>

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
					
						<span class="property-value" aria-labelledby="birthdate-label"><g:formatDate date="${clientInstance?.birthdate}" format="MM/dd/yyyy"/></span>
					
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
			
				<g:if test="${clientInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="client.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${clientInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.province}">
				<li class="fieldcontain">
					<span id="province-label" class="property-label"><g:message code="client.province.label" default="Province" /></span>
					
						<span class="property-value" aria-labelledby="province-label"><g:fieldValue bean="${clientInstance}" field="province"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.zipcode}">
				<li class="fieldcontain">
					<span id="zipcode-label" class="property-label"><g:message code="client.zipcode.label" default="Zipcode" /></span>
					
						<span class="property-value" aria-labelledby="zipcode-label"><g:fieldValue bean="${clientInstance}" field="zipcode"/></span>
					
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
                %{--<g:if test="${plans}">--}%
                    %{--<li class="fieldcontain">--}%
                        %{--<span id="agent-label" class="property-label">Plans</span>--}%
                        %{--<g:each in="${plans}" var="plan">--}%
                            %{--<span class="property-value">--}%
                                %{--<g:if test="${plan?.planHolder?.clientProfile.id == clientInstance.id}">--}%
                                    %{--<g:link controller="plan"  action="show" id="${plan?.id}"> ${plan.planNumber}</g:link>--}%
                                    %{--<g:link controller="client"  action="show" id="${plan?.planHolder?.clientProfile?.id}">${plan?.planHolder?.clientProfile?.getFullName()}</g:link>--}%
                                    %{--(Planholder)--}%
                                %{--</g:if>--}%
                            %{--</span>--}%
                            %{--<span class="property-value">--}%
                                %{--<g:if test="${plan.beneficiaries?.clientProfile.id.contains(clientInstance.id)}">--}%
                                    %{--<g:link controller="plan"  action="show" id="${plan?.id}"> ${plan.planNumber}</g:link>--}%
                                    %{--(Beneficiary)--}%
                                %{--</g:if>--}%
                            %{--</span>--}%
                            %{--<span class="property-value">--}%
                                %{--<g:if test="${plan?.agent?.clientProfile.id == clientInstance.id}">--}%
                                    %{--<g:link controller="plan"  action="show" id="${plan?.id}"> ${plan.planNumber}</g:link>--}%
                                    %{--(Agent)--}%
                                %{--</g:if>--}%

                            %{--</span>--}%
                        %{--</g:each>--}%

                    %{--</li>--}%
                %{--</g:if>--}%
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${clientInstance?.id}" />
					<g:link class="edit button-border" action="edit" id="${clientInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
