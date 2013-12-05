<%@ page import="com.dataentry.Plan" %>


<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'planNumber', 'error')} required">
    <label for="planNumber">
        <sup><span class="required-indicator">*</span></sup>
        <g:message code="plan.planNumber.label" default="Plan Number" />
    </label>
    <g:textField name="planNumber" value="${planInstance?.planNumber}"/>
    <g:hasErrors bean="${planInstance}"
                 field="planNumber">
        <g:eachError bean="${planInstance}" field="planNumber">
            <span class="inlineErrors">
            <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${duplicateClientError!='' ? 'error' : ''} ${hasErrors(bean: planInstance, field: 'planHolder', 'error')} required" >
    <label for="planHolder">
        <sup><span class="required-indicator">*</span></sup>
        <g:message code="plan.planHolder.label" default="Plan Holder" />
    </label>
%{--<g:select id="planHolder" name="planHolder.id" from="${com.dataentry.Planholder.list()}" optionKey="id" value="${planInstance?.planHolder?.id}" class="many-to-one" noSelection="['null': '']"/>--}%
    <g:textField class='autocomplete-field' name="planholder-autocomplete" value="${planholderInstance?.clientProfile?.firstName? planholderInstance?.clientProfile?.fullNameBirthdateAndGender() : ""}" placeholder="Search a client..."/>
    <g:hiddenField name="planHolder.id" value="${planholderInstance?.clientProfile?.id}"/>

    <g:hiddenField name="agentId" value="${agentInstance?.clientProfile?.id}"/>
    <util:beneficiaryIdsHiddenField beneficiaries="${beneficiaries}"/>

    <g:if test="${!readOnly}">
        <span class="buttons">
            <g:submitButton formaction="create" name="createPlanHolder" event="createPlanHolder" value="Create Planholder"/>
        </span>
    </g:if>
    <g:hasErrors bean="${planInstance}"
                 field="planHolder">
        <g:eachError bean="${planInstance}" field="planHolder">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'product', 'error')} required">
	<label for="product">
        <sup><span class="required-indicator">*</span></sup>
        <g:message code="plan.product.label" default="Product Code" />
	</label>
	<select:product value="${planInstance?.product}"/>
    <g:hasErrors bean="${planInstance}"
                 field="product">
        <g:eachError bean="${planInstance}" field="product">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'currentIssueDate', 'error')} required">
    <label for="currentIssueDate">
        <sup><span class="required-indicator">*</span></sup>
        <g:message code="plan.currentIssueDate.label" default="Current Issue Date" />
    </label>
    <g:textField id="currentIssueDate" name="currentIssueDate" value="${formatDate(format:'MM/dd/yyyy',date:planInstance?.currentIssueDate)}" />
    <g:hasErrors bean="${planInstance}"
                 field="currentIssueDate">
        <g:eachError bean="${planInstance}" field="currentIssueDate">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>


<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'payingPeriod', 'error')} required">
	<label for="payingPeriod">
        <sup><span class="required-indicator">*</span></sup>
		<g:message code="plan.payingPeriod.label" default="Paying Period" />
	</label>
	<g:field name="payingPeriod" value="${planInstance.payingPeriod}"/>
    <g:hasErrors bean="${planInstance}"
                 field="payingPeriod">
        <g:eachError bean="${planInstance}" field="payingPeriod">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'maturityPeriod', 'error')} required">
	<label for="maturityPeriod">
        <sup><span class="required-indicator">*</span></sup>
        <g:message code="plan.maturityPeriod.label" default="Maturity Period" />
	</label>
	<g:field name="maturityPeriod" value="${planInstance.maturityPeriod}" />
    <g:hasErrors bean="${planInstance}"
                 field="maturityPeriod">
        <g:eachError bean="${planInstance}" field="maturityPeriod">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'pnpPrice', 'error')} required">
	<label for="pnpPrice">
        <sup><span class="required-indicator">*</span></sup>
        PNP Price
	</label>
	<g:field name="pnpPrice" value="${fieldValue(bean: planInstance, field: 'pnpPrice')}"/>
    <g:hasErrors bean="${planInstance}"
                 field="pnpPrice">
        <g:eachError bean="${planInstance}" field="pnpPrice">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'paymentMode', 'error')} required">
    <label for="paymentMode">
        <sup><span class="required-indicator">*</span></sup>
        <g:message code="plan.paymentMode.label" default="Payment Mode" />
    </label>
    <select:paymentMode value="${planInstance?.paymentMode}"/>
    <g:hasErrors bean="${planInstance}"
                 field="paymentMode">
        <g:eachError bean="${planInstance}" field="paymentMode">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'modalInstallment', 'error')} required">
	<label for="modalInstallment">
        <sup><span class="required-indicator">*</span></sup>
        <g:message code="plan.modalInstallment.label" default="Modal Installment" />
	</label>
	<g:field name="modalInstallment" value="${fieldValue(bean: planInstance, field: 'modalInstallment')}"/>
    <g:hasErrors bean="${planInstance}"
                 field="modalInstallment">
        <g:eachError bean="${planInstance}" field="modalInstallment">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'numberOfUnits', 'error')} required">
	<label for="numberOfUnits">
        <sup><span class="required-indicator">*</span></sup>
        <g:message code="plan.numberOfUnits.label" default="Number Of Units" />
	</label>
	<g:field name="numberOfUnits" value="${planInstance.numberOfUnits}"/>
    <g:hasErrors bean="${planInstance}"
                 field="numberOfUnits">
        <g:eachError bean="${planInstance}" field="numberOfUnits">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'planStatus', 'error')} required">
    <label for="planStatus">
        <sup><span class="required-indicator">*</span></sup>
        <g:message code="plan.planStatus.label" default="Plan Status" />
    </label>
    <select:planStatus value="${planInstance?.planStatus}"/>
    <g:hasErrors bean="${planInstance}"
                 field="planStatus">
        <g:eachError bean="${planInstance}" field="planStatus">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'applicableDate', 'error')} ">
	<label for="applicableDate">
		<g:message code="plan.applicableDate.label" default="Applicable Date" />

	</label>
    <g:textField id="applicableDate" name="applicableDate" value="${formatDate(format:'MM/dd/yyyy',date:planInstance?.applicableDate)}" />

    <g:hasErrors bean="${planInstance}"
                 field="applicableDate">
        <g:eachError bean="${planInstance}" field="applicableDate">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'withInsurance', 'error')} required">
	<label for="withInsurance">
        <sup><span class="required-indicator">*</span></sup>
        With Insurance
	</label>
	%{--<g:checkBox name="withInsurance" value="${planInstance?.withInsurance}" />--}%
	<g:select name="withInsurance" value="${planInstance?.withInsurance}" optionKey= "value" optionValue="key" from="${['Yes':true, 'No':false]}" />
</div>

%{--<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'agent', 'error')} ">--}%
	%{--<label for="agent">--}%
		%{--<g:message code="plan.agent.label" default="Agent" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:select id="agent" name="agent.id" from="${com.dataentry.Agent.list()}" optionKey="id" value="${planInstance?.agent?.id}" class="many-to-one" noSelection="['null': '']"/>--}%
	%{--<g:textField class='autocomplete-field' name="agent-autocomplete" value="${planInstance?.agent?.fullName()}" placeholder="Search a client..."/>--}%
	%{--<g:hiddenField name="agent.id" value="${planInstance?.agent?.id}"/>--}%
    %{--<g:link controller="agent" action="create" params="['plan.id': planInstance?.id]">Create an agent</g:link>--}%
     %{--<g:submitButton formaction="create" name="createAgent" event="createAgent" value="Create"/>--}%

%{--</div>--}%



