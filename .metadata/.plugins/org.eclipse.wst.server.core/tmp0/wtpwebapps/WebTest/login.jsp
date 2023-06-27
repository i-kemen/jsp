<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    <form method="post" action="loginOk.jsp">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" required><br/>
        <label for="passwd">Password:</label>
        <input type="password" id="passwd" name="passwd" required><br/>
        <input type="submit" value="Login">
    </form>
</body>
</html>
