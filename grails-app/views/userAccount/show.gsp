
<%@ page import="com.dataentry.UserAccount" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userAccount.label', default: 'UserAccount')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userAccount" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <li><g:link class="list" action="list">Search Users</g:link></li>
                    <li><g:link class="create" action="create">Create User</g:link></li>
            </sec:ifAnyGranted>
			</ul>
		</div>
		<div id="show-userAccount" class="content scaffold-show" role="main">
			<h1>Show User</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userAccount">
			
				<g:if test="${userAccountInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="userAccount.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userAccountInstance}" field="username"/></span>
					
				</li>
				</g:if>

                <g:if test="${userAccountInstance?.name}">
                    <li class="fieldcontain">
                        <span id="name-label" class="property-label"><g:message code="userAccount.name.label" default="Name" /></span>

                        <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${userAccountInstance}" field="name"/></span>

                    </li>
                </g:if>

			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userAccountInstance?.id}" />
					<g:link class="edit" action="edit" id="${userAccountInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <sec:ifAnyGranted roles="ROLE_ADMIN">
					    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </sec:ifAnyGranted>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
