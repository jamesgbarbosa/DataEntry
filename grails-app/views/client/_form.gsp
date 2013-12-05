<%@ page import="com.dataentry.Client" %>



<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="client.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" value="${clientInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="client.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" value="${clientInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="client.middleName.label" default="Middle Name" />
        <span class="required-indicator">*</span>
	</label>
	<g:textField name="middleName" value="${clientInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="client.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${clientInstance.constraints.gender.inList}" required="" value="${clientInstance?.gender}" valueMessagePrefix="client.gender"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'birthdate', 'error')} required">
	<label for="birthdate">
		<g:message code="client.birthdate.label" default="Birthdate" />
		<span class="required-indicator">*</span>
	</label>
    <g:textField id="birthdate" name="birthdate" value="${formatDate(format:'MM/dd/yyyy',date:clientInstance?.birthdate)}" />
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
