<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalDateTime" %>
<html>
<body>
<p><a href="lifecycledemo.jsp">JSP Life CyCle Demo</a> </p>

<%@include file="header.jsp"%>
<h1>Welcome to Miss Xing channel! Please like and subscribe!!!</h1>
<h2>Declaration: used to insert instance variables and methods into generated servlet class</h2>
<%!
    int count = 0;

    public int getCount(){
        return count;
    }
%>

<h2>Scriptlet: all statements will be inserted into _jspService()</h2>  <%--like method--%>
<%  // like method
    int count = 0;    // local
    count++;
    System.out.println("count: " + count);
    System.out.println("getCount(): " + getCount()); // اللي فوق
%>

<h2>Expression: the thing you put between the tags, are wrapped in out.print() under _jspService()</h2>

<%= count %>        <%--  out.print( count );      --%>
<%= getCount()%>    <%--  out.print( getCount());  --%>




<h2>Directive: Page Directive</h2>
<%
    LocalDate currentDate = LocalDate.now();
    LocalDateTime currentTime = LocalDateTime.now();
%>

<p>Today is  <%=currentDate%> </p>
<p>Current Time is <%=currentTime%></p>

<!-- HTML Comment -->

<%-- JSP Comment --%>

<%
    String name = (String) pageContext.getAttribute("user", PageContext.SESSION_SCOPE);
    out.print("User: ");
    out.print(name);
%>

<%@include file="footer.jsp"%>

</body>
</html>
