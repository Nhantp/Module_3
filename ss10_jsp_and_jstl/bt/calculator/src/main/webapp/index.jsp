<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="calculate" method="post">
    <label> First Operand:
        <input type="text" name="first operand"  >
    </label><br><br>
    <label> Operator:
        <select name="operator" id="operator">
            <option value="+">Cong</option>
            <option value="-">Tru</option>
            <option value="*">Nhan</option>
            <option value="/">Chia</option>
        </select>
    </label><br><br>
    <label>Second Operand:
       <input type="text" name="second operand">
    </label><br><br>
    <input type="submit" name="Calculate" value="calculate">
</form>

</body>
</html>