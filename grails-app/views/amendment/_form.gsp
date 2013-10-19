<%@ page import="com.dataentry.Amendment" %>



<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'amendmentType', 'error')} ">
	<label for="amendmentType">
		<g:message code="amendment.amendmentType.label" default="Amendment Type" />
		
	</label>
	<g:textField name="amendmentType" value="${amendmentInstance?.amendmentType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'approvedBy', 'error')} ">
	<label for="approvedBy">
		<g:message code="amendment.approvedBy.label" default="Approved By" />
		
	</label>
	<g:textField name="approvedBy" value="${amendmentInstance?.approvedBy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'effectiveDate', 'error')} required">
	<label for="effectiveDate">
		<g:message code="amendment.effectiveDate.label" default="Effective Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="effectiveDate" precision="day"  value="${amendmentInstance?.effectiveDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'filingDate', 'error')} required">
	<label for="filingDate">
		<g:message code="amendment.filingDate.label" default="Filing Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="filingDate" precision="day"  value="${amendmentInstance?.filingDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'plan', 'error')} required">
	<label for="plan">
		<g:message code="amendment.plan.label" default="Plan" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="plan" name="plan.id" from="${com.dataentry.Plan.list()}" optionKey="id" required="" value="${amendmentInstance?.plan?.id}" class="many-to-one"/>
</div>

