<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    pageContext.setAttribute("ctx", contextPath);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${ctx}/css/page.css">
    <link rel="stylesheet" href="${ctx}/css/pageStyle.css">
    <%--<script type="text/javascript" src="${ctx}/js/paging.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>--%>
</head>
<body>
<!--顶部-->
<div class="header">
    <div class="heaLeft">
        <h1>Entangler</h1>
    </div>
    <div class="heaRight">
        <ul>
            <li><a href="#" target="_blank">我的首页</a></li>
            <li><a href="#" target="_blank">个人中心</a></li>
            <li><a href="#" target="_blank">注册/登录</a></li>
        </ul>
    </div>
</div>
<!--内容-->
<div class="content">
    <!--左边-->
    <div class="con_left">
        <!--上传内容-->
        <div class="upload">
            <!--用户头像-->
            <div class="head_portrait"><img src="${ctx}/img/img_user/01.jpg" alt=""></div>
            <!--上传文字图片-->
            <div class="up_content">
                <div class="inp"><label></label><textarea name="input" cols="30" rows="4">说点什么吧。。。。</textarea>
                    <div class="picture"><a href="#" title="上传照片"></a></div>
                </div>
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
        <!--浏览-->
        <div>
            <div class="browse1">
                <!--其他用户头像-->
                <div class="head_portrait"><img src="${ctx}/img/img_user/01.jpg" alt=""></div>
                <div class="bro_content">
                    <p class="bro_content_username">用户名</p>
                    <p class="bro_content_time">时间：时间</p>
                    <p class="bro_content_article">文章</p>
                    <!--浏览图像-->
                    <div class="img">
                        <ul>
                            <li><img src="${ctx}/img/img_user/01.jpg" alt=""></li>
                            <li><img src="${ctx}/img/img_user/02.jpg" alt=""></li>
                            <li><img src="${ctx}/img/img_user/03.jpg" alt=""></li>
                            <li><img src="${ctx}/img/img_user/04.jpg" alt=""></li>
                        </ul>
                    </div>
                    <!--评论-->
                    <div class="bro_content_comment">
                        <!--评论内容-->
                        <div class="bro_content_comment_left">
                            <textarea name="content" cols="20" rows="2"></textarea>
                        </div>
                        <!--提交按钮-->
                        <div class="bro_content_comment_right">
                            <button>提交</button>
                        </div>
                    </div>
                    <!--评论内容显示-->
                    <!--<div class="bro_content_comment_submit">-->
                    <!--<div class="bro_content_comment_submit_left"><img src="images1/01.jpg" alt=""></div>-->
                    <!--<div class="bro_content_comment_submit_right">-->
                    <!--<p class="right_username">用户名</p>-->
                    <!--<p class="right_time">时间：时间</p>-->
                    <!--<p class="right_article">评论的具体内容</p>-->
                    <!--</div>-->
                    <!--</div>-->
                    <!--<div class="bro_content_comment_submit">-->
                    <!--<div class="bro_content_comment_submit_left"><img src="images1/01.jpg" alt=""></div>-->
                    <!--<div class="bro_content_comment_submit_right">-->
                    <!--<p class="right_username">用户名</p>-->
                    <!--<p class="right_time">时间：时间</p>-->
                    <!--<p class="right_article">评论的具体内容 </p>-->
                    <!--</div>-->
                    <!--</div>-->
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
            <div class="bro_content_comment_submit">
                <div class="bro_content_comment_submit_left"><img src="${ctx}/img/img_user/01.jpg"
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
        <div>
            <div class="browse1">
                <!--其他用户头像-->
                <div class="head_portrait"><img src="${ctx}/img/img_user/01.jpg" alt=""></div>
                <div class="bro_content">
                    <p class="bro_content_username">用户名</p>
                    <p class="bro_content_time">时间：时间</p>
                    <p class="bro_content_article">文章</p>
                    <!--浏览图像-->
                    <div class="img">
                        <ul>
                            <li><img src="${ctx}/img/img_user/01.jpg" alt=""></li>
                            <li><img src="${ctx}/img/img_user/02.jpg" alt=""></li>
                            <li><img src="${ctx}/img/img_user/03.jpg" alt=""></li>
                            <li><img src="${ctx}/img/img_user/04.jpg" alt=""></li>
                        </ul>
                    </div>
                    <!--评论-->
                    <div class="bro_content_comment">
                        <!--评论内容-->
                        <div class="bro_content_comment_left">
                            <textarea name="content" id="" cols="20" rows="2"></textarea>
                        </div>
                        <!--提交按钮-->
                        <div class="bro_content_comment_right">
                            <button>提交</button>
                        </div>
                    </div>
                    <!--评论内容显示-->
                    <!--<div class="bro_content_comment_submit">-->
                    <!--<div class="bro_content_comment_submit_left"><img src="images1/01.jpg" alt=""></div>-->
                    <!--<div class="bro_content_comment_submit_right">-->
                    <!--<p class="right_username">用户名</p>-->
                    <!--<p class="right_time">时间：时间</p>-->
                    <!--<p class="right_article">评论的具体内容</p>-->
                    <!--</div>-->
                    <!--</div>-->
                    <!--<div class="bro_content_comment_submit">-->
                    <!--<div class="bro_content_comment_submit_left"><img src="images1/01.jpg" alt=""></div>-->
                    <!--<div class="bro_content_comment_submit_right">-->
                    <!--<p class="right_username">用户名</p>-->
                    <!--<p class="right_time">时间：时间</p>-->
                    <!--<p class="right_article">评论的具体内容 </p>-->
                    <!--</div>-->
                    <!--</div>-->
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
            <div class="bro_content_comment_submit">
                <div class="bro_content_comment_submit_left"><img src="${ctx}/img/img_user/01.jpg"
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
        <%--<div>
            <div class="browse1">
                <!--其他用户头像-->
                <div class="head_portrait"><img src="${ctx}/img/img_user/01.jpg" alt=""></div>
                <div class="bro_content">
                    <p class="bro_content_username">用户名</p>
                    <p class="bro_content_time">时间：时间</p>
                    <p class="bro_content_article">文章</p>
                    <!--浏览图像-->
                    <div class="img">
                        <ul>
                            <li><img src="${ctx}/img/img_user/01.jpg" alt=""></li>
                            <li><img src="${ctx}/img/img_user/02.jpg" alt=""></li>
                            <li><img src="${ctx}/img/img_user/03.jpg" alt=""></li>
                            <li><img src="${ctx}/img/img_user/04.jpg" alt=""></li>
                        </ul>
                    </div>
                    <!--评论-->
                    <div class="bro_content_comment">
                        <!--评论内容-->
                        <div class="bro_content_comment_left">
                            <textarea name="content" cols="20" rows="2"></textarea>
                        </div>
                        <!--提交按钮-->
                        <div class="bro_content_comment_right">
                            <button>提交</button>
                        </div>
                    </div>
                    <!--评论内容显示-->
                    <!--<div class="bro_content_comment_submit">-->
                    <!--<div class="bro_content_comment_submit_left"><img src="images1/01.jpg" alt=""></div>-->
                    <!--<div class="bro_content_comment_submit_right">-->
                    <!--<p class="right_username">用户名</p>-->
                    <!--<p class="right_time">时间：时间</p>-->
                    <!--<p class="right_article">评论的具体内容</p>-->
                    <!--</div>-->
                    <!--</div>-->
                    <!--<div class="bro_content_comment_submit">-->
                    <!--<div class="bro_content_comment_submit_left"><img src="images1/01.jpg" alt=""></div>-->
                    <!--<div class="bro_content_comment_submit_right">-->
                    <!--<p class="right_username">用户名</p>-->
                    <!--<p class="right_time">时间：时间</p>-->
                    <!--<p class="right_article">评论的具体内容 </p>-->
                    <!--</div>-->
                    <!--</div>-->
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
            <div class="bro_content_comment_submit">
                <div class="bro_content_comment_submit_left"><img src="${ctx}/img/img_user/01.jpg"
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
            <div class="bro_content_comment_submit">
                <div class="bro_content_comment_submit_left"><img src="${ctx}/img/img_user/01.jpg"
                                                                  alt=""></div>
                <div class="bro_content_comment_submit_right">
                    <p class="right_username">用户名</p>
                    <p class="right_time">时间：时间</p>
                    <p class="right_article">评论的具体内容</p>
                </div>
            </div>
        </div>--%>
        <div id="page" class="page_div">aaa</div>
    </div>

    <div class="con_right"></div>
</div>
<!--分页-->

<script src="${ctx }/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/js/paging.js"></script>
<script>
    //分页
    $("#page").paging({
        pageNo:3,<%--${pageBean.currentPage}--%>
        totalPage: 5,<%--${pageBean.totalPage}--%>
        totalSize: 6,<%--${pageBean.totalCount}--%>
        callback: function (num) {
            $(window).attr('location', '${ctx }/getPageData');
        }
    });
</script>
</body>
</html>