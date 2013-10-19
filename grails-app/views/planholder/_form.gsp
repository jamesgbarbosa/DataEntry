<%@ page import="com.dataentry.Planholder" %>



<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'clientType', 'error')} ">
	<label for="clientType">
		<g:message code="planholder.clientType.label" default="Client Type" />
		
	</label>
	<g:textField name="clientType" value="${planholderInstance?.clientType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="planholder.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${planholderInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="planholder.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${planholderInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="planholder.middleName.label" default="Middle Name" />
		
	</label>
	<g:textField name="middleName" value="${planholderInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'birthdate', 'error')} ">
	<label for="birthdate">
		<g:message code="planholder.birthdate.label" default="Birthdate" />
		
	</label>
	<g:datePicker name="birthdate" precision="day"  value="${planholderInstance?.birthdate}" default="none" noSelection="['': '']" />
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

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'address4', 'error')} ">
	<label for="address4">
		<g:message code="planholder.address4.label" default="Address4" />
		
	</label>
	<g:textField name="address4" value="${planholderInstance?.address4}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'address5', 'error')} ">
	<label for="address5">
		<g:message code="planholder.address5.label" default="Address5" />
		
	</label>
	<g:textField name="address5" value="${planholderInstance?.address5}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'address6', 'error')} ">
	<label for="address6">
		<g:message code="planholder.address6.label" default="Address6" />
		
	</label>
	<g:textField name="address6" value="${planholderInstance?.address6}"/>
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

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="planholder.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${planholderInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planholderInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="planholder.gender.label" default="Gender" />
		
	</label>
	<g:textField name="gender" value="${planholderInstance?.gender}"/>
</div>

