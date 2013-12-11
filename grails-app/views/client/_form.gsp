<%@ page import="com.dataentry.Client" %>
<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
        <sup><span class="required-indicator">*</span></sup>
		<g:message code="client.lastName.label" default="Last Name" />
	</label>
	<g:textField name="lastName" value="${clientInstance?.lastName}"/>
    <g:hasErrors bean="${clientInstance}"
                 field="lastName">
        <g:eachError bean="${clientInstance}" field="lastName">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
        <sup><span class="required-indicator">*</span></sup>
		<g:message code="client.firstName.label" default="First Name" />
	</label>
	<g:textField name="firstName" value="${clientInstance?.firstName}"/>
    <g:hasErrors bean="${clientInstance}"
                 field="firstName">
        <g:eachError bean="${clientInstance}" field="firstName">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="client.middleName.label" default="Middle Name" />
	</label>
	<g:textField name="middleName" value="${clientInstance?.middleName}"/>
    <g:hasErrors bean="${clientInstance}"
                 field="middleName">
        <g:eachError bean="${clientInstance}" field="middleName">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'gender', 'error')} required">
	<label for="gender">
        <sup><span class="required-indicator">*</span></sup>
		<g:message code="client.gender.label" default="Gender" />
	</label>
    <select:gender  name="gender" value="${clientInstance?.gender}" required=""/>
    <g:hasErrors bean="${clientInstance}"
                 field="gender">
        <g:eachError bean="${clientInstance}" field="gender">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'birthdate', 'error')} required">
	<label for="birthdate">
        <sup><span class="required-indicator">*</span></sup>
		<g:message code="client.birthdate.label" default="Birthdate" />
	</label>
    <g:textField id="birthdate" name="birthdate" value="${formatDate(format:'MM/dd/yyyy',date:clientInstance?.birthdate)}" />
    <g:hasErrors bean="${clientInstance}"
                 field="birthdate">
        <g:eachError bean="${clientInstance}" field="birthdate">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="client.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${clientInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'address1', 'error')} ">
	<label for="address1">
		<g:message code="client.address1.label" default="Address1" />
		
	</label>
	<g:textField name="address1" value="${clientInstance?.address1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'address2', 'error')} ">
	<label for="address2">
		<g:message code="client.address2.label" default="Address2" />
		
	</label>
	<g:textField name="address2" value="${clientInstance?.address2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'address3', 'error')} ">
	<label for="address3">
		<g:message code="client.address3.label" default="Address3" />
		
	</label>
	<g:textField name="address3" value="${clientInstance?.address3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'zipcode', 'error')} ">
    <label for="zipcode">
        ZIP Code
    </label>
    <g:textField class='autocomplete-field' name="zipcodes-autocomplete" value="${clientInstance?.zipcode}" placeholder="Search zipcode..."/>
    <g:hiddenField name="zipcode" id="zipcode.id" value="${clientInstance?.zipcode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="client.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${clientInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'province', 'error')} ">
	<label for="province">
		<g:message code="client.province.label" default="Province" />
		
	</label>
	<g:textField name="province" value="${clientInstance?.province}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'landline', 'error')} ">
	<label for="landline">
		<g:message code="client.landline.label" default="Landline" />
		
	</label>
	<g:textField name="landline" value="${clientInstance?.landline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="client.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="mobile" value="${clientInstance?.mobile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'officenumber', 'error')} ">
	<label for="officenumber">
		<g:message code="client.officenumber.label" default="Officenumber" />
		
	</label>
	<g:textField name="officenumber" value="${clientInstance?.officenumber}"/>
</div>

<g:hiddenField name="zipcodesListLink" value="${createLink(controller: 'plan', action: 'zipcodesList')}"/>
