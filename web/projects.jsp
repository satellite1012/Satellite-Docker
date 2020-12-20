<%@ page import="java.time.LocalDateTime" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Satellite | Projects</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Toàn bộ sản phẩm và code do mình viết ra, một số sẽ tính phí nếu tải source code về">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta name="author" content=Đoàn Đức Tín>
    <jsp:include page="Common/_css.jsp"/>
    <style>
        .title{
            margin: 50px auto 0 auto;
            text-align:center;
            color: #fff;
            font-size: 32px;
        }

        .gallery.box{
            height:450px;
            margin: 0 auto;
            overflow: hidden;
            border-radius: 1%;
            border: 10px #fff solid;
        }

        .gallery .card{
            position: relative;
        }

        .gallery .background, .gallery .column{
            height: 450px;
        }

        .gallery .column{
            width: 20%;
            float: left;
        }

        .gallery .column.col1{
            background-color: #325C7D;
        }

        .gallery .column.col2{
            background-color: #6C5B7B;
        }

        .gallery .column.col3{
            background-color: #C26D85;
        }

        .gallery .column.col4{
            background-color: #EB7180;
        }
        .gallery .column.col5{
            background-color: #F5B195;
        }

        .gallery .overlay{
            position: absolute;
            top:0;
            bottom: 0;
            left:0;
            right: 0;
            opacity: 0;
            background-color: #000;
            -webkit-transition: opacity 0.35s;
            -o-transition: opacity 0.35s;
            transition: opacity 0.35s;
        }

        .gallery .info,
        .gallery .foot{
            -webkit-transition: bottom 0.35s;
            -o-transition: bottom 0.35s;
            transition: bottom 0.35s;
        }

        .gallery .info{
            position: absolute;
            bottom: -35px;
            width: 100%;
        }

        .gallery .info h2 a{
            color: #fff;
            display: block;
            text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.4);
            text-decoration:none;
        }

        .gallery .info h2{
            line-height: 24px;
            font-size: 18px;
            padding: 0 10px;
            font-weight: 400;
        }

        .gallery .foot{
            height: 35px;
            bottom: -35px;
            position: relative;
            color: #fff;
            padding: 0 10px;

        }

        .gallery .foot .social{
            float: right;
            color: #fff;
            font-size: 20px;
            margin-left: 20px;
        }

        .gallery .foot .line{
            height: 2px;
            display: block;
            margin: 10px 0;
            background-color: #fff;
            margin-top: 20px;
            width: 0%;
            transition: width 0.6s;
        }

        .gallery .date{
            font-weight: 300;
        }

        .gallery .fa-camera-retro{
            top: 0;
            left: 0;
            padding: 10px 10px;
            position: absolute;
            color: #fff;
            font-size: 24px;
            z-index: 1;
            transition: font-size 0.35s;
        }

        /* All hovers here! */
        .gallery:hover .info,
        .gallery:hover .foot{
            bottom:10px;
        }

        .gallery:hover .overlay{
            opacity: 0.5;
        }

        .gallery:hover .foot .line{
            width: 100%;
        }

        .gallery:hover .fa-camera-retro{
            font-size:32px;
        }
        .mytext {
            background: linear-gradient(to right, #f12711 0%,  #f5af19  100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .mytext2 {
            background: linear-gradient(to right, #009FFF 0%,  #ec2F4B  100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .mytext3 {
            background: linear-gradient(to right, #6D6027 0%,  #D3CBB8 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
    </style>
</head>
<body>

<!--Facebook-->
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0" nonce="4TU3IejE"></script>
<div style="z-index: 999; position: fixed;bottom: 20px;left: 28px" class="fb-share-button" data-href="http://satellite-fpt.azurewebsites.net/projects.action" data-layout="button" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fsatellite-fpt.azurewebsites.net%2Fprojects.action&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a></div>

<jsp:include page="Common/header.jsp"/>

        <div style="padding-top:120px;padding-bottom:90px;background-image: url('Resource/img/background.jpg');background-size: cover;background-blend-mode: darken"
             data-stellar-background-ratio="0.5">
            <div class="container">
                <br>
                <div class="row align-items-center justify-content-center text-center">

                    <!--JAVA CODE-->
                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                    <div class="box gallery" style="border: 6px solid orange;margin: 5px 5px 10px;">
                        <div class="card" style="background: none;border: 0px">
                            <div class="background" style="height:450px;background-image: url('Resource/img/Project/mycode.jpg');">
                            </div>
                            <a href="javacode.action" class="overlay">
                            </a>
                            <a class="thumb" href="javacode.action">
                                <div class="info">
                                    <br>
                                    <h2 class="mytext" style="color:white;font-weight: 600;font-size:35px">
                                        <i class="fab fa-java" style="font-weight: 700;color:white;font-size: 35px"></i>&nbsp;&nbsp;&nbsp;FULL JAVA CODE
                                    </h2>
                                    <br><br><br><br><br><br>
                                    <h2 style="font-family:arial,sans-serif;font-weight: 600;color:white">
                                        Toàn bộ source code Java, beginning, algorithm, webapp,... miễn phí
                                    </h2>
                                    <div class="foot">
                                        <i class="line"></i>
                                        <span class="date" style="font-weight: 600">Updated 27-08-20&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:orange">CLICK TO GO</span></span>
                                            <i class="fas fa-laptop-code"></i>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    </div>

                    <!--GAME-->
                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                        <div class="box gallery" style="border: 6px solid blueviolet;margin: 5px 5px 10px;">
                            <div class="card" style="height:450px;background: none;border: 0px">
                                <div class="background" style="background-image: url('Resource/img/Project/mygame.jpg');">
                                </div>
                                <a href="mygame.action" class="overlay">
                                </a>
                                <a class="thumb" href="mygame.action">
                                    <div class="info">

                                        <h2 class="mytext2" style="color:white;font-weight: 600;font-size:35px">
                                            <i class="fas fa-gamepad" style="font-weight: 700;color:white;font-size: 35px"></i>&nbsp;&nbsp;&nbsp;MY GAME
                                        </h2>
                                        <br><br><br><br><br><br>
                                        <h2 style="font-family:arial,sans-serif;font-weight: 600;color:white">
                                            Trò chơi do mình phát triển, bao gồm app + source code
                                        </h2>
                                        <div class="foot">
                                            <i class="line"></i>
                                            <span class="date" style="font-weight: 600">Updated 27-08-20&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:orange">CLICK TO GO</span></span>
                                            <i class="fas fa-laptop-code"></i>
                                            <i class="fab fa-windows"></i>
                                            <i class="fab fa-android"></i>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!--APP-->
                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                        <div class="box gallery" style="border: 6px solid rosybrown;margin: 5px 5px 10px;">
                            <div class="card" style="background: none;border: 0px">
                                <div class="background" style="height:450px;background-image: url('Resource/img/Project/myapp.jpg');">
                                </div>
                                <a href="myapp.action" class="overlay">
                                </a>
                                <a class="thumb" href="myapp.action">
                                    <div class="info">

                                        <h2 class="mytext3" style="color:white;font-weight: 600;font-size:35px">
                                            <i class="fas fa-archive" style="font-weight: 700;color:white;font-size: 35px"></i>&nbsp;&nbsp;&nbsp;MY APPLICATION
                                        </h2>
                                        <br><br><br><br><br><br>
                                        <h2 style="font-family:arial,sans-serif;font-weight: 600;color:white">
                                            Phần mềm do mình phát triển, bao gồm app + source code
                                        </h2>
                                        <div class="foot">
                                            <i class="line"></i>
                                            <span class="date" style="font-weight: 600">Updated 27-08-20&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:orange">CLICK TO GO</span></span>
                                            <i class="fas fa-laptop-code"></i>
                                            <i class="fab fa-windows"></i>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

<jsp:include page="Common/_js.jsp"/>
<jsp:include page="Common/footer.jsp"/>
</body>
</html>
