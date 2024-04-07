<%--
  Created by IntelliJ IDEA.
  User: Mohamed Magdy
  Date: 9/22/2023
  Time: 8:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP Life Cycle Demo</title>
</head>
<body>
<%!
    public void jspInit(){
        System.out.println("Init... called only once entire life of this JSP page. After this method being called, the translated servlet is ready to serve");
    }

    public void jspDestroy(){
        System.out.println("destroy...called only once entire life of this JSP page when web container shuts down.");
    }
%>
<p>This is a life cycle demo for JSP page</p>
</body>
</html>