<%@ page import="com.dataentry.Agent" %>



<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="agent.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" value="${agentInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="agent.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" value="${agentInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="agent.middleName.label" default="Middle Name" />
        <span class="required-indicator">*</span>
	</label>
	<g:textField name="middleName" value="${agentInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="agent.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${agentInstance?.constraints?.gender?.inList}" required="" value="${agentInstance?.gender}" valueMessagePrefix="agent.gender"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'birthdate', 'error')} required">
	<label for="birthdate">
		<g:message code="agent.birthdate.label" default="Birthdate" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:datePicker name="birthdate" precision="day"  value="${agentInstance?.birthdate}"  />--}%
	<g:textField id="birthdate" name="birthdate" value="${formatDate(format:'MM/dd/yyyy',date:agentInstance?.birthdate)}" />
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="agent.email.label" default="Email" />

	</label>
	<g:textField name="email" value="${agentInstance?.email}"/>
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

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="agent.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${agentInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'province', 'error')} ">
	<label for="province">
		<g:message code="agent.province.label" default="Province" />
		
	</label>
	<g:textField name="province" value="${agentInstance?.province}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'zipcode', 'error')} ">
	<label for="zipcode">
		<g:message code="agent.zipcode.label" default="Zipcode" />
		
	</label>
	<g:textField name="zipcode" value="${agentInstance?.zipcode}"/>
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

%{--<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'agentCode', 'error')} ">--}%
	%{--<label for="agentCode">--}%
		%{--<g:message code="agent.agentCode.label" default="Agent Code" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:textField name="agentCode" value="${agentInstance?.agentCode}"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'position', 'error')} ">--}%
	%{--<label for="position">--}%
		%{--<g:message code="agent.position.label" default="Position" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:textField name="position" value="${agentInstance?.position}"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'appointmentDate', 'error')} ">--}%
	%{--<label for="appointmentDate">--}%
		%{--<g:message code="agent.appointmentDate.label" default="Appointment Date" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:datePicker name="appointmentDate" precision="day"  value="${agentInstance?.appointmentDate}" default="none" noSelection="['': '']" />--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'agency', 'error')} ">--}%
	%{--<label for="agency">--}%
		%{--<g:message code="agent.agency.label" default="Agency" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:textField name="agency" value="${agentInstance?.agency}"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'groupName', 'error')} ">--}%
	%{--<label for="groupName">--}%
		%{--<g:message code="agent.groupName.label" default="Group Name" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:textField name="groupName" value="${agentInstance?.groupName}"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: agentInstance, field: 'unit', 'error')} ">--}%
	%{--<label for="unit">--}%
		%{--<g:message code="agent.unit.label" default="Unit" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:textField name="unit" value="${agentInstance?.unit}"/>--}%
%{--</div>--}%

