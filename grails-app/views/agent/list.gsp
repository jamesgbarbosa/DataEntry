
<%@ page import="com.dataentry.Agent" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'agent.label', default: 'Agent')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-agent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-agent" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="clientType" title="${message(code: 'agent.clientType.label', default: 'Client Type')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'agent.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'agent.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="middleName" title="${message(code: 'agent.middleName.label', default: 'Middle Name')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'agent.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="birthdate" title="${message(code: 'agent.birthdate.label', default: 'Birthdate')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${agentInstanceList}" status="i" var="agentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${agentInstance.id}">${fieldValue(bean: agentInstance, field: "clientType")}</g:link></td>
					
						<td>${fieldValue(bean: agentInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: agentInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: agentInstance, field: "middleName")}</td>
					
						<td>${fieldValue(bean: agentInstance, field: "gender")}</td>
					
						<td><g:formatDate date="${agentInstance.birthdate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${agentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
