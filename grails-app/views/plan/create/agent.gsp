<%@ page import="com.dataentry.Beneficiary" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'beneficiary.label', default: 'Beneficiary')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <g:javascript library="jquery"/>
</head>
<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>
<div id="create-beneficiary" class="content scaffold-create" role="main">
    <h1>Add Beneficiaries</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${flash.error}">
        <div class="errors" role="status">${flash.error}</div>
    </g:if>
    <g:form action="create" >
        <div class="fieldcontain">
            <label for="agent">
                Agent
            </label>
                %{--<g:select id="agent" name="agent.id" from="${com.dataentry.Agent.list()}" optionKey="id" value="${planInstance?.agent?.id}" class="many-to-one" noSelection="['null': '']"/>--}%
                <g:textField class='autocomplete-field' name="agent-autocomplete" value="${planInstance?.agent?.firstName!=null ? planInstance?.agent?.fullName() : ''}" placeholder="Search a client..."/>
                <g:hiddenField name="agent.id" value="${planInstance?.agent?.id}"/>
                %{--<g:link controller="agent" action="create" params="['plan.id': planInstance?.id]">Create an agent</g:link>--}%
                <g:submitButton formaction="create" name="createAgent" event="createAgent" value="Create"/>


            %{--<div class="fieldcontain">--}%
                %{--<label for="designation">--}%
                    %{--<g:message code="beneficiary.designation.label" default="Designation" />--}%
                %{--</label>--}%
                %{--<g:textField id="designation" name="designation"/>--}%
            %{--</div>--}%

            %{--<div class="fieldcontain">--}%
                %{--<label for="relationship">--}%
                    %{--<g:message code="beneficiary.relationship.label" default="Relationship" />--}%
                %{--</label>--}%
                %{--<g:textField id="relationship" name="relationship"/>--}%
            %{--</div>--}%
            <br>
            <hr>

        </div>
        <fieldset class="buttons">
            <g:submitButton name="return" event="return" value="Back" />
            <g:submitButton formaction="create" name="savePlan" event="savePlan" value="Next"/>
        </fieldset>
    </g:form>
    <g:hiddenField name="clientsListLink" value="${createLink(controller: 'plan', action: 'clientsList')}"/>
</div>
</body>
</html>
