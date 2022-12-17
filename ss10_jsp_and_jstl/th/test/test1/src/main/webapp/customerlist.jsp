<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Nhân
  Date: 11/25/2022
  Time: 4:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sach khach hang</title>
</head>
<body>
<h1>Danh sach khach hang</h1>
<table border="1">
<tr>
    <td>Ten</td>
    <td>Ngay sinh</td>
    <td>Dia chi</td>
</tr>
    <c:forEach items="${listCustomer}" var="c">
       <tr>
           <td>${c.name}</td>
           <td>${c.dayOfBirth}</td>
           <td>${c.address}</td>
       </tr>
    </c:forEach>
</table>
</body>
</html>
