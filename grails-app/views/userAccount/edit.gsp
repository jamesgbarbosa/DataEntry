<%@ page import="com.dataentry.UserAccount" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userAccount.label', default: 'UserAccount')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-userAccount" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <li><g:link class="list" action="list">Search User</g:link></li>
                    <li><g:link class="create" action="create">Create User</g:link></li>
                </sec:ifAnyGranted>
			</ul>
		</div>
		<div id="edit-userAccount" class="content scaffold-edit" role="main">
			<h1>Update User</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userAccountInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userAccountInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${command.userId}" />
				<g:hiddenField name="version" value="${userAccountInstance?.version}" />
				<fieldset class="form">
                    <div class="fieldcontain ${hasErrors(bean: command, field: 'username', 'error')} required">
                        <label for="username">
                            <g:message code="userAccount.username.label" default="Username" />
                        </label>
                        <g:textField name="username" value="${command.username}" disabled="true"/>

                        <g:hasErrors bean="${command}"
                                     field="username">
                            <g:eachError bean="${command}" field="username">
                                <span class="inlineErrors">
                                    <g:message  error="${it}" />
                                </span>
                            </g:eachError>
                        </g:hasErrors>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: command, field: 'name', 'error')} required">
                        <label for="name">
                            <g:message code="userAccount.name.label" default="Name" />
                        </label>
                        <g:textField name="name" value="${command.name}"/>

                        <g:hasErrors bean="${command}"
                                     field="name">
                            <g:eachError bean="${command}" field="name">
                                <span class="inlineErrors">
                                    <g:message  error="${it}" />
                                </span>
                            </g:eachError>
                        </g:hasErrors>
                    </div>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                     <sec:ifAnyGranted roles="ROLE_ADMIN">
					    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </sec:ifAnyGranted>
				</fieldset>
			</g:form>
            <h1>Change Password</h1>
            <g:form method="post" >
                <g:hiddenField name="id" value="${pcommand.userId}" />
                <fieldset class="form">
                    %{--<div class="fieldcontain ${hasErrors(bean: command, field: 'username', 'error')} required">--}%
                    %{--<label for="username">--}%
                    %{--<g:message code="userAccount.username.label" default="Username" />--}%
                    %{--</label>--}%
                    %{--<g:textField name="username" value="${command.username}" disabled="true"/>--}%

                    %{--<g:hasErrors bean="${command}"--}%
                    %{--field="username">--}%
                    %{--<g:eachError bean="${command}" field="username">--}%
                    %{--<span class="inlineErrors">--}%
                    %{--<g:message  error="${it}" />--}%
                    %{--</span>--}%
                    %{--</g:eachError>--}%
                    %{--</g:hasErrors>--}%
                    %{--</div>--}%

                    <div class="fieldcontain">
                    <label for="password">
                        <sup><span class="required-indicator">*</span></sup>
                        Old Password
                        </label>
                        <g:passwordField name="oldPassword" />
                        <g:hasErrors bean="${pcommand}"
                                     field="oldPassword">
                            <g:eachError bean="${pcommand}" field="oldPassword">
                                <span class="inlineErrors">
                                    <g:message  error="${it}" />
                                </span>
                            </g:eachError>
                        </g:hasErrors>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: pcommand, field: 'password', 'error')} required">
                        <label for="password">
                            <sup><span class="required-indicator">*</span></sup>
                            New Password
                        </label>
                        <g:passwordField name="password" />
                        <g:hasErrors bean="${pcommand}"
                                     field="password">
                            <g:eachError bean="${pcommand}" field="password">
                                <span class="inlineErrors">
                                    <g:message  error="${it}" />
                                </span>
                            </g:eachError>
                        </g:hasErrors>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: pcommand, field: 'password2', 'error')} required">
                        <label for="password">
                            <sup><span class="required-indicator">*</span></sup>
                            Re-type New Password
                        </label>
                        <g:passwordField name="password2" />
                        <g:hasErrors bean="${pcommand}"
                                     field="password2">
                            <g:eachError bean="${pcommand}" field="password2">
                                <span class="inlineErrors">
                                    <g:message  error="${it}" />
                                </span>
                            </g:eachError>
                        </g:hasErrors>
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <g:hiddenField name="changePass" value="true"/>
                    <g:hiddenField name="userId" value="${pcommand.userId}"/>
                    <g:actionSubmit class="save" action="changePassword" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
		</div>
	</body>
</html>
