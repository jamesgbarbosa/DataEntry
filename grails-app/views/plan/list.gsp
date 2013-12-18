
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
				<li><g:link class="create" action="create">Create Plan</g:link></li>
			</ul>
		</div>
    <div id="search-plan" class="content scaffold-list">
        <h1>Search Plans:</h1>
        <g:form action="list">
            <table style="width: 700px">
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
                        <g:textField class='autocomplete-field' name="plan-planholder-search-autocomplete" value="${planHolder?.name()}" placeholder="Search a plan holder..."/>
                        <g:hiddenField name="planHolder" value="${planHolder?.clientProfile?.id}"/>
                        <g:hiddenField name="planHolderCompany" value="${planHolder?.company?.id}"/>
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
                        <label>Date Range</label>
                    </td>
                    <td>
                        <g:textField id="fromDate" name="fromDate" value="${ params?.fromDate != '' ? formatDate(format:'MM/dd/yyyy',date: params.fromDate) : ''}" />
                        –
                        <g:textField id="toDate" name="toDate" value="${ params?.toDate != '' ? formatDate(format:'MM/dd/yyyy',date: params.toDate) : ''}" />

                    </td>

                </tr>
            </table>
            <fieldset class="buttons">
                <g:submitButton name="Submit" value="Submit"/>
            </fieldset>

            <table>
                <thead>
                <tr>

                    <g:sortableColumn  params="[planID: params.planID, product: params.product, fromDate:params?.fromDate != '' ? formatDate(format:'MM/dd/yyyy',date: params.fromDate) : '' , toDate:params?.toDate != '' ? formatDate(format:'MM/dd/yyyy',date: params.toDate) : '', planHolderCompany: params.planHolderCompany ]" property="planNumber" title="${message(code: 'plan.planNumber.label', default: 'Plan Number')}" />

                    <g:sortableColumn params="[planID: params.planID, product: params.product, fromDate: params?.fromDate != '' ? formatDate(format:'MM/dd/yyyy',date: params.fromDate) : '' , toDate:params?.toDate != '' ? formatDate(format:'MM/dd/yyyy',date: params.toDate) : '', planHolder:params.planHolder, planHolderCompany: params.planHolderCompany ]" property="product" title="${message(code: 'plan.product.label', default: 'Product Code')}" />

                    <g:sortableColumn params="[planID: params.planID, product: params.product, fromDate: params?.fromDate != '' ? formatDate(format:'MM/dd/yyyy',date: params.fromDate) : '' , toDate:params?.toDate != '' ? formatDate(format:'MM/dd/yyyy',date: params.toDate) : '', planHolderCompany: params.planHolderCompany ]" property="planHolder.clientProfile.lastName" title="${message(code: 'plan.planholder.label', default: 'Planholder Name')}" />


                </tr>
                </thead>
                <tbody>
                <g:each in="${planInstanceList}" status="i" var="planInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show" id="${planInstance.id}">${fieldValue(bean: planInstance, field: "planNumber")}</g:link></td>

                        <td>${fieldValue(bean: planInstance, field: "product")}</td>

                        <td>${planInstance?.planHolder?.name()}</td>


                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${planInstanceTotal}" params="[planID: params.planID, product: params.product, fromDate: params?.fromDate != '' ? formatDate(format:'MM/dd/yyyy',date: params.fromDate) : '' , toDate:params?.toDate != '' ? formatDate(format:'MM/dd/yyyy',date: params.toDate) : '', planHolderCompany: params.planHolderCompany ]" />
            </div>

        </g:form>
    </div>
		<div id="list-plan" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <div id="totalSearchResults">
                <g:if test="${planInstanceList.size()!=0}">
                    <span class="totalSearchResultsText">
                    Total Records Found: ${planInstanceTotal}
                    </span>
                </g:if>
            </div>
		</div>
         <g:hiddenField name="planholderListLink" value="${createLink(controller: 'plan', action: 'planholdersList')}"/>
    </body>
</html>
