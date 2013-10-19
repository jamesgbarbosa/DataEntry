
<%@ page import="com.dataentry.Amendment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'amendment.label', default: 'Amendment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-amendment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-amendment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="amendmentType" title="${message(code: 'amendment.amendmentType.label', default: 'Amendment Type')}" />
					
						<g:sortableColumn property="approvedBy" title="${message(code: 'amendment.approvedBy.label', default: 'Approved By')}" />
					
						<g:sortableColumn property="effectiveDate" title="${message(code: 'amendment.effectiveDate.label', default: 'Effective Date')}" />
					
						<g:sortableColumn property="filingDate" title="${message(code: 'amendment.filingDate.label', default: 'Filing Date')}" />
					
						<th><g:message code="amendment.plan.label" default="Plan" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${amendmentInstanceList}" status="i" var="amendmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${amendmentInstance.id}">${fieldValue(bean: amendmentInstance, field: "amendmentType")}</g:link></td>
					
						<td>${fieldValue(bean: amendmentInstance, field: "approvedBy")}</td>
					
						<td><g:formatDate date="${amendmentInstance.effectiveDate}" /></td>
					
						<td><g:formatDate date="${amendmentInstance.filingDate}" /></td>
					
						<td>${fieldValue(bean: amendmentInstance, field: "plan")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${amendmentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
