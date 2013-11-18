
<%@ page import="com.dataentry.Beneficiary" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'beneficiary.label', default: 'Beneficiary')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-beneficiary" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-beneficiary" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>

						<g:sortableColumn property="lastName" title="${message(code: 'beneficiary.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'beneficiary.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="middleName" title="${message(code: 'beneficiary.middleName.label', default: 'Middle Name')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'beneficiary.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="birthdate" title="${message(code: 'beneficiary.birthdate.label', default: 'Birthdate')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${beneficiaryInstanceList}" status="i" var="beneficiaryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: beneficiaryInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: beneficiaryInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: beneficiaryInstance, field: "middleName")}</td>
					
						<td>${fieldValue(bean: beneficiaryInstance, field: "gender")}</td>
					
						<td><g:formatDate date="${beneficiaryInstance.birthdate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${beneficiaryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
