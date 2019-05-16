<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    pageContext.setAttribute("ctx", contextPath);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>${answer.answer}</h2>
</body>
</html>
