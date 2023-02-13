<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculate</title>
</head>
<body>
<style>
    form{

        border: 3px solid #cdcdcd;
        width: 250px;
    }
    input{
        border: 1px solid black;
        height: 30px;
    }
    input,label{
        margin-left: 30px;
    }
    .submit{
        margin-left: 150px;
    }
</style>

    <h1>Product Discount Calculate</h1>
    <form action="/convert" method="post">
        <label>Product Description</label><br>
        <input type="text" name="productDescription" placeholder="Product Description"><br><br>
        <label>List Price</label><br>
        <input type="text" name="listPrice" placeholder="List Price"><br><br>
        <label>Discount Present</label><br>
        <input type="text" name="discountPresent" placeholder="Discount Present"><br><br>
        <input class="submit" type="submit" name="discount_amount" placeholder="Discount Amount">
    </form>
</body>
</html>