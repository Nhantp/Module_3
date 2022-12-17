<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/login" method="post">
    <label>UserName
        <input type="text" name="username" placeholder="username">
    </label><br>
    <label>PassWord
        <input type="password" name="password" placeholder="password">
    </label><br>
    <input type="submit" name="submit" value="Submit">
</form>
</body>
</html>