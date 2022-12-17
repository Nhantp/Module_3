<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Nhân
  Date: 12/2/2022
  Time: 4:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display list book</title>
</head>
<body>
    <h1>List Book</h1>
    <table border="1"></table>
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Author</td>
        <td>Category</td>
    </tr>
<c:forEach items="${books}" var="book">
    <tr>
        <td>${book.id}</td>
        <td>${book.name}</td>
        <td>${book.author}</td>
        <td>${book.category.name}</td>
    </tr>

</c:forEach>
</body>
</html>
