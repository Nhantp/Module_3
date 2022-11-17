<%--
  Created by IntelliJ IDEA.
  User: Nhân
  Date: 11/14/2022
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style type="text/css">
    .login {
        height: 180px;
        width: 300px;
        margin: 0;
        padding: 10px;
        border: 1px #CCC solid;
    }

    .login input {
        padding: 5px;
        margin: 5px
    }
</style>
<body>
<form>
    <div class="login">
        <form method="post" action="/login">
            <h2>Login</h2>
            <label>
                <input type="text" name="username" size="30" placeholder="username"/>
            </label>
            <label>
                <input type="password" name="password" size="30" placeholder="password"/>
            </label>
            <input type="submit" value="Sign in"/>
        </form>
    </div>
</form>
</body>
</html>
