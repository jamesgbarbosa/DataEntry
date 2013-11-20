<%@ page import="com.dataentry.Planholder" %>


<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="planholder.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" value="${planholderInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="planholder.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" value="${planholderInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="planholder.middleName.label" default="Middle Name" />
        <span class="required-indicator">*</span>
	</label>
	<g:textField name="middleName" value="${planholderInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="planholder.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${planholderInstance?.constraints?.gender?.inList}" required="" value="${planholderInstance?.gender}" valueMessagePrefix="planholder.gender"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'birthdate', 'error')} required">
	<label for="birthdate">
		<g:message code="planholder.birthdate.label" default="Birthdate" />
		<span class="required-indicator">*</span>
	</label>
    <g:textField id="birthdate" name="birthdate" value="${formatDate(format:'MM/dd/yyyy',date:planholderInstance?.birthdate)}" />

</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="planholder.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${planholderInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'address1', 'error')} ">
	<label for="address1">
		<g:message code="planholder.address1.label" default="Address1" />
		
	</label>
	<g:textField name="address1" value="${planholderInstance?.address1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'address2', 'error')} ">
	<label for="address2">
		<g:message code="planholder.address2.label" default="Address2" />
		
	</label>
	<g:textField name="address2" value="${planholderInstance?.address2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'address3', 'error')} ">
	<label for="address3">
		<g:message code="planholder.address3.label" default="Address3" />
		
	</label>
	<g:textField name="address3" value="${planholderInstance?.address3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="planholder.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${planholderInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'province', 'error')} ">
	<label for="province">
		<g:message code="planholder.province.label" default="Province" />
		
	</label>
	<g:textField name="province" value="${planholderInstance?.province}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'zipcode', 'error')} ">
	<label for="zipcode">
		<g:message code="planholder.zipcode.label" default="Zipcode" />
		
	</label>
	<g:textField name="zipcode" value="${planholderInstance?.zipcode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'landline', 'error')} ">
	<label for="landline">
		<g:message code="planholder.landline.label" default="Landline" />
		
	</label>
	<g:textField name="landline" value="${planholderInstance?.landline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="planholder.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="mobile" value="${planholderInstance?.mobile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'officenumber', 'error')} ">
	<label for="officenumber">
		<g:message code="planholder.officenumber.label" default="Officenumber" />
		
	</label>
	<g:textField name="officenumber" value="${planholderInstance?.officenumber}"/>
</div>

