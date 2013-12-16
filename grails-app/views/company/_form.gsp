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

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'email', 'error')} ">
    <label for="email">
        <g:message code="company.email.label" default="Email" />

    </label>
    <g:textField name="email" value="${companyInstance?.email}"/>
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

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'zipcode', 'error')} ">
    <label for="zipcode">
        ZIP Code
    </label>
    <g:textField class='autocomplete-field' name="zipcodes-autocomplete" value="${companyInstance?.zipcode}" placeholder="Search zipcode..."/>
    <g:hiddenField name="zipcode" id="zipcode.id" value="${companyInstance?.zipcode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'city', 'error')} ">
    <label for="city">
        <g:message code="company.city.label" default="City" />

    </label>
    <g:textField name="city" value="${companyInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'province', 'error')} ">
    <label for="province">
        <g:message code="company.province.label" default="Province" />

    </label>
    <g:textField name="province" value="${companyInstance?.province}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'landline', 'error')} ">
    <label for="landline">
        <g:message code="company.landline.label" default="Landline" />

    </label>
    <g:textField name="landline" value="${companyInstance?.landline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'mobile', 'error')} ">
    <label for="mobile">
        <g:message code="company.mobile.label" default="Mobile" />

    </label>
    <g:textField name="mobile" value="${companyInstance?.mobile}"/>
</div>

<g:hiddenField name="zipcodesListLink" value="${createLink(controller: 'plan', action: 'zipcodesList')}"/>


