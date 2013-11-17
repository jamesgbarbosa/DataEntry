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
    <a href="#create-beneficiary" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        </ul>
    </div>
    <div id="create-beneficiary" class="content scaffold-create" role="main">
        <h1><g:message code="default.create.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="errors" role="status">${flash.error}</div>
        </g:if>

        %{--<g:form action="saveBeneficiary">--}%
        <g:form action="create" >
            <div class="fieldcontain">
                <label for="beneficiary">
                    Beneficiary
                    %{--<g:each in="${planInstance.beneficiaries}" var="a">--}%
                    %{--<span class="property-value" aria-labelledby="amendments-label">--}%
                    %{--<g:link controller="amendment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>--}%
                    %{--</g:each>--}%

                </label>
                <g:textField id="beneficiary-autocomplete" name="beneficiary-autocomplete" value="${beneficiaryInstance.firstName!=null ? beneficiaryInstance?.fullName() : ""}" placeholder="Search a client..."/>
                <g:hiddenField name="beneficiary.id" value="${beneficiaryInstance?.id}"/>
                <g:submitButton formaction="create" name="createBeneficiary" event="createBeneficiary" value="Create a beneficiary"/>

                <div class="fieldcontain">
                    <label for="designation">
                        <g:message code="beneficiary.designation.label" default="Designation" />
                    </label>
                     <g:textField id="designation" name="designation"/>
                </div>

                <div class="fieldcontain">
                    <label for="relationship">
                    <g:message code="beneficiary.relationship.label" default="Relationship" />
                    </label>
                    <g:textField id="relationship" name="relationship"/>
                </div>
                <br>
                <hr>

            </div>
            <fieldset class="buttons">
                <input type="button" value="Add" id="addBeneficiaryButton"/>
                <g:submitButton name="return" event="return" value="Back" />
            </fieldset>
            %{--<g:submitToRemote class="normal" url="[action: 'saveBeneficiary']" update="updateMe" value="Test"/>--}%
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
                        <g:each in="${planInstance?.beneficiaries}" status="i" var="beneficiary">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td>${i+1} <input type='hidden' class='benId' name='benId' value='${beneficiary?.id}' /> </td>

                                <td>${beneficiary?.fullName()}</td>

                                <td></td>

                                <td></td>

                                <td><input class='deleteBeneficiaryCB' type='checkbox' name='deleteBeneficiary${i+1}'/></td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
            <fieldset class="buttons">
                <input type="button" value="Delete" id="deleteBeneficiaryButton"/>
                <g:submitButton formaction="create" name="savePlan" event="savePlan" value="Create"/>
            </fieldset>
        </g:form>

        %{--</g:form>--}%
        <g:hiddenField name="clientsListLink" value="${createLink(controller: 'plan', action: 'clientsList')}"/>
    </div>

</body>
</html>
