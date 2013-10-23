<%@ page import="com.dataentry.Plan" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plan.label', default: 'Plan')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
        <g:javascript>
            $(document).ready(function() {
                $('#origIssueDate').datepicker()
                $('#currentIssueDate').datepicker()
                $('#applicableDate').datepicker()

                $("#agent-autocomplete").autocomplete({
                    source: function(request, response){
                        $.ajax({
                            url: "/DataEntry/plan/agentslist", // remote datasource
                            data: request,
                            success: function(data){
                                response(data); // set the response
                            },
                            error: function(){ // handle server errors
                                alert("Unable to retrieve agents.")
                            }
                        });
                    },
                    minLength: 1, // triggered only after minimum 1 characters have been entered.
                    select: function(event, ui) { // event handler when user selects a company from the list.
                        $("#agent\\.id").val(ui.item.id); // update the hidden field.
                    }
                });

                $("#planholder-autocomplete").autocomplete({
                    source: function(request, response){
                        $.ajax({
                            url: "/DataEntry/plan/planholderslist", // remote datasource
                            data: request,
                            success: function(data){
                                response(data); // set the response
                            },
                            error: function(){ // handle server errors
                                alert("Unable to retrieve plan holders.")
                            }
                        });
                    },
                    minLength: 1, // triggered only after minimum 1 characters have been entered.
                    select: function(event, ui) { // event handler when user selects a company from the list.
                        $("#planHolder\\.id").val(ui.item.id); // update the hidden field.
                    }
                });

                $("#beneficiary-autocomplete").autocomplete({
                    source: function(request, response){
                        $.ajax({
                            url: "/DataEntry/plan/beneficiarieslist", // remote datasource
                            data: request,
                            success: function(data){
                                response(data); // set the response
                            },
                            error: function(){ // handle server errors
                                alert("Unable to retrieve beneficiaries.")
                            }
                        });
                    },
                    minLength: 1, // triggered only after minimum 1 characters have been entered.
                    select: function(event, ui) { // event handler when user selects a company from the list.
                        $("#beneficiary\\.id").val(ui.item.id); // update the hidden field.
                    }
                });

            });
        </g:javascript>
	</head>
	<body>
		<a href="#create-plan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-plan" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${planInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${planInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="create" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
                    %{--TODO fixed this. make this work!--}%
					%{--<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
                    <g:submitButton formaction="create" name="savePlan" event="savePlan" value="Create"/>

                </fieldset>
			</g:form>
		</div>
	</body>
</html>
