<%--
  Created by IntelliJ IDEA.
  User: James
  Date: 11/1/13
  Time: 11:47 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:javascript src="file-renaming.js"/>
</head>
    <body>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
        <g:uploadForm action="rename">
            <div id="search-client" class="content scaffold-list">
                <h1>File Renaming:</h1>
                    <table style="width: 500px">
                        <tr>
                            <td>
                                <label>Files:</label>
                            </td>
                            <td>
                                <input type="file" name="files" id="files" multiple="" directory="" webkitdirectory="" mozdirectory="" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Policy Number:</label>
                            </td>
                            <td>
                                <g:textField id="policyNumber" name="policyNumber"></g:textField>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Doc date:</label>
                            </td>
                            <td>
                                <g:textField id="docDate" name="docDate"></g:textField>
                            </td>
                        </tr>
                    </table>
                    <div id="info" style="margin-top:30px"></div>
            </div>
        </g:uploadForm>
    </body>
</html>

