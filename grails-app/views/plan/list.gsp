
<%@ page import="com.dataentry.Plan" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plan.label', default: 'Plan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-plan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
    <div id="search-plan" class="content scaffold-list">
        <h1>Search Plans:</h1>
        <g:form action="list">
            <table style="width: 500px">
                <tr>
                    <td>
                        <label>Plan Number</label>
                    </td>
                    <td>
                        <g:textField name="planID" value="${params.planID}"></g:textField>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Planholder Name</label>
                    </td>
                    <td>
                        %{--<g:textField name="planholderName" value="${params.planholderName}"></g:textField>--}%
                        <g:textField class='autocomplete-field' name="plan-planholder-search-autocomplete" value="${planHolder?.clientProfile?.firstName ? planHolder?.clientProfile?.fullNameBirthdateAndGender() : ""}" placeholder="Search a plan holder..."/>
                        <g:hiddenField name="planHolder.id" value="${planHolder?.clientProfile?.id}" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Product Code</label>
                    </td>
                    <td>
                        <select:product value="${params.product}"/>

                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Date Created</label>
                    </td>
                    <td>
                        <g:textField id="dateCreated" name="dateCreated" value="${ params?.dateCreated != '' ? formatDate(format:'MM/dd/yyyy',date: params.dateCreated) : ''}" />

                    </td>
                </tr>
            </table>
            <fieldset class="buttons">
                <g:submitButton name="Submit" value="Submit"/>
            </fieldset>


        </g:form>
    </div>
		<div id="list-plan" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="planNumber" title="${message(code: 'plan.planNumber.label', default: 'Plan Number')}" />

						<g:sortableColumn property="product" title="${message(code: 'plan.product.label', default: 'Product Code')}" />

						<g:sortableColumn property="planHolder" title="${message(code: 'plan.planholder.label', default: 'Planholder Name')}" />
					
						%{--<g:sortableColumn property="maturityPeriod" title="${message(code: 'plan.maturityPeriod.label', default: 'Maturity Period')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="pnpPrice" title="${message(code: 'plan.pnpPrice.label', default: 'Pnp Price')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="modalInstallment" title="${message(code: 'plan.modalInstallment.label', default: 'Modal Installment')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="numberOfUnits" title="${message(code: 'plan.numberOfUnits.label', default: 'Number Of Units')}" />--}%
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${planInstanceList}" status="i" var="planInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${planInstance.id}">${fieldValue(bean: planInstance, field: "planNumber")}</g:link></td>
					
						<td>${fieldValue(bean: planInstance, field: "product")}</td>

						<td>${planInstance?.planHolder?.name()}</td>

						%{--<td>${fieldValue(bean: planInstance, field: "maturityPeriod")}</td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: planInstance, field: "pnpPrice")}</td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: planInstance, field: "modalInstallment")}</td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: planInstance, field: "numberOfUnits")}</td>--}%
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${planInstanceTotal}" />
			</div>
            <div id="totalSearchResults">
                <g:if test="${planInstanceList.size()!=0}">
                    <span class="totalSearchResultsText">
                    Total Records Found: ${planInstanceList.size()}
                    </span>
                </g:if>
            </div>
		</div>
         <g:hiddenField name="planholderListLink" value="${createLink(controller: 'plan', action: 'planholdersList')}"/>
    </body>
</html>
