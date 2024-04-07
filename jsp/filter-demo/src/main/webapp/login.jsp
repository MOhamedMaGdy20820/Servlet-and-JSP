<%--
  Created by IntelliJ IDEA.
  User: Mohamed Magdy
  Date: 9/28/2023
  Time: 2:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h2>Please Login Here</h2>

<form action="login" method="post">
    <label for="username">Username:</label><br>
    <input type="text" id="username" name="username"><br>
    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password"><br><br>
    <input type="submit" value="Log in">
</form>

<c:if test="${param.error}">
    Invalid Username/Password.
</c:if>

</body>
</html>