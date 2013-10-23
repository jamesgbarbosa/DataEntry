<%@ page import="com.dataentry.Plan" %>


<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'product', 'error')} ">
	<label for="product">
		<g:message code="plan.product.label" default="Product" />
		
	</label>
	<select:product value="${planInstance?.product}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'payingPeriod', 'error')} required">
	<label for="payingPeriod">
		<g:message code="plan.payingPeriod.label" default="Paying Period" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="payingPeriod" type="number" value="${planInstance.payingPeriod}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'maturityPeriod', 'error')} required">
	<label for="maturityPeriod">
		<g:message code="plan.maturityPeriod.label" default="Maturity Period" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maturityPeriod" type="number" value="${planInstance.maturityPeriod}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'pnpPrice', 'error')} ">
	<label for="pnpPrice">
		<g:message code="plan.pnpPrice.label" default="Pnp Price" />
		
	</label>
	<g:field name="pnpPrice" value="${fieldValue(bean: planInstance, field: 'pnpPrice')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'modalInstallment', 'error')} ">
	<label for="modalInstallment">
		<g:message code="plan.modalInstallment.label" default="Modal Installment" />
		
	</label>
	<g:field name="modalInstallment" value="${fieldValue(bean: planInstance, field: 'modalInstallment')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'numberOfUnits', 'error')} required">
	<label for="numberOfUnits">
		<g:message code="plan.numberOfUnits.label" default="Number Of Units" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numberOfUnits" type="number" value="${planInstance.numberOfUnits}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'origIssueDate', 'error')} ">
	<label for="origIssueDate">
		<g:message code="plan.origIssueDate.label" default="Orig Issue Date" />
		
	</label>
    <g:textField id="origIssueDate" name="origIssueDate" value="${formatDate(format:'MM/dd/yyyy',date:planInstance?.origIssueDate)}" />
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'currentIssueDate', 'error')} ">
	<label for="currentIssueDate">
		<g:message code="plan.currentIssueDate.label" default="Current Issue Date" />
		
	</label>
    <g:textField id="currentIssueDate" name="currentIssueDate" value="${formatDate(format:'MM/dd/yyyy',date:planInstance?.currentIssueDate)}" />

</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'paymentMode', 'error')} ">
	<label for="paymentMode">
		<g:message code="plan.paymentMode.label" default="Payment Mode" />
		
	</label>
	<g:textField name="paymentMode" value="${planInstance?.paymentMode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'planStatus', 'error')} ">
	<label for="planStatus">
		<g:message code="plan.planStatus.label" default="Plan Status" />

	</label>
	<g:textField name="planStatus" value="${planInstance?.planStatus}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'applicableDate', 'error')} ">
	<label for="applicableDate">
		<g:message code="plan.applicableDate.label" default="Applicable Date" />

	</label>
    <g:textField id="applicableDate" name="applicableDate" value="${formatDate(format:'MM/dd/yyyy',date:planInstance?.applicableDate)}" />

</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'withInsurance', 'error')} ">
	<label for="withInsurance">
		Make Insurance
		
	</label>
	%{--<g:checkBox name="withInsurance" value="${planInstance?.withInsurance}" />--}%
	<g:select name="withInsurance" value="${planInstance?.withInsurance}" optionKey= "value" optionValue="key" from="${['Y':true, 'N':false]}" />
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'planHolder', 'error')} ">
	<label for="planHolder">
		<g:message code="plan.planHolder.label" default="Plan Holder" />
		
	</label>
	%{--<g:select id="planHolder" name="planHolder.id" from="${com.dataentry.Planholder.list()}" optionKey="id" value="${planInstance?.planHolder?.id}" class="many-to-one" noSelection="['null': '']"/>--}%
    <g:textField name="planholder-autocomplete" value="${planInstance?.planHolder?.fullName()}" placeholder="Search a plan holder..."/>
    <g:hiddenField name="planHolder.id" value="${planInstance?.planHolder?.id}"/>

    <g:submitButton formaction="create" name="createPlanHolder" event="createPlanHolder" value="Create a plan Holder"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'agent', 'error')} ">
	<label for="agent">
		<g:message code="plan.agent.label" default="Agent" />
		
	</label>
	%{--<g:select id="agent" name="agent.id" from="${com.dataentry.Agent.list()}" optionKey="id" value="${planInstance?.agent?.id}" class="many-to-one" noSelection="['null': '']"/>--}%
	<g:textField name="agent-autocomplete" value="${planInstance?.agent?.fullName()}" placeholder="Search an agent..."/>
	<g:hiddenField name="agent.id" value="${planInstance?.agent?.id}"/>
    %{--<g:link controller="agent" action="create" params="['plan.id': planInstance?.id]">Create an agent</g:link>--}%
        <g:submitButton formaction="create" name="createAgent" event="createAgent" value="Create an agent"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'beneficiary', 'error')} ">
    <label for="beneficiary">
        <g:message code="plan.beneficiary.label" default="Beneficiary" />

    </label>
    <g:textField name="beneficiary-autocomplete" value="${planInstance?.beneficiary?.fullName()}" placeholder="Search an beneficiary..."/>
    <g:hiddenField name="beneficiary.id" value="${planInstance?.beneficiary?.id}"/>
    <g:submitButton formaction="create" name="createBeneficiary" event="createBeneficiary" value="Create a beneficiary"/>

</div>



