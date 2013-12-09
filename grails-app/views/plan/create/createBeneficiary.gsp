<%@ page import="com.dataentry.Beneficiary" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'beneficiary.label', default: 'Beneficiary')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>

	</head>
	<body>
		<a href="#create-beneficiary" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="create-beneficiary" class="content scaffold-create" role="main">
            <h4>
                <g:if test="${page1link!=''}"><a href="${page1link}&red=true"> Create Plan </a> > </g:if>
                <g:if test="${page2link!=''}"> <a href="${page2link}&red=true"> Add Beneficiaries </a> > </g:if>
                Create Beneficiary
            </h4>
			<g:if test="${flash.message}">
		    	<div class="message" role="status">${flash.message}</div>
			</g:if>
            <g:if test="${flash.error}">
                <div class="errors" role="status">${flash.error}</div>
            </g:if>
            <g:if test="${request.error}">
                <div class="errors" role="status">${request.error}</div>
            </g:if>
			<g:form action="create" >
				<fieldset class="form">
					<g:render template="/beneficiary/form"/>
				</fieldset>
				<fieldset class="buttons">
                    <g:submitButton name="return" event="return" value="Back" />
                    <g:submitButton class="save" name="saveBeneficiary" event="saveBeneficiary" value="Create" />
                </fieldset>

			</g:form>
		</div>
	</body>
</html>
