<%@ page import="com.dataentry.UserAccount" %>



<div class="fieldcontain ${hasErrors(bean: command, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="userAccount.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" value="${command.username}"/>

    <g:hasErrors bean="${command}"
                 field="username">
        <g:eachError bean="${command}" field="username">
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
	<g:passwordField name="password" value="${command.password}" />
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
    <g:passwordField name="password2" value="${command.password2}" />
    <g:hasErrors bean="${command}"
                 field="password2">
        <g:eachError bean="${command}" field="password2">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

