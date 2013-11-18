
<%@ page import="com.dataentry.Planholder" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'planholder.label', default: 'Planholder')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-planholder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-planholder" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="lastName" title="${message(code: 'planholder.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'planholder.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="middleName" title="${message(code: 'planholder.middleName.label', default: 'Middle Name')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'planholder.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="birthdate" title="${message(code: 'planholder.birthdate.label', default: 'Birthdate')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${planholderInstanceList}" status="i" var="planholderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: planholderInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: planholderInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: planholderInstance, field: "middleName")}</td>
					
						<td>${fieldValue(bean: planholderInstance, field: "gender")}</td>
					
						<td><g:formatDate date="${planholderInstance.birthdate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${planholderInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
