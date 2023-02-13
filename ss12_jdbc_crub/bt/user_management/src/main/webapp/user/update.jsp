
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Create New User</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.2.3/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <h1 class="text-center">Update User</h1>
    <div class="d-flex justify-content-center ">
        <div class="w-50">
            <form name="action" method="post">
                <div class="form-group">
                    <input type="hidden" name="id" class="form-control" id="exampleInputID" aria-describedby="emailHelp"
                           value="${userList.id}"></div>

                <div class="form-group">
                    <label for="exampleInputName">Name</label>
                    <input type="text" name="name" class="form-control" id="exampleInputName"
                           aria-describedby="emailHelp"
                           placeholder="Enter Name" value="${userList.name}"></div>

                <label for="exampleInputPrice">Email</label>
                <input type="text" name="email" class="form-control" id="exampleInputPrice" aria-describedby="emailHelp"
                       placeholder="Enter Email" value="${userList.email}">

                <label for="exampleInputDescribe">Country</label>
                <input type="text" name="country" class="form-control" id="exampleInputDescribe"
                       aria-describedby="emailHelp"
                       placeholder="Enter Country" value="${userList.country}">

                <div class="form-group">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Okay</label>
                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
                    <button type="reset" class="btn btn-primary">Reset</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
