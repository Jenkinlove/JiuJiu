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
    <title>Title</title>

    <link rel="stylesheet" href="${ctx}/css/personal_center.css">
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <script>
        $(function () {
            var content = document.getElementById('all');
            var comment = content.getElementsByTagName('a');
            var commentH3 = content.getElementsByTagName("h3");

            for (var i = 0; i < comment.length; i++) {
                comment[i].index = i;
                comment[i].onclick = function () {
                    comment[this.index].href = "${ctx}/deleteEntangler/" +
                        commentH3[this.index].innerHTML;
                    }
                }
            })
        </script>

    </head>
    <body>
    <div class="top">
        <div class="head_portrait">
            <img src="${ctx}/img/img_user/${sessionScope.resUser.uimage}" alt="">
        </div>
        <ul>
            <li><a href="#" class="username" title="编辑资料">${sessionScope.resUser.username}</a></li>
            <li><a href="${ctx}/getPageData/1" class="backpage">我的首页</a></li>
        </ul>

        <p>welcome to <span>jiujiu</span> house</p>
    </div>
    <div id="all">
        <c:forEach items="${entanglerList}" var="entangler">
            <div class="content">
                <div class="con_left">
                    <!--浏览的内容-->
                    <!--文字和图片-->
                    <div class="browse1">
                        <!--其他用户头像-->
                        <div class="head_portrait"><img
                                src="${ctx}/img/img_user/${entangler.user.uimage}"
                                alt="">
                            <p><fmt:formatDate value="${entangler.en_date}"
                                               pattern="yyyy-MM-dd"/></p></div>
                        <div class="bro_content">
                            <h3 style="display: none;">${entangler.en_id}</h3>
                            <a href="#"></a>
                            <p class="bro_content_article">${entangler.en_aritle}</p>

                            <!--浏览图像-->
                            <div class="img">
                                <ul>
                                    <c:forTokens items="${entangler.en_img}" var="img" delims=",">
                                        <li><img src="${ctx}/upload/${img}" alt=""></li>
                                    </c:forTokens>
                                </ul>
                            </div>

                        </div>
                    </div>
                    <!--发表的评论内容-->
                    <c:forEach items="${entangler.entanglerComments}" var="entanglerComment">
                        <div class="bro_content_comment_submit">
                            <div class="bro_content_comment_submit_left ">
                                <img src="${ctx}/img/img_user/${entanglerComment.user.uimage}" alt="">
                            </div>
                            <div class="bro_content_comment_submit_right">
                                <p class="right_username">${entanglerComment.user.username}</p>
                                <p class="right_time">
                                    <fmt:formatDate value="${entanglerComment.ec_date}"
                                                    pattern="yyyy-MM-dd"/>
                                </p>
                                <p class="right_article">${entanglerComment.en_comment}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:forEach>
    </div>
    <%--<div class="content">
        <div class="con_left">
            <!--浏览的内容-->
            <!--文字和图片-->
            <div class="browse1">
                <!--其他用户头像-->
                <div class="head_portrait"><img src="${ctx}/img/img_bd/15.jpg" alt="">
                    <p>2019.03.13</p></div>
                <div class="bro_content">
                    <p class="bro_content_article">文章
                        <a href="#"></a></p>
                    <!--浏览图像-->
                    <div class="img">
                        <ul>
                            <li><img src="${ctx}/img/img_user/01.jpg" alt=""></li>
                            <li><img src="${ctx}/img/img_user/02.jpg" alt=""></li>
                            <li><img src="${ctx}/img/img_user/03.jpg" alt=""></li>
                            <li><img src="${ctx}/img/img_user/04.jpg" alt=""></li>
                        </ul>
                    </div>

                </div>
            </div>
            <!--发表的评论内容-->
            <div class="bro_content_comment_submit">
                <div class="bro_content_comment_submit_left "><img src="${ctx}/img/img_user/01.jpg"
                                                                   alt=""></div>
                <div class="bro_content_comment_submit_right">
                    <p class="right_username">用户名</p>
                    <p class="right_time">时间：时间</p>
                    <p class="right_article">评论的具体内容</p>
                </div>
            </div>
            <div class="bro_content_comment_submit">
                <div class="bro_content_comment_submit_left"><img src="${ctx}/img/img_user/01.jpg"
                                                                  alt=""></div>
                <div class="bro_content_comment_submit_right">
                    <p class="right_username">用户名</p>
                    <p class="right_time">时间：时间</p>
                    <p class="right_article">评论的具体内容</p>
                </div>
            </div>
        </div>
    </div>--%>

</body>
</html>