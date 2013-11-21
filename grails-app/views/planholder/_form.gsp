<%@ page import="com.dataentry.Planholder" %>


<div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.clientProfile, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="planholder.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" value="${createPlanHolderDto?.clientProfile?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.clientProfile, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="planholder.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" value="${createPlanHolderDto?.clientProfile?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.clientProfile, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="planholder.middleName.label" default="Middle Name" />
        <span class="required-indicator">*</span>
	</label>
	<g:textField name="middleName" value="${createPlanHolderDto?.clientProfile?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.clientProfile, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="planholder.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${createPlanHolderDto?.clientProfile?.constraints?.gender?.inList}" required="" value="${createPlanHolderDto?.clientProfile?.gender}" valueMessagePrefix="planholder.gender"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.clientProfile, field: 'birthdate', 'error')} required">
	<label for="birthdate">
		<g:message code="planholder.birthdate.label" default="Birthdate" />
		<span class="required-indicator">*</span>
	</label>
    <g:textField id="birthdate" name="birthdate" value="${formatDate(format:'MM/dd/yyyy',date:createPlanHolderDto?.clientProfile?.birthdate)}" />

</div>

<div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.clientProfile, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="planholder.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${createPlanHolderDto?.clientProfile?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.clientProfile, field: 'address1', 'error')} ">
	<label for="address1">
		<g:message code="planholder.address1.label" default="Address1" />
		
	</label>
	<g:textField name="address1" value="${createPlanHolderDto?.clientProfile?.address1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.clientProfile, field: 'address2', 'error')} ">
	<label for="address2">
		<g:message code="planholder.address2.label" default="Address2" />
		
	</label>
	<g:textField name="address2" value="${createPlanHolderDto?.clientProfile?.address2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.clientProfile, field: 'address3', 'error')} ">
	<label for="address3">
		<g:message code="planholder.address3.label" default="Address3" />
		
	</label>
	<g:textField name="address3" value="${createPlanHolderDto?.clientProfile?.address3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.clientProfile, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="planholder.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${createPlanHolderDto?.clientProfile?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.clientProfile, field: 'province', 'error')} ">
	<label for="province">
		<g:message code="planholder.province.label" default="Province" />
		
	</label>
	<g:textField name="province" value="${createPlanHolderDto?.clientProfile?.province}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.clientProfile, field: 'zipcode', 'error')} ">
	<label for="zipcode">
		<g:message code="planholder.zipcode.label" default="Zipcode" />
		
	</label>
	<g:textField name="zipcode" value="${createPlanHolderDto?.clientProfile?.zipcode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.clientProfile, field: 'landline', 'error')} ">
	<label for="landline">
		<g:message code="planholder.landline.label" default="Landline" />
		
	</label>
	<g:textField name="landline" value="${createPlanHolderDto?.clientProfile?.landline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.clientProfile, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="planholder.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="mobile" value="${createPlanHolderDto?.clientProfile?.mobile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createPlanHolderDto?.clientProfile, field: 'officenumber', 'error')} ">
	<label for="officenumber">
		<g:message code="planholder.officenumber.label" default="Officenumber" />
		
	</label>
	<g:textField name="officenumber" value="${createPlanHolderDto?.clientProfile?.officenumber}"/>
</div>

