<%--
  Created by IntelliJ IDEA.
  User: Mohamed Magdy
  Date: 9/25/2023
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>XSS Form</title>
</head>
<body>

<form action="xss" method="post">
    <textarea name="blog"></textarea>
    <input type="submit" value="Submit">
</form>

</body>
</html>
