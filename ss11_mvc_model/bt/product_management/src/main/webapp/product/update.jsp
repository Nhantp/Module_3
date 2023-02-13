<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Create New Products</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.2.3/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <h1 class="text-center">Update Product</h1>
    <div class="d-flex justify-content-center ">
        <div class="w-50">
            <form name="action" method="post">
                <div class="form-group">
                    <input type="hidden" name="id" class="form-control" id="exampleInputID" aria-describedby="emailHelp"
                           value="${products.id}"></div>

                <div class="form-group">
                    <label for="exampleInputName">Name</label>
                    <input type="text" name="name" class="form-control" id="exampleInputName"
                           aria-describedby="emailHelp"
                           placeholder="Enter Name" value="${products.name}"></div>

                <label for="exampleInputPrice">Price</label>
                <input type="text" name="price" class="form-control" id="exampleInputPrice" aria-describedby="emailHelp"
                       placeholder="Enter Price" value="${products.price}">

                <label for="exampleInputDescribe">Describe</label>
                <input type="text" name="describe" class="form-control" id="exampleInputDescribe"
                       aria-describedby="emailHelp"
                       placeholder="Enter Describe" value="${products.describe}">

                <label for="exampleInputProducer">Producer</label>
                <input type="text" name="producer" class="form-control" id="exampleInputProducer"
                       aria-describedby="emailHelp"
                       placeholder="Enter Producer" value="${products.producer}">
                <div class="form-group">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Okay</label>
                    </div>
                    <button type="submit" class="btn btn-primary" value="update">Update</button>
                    <button type="reset" class="btn btn-primary">Reset</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>

<%--<html>--%>
<%--<head>--%>
<%--    <title>Update Product</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--    <h1>Update Product</h1>--%>
<%--    <form name="action" method="post">--%>
<%--        <table border="1">--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                    <input type="hidden" name="id" value="${products.id}">--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>Name</th>--%>
<%--                <td>--%>
<%--                    <input type="text" name="name" value="${products.name}">--%>
<%--                </td>--%>
<%--            </tr>--%>

<%--            <tr>--%>
<%--                <th>Price</th>--%>
<%--                <td>--%>
<%--                    <input type="text" name="price" value="${products.price}">--%>
<%--                </td>--%>
<%--            </tr>--%>

<%--            <tr>--%>
<%--                <th>Describe</th>--%>
<%--                <td>--%>
<%--                    <input type="text" name="describe" value="${products.describe}">--%>
<%--                </td>--%>
<%--            </tr>--%>

<%--            <tr>--%>
<%--                <th>Producer</th>--%>
<%--                <td>--%>
<%--                    <input type="text" name="producer" value="${products.producer}">--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                    <input type="submit" value="Update">--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </form>--%>
<%--</body>--%>
<%--</html>--%>
