<%@ page import="com.dataentry.Agent" %>



<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'clientType', 'error')} ">
	<label for="clientType">
		<g:message code="agent.clientType.label" default="Client Type" />
		
	</label>
	<g:textField name="clientType" value="${agentInstance?.clientType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="agent.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${agentInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="agent.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${agentInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="agent.middleName.label" default="Middle Name" />
		
	</label>
	<g:textField name="middleName" value="${agentInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'birthdate', 'error')} ">
	<label for="birthdate">
		<g:message code="agent.birthdate.label" default="Birthdate" />
		
	</label>
	<g:datePicker name="birthdate" precision="day"  value="${agentInstance?.birthdate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'address1', 'error')} ">
	<label for="address1">
		<g:message code="agent.address1.label" default="Address1" />
		
	</label>
	<g:textField name="address1" value="${agentInstance?.address1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'address2', 'error')} ">
	<label for="address2">
		<g:message code="agent.address2.label" default="Address2" />
		
	</label>
	<g:textField name="address2" value="${agentInstance?.address2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'address3', 'error')} ">
	<label for="address3">
		<g:message code="agent.address3.label" default="Address3" />
		
	</label>
	<g:textField name="address3" value="${agentInstance?.address3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'address4', 'error')} ">
	<label for="address4">
		<g:message code="agent.address4.label" default="Address4" />
		
	</label>
	<g:textField name="address4" value="${agentInstance?.address4}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'address5', 'error')} ">
	<label for="address5">
		<g:message code="agent.address5.label" default="Address5" />
		
	</label>
	<g:textField name="address5" value="${agentInstance?.address5}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'address6', 'error')} ">
	<label for="address6">
		<g:message code="agent.address6.label" default="Address6" />
		
	</label>
	<g:textField name="address6" value="${agentInstance?.address6}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'landline', 'error')} ">
	<label for="landline">
		<g:message code="agent.landline.label" default="Landline" />
		
	</label>
	<g:textField name="landline" value="${agentInstance?.landline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="agent.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="mobile" value="${agentInstance?.mobile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'officenumber', 'error')} ">
	<label for="officenumber">
		<g:message code="agent.officenumber.label" default="Officenumber" />
		
	</label>
	<g:textField name="officenumber" value="${agentInstance?.officenumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="agent.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${agentInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="agent.gender.label" default="Gender" />
		
	</label>
	<g:textField name="gender" value="${agentInstance?.gender}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'agentCode', 'error')} ">
	<label for="agentCode">
		<g:message code="agent.agentCode.label" default="Agent Code" />
		
	</label>
	<g:textField name="agentCode" value="${agentInstance?.agentCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'position', 'error')} ">
	<label for="position">
		<g:message code="agent.position.label" default="Position" />
		
	</label>
	<g:textField name="position" value="${agentInstance?.position}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'appointmentDate', 'error')} ">
	<label for="appointmentDate">
		<g:message code="agent.appointmentDate.label" default="Appointment Date" />
		
	</label>
	<g:datePicker name="appointmentDate" precision="day"  value="${agentInstance?.appointmentDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'agency', 'error')} ">
	<label for="agency">
		<g:message code="agent.agency.label" default="Agency" />
		
	</label>
	<g:textField name="agency" value="${agentInstance?.agency}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'groupName', 'error')} ">
	<label for="groupName">
		<g:message code="agent.groupName.label" default="Group Name" />
		
	</label>
	<g:textField name="groupName" value="${agentInstance?.groupName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'unit', 'error')} ">
	<label for="unit">
		<g:message code="agent.unit.label" default="Unit" />
		
	</label>
	<g:textField name="unit" value="${agentInstance?.unit}"/>
</div>

