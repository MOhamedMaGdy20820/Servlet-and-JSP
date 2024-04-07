<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Mohamed Magdy
  Date: 9/25/2023
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>XSS Result - Blog List</title>
</head>
<body>
<%
    List<String> blogs = (List<String>) request.getAttribute("blogs");
    for(String blog: blogs){

        pageContext.setAttribute("myblog", blog);/* دي الطريقه الصح 1*/ /*   كده بفلتره الاول*/
%>
<%--<%= blog%> --%> <%--  الطريقه دي ان اطبعها مباشره ممكن حد يكتب كود جافا اسكربت يشرب الدنيا --%>

<c:out value="${myblog}"></c:out> <%-- 2 --%>  <%--بطبعه--%>
<%
    }
%>
</body>
</html>