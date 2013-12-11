<%@ page import="com.dataentry.UserAccount" %>



<div class="fieldcontain ${hasErrors(bean: userAccountInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="userAccount.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" value="${userAccountInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userAccountInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="userAccount.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" value="${userAccountInstance?.password}" />
</div>

