<%@ page import="com.dataentry.Company" %>



<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'name', 'error')} required">
	<label for="name">
        <sup><span class="required-indicator">*</span></sup>
        <g:message code="company.name.label" default="Name" />
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

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="company.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${companyInstance?.address}"/>
</div>

