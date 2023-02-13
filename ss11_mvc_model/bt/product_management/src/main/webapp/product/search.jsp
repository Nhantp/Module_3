<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <title>Search Product</title>
    <link rel="stylesheet" href="webjars/bootstrap/5.2.3/css/bootstrap.min.css">
</head>
<body>
<c:if test="${products!=null}">
<div class="container">
    <h1 class="text-center">Display Product</h1>
    <table class="table table-hover">
        <thead class="thead-dark">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Describe</th>
            <th scope="col">Producer</th>
            <th class="text-center" scope="col">Function</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="p">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td>${p.price}</td>
                <td>${p.describe}</td>
                <td>${p.producer}</td>
                <td class="text-center">
                    <a href="product?action=update&id=${p.id}" class="btn btn-primary">Update</a>
                    <a href="product?action=delete&pid=${p.id}" class="btn btn-primary">Delete</a>
                    <a href="product?action=check&pid=${p.id}" class="btn btn-primary">Check</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</c:if>
<c:if test="${products==null}">
    <h1>Co cai deo</h1>
</c:if>
</body>
</html>

<%--<!doctype html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <title>Search Product</title>--%>
<%--    <link rel="stylesheet" href="webjars/bootstrap/5.2.3/css/bootstrap.min.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<c:if test="${products != null}">--%>
<%--    <div class="container">--%>
<%--        <h1 class="text-center">Display Product</h1>--%>
<%--        <table class="table table-hover">--%>
<%--            <thead class="thead-dark">--%>
<%--            <tr>--%>
<%--                <th scope="col">ID</th>--%>
<%--                <th scope="col">Name</th>--%>
<%--                <th scope="col">Price</th>--%>
<%--                <th scope="col">Describe</th>--%>
<%--                <th scope="col">Producer</th>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <tr>--%>
<%--                <td>${products.id}</td>--%>
<%--                <td>${products.name}</td>--%>
<%--                <td>${products.price}</td>--%>
<%--                <td>${products.describe}</td>--%>
<%--                <td>${products.producer}</td>--%>
<%--            </tr>--%>
<%--            </tbody>--%>
<%--        </table>--%>
<%--    </div>--%>
<%--</c:if>--%>

<%--<c:if test="${product == null}">--%>
<%--    <h1>Not Found</h1>--%>
<%--</c:if>--%>
<%--</body>--%>
<%--</html>--%>


<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Search By Name</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<c:if test="${products != null}">--%>
<%--    <table border="1">--%>
<%--        <tr>--%>
<%--            <th>ID</th>--%>
<%--            <th>Name</th>--%>
<%--            <th>Price</th>--%>
<%--            <th>Describe</th>--%>
<%--            <th>Producer</th>--%>
<%--        </tr>--%>
<%--        <c:forEach items="${products}" var="product">--%>
<%--            <tr>--%>
<%--                <td>${product.id}</td>--%>
<%--                <td>${product.name}</td>--%>
<%--                <td>${product.price}</td>--%>
<%--                <td>${product.describe}</td>--%>
<%--                <td>${product.producer}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</c:if>--%>
<%--<c:if test="${products==null}">--%>
<%--    <p>Not Found</p>--%>
<%--</c:if>--%>
<%--</body>--%>
<%--</html>--%>
