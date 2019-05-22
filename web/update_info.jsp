<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
    pageContext.setAttribute("ctx", contextPath);

%>
<!DOCTYPE html>
<html class="no-js lt-ie9 lt-ie8 lt-ie7">
<html class="no-js lt-ie9 lt-ie8">
<html class="no-js lt-ie9">
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>信息修改</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co"/>
    <meta name="keywords"
          content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive"/>
    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:card" content=""/>

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet'
          type='text/css'>

    <link rel="stylesheet" href="${ctx}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/css/animate2.css">
    <link rel="stylesheet" href="${ctx}/css/style2.css">
<%--    <link rel="stylesheet" type="text/css" href="${ctx}/css/webuploader.css"/>--%>
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/webuploader.js"></script>

    <!-- Modernizr JS -->
    <script src="${ctx}/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

    <script>
        $(function () {
            $("#submit_up").click(function () {
                $("#form1").attr("action", "${ctx}/upload");
                $("#form1").attr("enctype", "multipart/form-data");
                $("form").submit();
            });
            $("#submit_update").click(function () {
                $("#form1").attr("action", "${ctx}/updateInfo");
                $("#form1").attr("enctype", "application/x-www-form-urlencoded");
                $("form").submit();
            });

        })
    </script>
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
                auto: true,

                // swf文件路径
                swf: '${pageContext.request.contextPath}/js/Uploader.swf',

                // 文件接收服务端。
                server: '${pageContext.request.contextPath}/upload',
                fileVal: 'file',
                threads: '30',  //同时运行30个线程传输
                fileNumLimit: '1',//文件总数量只能选择10个

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
                    '<div>' +
                    '<img style="height:100px;width: 100px;border-radius: 50px">' +
                    '<input type="text" class="info" name="uimage" style="opacity: 0;" value="' +
                    file.name + '">'+
                    '</div>'

                    <%--<img src="${ctx}/img/img_user/${sessionScope.resUser.uimage}"
                         style="height:100px;width: 100px;border-radius: 50px"
                         alt=""><br>--%>
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


</head>
<body class="style-3">
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <!-- Start Sign In Form -->
            <form action="" enctype="" id="form1"
                  class="fh5co-form animate-box"
                  data-animate-effect="fadeInRight" method="post">
                <h2>个人信息修改</h2>
                <c:if test="${errors!=null||error!=null}">
                    <p style="font-size: 20px;color: #dd356e">错误提示:</p>
                </c:if>
                <c:if test="${error!=null}">
                    <p style="font-size: 20px;color: #dd356e">${error}</p>
                </c:if>
                <c:forEach var="error" items="${errors}">
                    <p style="font-size: 17px;color: #dd356e">${error.defaultMessage}</p>
                </c:forEach>
                <div class="form-group">
                    <div class="alert alert-success" role="alert">请填写需要修改项</div>
                </div>
                <div class="form-group">
                    <label style="color: #000000;">用户头像</label><br>
                    <%--<img src="${ctx}/img/img_user/${sessionScope.resUser.uimage}"
                         style="height:100px;width: 100px;border-radius: 50px"
                         alt=""><br>--%>
                    <div id="fileList"></div>
                    <div class="file-box2" style="margin-top: 15px;">
                        <div  id="filePicker" style="display:inline-block;">选择文件</div>
                    </div>

<%--                    <div class="file-box" style="margin-top: 15px;">--%>
<%--                        <input type="submit" class="file-btn" id="submit_up"/>--%>
<%--                        上传文件--%>
<%--                    </div>--%>
                    <%--<input type="text" class="form-control" readonly="readonly" name="account"
                           id="account" value="${user.account}" autocomplete="off">--%>
                </div>
                <div class="form-group">
                    <label for="name" style="color: #000000;">用户名</label>
                    <input type="text" class="form-control" name="username" id="name"
                           value="${sessionScope.resUser.username}" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="email" style="color: #000000;">邮箱</label>
                    <input type="email" name="email" class="form-control" id="email"
                           value="${sessionScope.resUser.email}" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="password" style="color: #000000;">密码(如果要修改密码请在此填写新密码)</label>
                    <input type="password" name="password" class="form-control" id="password"
                           value="${sessionScope.resUser.password}" autocomplete="off">
                </div>

                <div class="form-group" style="text-align:center;">
                    <input type="submit" id="submit_update" value="点击修改" class="btn btn-primary">
                </div>
            </form>
            <!-- END Sign In Form -->
        </div>
    </div>
    <div class="row" style="padding-top: 80px; clear: both;">
    </div>

</div>

<!-- Placeholder -->
<script src="${ctx}/js/jquery.placeholder.min.js"></script>
<!-- Waypoints -->
<script src="${ctx}/js/jquery.waypoints.min.js"></script>
<!-- Main JS -->
<script src="${ctx}/js/main2.js"></script>

</body>
</html>


