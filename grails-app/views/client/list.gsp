
<%@ page import="com.dataentry.Client" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" controller="client" action="create">Create Client</g:link>  </li>
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
        <div id="search-client" class="content scaffold-list">
            <h1>Search Clients:</h1>
            <g:form action="list">
                <table style="width: 500px">
                    <tr>
                        <td>
                            <label>Name</label>
                        </td>
                        <td>
                            <g:textField name="term" value="${params.term}"></g:textField>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <g:submitButton name="Submit" value="Submit"/>
                        </td>
                    </tr>
                </table>
            </g:form>
        </div>
		<div id="list-client" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>

						%{--<th>Name</th>--}%
                        <g:sortableColumn property="name" title="${message(code: 'client.name.label', default: 'Name')}" params="[term: params.term]"  />
                        <g:sortableColumn property="gender" title="${message(code: 'client.gender.label', default: 'Gender')}" params="[term: params.term]"  />
                        <g:sortableColumn property="birthdate" title="${message(code: 'client.birthdate.label', default: 'Birthdate')}" params="[term: params.term]"  />
						%{--<th>Gender</th>--}%
						%{--<th>Birthdate</th>--}%


					
						%{--<g:sortableColumn property="birthdate" title="${message(code: 'client.birthdate.label', default: 'Birthdate')}" params="[term: params.term]"  />--}%
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clientInstanceList}" status="i" var="clientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" controller="${clientInstance.gender ? 'client' :'company'}" id="${clientInstance.id}">${clientInstance?.name}</g:link></td>

						<td>${clientInstance.gender}</td>

						<td>${clientInstance.birthdate}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clientInstanceTotal}" params="[term: params.term]" />
			</div>
		</div>
	</body>
</html>
