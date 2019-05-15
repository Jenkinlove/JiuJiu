<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    pageContext.setAttribute("ctx", contextPath);
%>
<%
    String name = "";
    String pwd = "";
    //取出Cookie
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("users")) {
            //存着数据（用户名+密码）
            name = cookie.getValue().split("-")[0];
            pwd = cookie.getValue().split("-")[1];

            //再一次存起来（备用）
            request.setAttribute("uname", name);
            request.setAttribute("pwd", pwd);
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${ctx}/css/loginjj.css">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.js"></script>
    <script>
        $(function () {
            $("#submit_log").click(function () {
                $("#form1").attr("action","${ctx}/login");
                $("form").submit();
            });
            $("#submit_reg").click(function () {
                $("#form1").attr("action","${ctx}/saveUser");
                $("form").submit();
            });
        })
    </script>
</head>
<body>
<!--登录界面-->
<form id="form1" action="" method="post">
    <div class="login" id="login">
        <div class="logHead">
            <img src="${ctx}/img/img_user/user_image.jpg" class="round_icon" alt="">
            <p>欢迎登陆纠纠</p>
        </div>
        <div class="logContent">

            <div class="errormsg">
                <label style="color: red; font-size:20px; text-align: center;">${error}</label><br>
            </div>
            <div class="inp">
                <input type="text" placeholder="username" name="username"
                       value="${user.username}${uname}"
                       style="border-radius: 20px">
            </div>

            <div class="inp">
                <input type="password" placeholder="password" name="password"
                       value="${user.password}${pwd}"
                       style="border-radius:20px;">
            </div>
            <div class="remember" style="color:white;">
                <input type="checkbox" name="remember" value="yes" checked="checked">记住密码<br>
            </div>
            <div class="sub">
                <input id="submit_log" type="submit" value="登录" style="border-radius:20px;">

            </div>
        </div>
        <a href="javascript:;" id="ain">点击注册</a>
    </div>
    <!--注册界面-->
    <div class="register" id="register">
        <div class="regHead"><p>欢迎注册纠纠</p></div>
        <div class="regContent">
            <div class="inp"><input type="text" placeholder="请输入用户名" name="username"
                                    value="${user.username}"
                                    style="border-radius: 20px"></div>
            <div class="inp"><input type="password" placeholder="请输入密码" name="password"
                                    value="${user.password}"
                                    style="border-radius: 20px"></div>
            <div class="inp"><input type="text" placeholder="请输入常用邮箱" name="email"
                                    value="${user.email}"
                                    style="border-radius: 20px"></div>
            <div class="inp">
                <div class="code"><input type="text" placeholder="请输入验证码" value=""
                                         style="border-radius: 20px"></div>
                <div class="photo"><img
                        src="" alt=""></div>
            </div>
            <div class="sub">
                <input id="submit_reg" type="submit" value="立即注册" style="border-radius:20px;">

            </div>
            <a href="javascript:;" id="areg">点击登陆</a>
        </div>
    </div>
</form>
<script type="text/javascript">
    var ain = document.getElementById('ain');
    var areg = document.getElementById('areg');
    var ologin = document.getElementById('login');
    var oregister = document.getElementById('register');
    ain.onclick = function () {
        ologin.classList.remove("move3");
        ologin.classList.toggle("move1");
        oregister.classList.remove("move4");
        oregister.classList.toggle("move2");
        ologin.opacity = "0.1";
    };
    areg.onclick = function () {
        ologin.classList.remove("move1");
        ologin.classList.toggle("move3");
        oregister.classList.remove("move2");
        oregister.classList.toggle("move4");
        oregister.opacity = "0.1";

    };
</script>

</body>
</html>