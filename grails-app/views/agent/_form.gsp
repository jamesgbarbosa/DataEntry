<%@ page import="com.dataentry.Agent" %>



<div class="fieldcontain ${hasErrors(bean: createAgentDto?.clientProfile, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="agent.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" value="${createAgentDto?.clientProfile?.lastName}"/>
    <g:hasErrors bean="${createAgentDto?.clientProfile}"
                 field="lastName">
        <g:eachError bean="${createAgentDto?.clientProfile}" field="lastName">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: createAgentDto?.clientProfile, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="agent.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" value="${createAgentDto?.clientProfile?.firstName}"/>
    <g:hasErrors bean="${createAgentDto?.clientProfile}"
                 field="firstName">
        <g:eachError bean="${createAgentDto?.clientProfile}" field="firstName">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: createAgentDto?.clientProfile, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="agent.middleName.label" default="Middle Name" />
        <span class="required-indicator">*</span>
	</label>
	<g:textField name="middleName" value="${createAgentDto?.clientProfile?.middleName}"/>
    <g:hasErrors bean="${createAgentDto?.clientProfile}"
                 field="middleName">
        <g:eachError bean="${createAgentDto?.clientProfile}" field="middleName">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: createAgentDto?.clientProfile, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="agent.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>

    <select:gender  name="gender" value="${createAgentDto?.clientProfile?.gender}" required=""/>
    <g:hasErrors bean="${createAgentDto?.clientProfile}"
                 field="gender">
        <g:eachError bean="${createAgentDto?.clientProfile}" field="gender">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: createAgentDto?.clientProfile, field: 'birthdate', 'error')} required">
	<label for="birthdate">
		<g:message code="agent.birthdate.label" default="Birthdate" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:datePicker name="birthdate" precision="day"  value="${createAgentDto?.clientProfile?.birthdate}"  />--}%
	<g:textField id="birthdate" name="birthdate" value="${formatDate(format:'MM/dd/yyyy',date:createAgentDto?.clientProfile?.birthdate)}" />
    <g:hasErrors bean="${createAgentDto?.clientProfile}"
                 field="birthdate">
        <g:eachError bean="${createAgentDto?.clientProfile}" field="birthdate">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: createAgentDto?.clientProfile, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="agent.email.label" default="Email" />

	</label>
	<g:textField name="email" value="${createAgentDto?.clientProfile?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createAgentDto?.clientProfile, field: 'address1', 'error')} ">
	<label for="address1">
		<g:message code="agent.address1.label" default="Address1" />

	</label>
	<g:textField name="address1" value="${createAgentDto?.clientProfile?.address1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createAgentDto?.clientProfile, field: 'address2', 'error')} ">
	<label for="address2">
		<g:message code="agent.address2.label" default="Address2" />

	</label>
	<g:textField name="address2" value="${createAgentDto?.clientProfile?.address2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createAgentDto?.clientProfile, field: 'address3', 'error')} ">
	<label for="address3">
		<g:message code="agent.address3.label" default="Address3" />

	</label>
	<g:textField name="address3" value="${createAgentDto?.clientProfile?.address3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createAgentDto?.clientProfile, field: 'zipcode', 'error')} ">
    <label for="zipcode">
        ZIP Code
    </label>
    <g:textField class='autocomplete-field' name="zipcodes-autocomplete" value="${createAgentDto?.clientProfile?.zipcode}" placeholder="Search zipcode..."/>
    <g:hiddenField name="zipcode" id="zipcode.id" value="${createAgentDto?.clientProfile?.zipcode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createAgentDto?.clientProfile, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="agent.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${createAgentDto?.clientProfile?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createAgentDto?.clientProfile, field: 'province', 'error')} ">
	<label for="province">
		<g:message code="agent.province.label" default="Province" />
		
	</label>
	<g:textField name="province" value="${createAgentDto?.clientProfile?.province}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createAgentDto?.clientProfile, field: 'landline', 'error')} ">
	<label for="landline">
		<g:message code="agent.landline.label" default="Landline" />
		
	</label>
	<g:textField name="landline" value="${createAgentDto?.clientProfile?.landline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createAgentDto?.clientProfile, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="agent.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="mobile" value="${createAgentDto?.clientProfile?.mobile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: createAgentDto?.clientProfile, field: 'officenumber', 'error')} ">
	<label for="officenumber">
		Office Number
	</label>
	<g:textField name="officenumber" value="${createAgentDto?.clientProfile?.officenumber}"/>
</div>

<g:hiddenField name="zipcodesListLink" value="${createLink(controller: 'plan', action: 'zipcodesList')}"/>