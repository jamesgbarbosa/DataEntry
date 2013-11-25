<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
	</head>
	<body>
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="list" controller="plan" action="list">Search Plans</g:link></li>
            <li><g:link class="list" controller="plan" action="create">New Plan</g:link></li>
        </ul>
    </div>
    <p>

    </p>
	</body>
</html>
