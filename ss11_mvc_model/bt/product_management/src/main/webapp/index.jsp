<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Management</title>
    <link rel="stylesheet" href="webjars/bootstrap/5.2.3/css/bootstrap.min.css">
</head>
<body>
<div class="has-bg-img bg-purple bg-blend-overlay">
    <div class="w-auto">
    <div class="opacity-50">
    <img class="bg-img" src="product/5.jpg" alt="...">
    </div>
    </div>
</div>
<!-- Background image -->
<%--<nav class="navbar navbar-expand-lg navbar-light bg-light">--%>
<%--    <a class="navbar-brand">Product Management</a>--%>
<%--    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"--%>
<%--            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--        <span class="navbar-toggler-icon"></span>--%>
<%--    </button>--%>
<%--    <div class="collapse navbar-collapse" id="navbarNavDropdown">--%>
<%--        <ul class="navbar-nav">--%>
<%--            <li class="nav-item active">--%>
<%--                <a class="nav-link" href="product?action=list">Display List Products<span class="sr-only"></span></a>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" href="product?action=create">Create New Product</a>--%>
<%--            </li>--%>
<%--            <nav class="navbar navbar-light bg-light">--%>
<%--                <form class="form-inline">--%>
<%--                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
<%--                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
<%--                </form>--%>
<%--            </nav>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</nav>--%>


<h1>Product Management</h1>
<a href="product?action=list">Display List Product</a>
<br><br>
<a href="product?action=create">Create New Product</a>
<br><br>
<a href="product?action=searchByName">Search By Name</a>
