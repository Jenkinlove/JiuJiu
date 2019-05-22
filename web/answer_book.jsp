<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String contextPath = request.getContextPath();
    pageContext.setAttribute("ctx", contextPath);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>答案之书</title>
    <link rel="stylesheet" href="${ctx}/css/answer_book.css">


</head>
<body>
<!--标题-->
<div class="title"><img src="${ctx}/img/img_bd/title7.jpg" alt=""><p>Answer of  BOOK</p></div>
<!--规则-->
<div class="rule"><button>  《答案之书》使用说明</button>
    <p class="rule_one">1.首先闭上眼睛。 </p>
    <p class="rule_two"> 2.用5至10s的时间集中思考你的问题。例如：“他喜欢我吗？”或“我需要换个工作吗？”</p>
    <p class="rule_three">    3.在想象或说出你问题的同时（每次只能有一个问题），将鼠标放到书本的封面上。</p>
    <p class="rule_four"> 4.打开书，你要寻找的答案就在那里。</p>
    <p class="rule_five">     5.遇到任何问题，你都可以翻开它。</p>






</div>
<!--答案之书-->
<div class="answer_book">
<ul>
    <!--左侧-->
    <li class="book_left"></li>
    <!--看不见的上右两侧-->
    <li></li>
    <li></li>
    <!--底侧-->
    <li class="book_bottom"></li>
    <!--书本背面-->
    <li class="book_back"></li>
    <!--书本翻开内容-->
    <li class="book_top_content">
        <p>${answer.answer}</p>
    </li>
    <!--封面-->
    <li class="book_top1"></li>
</ul></div>

</body>

</html>
