<%@ page import="com.dataentry.Beneficiary" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'agent.label', default: 'Agent')}" />
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
    <div id="breadcrumbs">
        <h4>
            <g:if test="${page1link!=''}"><a href="${page1link}&red=true"> Create Plan </a> > </g:if>
            <g:if test="${page2link!=''}"><a href="${page2link}&red=true"> Create Beneficiaries</a> > </g:if>
            Create Agent
            %{--<g:if test="${page4link!=''}"> > <a href="${page4link}&red=true"> Create Amendments </a> </g:if>--}%
        </h4>
    </div>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${flash.error}">
        <div class="errors" role="status">${flash.error}</div>
    </g:if>
    <g:form action="create" >
        <div class="fieldcontain">
            <g:if test="${!duplicateClientError.equals('')}">
                <ul class="errors" role="alert">
                    <li>${duplicateClientError} </li>
                </ul>
            </g:if>
                <div class="fieldcontain ${duplicateClientError!='' ? 'error' : ''} ${hasErrors(bean: agentInstance, field: 'clientProfile', 'error')} required">
                    <label for="agent">
                        <sup><span class="required-indicator">*</span></sup>
                        Agent
                    </label>
                    <g:textField class='autocomplete-field' name="agent-autocomplete" value="${agentInstance?.clientProfile?.firstName!=null ? agentInstance?.clientProfile?.fullNameBirthdateAndGender() : ''}" placeholder="Search a client..."/>
                    <g:hiddenField name="agent.id" value="${agentInstance?.clientProfile?.id}"/>
                    <g:hiddenField name="planholderId" value="${planholderInstance?.clientProfile?.id}"/>
                    <util:beneficiaryIdsHiddenField beneficiaries="${beneficiaries}"/>

                    <g:if test="${!readOnly}">
                        <span class="buttons">
                            <g:submitButton formaction="create" name="createAgent" event="createAgent" value="Create Agent"/>
                        </span>
                    </g:if>

                    <g:hasErrors bean="${agentInstance}"
                                 field="clientProfile">
                        <g:eachError bean="${agentInstance}" field="clientProfile">
                            <span class="inlineErrors">
                                <g:message  error="${it}" />
                            </span>
                        </g:eachError>
                    </g:hasErrors>
                </div>

                <div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'agency', 'error')} required">
                    <label for="agency">
                        <g:message code="agent.agency.label" default="Agency" />

                    </label>
                    <g:textField name="agency" value="${agentInstance?.agency}"/>
                    <g:hasErrors bean="${agentInstance}"
                                 field="agency">
                        <g:eachError bean="${agentInstance}" field="agency">
                            <span class="inlineErrors">
                                <g:message  error="${it}" />
                            </span>
                        </g:eachError>
                    </g:hasErrors>
                </div>
            <div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'groupName', 'error')} required">
                <label for="groupName">
                    <sup><span class="required-indicator">*</span></sup>
                    <g:message code="agent.groupName.label" default="Group Name" />

                </label>
                <g:textField name="groupName" value="${agentInstance?.groupName}"/>
                <g:hasErrors bean="${agentInstance}"
                             field="groupName">
                    <g:eachError bean="${agentInstance}" field="groupName">
                        <span class="inlineErrors">
                            <g:message  error="${it}" />
                        </span>
                    </g:eachError>
                </g:hasErrors>
            </div>

            <div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'unit', 'error')} required">
                <label for="unit">
                    <sup><span class="required-indicator">*</span></sup>
                    <g:message code="agent.unit.label" default="Unit" />

                </label>
                <g:textField name="unit" value="${agentInstance?.unit}"/>
                <g:hasErrors bean="${agentInstance}"
                             field="unit">
                    <g:eachError bean="${agentInstance}" field="unit">
                        <span class="inlineErrors">
                            <g:message  error="${it}" />
                        </span>
                    </g:eachError>
                </g:hasErrors>
            </div>

            <div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'position', 'error')}">
                <label for="position">
                    <g:message code="agent.position.label" default="Position" />

                </label>
                <g:textField name="position" value="${agentInstance?.position}"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'appointmentDate', 'error')} ">
                <label for="appointmentDate">
                    <g:message code="agent.appointmentDate.label" default="Appointment Date" />

                </label>
                <g:textField id="appointmentDate" name="appointmentDate" value="${formatDate(format:'MM/dd/yyyy',date:agentInstance?.appointmentDate)}" />
                <g:hasErrors bean="${agentInstance}"
                             field="appointmentDate">
                    <g:eachError bean="${agentInstance}" field="appointmentDate">
                        <span class="inlineErrors">
                            <g:message  error="${it}" />
                        </span>
                    </g:eachError>
                </g:hasErrors>
            </div>

            <div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'counselorCode', 'error')} ">
                <label for="appointmentDate">
                    <sup><span class="required-indicator">*</span></sup>
                    <g:message code="agent.counselorCode.label" default="Counselor Code" />
                </label>
                <g:textField id="counselorCode" name="counselorCode" value="${agentInstance?.counselorCode}" />
                <g:hasErrors bean="${agentInstance}"
                             field="counselorCode">
                    <g:eachError bean="${agentInstance}" field="counselorCode">
                        <span class="inlineErrors">
                            <g:message  error="${it}" />
                        </span>
                    </g:eachError>
                </g:hasErrors>
            </div>
            <br>
            <hr>
        <fieldset class="buttons">
            <g:submitButton name="return" event="return" value="Back" />
            <g:submitButton formaction="create" name="next" event="next" value="Next"/>
        </fieldset>
    </g:form>
    <g:hiddenField name="clientsListLink" value="${createLink(controller: 'plan', action: 'clientsList')}"/>
    <g:hiddenField name="red" value="${params.red ? params.red : request.red}"/>
</div>
</body>
</html>
