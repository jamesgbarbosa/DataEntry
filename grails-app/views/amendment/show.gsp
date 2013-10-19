
<%@ page import="com.dataentry.Amendment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'amendment.label', default: 'Amendment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-amendment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-amendment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list amendment">
			
				<g:if test="${amendmentInstance?.amendmentType}">
				<li class="fieldcontain">
					<span id="amendmentType-label" class="property-label"><g:message code="amendment.amendmentType.label" default="Amendment Type" /></span>
					
						<span class="property-value" aria-labelledby="amendmentType-label"><g:fieldValue bean="${amendmentInstance}" field="amendmentType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${amendmentInstance?.approvedBy}">
				<li class="fieldcontain">
					<span id="approvedBy-label" class="property-label"><g:message code="amendment.approvedBy.label" default="Approved By" /></span>
					
						<span class="property-value" aria-labelledby="approvedBy-label"><g:fieldValue bean="${amendmentInstance}" field="approvedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${amendmentInstance?.effectiveDate}">
				<li class="fieldcontain">
					<span id="effectiveDate-label" class="property-label"><g:message code="amendment.effectiveDate.label" default="Effective Date" /></span>
					
						<span class="property-value" aria-labelledby="effectiveDate-label"><g:formatDate date="${amendmentInstance?.effectiveDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${amendmentInstance?.filingDate}">
				<li class="fieldcontain">
					<span id="filingDate-label" class="property-label"><g:message code="amendment.filingDate.label" default="Filing Date" /></span>
					
						<span class="property-value" aria-labelledby="filingDate-label"><g:formatDate date="${amendmentInstance?.filingDate}" /></span>
					
				</li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${amendmentInstance?.id}" />
					<g:link class="edit" action="edit" id="${amendmentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
