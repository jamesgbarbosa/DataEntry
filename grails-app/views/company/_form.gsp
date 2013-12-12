<%@ page import="com.dataentry.Company" %>



<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'name', 'error')} required">
	<label for="name">
        <sup><span class="required-indicator">*</span></sup>
        Company Name
	</label>
	<g:textField name="name" value="${companyInstance?.name}"/>
    <g:hasErrors bean="${companyInstance}"
                 field="name">
        <g:eachError bean="${companyInstance}" field="name">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'address1', 'error')} ">
	<label for="address1">
		<g:message code="company.address1.label" default="Address1" />
		
	</label>
	<g:textField name="address1" value="${companyInstance?.address1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'address2', 'error')} ">
    <label for="address2">
        <g:message code="company.address2.label" default="Address2" />

    </label>
    <g:textField name="address2" value="${companyInstance?.address2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'address3', 'error')} ">
    <label for="address3">
        <g:message code="company.address3.label" default="Address3" />

    </label>
    <g:textField name="address3" value="${companyInstance?.address3}"/>
</div>

