<%@ page import="com.dataentry.Agent" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'agent.label', default: 'Agent')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-agent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="create-agent" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
            <g:if test="${flash.error}">
                <div class="errors" role="status">${flash.error}</div>
            </g:if>
			<g:form action="create" >
				<fieldset class="form">
					<g:render template="/agent/form"/>
				</fieldset>
				<fieldset class="buttons">
					%{--<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
                    <g:submitButton name="return" event="return" value="Back" />
                    <g:submitButton class="save" name="saveAgent" event="saveAgent" value="Create" />
                </fieldset>
			</g:form>

		</div>
	</body>
</html>
