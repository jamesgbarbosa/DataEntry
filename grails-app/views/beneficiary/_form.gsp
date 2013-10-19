<%@ page import="com.dataentry.Beneficiary" %>



<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'clientType', 'error')} ">
	<label for="clientType">
		<g:message code="beneficiary.clientType.label" default="Client Type" />
		
	</label>
	<g:textField name="clientType" value="${beneficiaryInstance?.clientType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="beneficiary.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${beneficiaryInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="beneficiary.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${beneficiaryInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="beneficiary.middleName.label" default="Middle Name" />
		
	</label>
	<g:textField name="middleName" value="${beneficiaryInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'birthdate', 'error')} ">
	<label for="birthdate">
		<g:message code="beneficiary.birthdate.label" default="Birthdate" />
		
	</label>
	<g:datePicker name="birthdate" precision="day"  value="${beneficiaryInstance?.birthdate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'address1', 'error')} ">
	<label for="address1">
		<g:message code="beneficiary.address1.label" default="Address1" />
		
	</label>
	<g:textField name="address1" value="${beneficiaryInstance?.address1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'address2', 'error')} ">
	<label for="address2">
		<g:message code="beneficiary.address2.label" default="Address2" />
		
	</label>
	<g:textField name="address2" value="${beneficiaryInstance?.address2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'address3', 'error')} ">
	<label for="address3">
		<g:message code="beneficiary.address3.label" default="Address3" />
		
	</label>
	<g:textField name="address3" value="${beneficiaryInstance?.address3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'address4', 'error')} ">
	<label for="address4">
		<g:message code="beneficiary.address4.label" default="Address4" />
		
	</label>
	<g:textField name="address4" value="${beneficiaryInstance?.address4}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'address5', 'error')} ">
	<label for="address5">
		<g:message code="beneficiary.address5.label" default="Address5" />
		
	</label>
	<g:textField name="address5" value="${beneficiaryInstance?.address5}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'address6', 'error')} ">
	<label for="address6">
		<g:message code="beneficiary.address6.label" default="Address6" />
		
	</label>
	<g:textField name="address6" value="${beneficiaryInstance?.address6}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'landline', 'error')} ">
	<label for="landline">
		<g:message code="beneficiary.landline.label" default="Landline" />
		
	</label>
	<g:textField name="landline" value="${beneficiaryInstance?.landline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="beneficiary.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="mobile" value="${beneficiaryInstance?.mobile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'officenumber', 'error')} ">
	<label for="officenumber">
		<g:message code="beneficiary.officenumber.label" default="Officenumber" />
		
	</label>
	<g:textField name="officenumber" value="${beneficiaryInstance?.officenumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="beneficiary.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${beneficiaryInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="beneficiary.gender.label" default="Gender" />
		
	</label>
	<g:textField name="gender" value="${beneficiaryInstance?.gender}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'designation', 'error')} ">
	<label for="designation">
		<g:message code="beneficiary.designation.label" default="Designation" />
		
	</label>
	<g:textField name="designation" value="${beneficiaryInstance?.designation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance, field: 'relationship', 'error')} ">
	<label for="relationship">
		<g:message code="beneficiary.relationship.label" default="Relationship" />
		
	</label>
	<g:textField name="relationship" value="${beneficiaryInstance?.relationship}"/>
</div>

