<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>

<html>
<head>
    <title>Welcome</title>
</head>
<body>
<p><a href="employee">Display Employee Info</a></p>
<p><a href="operator">Demo for - ${something}</a></p>
<p><a href="implicitObject">${firstThing.secondThing} - firstThing is EL Implicit Object</a> </p>
<p><a href="paramimplicitobj.jsp?username=Rujuan&password=123456">EL param Implicit Object</a> </p>
<p><a href="cookie">EL cookie Implicit Object</a> </p>
<p><a href="employee">Display Employee Info</a></p>
<p><a href="collectionaccessoperator.jsp">JSP EL [] Operator Demo</a> </p>
<p><a href="arithmeticlogicalrelationaloperators.jsp">JSP EL Arithmetic, Logical, Relational Operators Demo </a> </p>
<p><a href="reservewords.jsp">JSP EL Reserved Word Demo</a> </p>
<p><a href="elnullfriendly.jsp">EL is “null friendly”</a> </p>
</body>
</html>