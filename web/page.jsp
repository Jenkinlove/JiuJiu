<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.UUID" %>
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
    <link rel="stylesheet" href="${ctx}/css/page.css">
    <link rel="stylesheet" href="${ctx}/css/pageStyle.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/webuploader.css"/>
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/webuploader.js"></script>
    <script type="text/javascript">
        jQuery(function () {
            var $ = jQuery,
                $list = $('#fileList'),
                //优化retina,在retina下这个值是2
                ratio = window.devicePixelRatio || 1,
                //缩略图大小
                thumbnailWidth = 100 * ratio,
                thumbnailHeight = 100 * ratio,
                //Web Uploader实例uploader；
                uploader;
            //初始化Web Uploader
            uploader = WebUploader.create({

                // 选完文件后，是否自动上传。
                auto: false,

                // swf文件路径
                swf: '${pageContext.request.contextPath}/js/Uploader.swf',

                // 文件接收服务端。
                server: '${pageContext.request.contextPath}/upload',
                fileVal: 'file',
                threads: '30',  //同时运行30个线程传输
                fileNumLimit: '4',//文件总数量只能选择10个

                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                pick: {
                    id: '#filePicker',  //选择文件的按钮
                    multiple: true      //允许可以同时选择多个文件
                },

                quality: 100,
                //限制传输文件类型，accept可以不写（用于显示文件类型筛选）
                // 只允许选择图片文件。
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
                    mimeTypes: 'image/*'
                }
            });

            // 当有文件添加进来的时候
            uploader.on('fileQueued', function (file) {
                var $li = $(
                    '<li> ' +
                    '<img >' +
                    '<input type="text" class="info" name="en_img" style="opacity: 0;" value="'+file.name+'">'+
                    '</li>'

                    /* '<div id="' + file.id + '" class="file-item">' +
                     '<img>' +
                     '</div>'*/
                    ),
                    $img = $li.find('img');

                /*<ul>
                    <li><img></li>
                </ul>*/

                // $list为容器jQuery实例
                $list.append($li);

                // 创建缩略图
                // 如果为非图片文件，可以不用调用此方法。
                // thumbnailWidth x thumbnailHeight 为 100 x 100
                uploader.makeThumb(file, function (error, src) {
                    if (error) {
                        $img.replaceWith('<span>不能预览</span>');
                        return;
                    }

                    $img.attr('src', src);
                }, thumbnailWidth, thumbnailHeight);
            });

            // 文件上传过程中创建进度条实时显示。
            uploader.on('uploadProgress', function (file, percentage) {
                var $li = $('#' + file.id),
                    $percent = $li.find('.progress span');

                // 避免重复创建
                if (!$percent.length) {
                    $percent = $('<p class="progress"><span></span></p>')
                        .appendTo($li)
                        .find('span');
                }

                $percent.css('width', percentage * 100 + '%');
            });

            // 文件上传成功，给item添加成功class, 用样式标记上传成功。
            uploader.on('uploadSuccess', function (file, response) {
                $('#' + file.id).addClass('upload-state-done');
            });

            // 文件上传失败，显示上传出错。
            //file:文件对象
            //code:出错代码
            uploader.on('uploadError', function (file, code) {
                var $li = $('#' + file.id),
                    $error = $li.find('div.error');

                // 避免重复创建
                if (!$error.length) {
                    $error = $('<div class="error"></div>').appendTo($li);
                }

                $error.text('上传失败');
            });

            // 完成上传完了，成功或者失败，先删除进度条。
            uploader.on('uploadComplete', function (file) {
                $('#' + file.id).find('.progress').remove();
            });

            //绑定提交事件
            $("#submit_img").click(function () {
                console.log("上传...");
                uploader.upload();  //执行手动提交
                console.log("上传完成");
            });




        });
    </script>
    <script>
        $(function () {
            $("#submit_up").click(function () {
                $("#form1").attr("action", "${ctx}/saveEntangler");
                $("form").submit();
            });

            var content=document.getElementById('all');
            var comment=content.getElementsByTagName('a');
            var commentH3=content.getElementsByTagName("h3");
            var commentTextarea=content.getElementsByTagName("textarea");

            for(var i=0;i<comment.length;i++){
                comment[i].index=i;
                comment[i].onclick=function () {
                    comment[this.index].href="${ctx}/saveEntanglerComment/"+commentH3[this.index].innerHTML+"/"+commentTextarea[this.index+1].value;
                }
            }



        })
    </script>
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
            <li><a href="${ctx}/personPage" >个人中心</a></li>
            <li>
                <c:if test="${empty sessionScope.resUser}">
                    <a href="${ctx}/login_register.jsp">注册/登录</a>
                </c:if>
                <c:if test="${!empty sessionScope.resUser}">
                   <%-- <img class="userimg" src="${ctx}/img/img_user/${empty
                    sessionScope.resUser.uimage ?
                     '01.jpg':
                     sessionScope.resUser.uimage}"
                         alt="">--%>
                    <a href="${ctx}/loginout" style="color: red;">退出</a>
                </c:if>

            </li>
        </ul>
    </div>
</div>
<!--内容-->
<form id="form1" action="" method="post" enctype="">
    <div class="content" id="all">
        <!--左边-->
        <div class="con_left">
            <!--上传内容-->
            <div class="upload">
                <!--用户头像-->
                <div class="head_portrait"><img src="${ctx}/img/img_user/${sessionScope.resUser.uimage}" alt=""></div>
                <!--上传文字图片-->

                <div class="up_content">
                    <div class="inp"><textarea name="en_aritle" cols="30"
                                               rows="4">说点什么吧。。。。</textarea>
                        <div class="picture" id="filePicker"></div>
                    </div>
                    <div class="img">
                        <ul id="fileList"></ul>

                        <%--<ul>
                            <li><img src="${ctx}/img/img_user/01.jpg" alt=""></li>
                            <li><img src="${ctx}/img/img_user/02.jpg" alt=""></li>
                            <li><img src="${ctx}/img/img_user/03.jpg" alt=""></li>
                            <li><img src="${ctx}/img/img_user/04.jpg" alt=""></li>
                        </ul>--%>
                    </div>
                    <div class="up_content_check"><span>是否设为私密</span><input type="checkbox"
                                                                            class="up_checkbox"
                                                                            name="isprivacy"
                                                                            value="1">
                    </div>
                    <div class="up_content_submit">
                        <input id="submit_img" type="button" value="上传图片">
                        <input id="submit_up" type="submit" value="上传纠结">
                    </div>
                </div>


            </div>
            <!--浏览的内容-->
            <!--文字和图片-->
            <c:forEach items="${entanglerList}" var="entangler">
                <div class="browse1" id="updiv">
                    <!--其他用户头像-->
                    <div class="head_portrait"><img src="${ctx}/img/img_user/${entangler.user.uimage}"
                                                    alt=""></div>
                    <div class="bro_content">
                        <p class="bro_content_username">${entangler.user.username}</p>
                        <p class="bro_content_time">
                            <fmt:formatDate value="${entangler.en_date}" pattern="yyyy-MM-dd"/>
                        </p>
                        <p class="bro_content_article">${entangler.en_aritle}</p>
                        <!--浏览图像-->
                        <div class="img">
                            <ul>
                                <c:forTokens items="${entangler.en_img}" delims="," var="img">
                                    <li><img src="${ctx}/img/img_user/${img}" alt=""></li>
                               </c:forTokens>
                            </ul>
                        </div>
                        <!--评论-->
                        <div class="bro_content_comment">
                            <!--评论内容-->
                            <div class="bro_content_comment_left">
                                <textarea   class="textarea_comment" name="en_comment" cols="20"
                                            rows="2"></textarea>
                            </div>
                            <h3 style="display: none;" >${entangler.en_id}</h3>
                            <%--<input type="text" name="entangler_id" value="${entangler.en_id}"
                                   style="display: none">--%>
                            <!--提交按钮-->
                            <div class="bro_content_comment_right">
                                <a href="#" id="submit_com">提交</a>
                                <%--<input type="button" value="提交">--%>
                                    <%--<button>提交</button>--%>
                            </div>
                        </div>

                    </div>
                </div>
                <!--发表的评论内容-->
                <c:forEach items="${entangler.entanglerComments}"
                           var="entanglerComment">
                    <div class="bro_content_comment_submit">
                        <div class="bro_content_comment_submit_left "><img
                                src="${ctx}/img/img_user/${entanglerComment.user.uimage}" alt=""></div>
                        <div class="bro_content_comment_submit_right">
                            <p class="right_username">${entanglerComment.user.username}</p>
                            <p class="right_time">
                                <fmt:formatDate value="${entanglerComment.ec_date}" pattern="yyyy-MM-dd"/>

                            </p>
                            <p class="right_article">${entanglerComment.en_comment}</p>
                        </div>
                    </div>
                </c:forEach>

            </c:forEach>



            <%--<!--浏览的内容-->
            <!--文字和图片-->
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

                </div>
            </div>
            <!--发表的评论内容-->
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
            </div>--%>

            <!--分页-->
            <div id="page" class="page_div">aaa</div>
        </div>

        <div class="con_right">
            <div class="con_right_top">
                <ul>
                    <li>
                        <div class="head_portrait"><img src="${ctx}/img/img_user/01.jpg" alt="">
                        </div>
                        <p>${sessionScope.resUser.username}</p>
                    </li>
                    <li><a href="#">纠结症测试</a></li>
                    <li><a href="#">私信</a></li>
                    <li><a href="#">关注</a></li>
                </ul>
            </div>
            <div class="con_right_bottom">
                <a href="${ctx}/answer">进入答案之书</a>
            </div>
        </div>
    </div>
</form>
<script src="${ctx }/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/js/paging.js"></script>
<script>
    //分页
    $("#page").paging({
        pageNo: ${pageBean.currentPage}, <%--${pageBean.currentPage}--%>
        totalPage: ${pageBean.totalPage}, <%--${pageBean.totalPage}--%>
        totalSize: ${pageBean.totalCount},
        callback: function (num) {
            $(window).attr('location', '${ctx }/getPageData/'+num);
        }
    });
</script>

</body>
</html>