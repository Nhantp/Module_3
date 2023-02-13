<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Create New Products</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.2.3/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="text-center">Create New Product</h1>
        <div class="d-flex justify-content-center ">
            <div class="w-50">
            <form action="/product" method="post">
                <div class="form-group">
                    <label for="exampleInputID">ID</label>
                    <input type="text" name="id" class="form-control" id="exampleInputID" aria-describedby="emailHelp"
                           placeholder="Enter ID"></div>

                <div class="form-group">
                    <label for="exampleInputName">Name</label>
                    <input type="text" name="name" class="form-control" id="exampleInputName"
                           aria-describedby="emailHelp"
                           placeholder="Enter Name"></div>

                <label for="exampleInputPrice">Price</label>
                <input type="text" name="price" class="form-control" id="exampleInputPrice" aria-describedby="emailHelp"
                       placeholder="Enter Price">

                <label for="exampleInputDescribe">Describe</label>
                <input type="text" name="describe" class="form-control" id="exampleInputDescribe" aria-describedby="emailHelp"
                       placeholder="Enter Describe">

                <label for="exampleInputProducer">Producer</label>
                <input type="text" name="producer" class="form-control" id="exampleInputProducer" aria-describedby="emailHelp"
                       placeholder="Enter Producer">
                <div class="form-group">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Okay</label>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-primary">Reset</button>
                </div>
                <input type="hidden" name="action" value="create">
            </form>
        </div>
    </div>
</div>
</body>
</html>

