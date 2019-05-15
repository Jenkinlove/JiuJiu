<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    pageContext.setAttribute("ctx",contextPath);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${ctx}/saveUser" method="post">
    <label for="un">username:</label><input id="un" type="text" name="username" value="${user.username}">
    <label style="color: red">${username}</label><br>
    <label for="pwd1">password:</label><input id="pwd1" type="text" name="password" value="${user.password}">
    <label style="color: red">${password}</label><br>
    <label for="pwd2">confirmPassword:</label><input id="pwd2" type="text" value="${user.password}">
    <label style="color: red">${password}</label><br>
    <label for="el">email:</label><input id="el" type="text" name="email" value="${user.email}">
    <label style="color: red">${email}</label><br>
    验证码：<input type="text" > <img src="${ctx}/checkCode" alt=""><a href="">
    看不清楚？换张图片</a><br>
    <input type="submit" value="注册">
</form>
</body>
</html>
