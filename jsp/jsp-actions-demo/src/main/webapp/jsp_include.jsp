<%--
  Created by IntelliJ IDEA.
  User: Mohamed Magdy
  Date: 9/25/2023
  Time: 1:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP Include Action Demo</title>
</head>
<body>
<h1>JSP Include Action Demo</h1>
<p>The included page cannot change response status code or set headers. The servlet container will ignore those attempts.</p>

<%--  flush="true"  ده معناه ان كل اللي قلبه هيظهر في البروزر و مش هيتم توجه الصفحه لصفحه تانيه
                                                 يعني forward مش هتشتغل عشان بتحلنا لصفحه جديده
                                                 ولو في forwerd في بقيت الصفحه هيقف عندها مش هيكمل بقيتها
 --%>


<%--
<jsp:include page="being_included.jsp" />
--%>

<jsp:include page="being_included.jsp" flush="true" >
    <jsp:param name="channel" value="Miss Xing"/>
    <jsp:param name="author" value="Tina"/>
</jsp:include>

<%--<jsp:forward page="result.jsp" >
    <jsp:param name="channel" value="Miss Xing"/>
    <jsp:param name="author" value="Tina"/>
</jsp:forward>--%>

<p>The servlet container includes response (not source code) of the included page.
</p>

</body>
</html>