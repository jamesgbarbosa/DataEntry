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
            <div id="breadcrumbs">
                <h4>
                <g:if test="${page1link!=''}"><a href="${page1link}&red=true"> Create Plan </a> > </g:if>
                Add Beneficiaries
                %{--<g:if test="${page3link!=''}"> >  <a href="${page3link}&red=true"> Create Agent </a> </g:if>--}%
                %{--<g:if test="${page4link!=''}"> >  <a href="${page4link}&red=true"> Create Amendments </a> </g:if>--}%
                </h4>
            </div>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:if test="${flash.error}">
                <div class="errors" role="status">${flash.error}</div>
            </g:if>
            <g:form action="edit" >
                %{--<g:eachError bean="${beneficiaryInstance}" var="error">--}%
                    %{--<ul class="errors" role="alert">--}%
                        %{--<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>--}%
                    %{--</ul>--}%
                %{--</g:eachError>--}%
                <g:if test="${duplicateClientError!=""}">
                    <ul class="errors" role="alert">
                        <li>${duplicateClientError} </li>
                    </ul>
                </g:if>
                <div class="fieldcontain ${duplicateClientError!='' ? 'error' : ''} ${hasErrors(bean: beneficiaryInstance, field: 'clientProfile', 'error')}">
                    <label for="beneficiary">
                        <sup><span class="required-indicator">*</span></sup>
                        Beneficiary
                    </label>
                    <g:textField class='autocomplete-field' id="beneficiary-autocomplete" name="beneficiary-autocomplete" value="${beneficiaryInstance?.clientProfile?.firstName!=null ? beneficiaryInstance?.clientProfile?.fullNameBirthdateAndGender() : ""}" placeholder="Search a client..."/>
                    <g:hiddenField id="beneficiary-autocomplete-id" name="beneficiary.id" value="${beneficiaryInstance?.clientProfile?.id}"/>
                    <g:hiddenField name="agentId" value="${agentInstance?.clientProfile?.id}"/>
                    <g:hiddenField name="planholderId" value="${planholderInstance?.clientProfile?.id}"/>
                    <util:beneficiaryIdsHiddenField beneficiaries="${beneficiaries}"/>

                    <g:if test="${!readOnly}">
                        <span class="buttons">
                            <g:submitButton formaction="edit" name="createBeneficiary" event="createBeneficiary" value="Create a beneficiary"/>
                        </span>
                    </g:if>

                    <g:hasErrors bean="${beneficiaryInstance}"
                                 field="clientProfile">
                        <g:eachError bean="${beneficiaryInstance}" field="clientProfile">
                            <span class="inlineErrors">
                                <g:message  error="${it}" />
                            </span>
                        </g:eachError>
                    </g:hasErrors>
                </div>

                <div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'designation', 'error')} required">
                        <label for="designation">
                            <sup><span class="required-indicator">*</span></sup>
                            <g:message code="beneficiary.designation.label" default="Designation" />
                        </label>
                        <select:designation value="${beneficiaryInstance?.designation}"/>
                        <g:hasErrors bean="${beneficiaryInstance}"
                                     field="designation">
                            <g:eachError bean="${beneficiaryInstance}" field="designation">
                                <span class="inlineErrors">
                                    <g:message  error="${it}" />
                                </span>
                            </g:eachError>
                        </g:hasErrors>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'relationship', 'error')} required">
                        <label for="relationship">
                            <sup><span class="required-indicator">*</span></sup>
                            <g:message code="beneficiary.relationship.label" default="Relationship"/>
                        </label>
                        <select:relationship value="${beneficiaryInstance?.relationship}"/>
                        <g:hasErrors bean="${beneficiaryInstance}"
                                     field="relationship">
                            <g:eachError bean="${beneficiaryInstance}" field="relationship">
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
                    <g:submitButton formaction="edit" name="next" event="next" value="Next"/>
                </fieldset>
                <div id="updateMe">
                    <table id="beneficiaries">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Beneficiary</th>
                                <th>Designation</th>
                                <th>Relationship</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            </tr>
                            <g:each in="${beneficiaries}" status="i" var="beneficiary">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td>${i+1} <input type='hidden' class='benId' name='benId' value='${beneficiary?.clientProfile?.id}' /> </td>

                                    <td>${beneficiary?.clientProfile?.fullName()}</td>

                                    <td>${beneficiary?.designation}</td>

                                    <td>${beneficiary?.relationship}</td>

                                    <td><input class='deleteBeneficiaryCB' type='checkbox' name='deleteBeneficiary_${beneficiary?.clientProfile?.id}'/></td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>
                <fieldset class="buttons">
                <g:if test="${!readOnly}">
                    <g:submitButton name="add" event="add" value="Add" />
                    <g:submitButton id="delete-beneficiary" name="delete"  formaction="edit" event="delete" value="Delete" />
                    <input type="button" name="open-delete-beneficiary-dialog" id="open-delete-beneficiary-dialog" value="Delete"/>
                </g:if>
                </fieldset>
            </g:form>
            <g:hiddenField name="clientsListLink" value="${createLink(controller: 'plan', action: 'clientsList')}"/>
        </div>
        <div id="delete-beneficiary-dialog-confirm" title="Delete Beneficiary">
            <p>
                <span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 10px 0;"></span>
                Are you sure you want to proceed?
            </p>
            <br>
            <div class="buttons">
                <g:form action="edit">
                    <input type="button" name="confirm-delete-beneficiary" id="confirm-delete-beneficiary" value="Delete"/>
                    <input type="button" id="confirm-cancel-delete-beneficiary-form" value="Cancel" />
                </g:form>
            </div>
        </div>
        <g:hiddenField name="red" value="${params.red ? params.red : request.red}"/>
    </body>
</html>
