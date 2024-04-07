<%--
  Created by IntelliJ IDEA.
  User: Mohamed Magdy
  Date: 9/25/2023
  Time: 11:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>c:choose, c:when, c:otherwise</title>
</head>
<body>

<c:set var="salary" value="1"></c:set>

<c:choose>
    <c:when test="${salary > 9000}">
        <p>Paid High</p>
    </c:when>

    <c:when test="${salary <= 9000 && salary > 1}">
        <p>Paid Normal</p>
    </c:when>

    <c:otherwise>
        <p>No comment</p>
    </c:otherwise>

</c:choose>

</body>
</html>