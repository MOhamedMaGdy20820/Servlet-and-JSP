<%@ page import="miss.xing.model.User" %>

<%--
  Created by IntelliJ IDEA.
  User: Mohamed Magdy
  Date: 9/24/2023
  Time: 9:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thank you!</title>
</head>
<body>
<h1>Thank you for signup!</h1>
<p>Below is your details:</p>

<p>Username: ${newUser.username}</p>
<p>Password: ${newUser.password}</p>
<p>Email: ${newUser.email}</p>
<p>Created At: ${newUser.createdAt}</p>

</body>
</html>