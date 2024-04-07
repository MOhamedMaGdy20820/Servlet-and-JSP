<%@ page import="miss.xing.model.User" %>

<%--
  Created by IntelliJ IDEA.
  User: Mohamed Magdy
  Date: 9/24/2023
  Time: 8:23 PM
  To change this template use File | Settings | File Templates.
--%>

<%--  control and view--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Thank you!</title>
</head>
<body>
<h1>Thank you for signup!</h1>
<p>Below is your details:</p>
<%
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  String email    = request.getParameter("email");
  User user = new User(username, password, email);
  pageContext.setAttribute("newUser", user);

%>

<p>Username:   <%= user.getUsername()%></p>
<p>Password:   <%= user.getPassword()%></p>
<p>Email:      <%= user.getEmail()%></p>
<p>Created At: <%= user.getCreatedAt()%></p>

<hr />

<p>Username: ${newUser.username} </p>
<p>Password: ${newUser.password} </p>
<p>Email: ${newUser.email}</p>
<p>Created At: ${newUser.createdAt}</p>

${newUser.username}


</body>
</html>