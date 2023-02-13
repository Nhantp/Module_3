<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <title>Display Product List</title>
    <link rel="stylesheet" href="webjars/bootstrap/5.2.3/css/bootstrap.min.css">
</head>
<body>
<c:if test="${product != null}">
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
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.describe}</td>
                <td>${product.producer}</td>
            </tr>
            </tbody>
        </table>
    </div>
</c:if>

<c:if test="${product == null}">
    <div class="container">
        <h1 class="text-center">Display Product List</h1>
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
<div class="w-25">
    <form class="form-inline" action="/product" method="post">
        <input class="form-control mr-sm-2" type="text" name="name" placeholder="Search"
               aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        <input type="hidden" name="action" value="searchByName">
    </form>
</div>
<a href="product?action=create">Create New Product</a>
</body>
</html>


<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Display List Product</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Display Product</h1>--%>
<%--<c:if test="${product != null}">--%>
<%--    <table border="1">--%>
<%--        <tr>--%>
<%--            <th>ID</th>--%>
<%--            <th>Name</th>--%>
<%--            <th>Price</th>--%>
<%--            <th>Describe</th>--%>
<%--            <th>Producer</th>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>${product.id}</td>--%>
<%--            <td>${product.name}</td>--%>
<%--            <td>${product.price}</td>--%>
<%--            <td>${product.describe}</td>--%>
<%--            <td>${product.producer}</td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</c:if>--%>

<%--<c:if test="${product == null}">--%>
<%--    <table border="1">--%>
<%--        <tr>--%>
<%--            <th>ID</th>--%>
<%--            <th>Name</th>--%>
<%--            <th>Price</th>--%>
<%--            <th>Describe</th>--%>
<%--            <th>Producer</th>--%>
<%--            <th>Function</th>--%>
<%--        </tr>--%>
<%--        <c:forEach items="${products}" var="product">--%>
<%--            <tr>--%>
<%--                <td>${product.id}</td>--%>
<%--                <td>${product.name}</td>--%>
<%--                <td>${product.price}</td>--%>
<%--                <td>${product.describe}</td>--%>
<%--                <td>${product.producer}</td>--%>
<%--                <td>--%>
<%--                    <a href="product?action=update&id=${product.id}">Update</a>--%>
<%--                    <a href="product?action=delete&pid=${product.id}">Delete</a>--%>
<%--                    <a href="product?action=check&pid=${product.id}">Check</a>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--    <br><br>--%>
<%--    <form action="/product" method="post">--%>
<%--        <input type="text" name="name">--%>
<%--        <input type="submit" value="Search">--%>
<%--        <input type="hidden" name="action" value="searchByName">--%>
<%--    </form>--%>
<%--    <br><br>--%>
<%--    <a href="product?action=create">Create New Product</a>--%>
<%--</c:if>--%>
<%--</body>--%>
<%--</html>--%>
