<div class="navbar">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

<h1>Data Entry</h1>
            <div class="nav-collapse collapse">
                %{--<ul class="nav nav-pills">--}%
                    %{--<sec:ifAnyGranted roles="ROLE_ADMIN"><li><g:link controller="securityInfo" action="config"><i class="icon-wrench"></i> Administration</g:link></li></sec:ifAnyGranted>--}%
                %{--</ul>--}%
                <g:if test="${params.action == 'auth' && params.controller == 'login'}">

                </g:if>
                <g:else>
                    <div class="pull-right" style="line-height: 38px;">
                        <sec:ifLoggedIn>
                            <i class='icon-user'></i>
                            Welcome, <g:link controller="userAccount" action="edit" id="${sec.loggedInUserInfo(field: 'id')}">
                            <sec:username/>
                        </g:link>
                            | <i class='icon-off'></i> <g:link controller="logout">Log out</g:link>
                        </sec:ifLoggedIn>
                        <sec:ifNotLoggedIn>
                            <i class='icon-user'></i> <g:link controller="login">Log in</g:link>&nbsp;&nbsp;&nbsp;
                            <i class='icon-plus'></i> <g:link controller="register">Register</g:link>
                        </sec:ifNotLoggedIn>
                    </div>
                </g:else>

            </div>
        </div>
    </div>
</div>
