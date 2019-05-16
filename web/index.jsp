<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String contextPath = request.getContextPath();
  pageContext.setAttribute("ctx", contextPath);
%>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <a href="${ctx}/answer">答案之书</a>
  </body>
</html>
