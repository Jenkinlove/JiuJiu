<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/webuploader.css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/webuploader.js"></script>
    <script type="text/javascript">
        jQuery(function () {
            var $ = jQuery,
                $list = $('#fileList'),
                //优化retina,在retina下这个值是2
                ratio = window.devicePixelRatio || 1,
                //缩略图大小
                thumbnailWidth=100*ratio,
                thumbnailHeight=100*ratio,
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
                threads:'30',  //同时运行30个线程传输
                fileNumLimit:'10',//文件总数量只能选择10个

                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                pick: {
                    id: '#filePicker',  //选择文件的按钮
                    multiple: true      //允许可以同时选择多个文件
                },

                quality:100,
                //限制传输文件类型，accept可以不写（用于显示文件类型筛选）
                // 只允许选择图片文件。
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
                    mimeTypes: 'image/*'
                }
            });

            // 当有文件添加进来的时候
            uploader.on( 'fileQueued', function( file ) {
                var $li = $(
                    '<div id="' + file.id + '" class="file-item">' +
                    '<img>' +
                    '</div>'
                    ),
                    $img = $li.find('img');


                // $list为容器jQuery实例
                $list.append( $li );

                // 创建缩略图
                // 如果为非图片文件，可以不用调用此方法。
                // thumbnailWidth x thumbnailHeight 为 100 x 100
                uploader.makeThumb( file, function( error, src ) {
                    if ( error ) {
                        $img.replaceWith('<span>不能预览</span>');
                        return;
                    }

                    $img.attr( 'src', src );
                }, thumbnailWidth, thumbnailHeight );
            });

            // 文件上传过程中创建进度条实时显示。
            uploader.on( 'uploadProgress', function( file, percentage ) {
                var $li = $( '#'+file.id ),
                    $percent = $li.find('.progress span');

                // 避免重复创建
                if ( !$percent.length ) {
                    $percent = $('<p class="progress"><span></span></p>')
                        .appendTo( $li )
                        .find('span');
                }

                $percent.css( 'width', percentage * 100 + '%' );
            });

            // 文件上传成功，给item添加成功class, 用样式标记上传成功。
            uploader.on( 'uploadSuccess', function( file,response ) {
                $( '#'+file.id ).addClass('upload-state-done');
            });

            // 文件上传失败，显示上传出错。
            //file:文件对象
            //code:出错代码
            uploader.on( 'uploadError', function( file,code ) {
                var $li = $( '#'+file.id ),
                    $error = $li.find('div.error');

                // 避免重复创建
                if ( !$error.length ) {
                    $error = $('<div class="error"></div>').appendTo( $li );
                }

                $error.text('上传失败');
            });

            // 完成上传完了，成功或者失败，先删除进度条。
            uploader.on( 'uploadComplete', function( file ) {
                $( '#'+file.id ).find('.progress').remove();
            });


        });
    </script>
</head>
<body>
<%--<form action="${pageContext.request.contextPath}/upload" method="post" enctype="multipart/form-data">
    <input type="file" name="file">
    <input type="submit" value="上传">
</form>--%>

<img src="${pageContext.request.contextPath}/upload/${fileName}" alt="" style="height: 200px;">

<hr>

<!--dom结构部分-->
<div id="uploader-demo">
    <!--用来存放item-->
    <div id="fileList" class="uploader-list"></div>
    <div id="filePicker" >选择图片</div>
</div>


</div>



</body>
</html>
