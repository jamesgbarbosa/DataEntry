<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
	</head>
	<body>
    <div class="nav" role="navigation">
        <ul>
            <li><g:link class="list" controller="client" action="list">Clients</g:link></li>
            <li><g:link class="list" controller="plan" action="list">Plans</g:link></li>
        </ul>
    </div>
    <p>

    </p>
    <form method="post" enctype="multipart/form-data">
        <input type="file" name="files[]" id="files" multiple="" directory="" webkitdirectory="" mozdirectory="">
        <input class="button" type="submit" value="Upload" />
    </form>
	</body>
</html>
