<%--
  Created by IntelliJ IDEA.
  User: Mohamed Magdy
  Date: 9/25/2023
  Time: 1:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
</head>
<body>
<h1>This is result Page</h1>

${param.channel} ---- ${param.author}

<p>
    <%=request.getParameter("channel")%> =====
    <%=request.getParameter("author")%>
</p>

<p>
    <%
        out.print(request.getParameter("channel"));
        out.print("<br/>");
        out.print(request.getParameter("author"));
    %>
</p>
</body>
</html>