<%@ page import="com.dataentry.Plan" %>



<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'product', 'error')} ">
	<label for="product">
		<g:message code="plan.product.label" default="Product" />
		
	</label>
	<g:textField name="product" value="${planInstance?.product}"/>
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
	<g:datePicker name="origIssueDate" precision="day"  value="${planInstance?.origIssueDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'currentIssueDate', 'error')} ">
	<label for="currentIssueDate">
		<g:message code="plan.currentIssueDate.label" default="Current Issue Date" />
		
	</label>
	<g:datePicker name="currentIssueDate" precision="day"  value="${planInstance?.currentIssueDate}" default="none" noSelection="['': '']" />
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
	<g:datePicker name="applicableDate" precision="day"  value="${planInstance?.applicableDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'withInsurance', 'error')} ">
	<label for="withInsurance">
		<g:message code="plan.withInsurance.label" default="With Insurance" />
		
	</label>
	<g:checkBox name="withInsurance" value="${planInstance?.withInsurance}" />
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'planHolder', 'error')} ">
	<label for="planHolder">
		<g:message code="plan.planHolder.label" default="Plan Holder" />
		
	</label>
	<g:select id="planHolder" name="planHolder.id" from="${com.dataentry.Planholder.list()}" optionKey="id" value="${planInstance?.planHolder?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'agent', 'error')} ">
	<label for="agent">
		<g:message code="plan.agent.label" default="Agent" />
		
	</label>
	<g:select id="agent" name="agent.id" from="${com.dataentry.Agent.list()}" optionKey="id" value="${planInstance?.agent?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'beneficiaries', 'error')} ">
	<label for="beneficiaries">
		<g:message code="plan.beneficiaries.label" default="Beneficiaries" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${planInstance?.beneficiaries?}" var="b">
    <li><g:link controller="beneficiary" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="beneficiary" action="create" params="['plan.id': planInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'beneficiary.label', default: 'Beneficiary')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'amendments', 'error')} ">
	<label for="amendments">
		<g:message code="plan.amendments.label" default="Amendments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${planInstance?.amendments?}" var="a">
    <li><g:link controller="amendment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="amendment" action="create" params="['plan.id': planInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'amendment.label', default: 'Amendment')])}</g:link>
</li>
</ul>

</div>

