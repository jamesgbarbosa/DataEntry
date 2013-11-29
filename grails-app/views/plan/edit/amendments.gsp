<%@ page import="com.dataentry.Beneficiary" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'amendment.label', default: 'Amendment')}" />
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
                <g:if test="${page2link!=''}"> <a href="${page2link}&red=true"> Create Beneficiaries </a> > </g:if>
                <g:if test="${page3link!=''}"> <a href="${page3link}&red=true"> Create Agent </a> > </g:if>
                Create Amendments
            </h4>
        </div>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:if test="${flash.error}">
                <div class="errors" role="status">${flash.error}</div>
            </g:if>
            %{--<g:hasErrors bean="${amendmentInstance}">--}%
                %{--<ul class="errors" role="alert">--}%
                    %{--<g:eachError bean="${amendmentInstance}" var="error">--}%
                        %{--<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>--}%
                    %{--</g:eachError>--}%
                %{--</ul>--}%
            %{--</g:hasErrors>--}%
            <g:form name="amendmentForm" action="edit">
                <div class="fieldcontain">

                    <div id="amendmentField" class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'amendmentType', 'error')} required">
                        <label for="amendmentType">
                            <g:message code="amendment.amendmentType.label" default="Amendment Type" />

                        </label>
                        <select:amendmentTypes  name="amendmentType" value="${amendmentInstance?.amendmentType}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'filingDate', 'error')} required">
                        <label for="filingDate">
                            <sup><span class="required-indicator">*</span></sup>
                            <g:message code="amendment.filingDate.label" default="Filing Date" />
                        </label>
                        <g:textField id="filingDate" name="filingDate" value="${formatDate(format:'MM/dd/yyyy',date:amendmentInstance?.filingDate)}"/>
                        <g:hasErrors bean="${amendmentInstance}"
                                     field="filingDate">
                            <g:eachError bean="${amendmentInstance}" field="filingDate">
                                <span class="inlineErrors">
                                    <g:message  error="${it}" />
                                </span>
                            </g:eachError>
                        </g:hasErrors>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'effectiveDate', 'error')} required">
                        <label for="effectiveDate">
                            <sup><span class="required-indicator">*</span></sup>
                            <g:message code="amendment.effectiveDate.label" default="Effective Date" />
                        </label>
                        <g:textField id="effectiveDate" name="effectiveDate" value="${formatDate(format:'MM/dd/yyyy',date:amendmentInstance?.effectiveDate)}" />
                        <g:hasErrors bean="${amendmentInstance}"
                                     field="effectiveDate">
                            <g:eachError bean="${amendmentInstance}" field="effectiveDate">
                                <span class="inlineErrors">
                                    <g:message  error="${it}" />
                                </span>
                            </g:eachError>
                        </g:hasErrors>
                    </div>

                    <div id="approvedByField"class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'approvedBy', 'error')} ">
                        <label for="approvedBy">
                            <g:message code="amendment.approvedBy.label" default="Approved By" />

                        </label>
                        <g:textField name="approvedBy" value="${amendmentInstance?.approvedBy}"/>
                    </div>

                </div>
                    <br>
                    <hr>

                </div>
                <fieldset class="buttons">
                    <g:submitButton name="return" event="return" value="Back" />
                     <g:if test="${!readOnly}">
                        <input type="button" name="open-save-plan-dialog" id="open-save-plan-dialog" value="Save Plan"/>
                     </g:if>
                    <g:else>
                        <g:submitButton name="next" event="next" value="Next" />
                    </g:else>
                </fieldset>
                <div id="updateMe">
                    <table id="amendments">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Amendment Type</th>
                                <th>Filing Date</th>
                                <th>Effective Date</th>
                                <th>Approved by</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            </tr>
                            <g:each in="${amendments}" status="i" var="amendment">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td>${i+1} <input type='hidden' class='amendmentId' name='tempId' value='${i+1}' /> </td>

                                    <td>${amendment?.amendmentType}</td>

                                    <td>${formatDate(format:'MM/dd/yyyy',date:amendment?.filingDate)}</td>

                                    <td>${formatDate(format:'MM/dd/yyyy',date:amendment?.effectiveDate)}</td>

                                    <td>${amendment?.approvedBy}</td>

                                    <td><input class='deleteAmendmentCB' type='checkbox' name='deleteAmendment_${amendment.tempId}'/></td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>
                <fieldset class="buttons">
                    <g:if test="${!readOnly}">
                        <g:submitButton id="addAmendmentButton" formaction="edit" name="add" event="add" value="Add"/>
                        <g:submitButton id="delete-amendment" formaction="edit" name="delete" event="delete" value="Delete"/>
                        <input type="button" name="open-delete-amendment-dialog" id="open-delete-amendment-dialog" value="Delete"/>
                    </g:if>
                </fieldset>
            </g:form>
            <g:hiddenField name="clientsListLink" value="${createLink(controller: 'plan', action: 'clientsList')}"/>
        </div>
        <div id="dialog-confirm" title="Save Plan">
            <p>
                <span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 10px 0;"></span>
                Are you sure you want to proceed?
            </p>
            <br>
            <div class="buttons">
                <g:form name="amendmentForm" action="edit">
                    <g:submitButton id="savePlan" formaction="edit" name="savePlan" event="savePlan" value="Okay"/>
                    <input type="button" id="confirm-cancel-form" value="Cancel" />
                </g:form>
            </div>
        </div>
        <div id="delete-amendment-dialog-confirm" title="Delete Amendment">
            <p>
                <span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 10px 0;"></span>
                Are you sure you want to proceed?
            </p>
            <br>
            <div class="buttons">
                <g:form action="edit">
                    <input type="button" name="confirm-delete-amendment" id="confirm-delete-amendment" value="Delete"/>
                    <input type="button" id="confirm-cancel-delete-amendment-form" value="Cancel" />
                </g:form>
            </div>
        </div>
        <g:hiddenField name="red" value="${params.red ? params.red : request.red}"/>
    </body>
</html>
