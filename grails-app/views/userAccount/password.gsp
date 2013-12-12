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
				<li><g:link class="list" action="list">Search User</g:link></li>
				<li><g:link class="create" action="create">Create User</g:link></li>
			</ul>
		</div>
		<div id="edit-userAccount" class="content scaffold-edit" role="main">
			<h1>Change Password</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form method="post" >
				<g:hiddenField name="id" value="${command.userId}" />
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
                            Old Password
                        </label>
                        <g:passwordField name="oldPassword" />
                        <g:hasErrors bean="${command}"
                                     field="oldPassword">
                            <g:eachError bean="${command}" field="oldPassword">
                                <span class="inlineErrors">
                                    <g:message  error="${it}" />
                                </span>
                            </g:eachError>
                        </g:hasErrors>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: command, field: 'password', 'error')} required">
                        <label for="password">
                            <g:message code="userAccount.password.label" default="Password" />
                            <span class="required-indicator">*</span>
                        </label>
                        <g:passwordField name="password" />
                        <g:hasErrors bean="${command}"
                                     field="password">
                            <g:eachError bean="${command}" field="password">
                                <span class="inlineErrors">
                                    <g:message  error="${it}" />
                                </span>
                            </g:eachError>
                        </g:hasErrors>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: command, field: 'password2', 'error')} required">
                        <label for="password">
                            <g:message code="userAccount.password.label" default="Password" />
                            <span class="required-indicator">*</span>
                        </label>
                        <g:passwordField name="password2" />
                        <g:hasErrors bean="${command}"
                                     field="password2">
                            <g:eachError bean="${command}" field="password2">
                                <span class="inlineErrors">
                                    <g:message  error="${it}" />
                                </span>
                            </g:eachError>
                        </g:hasErrors>
                    </div>
				</fieldset>
				<fieldset class="buttons">
                    <g:hiddenField name="changePass" value="true"/>
                    <g:hiddenField name="userId" value="${command.userId}"/>
					<g:actionSubmit class="save" action="changePassword" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>