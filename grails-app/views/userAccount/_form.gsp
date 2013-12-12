<%@ page import="com.dataentry.UserAccount" %>



<div class="fieldcontain ${hasErrors(bean: command, field: 'username', 'error')} required">
	<label for="username">
        <sup><span class="required-indicator">*</span></sup>
        <g:message code="userAccount.username.label" default="Username" />
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

<div class="fieldcontain ${hasErrors(bean: command, field: 'password', 'error')} required">
	<label for="password">
        <sup><span class="required-indicator">*</span></sup>
        <g:message code="userAccount.password.label" default="Password" />
	</label>
	<g:passwordField name="password" value="${command?.password}" />
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
        <sup><span class="required-indicator">*</span></sup>
        <g:message code="userAccount.password.label" default="Password" />
    </label>
    <g:passwordField name="password2" value="${command?.password2}" />
    <g:hasErrors bean="${command}"
                 field="password2">
        <g:eachError bean="${command}" field="password2">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

