
<%@ page import="com.dataentry.Company" %>
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
			</ul>
		</div>
		<div id="list-planholder" class="content scaffold-list" role="main">
			<h1>Logs</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
					    <th>User</th>
					    <th>Transaction</th>
					    <th>Timestamp</th>

					</tr>
				</thead>
				<tbody>
				<g:each in="${logsList}" status="i" var="log">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${log.username}</td>
						<td>${log.transaction}</td>
						<td>${log.timeStamp}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${logsTotal}" />
			</div>
		</div>
	</body>
</html>
