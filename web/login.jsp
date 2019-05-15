<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    pageContext.setAttribute("ctx",contextPath);
%>
<%
    String name="";
    String pwd="";
    //取出Cookie
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        if(cookie.getName().equals("users")){
            //存着数据（用户名+密码）
            name=cookie.getValue().split("-")[0];
            pwd=cookie.getValue().split("-")[1];

            //再一次存起来（备用）
            request.setAttribute("uname",name);
            request.setAttribute("pwd",pwd);
        }
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${ctx}/login" method="post">
    <label style="color: red">${error}</label><br>
    username:<input type="text" name="username" value="${user.username}${uname}"><br>
    password:<input type="text" name="password" value="${user.password}${pwd}"><br>
    <input type="checkbox" name="remember" value="yes" checked="checked">记住密码<br>
    <input type="submit" value="登录">
</form>
</body>
</html>
