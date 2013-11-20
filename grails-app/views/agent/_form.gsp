<%@ page import="com.dataentry.Agent" %>



<div class="fieldcontain ${hasErrors(bean: agentInstance?.clientProfile, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="agent.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" value="${agentInstance?.clientProfile?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance?.clientProfile, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="agent.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" value="${agentInstance?.clientProfile?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance?.clientProfile, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="agent.middleName.label" default="Middle Name" />
        <span class="required-indicator">*</span>
	</label>
	<g:textField name="middleName" value="${agentInstance?.clientProfile?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance?.clientProfile, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="agent.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${agentInstance?.clientProfile?.constraints?.gender?.inList}" required="" value="${agentInstance?.clientProfile?.gender}" valueMessagePrefix="agent.gender"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance?.clientProfile, field: 'birthdate', 'error')} required">
	<label for="birthdate">
		<g:message code="agent.birthdate.label" default="Birthdate" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:datePicker name="birthdate" precision="day"  value="${agentInstance?.clientProfile?.birthdate}"  />--}%
	<g:textField id="birthdate" name="birthdate" value="${formatDate(format:'MM/dd/yyyy',date:agentInstance?.clientProfile?.birthdate)}" />
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance?.clientProfile, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="agent.email.label" default="Email" />

	</label>
	<g:textField name="email" value="${agentInstance?.clientProfile?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance?.clientProfile, field: 'address1', 'error')} ">
	<label for="address1">
		<g:message code="agent.address1.label" default="Address1" />

	</label>
	<g:textField name="address1" value="${agentInstance?.clientProfile?.address1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance?.clientProfile, field: 'address2', 'error')} ">
	<label for="address2">
		<g:message code="agent.address2.label" default="Address2" />

	</label>
	<g:textField name="address2" value="${agentInstance?.clientProfile?.address2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance?.clientProfile, field: 'address3', 'error')} ">
	<label for="address3">
		<g:message code="agent.address3.label" default="Address3" />

	</label>
	<g:textField name="address3" value="${agentInstance?.clientProfile?.address3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance?.clientProfile, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="agent.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${agentInstance?.clientProfile?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance?.clientProfile, field: 'province', 'error')} ">
	<label for="province">
		<g:message code="agent.province.label" default="Province" />
		
	</label>
	<g:textField name="province" value="${agentInstance?.clientProfile?.province}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance?.clientProfile, field: 'zipcode', 'error')} ">
	<label for="zipcode">
		<g:message code="agent.zipcode.label" default="Zipcode" />
		
	</label>
	<g:textField name="zipcode" value="${agentInstance?.clientProfile?.zipcode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance?.clientProfile, field: 'landline', 'error')} ">
	<label for="landline">
		<g:message code="agent.landline.label" default="Landline" />
		
	</label>
	<g:textField name="landline" value="${agentInstance?.clientProfile?.landline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance?.clientProfile, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="agent.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="mobile" value="${agentInstance?.clientProfile?.mobile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance?.clientProfile, field: 'officenumber', 'error')} ">
	<label for="officenumber">
		<g:message code="agent.officenumber.label" default="Officenumber" />
		
	</label>
	<g:textField name="officenumber" value="${agentInstance?.clientProfile?.officenumber}"/>
</div>
