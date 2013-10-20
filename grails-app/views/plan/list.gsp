
<%@ page import="com.dataentry.Plan" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plan.label', default: 'Plan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-plan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-plan" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="product" title="${message(code: 'plan.product.label', default: 'Product')}" />
					
						<g:sortableColumn property="payingPeriod" title="${message(code: 'plan.payingPeriod.label', default: 'Paying Period')}" />
					
						<g:sortableColumn property="maturityPeriod" title="${message(code: 'plan.maturityPeriod.label', default: 'Maturity Period')}" />
					
						<g:sortableColumn property="pnpPrice" title="${message(code: 'plan.pnpPrice.label', default: 'Pnp Price')}" />
					
						<g:sortableColumn property="modalInstallment" title="${message(code: 'plan.modalInstallment.label', default: 'Modal Installment')}" />
					
						<g:sortableColumn property="numberOfUnits" title="${message(code: 'plan.numberOfUnits.label', default: 'Number Of Units')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${planInstanceList}" status="i" var="planInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${planInstance.id}">${fieldValue(bean: planInstance, field: "product")}</g:link></td>
					
						<td>${fieldValue(bean: planInstance, field: "payingPeriod")}</td>
					
						<td>${fieldValue(bean: planInstance, field: "maturityPeriod")}</td>
					
						<td>${fieldValue(bean: planInstance, field: "pnpPrice")}</td>
					
						<td>${fieldValue(bean: planInstance, field: "modalInstallment")}</td>
					
						<td>${fieldValue(bean: planInstance, field: "numberOfUnits")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${planInstanceTotal}" />
			</div>
		</div>
	</body>
</html>