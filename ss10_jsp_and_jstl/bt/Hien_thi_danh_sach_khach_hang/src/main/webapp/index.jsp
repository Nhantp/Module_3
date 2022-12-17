<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h1>Danh Sach Khach Hang</h1>
<table border="1">
    <tr>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach items="${listCustomer}" var="c">
        <tr>
            <td>${c.name}</td>
            <td>${c.dateOfBirth}</td>
            <td>${c.address}</td>
            <td></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>