<%@ page import="com.dataentry.Plan" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plan.label', default: 'Plan')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-plan" class="content scaffold-create" role="main">
            <h1>
            Create Plan
            <g:if test="${page2link!=''}"> >  <a href="${page2link}&red=true"> Create Beneficiaries </a> </g:if>
            <g:if test="${page3link!=''}"> >  <a href="${page3link}&red=true"> Create Agent </a> </g:if>
            <g:if test="${page4link!=''}"> >  <a href="${page4link}&red=true"> Create Amendments </a> </g:if>
            </h1>
			%{--<g:message code="default.create.label" args="[entityName]" />--}%
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${planInstance}">
			%{--<ul class="errors" role="alert">--}%
				%{--<g:eachError bean="${planInstance}" var="error">--}%
				%{--<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>--}%
				%{--</g:eachError>--}%
			%{--</ul>--}%
			</g:hasErrors>
            <g:if test="${duplicateClientError!=""}">
                <ul class="errors" role="alert">
                    <li>${duplicateClientError} </li>
                </ul>
            </g:if>
			<g:form action="create" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
                    %{--TODO fixed this. make this work!--}%
					%{--<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
                    <g:submitButton name="beneficiaries" event="beneficiaries" value="Next" />

                </fieldset>
			</g:form>
		</div>
    <g:hiddenField name="clientsListLink" value="${createLink(controller: 'plan', action: 'clientsList')}"/>
	</body>

</html>
