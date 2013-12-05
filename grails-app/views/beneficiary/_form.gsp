<%@ page import="com.dataentry.Beneficiary" %>



<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.clientProfile, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="beneficiary.lastName.label" default="Last Name" />
        <span class="required-indicator">*</span>
    </label>
	<g:textField name="lastName" value="${beneficiaryInstance?.clientProfile?.lastName}"/>
    <g:hasErrors bean="${beneficiaryInstance?.clientProfile}"
                 field="lastName">
        <g:eachError bean="${beneficiaryInstance?.clientProfile}" field="lastName">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.clientProfile, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="beneficiary.firstName.label" default="First Name" />
        <span class="required-indicator">*</span>
    </label>
	<g:textField name="firstName" value="${beneficiaryInstance?.clientProfile?.firstName}"/>
    <g:hasErrors bean="${beneficiaryInstance?.clientProfile}"
                 field="firstName">
        <g:eachError bean="${beneficiaryInstance?.clientProfile}" field="firstName">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.clientProfile, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="beneficiary.middleName.label" default="Middle Name" />
        <span class="required-indicator">*</span>
	</label>
	<g:textField name="middleName" value="${beneficiaryInstance?.clientProfile?.middleName}"/>
    <g:hasErrors bean="${beneficiaryInstance?.clientProfile}"
                 field="middleName">
        <g:eachError bean="${beneficiaryInstance?.clientProfile}" field="middleName">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.clientProfile, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="beneficiary.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${beneficiaryInstance?.clientProfile.constraints.gender.inList}" required="" value="${beneficiaryInstance?.clientProfile?.gender}" valueMessagePrefix="beneficiary.gender"/>
    <g:hasErrors bean="${beneficiaryInstance?.clientProfile}"
                 field="gender">
        <g:eachError bean="${beneficiaryInstance?.clientProfile}" field="gender">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.clientProfile, field: 'birthdate', 'error')} required">
	<label for="birthdate">
		<g:message code="beneficiary.birthdate.label" default="Birthdate" />
		<span class="required-indicator">*</span>
	</label>
    <g:textField id="birthdate" name="birthdate" value="${formatDate(format:'MM/dd/yyyy',date:beneficiaryInstance?.clientProfile?.birthdate)}" />
    <g:hasErrors bean="${beneficiaryInstance?.clientProfile}"
                 field="birthdate">
        <g:eachError bean="${beneficiaryInstance?.clientProfile}" field="birthdate">
            <span class="inlineErrors">
                <g:message  error="${it}" />
            </span>
        </g:eachError>
    </g:hasErrors>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.clientProfile, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="beneficiary.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${beneficiaryInstance?.clientProfile?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.clientProfile, field: 'address1', 'error')} ">
	<label for="address1">
		<g:message code="beneficiary.address1.label" default="Address1" />
		
	</label>
	<g:textField name="address1" value="${beneficiaryInstance?.clientProfile?.address1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.clientProfile, field: 'address2', 'error')} ">
	<label for="address2">
		<g:message code="beneficiary.address2.label" default="Address2" />
		
	</label>
	<g:textField name="address2" value="${beneficiaryInstance?.clientProfile?.address2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.clientProfile, field: 'address3', 'error')} ">
	<label for="address3">
		<g:message code="beneficiary.address3.label" default="Address3" />
		
	</label>
	<g:textField name="address3" value="${beneficiaryInstance?.clientProfile?.address3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.clientProfile, field: 'zipcode', 'error')} ">
    <label for="zipcode">
        ZIP Code
    </label>
    <g:textField class='autocomplete-field' name="zipcodes-autocomplete" value="${beneficiaryInstance?.clientProfile?.zipcode}" placeholder="Search zipcode..."/>
    <g:hiddenField name="zipcode" id="zipcode.id" value="${beneficiaryInstance?.clientProfile?.zipcode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.clientProfile, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="beneficiary.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${beneficiaryInstance?.clientProfile?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.clientProfile, field: 'province', 'error')} ">
	<label for="province">
		<g:message code="beneficiary.province.label" default="Province" />
		
	</label>
	<g:textField name="province" value="${beneficiaryInstance?.clientProfile?.province}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.clientProfile, field: 'landline', 'error')} ">
	<label for="landline">
		<g:message code="beneficiary.landline.label" default="Landline" />
		
	</label>
	<g:textField name="landline" value="${beneficiaryInstance?.clientProfile?.landline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.clientProfile, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="beneficiary.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="mobile" value="${beneficiaryInstance?.clientProfile?.mobile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beneficiaryInstance?.clientProfile, field: 'officenumber', 'error')} ">
	<label for="officenumber">
		   Office Number
	</label>
	<g:textField name="officenumber" value="${beneficiaryInstance?.clientProfile?.officenumber}"/>
</div>

<g:hiddenField name="zipcodesListLink" value="${createLink(controller: 'plan', action: 'zipcodesList')}"/>
