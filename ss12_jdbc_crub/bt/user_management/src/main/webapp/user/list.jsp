<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Display User List</title>
    <link rel="stylesheet" href="webjars/bootstrap/5.2.3/css/bootstrap.min.css">
</head>
<body>
<c:if test="${user != null}">
    <div class="container">
        <h1 class="text-center">Display Product</h1>
        <table class="table table-hover">
            <thead class="thead-dark">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Country</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
            </tr>
            </tbody>
        </table>
    </div>
</c:if>

<c:if test="${user == null}">
    <div class="container">
        <h1 class="text-center">Display User List</h1>
        <table class="table table-hover">
            <thead class="thead-dark">
            <tr>
                <th scope="col">ID</th>
                <th scope="col"><a href="/user?action=sort">Name</a></th>
                <th scope="col">Email</th>
                <th scope="col">Country</th>
                <th class="text-center" scope="col">Function</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.country}</td>
                    <td class="text-center">
                        <a href="user?action=update&id=${user.id}" class="btn btn-primary">Update</a>
                        <a href="user?action=delete&id=${user.id}" class="btn btn-primary">Delete</a>
                        <a href="user?action=check&id=${user.id}" class="btn btn-primary">Check</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>
<div class="w-25">
    <form class="form-inline" action="/user" method="post">
        <input class="form-control mr-sm-2" type="text" name="country" placeholder="Search"
               aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        <input type="hidden" name="action" value="search">
    </form>
</div>
<a href="user?action=create">Create New User</a>
</body>
</html>
