
<%@ page import="com.dataentry.UserAccount" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userAccount.label', default: 'UserAccount')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userAccount" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create">Create User</g:link></li>
			</ul>
		</div>
		<div id="list-userAccount" class="content scaffold-list" role="main">
			<h1>User List</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'userAccount.username.label', default: 'Username')}" />

						<g:sortableColumn property="username" title="${message(code: 'userAccount.name.label', default: 'Name')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${userAccountInstanceList}" status="i" var="userAccountInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userAccountInstance.id}">${fieldValue(bean: userAccountInstance, field: "username")}</g:link></td>

						<td><g:link action="show" id="${userAccountInstance.id}">${fieldValue(bean: userAccountInstance, field: "name")}</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userAccountInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
