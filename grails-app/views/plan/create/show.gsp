<%@ page import="com.dataentry.Plan" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'plan.label', default: 'Plan')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-plan" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" controller="plan" action="list">Search Plans</g:link></li>
        <li><a class="create" href="${createLink(uri: '/plan/create')}"><g:message code="default.new.label"
                                                                                   args="[entityName]"/></a></li>
    </ul>
</div>

<div id="show-plan" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${request.myMessage}">
        <div class="message" role="status">${request.myMessage}</div>
    </g:if>
    <g:if test="${params.message}">
        <div class="message" role="status">${params.message}</div>
    </g:if>
    <ol class="property-list plan">

        <g:if test="${planInstance?.planNumber}">
            <li class="fieldcontain">
                <span id="planNumber-label" class="property-label"><g:message code="plan.planNumber.label"
                                                                              default="Plan Number"/></span>

                <span class="property-value" aria-labelledby="product-label"><g:fieldValue bean="${planInstance}"
                                                                                           field="planNumber"/></span>

            </li>
        </g:if>
        <g:if test="${planInstance?.product}">
            <li class="fieldcontain">
                <span id="product-label" class="property-label"><g:message code="plan.product.label"
                                                                           default="Product Code"/></span>

                <span class="property-value" aria-labelledby="product-label"><g:fieldValue bean="${planInstance}"
                                                                                           field="product"/></span>

            </li>
        </g:if>

        <g:if test="${planInstance?.payingPeriod}">
            <li class="fieldcontain">
                <span id="payingPeriod-label" class="property-label"><g:message code="plan.payingPeriod.label"
                                                                                default="Paying Period"/></span>

                <span class="property-value" aria-labelledby="payingPeriod-label"><g:fieldValue bean="${planInstance}"
                                                                                                field="payingPeriod"/></span>

            </li>
        </g:if>

        <g:if test="${planInstance?.maturityPeriod}">
            <li class="fieldcontain">
                <span id="maturityPeriod-label" class="property-label"><g:message code="plan.maturityPeriod.label"
                                                                                  default="Maturity Period"/></span>

                <span class="property-value" aria-labelledby="maturityPeriod-label"><g:fieldValue bean="${planInstance}"
                                                                                                  field="maturityPeriod"/></span>

            </li>
        </g:if>

        <g:if test="${planInstance?.pnpPrice}">
            <li class="fieldcontain">
                <span id="pnpPrice-label" class="property-label"><g:message code="plan.pnpPrice.label"
                                                                            default="PNP Price"/></span>

                <span class="property-value" aria-labelledby="pnpPrice-label"><g:fieldValue bean="${planInstance}"
                                                                                            field="pnpPrice"/></span>

            </li>
        </g:if>

        <g:if test="${planInstance?.modalInstallment}">
            <li class="fieldcontain">
                <span id="modalInstallment-label" class="property-label"><g:message code="plan.modalInstallment.label"
                                                                                    default="Modal Installment"/></span>

                <span class="property-value" aria-labelledby="modalInstallment-label"><g:fieldValue
                        bean="${planInstance}" field="modalInstallment"/></span>

            </li>
        </g:if>

        <g:if test="${planInstance?.numberOfUnits}">
            <li class="fieldcontain">
                <span id="numberOfUnits-label" class="property-label"><g:message code="plan.numberOfUnits.label"
                                                                                 default="Number Of Units"/></span>

                <span class="property-value" aria-labelledby="numberOfUnits-label"><g:fieldValue bean="${planInstance}"
                                                                                                 field="numberOfUnits"/></span>

            </li>
        </g:if>

    %{--<g:if test="${planInstance?.origIssueDate}">--}%
    %{--<li class="fieldcontain">--}%
    %{--<span id="origIssueDate-label" class="property-label"><g:message code="plan.origIssueDate.label" default="Orig Issue Date" /></span>--}%
    %{----}%
    %{--<span class="property-value" aria-labelledby="origIssueDate-label"><g:formatDate date="${planInstance?.origIssueDate}" format="MM/dd/yyyy" /></span>--}%
    %{----}%
    %{--</li>--}%
    %{--</g:if>--}%

        <g:if test="${planInstance?.currentIssueDate}">
            <li class="fieldcontain">
                <span id="currentIssueDate-label" class="property-label"><g:message code="plan.currentIssueDate.label"
                                                                                    default="Current Issue Date"/></span>

                <span class="property-value" aria-labelledby="currentIssueDate-label"><g:formatDate
                        date="${planInstance?.currentIssueDate}" format="MM/dd/yyyy"/></span>

            </li>
        </g:if>

        <g:if test="${planInstance?.paymentMode}">
            <li class="fieldcontain">
                <span id="paymentMode-label" class="property-label"><g:message code="plan.paymentMode.label"
                                                                               default="Payment Mode"/></span>

                <span class="property-value" aria-labelledby="paymentMode-label"><g:fieldValue bean="${planInstance}"
                                                                                               field="paymentMode"/></span>

            </li>
        </g:if>

        <g:if test="${planInstance?.planStatus}">
            <li class="fieldcontain">
                <span id="planStatus-label" class="property-label"><g:message code="plan.planStatus.label"
                                                                              default="Plan Status"/></span>

                <span class="property-value" aria-labelledby="planStatus-label"><g:fieldValue bean="${planInstance}"
                                                                                              field="planStatus"/></span>

            </li>
        </g:if>

        <g:if test="${planInstance?.applicableDate}">
            <li class="fieldcontain">
                <span id="applicableDate-label" class="property-label"><g:message code="plan.applicableDate.label"
                                                                                  default="Applicable Date"/></span>

                <span class="property-value" aria-labelledby="applicableDate-label"><g:formatDate
                        date="${planInstance?.applicableDate}" format="MM/dd/yyyy"/></span>

            </li>
        </g:if>

        <g:if test="${planInstance?.withInsurance}">
            <li class="fieldcontain">
                <span id="withInsurance-label" class="property-label"><g:message code="plan.withInsurance.label"
                                                                                 default="With Insurance"/></span>

                <span class="property-value" aria-labelledby="withInsurance-label"><g:formatBoolean
                        boolean="${planInstance?.withInsurance}"/></span>

            </li>
        </g:if>

        <g:if test="${planInstance?.planHolder}">
            <li class="fieldcontain">
                <span id="planHolder-label" class="property-label"><g:message code="plan.planHolder.label"
                                                                              default="Plan Holder"/></span>

                <span class="property-value" aria-labelledby="planHolder-label"><g:link controller="client"
                                                                                        action="show"
                                                                                        id="${planInstance?.planHolder?.clientProfile?.id}">${planInstance?.planHolder?.clientProfile?.getFullName()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${planInstance?.agent}">
            <li class="fieldcontain">
                <span id="agent-label" class="property-label"><g:message code="plan.agent.label"
                                                                         default="Agent"/></span>

                <span class="property-value" aria-labelledby="agent-label"><g:link controller="client" action="show"
                                                                                   id="${planInstance?.agent?.clientProfile?.id}">${planInstance?.agent?.clientProfile?.getFullName()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${planInstance?.beneficiaries}">
            <li class="fieldcontain">
                <span id="agent-label" class="property-label"><g:message code="plan.beneficiary.label"
                                                                         default="Beneficiaries"/></span>

                <g:each in="${planInstance.beneficiaries}" var="a">
                    <span class="property-value" aria-labelledby="beneficiaries-label"><g:link controller="client"
                                                                                               action="show"
                                                                                               id="${a?.clientProfile.id}">${a?.clientProfile?.fullName()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${planInstance?.amendments}">
            <li class="fieldcontain">
                <span id="amendments-label" class="property-label"><g:message code="plan.amendments.label"
                                                                              default="Amendments"/></span>

                <g:each in="${planInstance.amendments}" var="a">
                    <span class="property-value" aria-labelledby="amendments-label"><g:link controller="amendment"
                                                                                            action="show"
                                                                                            id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>
    <g:form action="create">
        <fieldset class="buttons">
            %{--<g:submitButton name="return" event="return" value="Back"/>--}%
            %{--<g:submitButton name="finish" event="finish" value="Finish"/>--}%
            <g:hiddenField name="id" value="${planInstance?.id}"/>
            <a class="create" href="${createLink(uri: '/plan/edit/')}${planInstance?.id}">Edit</a>

            <g:actionSubmit id="delete-plan" class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"/>
            <input id="open-delete-plan-dialog" value="Delete" class="delete" type="button"/>
        </fieldset>
    </g:form>
</div>
<div id="delete-plan-dialog-confirm" title="Delete Plan">
    <p>
        <span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 10px 0;"></span>
        Are you sure you want to proceed?
    </p>
    <br>
    <div class="buttons">
        <g:form action="edit">
            <input type="button" name="confirm-delete-plan" id="confirm-delete-plan" value="Delete"/>
            <input type="button" id="confirm-cancel-delete-plan-form" value="Cancel" />
        </g:form>
    </div>
</div>
</body>
</html>
