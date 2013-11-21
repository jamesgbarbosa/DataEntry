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
    <h1>Add Agent</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${flash.error}">
        <div class="errors" role="status">${flash.error}</div>
    </g:if>
    <g:form action="create" >
        <div class="fieldcontain">


                    <g:eachError bean="${agentInstance}" var="error">
                       <ul class="errors" role="alert">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                       </ul>
                    </g:eachError>

                <label for="agent">
                    Agent
                </label>

                %{--<g:select id="agent" name="agent.id" from="${com.dataentry.Agent.list()}" optionKey="id" value="${agentInstance?.id}" class="many-to-one" noSelection="['null': '']"/>--}%
                <g:textField class='autocomplete-field' name="agent-autocomplete" value="${agentInstance?.clientProfile?.firstName!=null ? agentInstance?.clientProfile?.fullName() : ''}" placeholder="Search a client..."/>
                <g:hiddenField name="agent.id" value="${agentInstance?.clientProfile?.id}"/>
                %{--<g:link controller="agent" action="create" params="['plan.id': planInstance?.id]">Create an agent</g:link>--}%
                <g:submitButton formaction="create" name="createAgent" event="createAgent" value="Create"/>

                <div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'agentCode', 'error')} ">
                    <label for="agentCode">
                        <g:message code="agent.agentCode.label" default="Agent Code" />

                    </label>
                    <g:textField name="agentCode" value="${agentInstance?.agentCode}"/>
                </div>

                <div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'position', 'error')} ">
                    <label for="position">
                        <g:message code="agent.position.label" default="Position" />

                    </label>
                    <g:textField name="position" value="${agentInstance?.position}"/>
                </div>

                <div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'appointmentDate', 'error')} ">
                    <label for="appointmentDate">
                        <g:message code="agent.appointmentDate.label" default="Appointment Date" />

                    </label>
                    <g:datePicker name="appointmentDate" precision="day"  value="${agentInstance?.appointmentDate}" default="none" noSelection="['': '']" />
                </div>

                <div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'agency', 'error')} ">
                    <label for="agency">
                        <g:message code="agent.agency.label" default="Agency" />

                    </label>
                    <g:textField name="agency" value="${agentInstance?.agency}"/>
                </div>

                <div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'groupName', 'error')} ">
                    <label for="groupName">
                        <g:message code="agent.groupName.label" default="Group Name" />

                    </label>
                    <g:textField name="groupName" value="${agentInstance?.groupName}"/>
                </div>

                <div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'unit', 'error')} ">
                    <label for="unit">
                        <g:message code="agent.unit.label" default="Unit" />

                    </label>
                    <g:textField name="unit" value="${agentInstance?.unit}"/>
                </div>

            <br>
            <hr>

        </div>
        <fieldset class="buttons">
            <g:submitButton name="return" event="return" value="Back" />
            <g:submitButton formaction="create" name="next" event="next" value="Next"/>
        </fieldset>
    </g:form>
    <g:hiddenField name="clientsListLink" value="${createLink(controller: 'plan', action: 'clientsList')}"/>
</div>
</body>
</html>
