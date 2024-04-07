<%--
  Created by IntelliJ IDEA.
  User: Mohamed Magdy
  Date: 9/25/2023
  Time: 1:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forward to Another Page</title>
</head>
<body>
<%
    System.out.println("Before JSP forward Action..........");
%>

<h1>JSP Foward Action Home Page</h1>


<jsp:forward page="result.jsp">
    <jsp:param name="channel" value="Miss Xing"/>
    <jsp:param name="author" value="Tina"/>
</jsp:forward>


<%
    System.out.println("After JSP forward Action..........");
%>

</body>
</html>