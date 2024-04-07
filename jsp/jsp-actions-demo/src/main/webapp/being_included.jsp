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
    <title>This Page is included inside jsp_include.jsp</title>
</head>

<body>
<%
    out.print(2+4);
    out.print("<p>The answer is 6</p>");
    System.out.println("being_include.jsp is executed.........");
%>
<p>${param.channel} --- ${param.author}</p>
</body>

</html>