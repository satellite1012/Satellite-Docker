<%@page import="main.java.Database.UserModel.UserModel" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@ page import="main.java.Database.DatabaseDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    UserModel model = null;
    int count = 0;
    try {
        //Init
        DatabaseDAO db = new DatabaseDAO();
        model = new UserModel();

        //Val
        if (session.getAttribute("count_access")==null){
            try {
                db.openConnection();
                model.setConnection(db.getConnection());
                model.updateCountAccess(1);
                count = model.getCountAccess() / 5;
                session.setAttribute("count_access",count);
                db.closeConnection();
            } catch (SQLException e) {
                db.closeConnection();
            }}
    } catch (Exception e) {
        response.sendRedirect("overload");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!--Validate Index GG-->
    <meta name="google-site-verification" content="dl_OWRu9l8aIU2QWHLkEkmlezwIOli3pQBzUxCOxk0M" />

    <!--Validate Author-->
    <meta name='dmca-site-verification' content='UU9nNFRIVVJCRXRISVhQbHYwc3J4ZGFZYXF1eHoxaFhxU0trVUpFTXozOD01' />

    <!--Adsence-->
    <script data-ad-client="ca-pub-3357448996497052" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

    <!--Main-->
    <link rel="shortcut icon" href="favicon.ico"/>
    <title>Satellite | Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Trang diễn đàn tin học và nơi chia sẻ tài liệu học tập, phần mềm, game, blog cá nhân, đăng ký dự án">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta name="author" content=Đoàn Đức Tín>


    <jsp:include page="Common/_css.jsp"/>
    <c:if test="${sessionScope.log_HomeController_Home != null}">
        <script>
            window.onload = function showLog_Home() {
                Swal.fire({
                    icon: 'error',
                    title: 'THÔNG BÁO KHẨN',
                    text: 'Vì gần thi cuối kỳ, nên tất cả tính năng xem tài liệu quá trình và để thi các năm trước sẽ bị ẩn để tránh tình trạng gian lận hoặc học theo đề mẫu xong thi rớt đổ admin -_-, bắt đầu từ tuần sau',
                    footer: '<a href="#" target="_blank" style="color:blue;font-weight: 700;font-family: Arial, Baskerville, monospace">Ngày mở lại dự kiến: 30/11/2020, sinh nhật ad 10.12 nha :)))</a>'
                })
            };
        </script>
    </c:if>
    <style>
        .scrollable-menu {
            height: auto;
            max-height: 300px;
            overflow-x: hidden;
        }

        .myflash{
            -webkit-animation: glowing 1500ms infinite;
            -moz-animation: glowing 1500ms infinite;
            -o-animation: glowing 1500ms infinite;
        }

        @-webkit-keyframes glowing {
            0% { background-color: #b20000; -webkit-box-shadow: 0 0 3px #b20000; }
            50% { background-color: #FF0000; -webkit-box-shadow: 0 0 40px #FF0000; }
            100% { background-color: #B20000; -webkit-box-shadow: 0 0 3px #B20000; }
        }

        @-moz-keyframes glowing {
            0% { background-color: #b20000; -moz-box-shadow: 0 0 3px #b20000; }
            50% { background-color: #FF0000; -moz-box-shadow: 0 0 40px #FF0000; }
            100% { background-color: #B20000; -moz-box-shadow: 0 0 3px #B20000; }
        }

        @-o-keyframes glowing {
            0% { background-color: #B20000; box-shadow: 0 0 3px #B20000; }
            50% { background-color: #FF0000; box-shadow: 0 0 40px #FF0000; }
            100% { background-color: #B20000; box-shadow: 0 0 3px #B20000; }
        }

        @keyframes glowing {
            0% { background-color: #B20000; box-shadow: 0 0 3px #B20000; }
            50% { background-color: #FF0000; box-shadow: 0 0 40px #FF0000; }
            100% { background-color: #B20000; box-shadow: 0 0 3px #B20000; }
        }
    </style>
</head>
<body>

<!--Facebook-->
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0" nonce="4TU3IejE"></script>
<div id="fbShare1" style="z-index: 999; position: fixed;bottom: 20px;left: 28px" class="fb-share-button" data-href="http://satellite-fpt.azurewebsites.net/" data-layout="button" data-size="large">
    <a id="fbShare2" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fsatellite-fpt.azurewebsites.net%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a>
</div>

<jsp:include page="Common/header.jsp"/>

<!--Home-->
<div style="padding-top:120px;padding-bottom:90px;background-image: url('Resource/img/background.jpg');background-attachment: fixed;background-size: cover;background-blend-mode: darken;"
     data-stellar-background-ratio="0.5">
     <div class="container">
                <div class="row align-items-center justify-content-center text-center">
                    <div class="col-md-9">
                        <br><br><br>

                        <!--Header of head-->
                        <h2 style="color:white;font-size: 60px;font-weight: 700;font-family: Dosis, sans-serif">Welcome to Sat Portal</h2>
                        <h6 style="font-size:22px;font-weight:600;font-family:Dosis,serif;color:white;text-align: center;">Để có trải nghiệm tốt nhất, hãy
                            dùng thiết bị PC để truy cập trang web</h6>
                        <br>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12" >
                                    <div class="btn-group">
                                        <button onclick="showShortCut()" style="margin:10px;font-family: Dosis,sans-serif;color: darkorange;font-weight: 700" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Truy cập nhanh<span class="caret"></span></button>
                                    </div>
                                    <div class="btn-group">
                                        <button onclick="showNewAno()" style="display:grid;margin:10px;font-family: Dosis,sans-serif;color: whitesmoke;font-weight: 700" type="button" class="btn btn-default dropdown-toggle myflash" data-toggle="dropdown">
                                            <span><b style="color: yellow">[2] </b>
                                            Thông báo mới</span>
                                            <span style="color: darkorange">02-11-2020</span>
                                            <span class="caret justify-content-center"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--Short cut-->
                        <div id="short-cut-section" class="scrollable-menu" style="display: none">
                            <h5
                                style="font-weight:600;font-family:Dosis,serif;background-color: rgba(0,0,0,0.5);padding:18px;border-radius:10px;color:cyan;;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-door-open" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M1 15.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5zM11.5 2H11V1h.5A1.5 1.5 0 0 1 13 2.5V15h-1V2.5a.5.5 0 0 0-.5-.5z"></path>
                                <path fill-rule="evenodd" d="M10.828.122A.5.5 0 0 1 11 .5V15h-1V1.077l-6 .857V15H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117z"/>
                                <path d="M8 9c0 .552.224 1 .5 1s.5-.448.5-1-.224-1-.5-1-.5.448-.5 1z"/>
                            </svg>
                                &nbsp;&nbsp;Đăng nhập bằng mail FPT và nhận 1000 STONE<a href="login">
                                <button class="btn-outline-warning" style="color:orange;background: none;border-radius: 4px;"> TẠI ĐÂY </button></a>
                            </h5>
                            <h5
                                style="font-weight:600;font-family:Dosis,serif;background-color: rgba(0,0,0,0.5);padding:18px;border-radius:10px;color:cyan;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cloud" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M4.406 3.342A5.53 5.53 0 0 1 8 2c2.69 0 4.923 2 5.166 4.579C14.758 6.804 16 8.137 16 9.773 16 11.569 14.502 13 12.687 13H3.781C1.708 13 0 11.366 0 9.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383zm.653.757c-.757.653-1.153 1.44-1.153 2.056v.448l-.445.049C2.064 6.805 1 7.952 1 9.318 1 10.785 2.23 12 3.781 12h8.906C13.98 12 15 10.988 15 9.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 4.825 10.328 3 8 3a4.53 4.53 0 0 0-2.941 1.1z"/>
                            </svg>
                                &nbsp;&nbsp;Truy cập tài liệu và đề thi <a href="document">
                                <button class="btn-outline-warning" style="color:orange;background: none;border-radius: 4px;"> TẠI ĐÂY </button></a>
                            </h5>
                            <h5
                                    style="font-weight:600;font-family:Dosis,serif;background-color: rgba(0,0,0,0.5);padding:18px;border-radius:10px;color:cyan;;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bug-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M4.978.855a.5.5 0 1 0-.956.29l.41 1.352A4.985 4.985 0 0 0 3 6h10a4.985 4.985 0 0 0-1.432-3.503l.41-1.352a.5.5 0 1 0-.956-.29l-.291.956A4.978 4.978 0 0 0 8 1a4.979 4.979 0 0 0-2.731.811l-.29-.956zM13 6v1H8.5v8.975A5 5 0 0 0 13 11h.5a.5.5 0 0 1 .5.5v.5a.5.5 0 1 0 1 0v-.5a1.5 1.5 0 0 0-1.5-1.5H13V9h1.5a.5.5 0 0 0 0-1H13V7h.5A1.5 1.5 0 0 0 15 5.5V5a.5.5 0 0 0-1 0v.5a.5.5 0 0 1-.5.5H13zm-5.5 9.975V7H3V6h-.5a.5.5 0 0 1-.5-.5V5a.5.5 0 0 0-1 0v.5A1.5 1.5 0 0 0 2.5 7H3v1H1.5a.5.5 0 0 0 0 1H3v1h-.5A1.5 1.5 0 0 0 1 11.5v.5a.5.5 0 1 0 1 0v-.5a.5.5 0 0 1 .5-.5H3a5 5 0 0 0 4.5 4.975z"/>
                            </svg>
                                &nbsp;&nbsp;FIX BUG THUÊ (50k-200k)<a href="https://www.facebook.com/satfomacej/" target="_blank">
                                    <button class="btn-outline-warning" style="color:orange;background: none;border-radius: 4px;"> TẠI ĐÂY </button></a>
                            </h5>
                            <h5
                                style="font-weight:600;font-family:Dosis,serif;background-color: rgba(0,0,0,0.5);padding:18px;border-radius:10px;color:cyan;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-tools" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M0 1l1-1 3.081 2.2a1 1 0 0 1 .419.815v.07a1 1 0 0 0 .293.708L10.5 9.5l.914-.305a1 1 0 0 1 1.023.242l3.356 3.356a1 1 0 0 1 0 1.414l-1.586 1.586a1 1 0 0 1-1.414 0l-3.356-3.356a1 1 0 0 1-.242-1.023L9.5 10.5 3.793 4.793a1 1 0 0 0-.707-.293h-.071a1 1 0 0 1-.814-.419L0 1zm11.354 9.646a.5.5 0 0 0-.708.708l3 3a.5.5 0 0 0 .708-.708l-3-3z"/>
                                <path fill-rule="evenodd" d="M15.898 2.223a3.003 3.003 0 0 1-3.679 3.674L5.878 12.15a3 3 0 1 1-2.027-2.027l6.252-6.341A3 3 0 0 1 13.778.1l-2.142 2.142L12 4l1.757.364 2.141-2.141zm-13.37 9.019L3.001 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026z"/>
                            </svg>
                                &nbsp;&nbsp;Công cụ dành cho sinh viên FPT <a href="tool">
                                <button class="btn-outline-warning" style="color:orange;background: none;border-radius: 4px;"> TẠI ĐÂY </button></a>
                            </h5>
                            <h5
                                    style="font-weight:600;font-family:Dosis,serif;background-color: rgba(0,0,0,0.5);padding:18px;border-radius:10px;color:cyan;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-tools" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M0 1l1-1 3.081 2.2a1 1 0 0 1 .419.815v.07a1 1 0 0 0 .293.708L10.5 9.5l.914-.305a1 1 0 0 1 1.023.242l3.356 3.356a1 1 0 0 1 0 1.414l-1.586 1.586a1 1 0 0 1-1.414 0l-3.356-3.356a1 1 0 0 1-.242-1.023L9.5 10.5 3.793 4.793a1 1 0 0 0-.707-.293h-.071a1 1 0 0 1-.814-.419L0 1zm11.354 9.646a.5.5 0 0 0-.708.708l3 3a.5.5 0 0 0 .708-.708l-3-3z"></path>
                                <path fill-rule="evenodd" d="M15.898 2.223a3.003 3.003 0 0 1-3.679 3.674L5.878 12.15a3 3 0 1 1-2.027-2.027l6.252-6.341A3 3 0 0 1 13.778.1l-2.142 2.142L12 4l1.757.364 2.141-2.141zm-13.37 9.019L3.001 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026z"></path>
                            </svg>
                                &nbsp;&nbsp;Hỏi đáp về môi trường học tập tại FPT <a href="qaFPT">
                                    <button class="btn-outline-warning" style="color:orange;background: none;border-radius: 4px;"> TẠI ĐÂY </button></a>
                            </h5>
                        </div>

                        <!--Anocement-->
                        <div  id="new-ano-section" class="scrollable-menu" style="display: none">
                            <h5 style="font-weight:600;font-family:Dosis,serif;background-color: rgba(0,0,0,0.5);padding:18px;border-radius:10px;color:cyan;;">
                                <span style="color: darkorange">[02-11-20]&nbsp;&nbsp;</span>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-brush" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M15.825.12a.5.5 0 0 1 .132.584c-1.53 3.43-4.743 8.17-7.095 10.64a6.067 6.067 0 0 1-2.373 1.534c-.018.227-.06.538-.16.868-.201.659-.667 1.479-1.708 1.74a8.117 8.117 0 0 1-3.078.132 3.658 3.658 0 0 1-.563-.135 1.382 1.382 0 0 1-.465-.247.714.714 0 0 1-.204-.288.622.622 0 0 1 .004-.443c.095-.245.316-.38.461-.452.393-.197.625-.453.867-.826.094-.144.184-.297.287-.472l.117-.198c.151-.255.326-.54.546-.848.528-.739 1.2-.925 1.746-.896.126.007.243.025.348.048.062-.172.142-.38.238-.608.261-.619.658-1.419 1.187-2.069 2.175-2.67 6.18-6.206 9.117-8.104a.5.5 0 0 1 .596.04zM4.705 11.912a1.23 1.23 0 0 0-.419-.1c-.247-.013-.574.05-.88.479a11.01 11.01 0 0 0-.5.777l-.104.177c-.107.181-.213.362-.32.528-.206.317-.438.61-.76.861a7.127 7.127 0 0 0 2.657-.12c.559-.139.843-.569.993-1.06a3.121 3.121 0 0 0 .126-.75l-.793-.792zm1.44.026c.12-.04.277-.1.458-.183a5.068 5.068 0 0 0 1.535-1.1c1.9-1.996 4.412-5.57 6.052-8.631-2.591 1.927-5.566 4.66-7.302 6.792-.442.543-.796 1.243-1.042 1.826a11.507 11.507 0 0 0-.276.721l.575.575zm-4.973 3.04l.007-.005a.031.031 0 0 1-.007.004zm3.582-3.043l.002.001h-.002z"></path>
                                </svg>
                                &nbsp;&nbsp;Cập nhật giao diện, truy cập các mục liên quan đến FPT tại biểu tượng FPT Lab trên thanh điều hướng
                            </h5>
                            <h5 style="font-weight:600;font-family:Dosis,serif;background-color: rgba(0,0,0,0.5);padding:18px;border-radius:10px;color:cyan;;">
                                <span style="color: darkorange">[31-10-20]&nbsp;&nbsp;</span>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-clipboard-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"></path>
                                    <path fill-rule="evenodd" d="M9.5 1h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3zm4.354 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"></path>
                                </svg>
                                &nbsp;&nbsp;Mở tính năng đăng câu hỏi trong diễn đàn
                            </h5>
                            <h5 style="font-weight:600;font-family:Dosis,serif;background-color: rgba(0,0,0,0.5);padding:18px;border-radius:10px;color:cyan;;">
                                <span style="color: darkorange">[30-10-20]&nbsp;&nbsp;</span>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-clipboard-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"></path>
                                    <path fill-rule="evenodd" d="M9.5 1h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3zm4.354 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"></path>
                                </svg>
                                &nbsp;&nbsp;Cập nhật tài liệu từ kỳ 1->4
                            </h5>
                            <h5 style="font-weight:600;font-family:Dosis,serif;background-color: rgba(0,0,0,0.5);padding:18px;border-radius:10px;color:darkgray;">
                                <span style="color: darkorange">[26-10-20]&nbsp;&nbsp;</span>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-clipboard-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
                                <path fill-rule="evenodd" d="M9.5 1h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3zm-.354 7.146a.5.5 0 0 1 .708 0L8 8.293l1.146-1.147a.5.5 0 1 1 .708.708L8.707 9l1.147 1.146a.5.5 0 0 1-.708.708L8 9.707l-1.146 1.147a.5.5 0 0 1-.708-.708L7.293 9 6.146 7.854a.5.5 0 0 1 0-.708z"/>
                                </svg>
                                &nbsp;&nbsp;Tài khoản khách đã không còn hỗ trợ cho việc xem tài liệu
                            </h5>
                            <h5 style="font-weight:600;font-family:Dosis,serif;background-color: rgba(0,0,0,0.5);padding:18px;border-radius:10px;color:cyan;;">
                                <span style="color: darkorange">[26-10-20]&nbsp;&nbsp;</span>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-clipboard-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
                                    <path fill-rule="evenodd" d="M9.5 1h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3zm4.354 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                                </svg>
                                &nbsp;&nbsp;Thêm tính năng: forum hỏi đáp cho sinh viên (mục FPT Q&A)
                            </h5>
                            <h5 style="font-weight:600;font-family:Dosis,serif;background-color: rgba(0,0,0,0.5);padding:18px;border-radius:10px;color:red;">
                                <span style="color: darkorange">[26-10-20]&nbsp;&nbsp;</span>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bug" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M4.355.522a.5.5 0 0 1 .623.333l.291.956A4.979 4.979 0 0 1 8 1c1.007 0 1.946.298 2.731.811l.29-.956a.5.5 0 1 1 .957.29l-.41 1.352A4.985 4.985 0 0 1 13 6h.5a.5.5 0 0 0 .5-.5V5a.5.5 0 0 1 1 0v.5A1.5 1.5 0 0 1 13.5 7H13v1h1.5a.5.5 0 0 1 0 1H13v1h.5a1.5 1.5 0 0 1 1.5 1.5v.5a.5.5 0 1 1-1 0v-.5a.5.5 0 0 0-.5-.5H13a5 5 0 0 1-10 0h-.5a.5.5 0 0 0-.5.5v.5a.5.5 0 1 1-1 0v-.5A1.5 1.5 0 0 1 2.5 10H3V9H1.5a.5.5 0 0 1 0-1H3V7h-.5A1.5 1.5 0 0 1 1 5.5V5a.5.5 0 0 1 1 0v.5a.5.5 0 0 0 .5.5H3c0-1.364.547-2.601 1.432-3.503l-.41-1.352a.5.5 0 0 1 .333-.623zM4 7v4a4 4 0 0 0 3.5 3.97V7H4zm4.5 0v7.97A4 4 0 0 0 12 11V7H8.5zM12 6H4a3.99 3.99 0 0 1 1.333-2.982A3.983 3.983 0 0 1 8 2c1.025 0 1.959.385 2.666 1.018A3.989 3.989 0 0 1 12 6z"/>
                            </svg>
                                &nbsp;&nbsp;FIX Lỗi không gửi tài liệu được (link gg form bị mất)
                            </h5>
                            <h5 style="font-weight:600;font-family:Dosis,serif;background-color: rgba(0,0,0,0.5);padding:18px;border-radius:10px;color:red;">
                                <span style="color: darkorange">[12-09-20]&nbsp;&nbsp;</span>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bug" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M4.355.522a.5.5 0 0 1 .623.333l.291.956A4.979 4.979 0 0 1 8 1c1.007 0 1.946.298 2.731.811l.29-.956a.5.5 0 1 1 .957.29l-.41 1.352A4.985 4.985 0 0 1 13 6h.5a.5.5 0 0 0 .5-.5V5a.5.5 0 0 1 1 0v.5A1.5 1.5 0 0 1 13.5 7H13v1h1.5a.5.5 0 0 1 0 1H13v1h.5a1.5 1.5 0 0 1 1.5 1.5v.5a.5.5 0 1 1-1 0v-.5a.5.5 0 0 0-.5-.5H13a5 5 0 0 1-10 0h-.5a.5.5 0 0 0-.5.5v.5a.5.5 0 1 1-1 0v-.5A1.5 1.5 0 0 1 2.5 10H3V9H1.5a.5.5 0 0 1 0-1H3V7h-.5A1.5 1.5 0 0 1 1 5.5V5a.5.5 0 0 1 1 0v.5a.5.5 0 0 0 .5.5H3c0-1.364.547-2.601 1.432-3.503l-.41-1.352a.5.5 0 0 1 .333-.623zM4 7v4a4 4 0 0 0 3.5 3.97V7H4zm4.5 0v7.97A4 4 0 0 0 12 11V7H8.5zM12 6H4a3.99 3.99 0 0 1 1.333-2.982A3.983 3.983 0 0 1 8 2c1.025 0 1.959.385 2.666 1.018A3.989 3.989 0 0 1 12 6z"/>
                                </svg>
                                &nbsp;&nbsp;FIX Lỗi server tự tắt khi không có người truy cập
                            </h5>
                        </div>

                        <br><br><br>
                        <p style="font-family:Dosis,serif;font-weight:600;color:white;font-size:20px;margin:0;">Other</p>
                        <a href="#home-feature">
                            <span class=" icon-keyboard_arrow_down" style="size: 88px;font-size:88px;"></span>
                        </a>
                    </div>
                </div>
            </div>
</div>

<!--Access and date time-->
<div class="site-section section-counter">
    <div class="container">
        <div class="row" >
            <div class="col-md-5 pr-5" style="background-color: orangered;">
                <div class="block-48" style="background-color: orangered;font-family:Dosis,serif;font-weight:600;padding:30px 0 0 30px;">
                    <span class="block-48-text-1" style="color:black;font-size: 40px;">Số lượt truy cập</span>
                    <%
                        out.println("<div class=\"block-48-counter ftco-number\" data-number=\"" + session.getAttribute("count_access") + "\" style=\"color:yellow;\">0</div>");
                    %>
                    <br>
                    <hr style="border-top: 1px solid black;">
                    <span class="block-48-text-1 mb-4 d-block" style="color:black;">Trong tổng thời gian
              <%
                  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                  LocalDateTime dateTime1 = LocalDateTime.parse("2020-06-11 19:00:00", formatter);
                  LocalDateTime dateTime2 = LocalDateTime.now();
                  long diffInHours = java.time.Duration.between(dateTime1, dateTime2).toHours();
                  long diffInMinutes = java.time.Duration.between(dateTime1, dateTime2).toMinutes();
                  long diffInDates = java.time.Duration.between(dateTime1, dateTime2).toDays();
                  String timeDiff = diffInDates + " Ngày, " + (diffInHours - diffInDates * 24) + " Giờ và " + (diffInMinutes - diffInHours * 60) + " phút";
                  out.println("<br><p style=\"color:black;text-shadow:none;fonr-size:25px;\">" + timeDiff + "</p");
              %>
              </span>
                    <hr style="border-top: 1px solid black;">
                    <p class="mb-0"><a href="#contact-section" class="btn btn-white px-3 py-2" style="font-weight:700;">Liên Hệ Admin Ngay</a></p>
                    <br>
                    <p style="font-style: italic;color:white;font-size: 16px;">Dữ liệu thật, bạn có thể F5 sau vài giờ
                        để kiểm chứng :)</p>
                </div>
            </div>
            <div class="col-md-7 welcome-text" style="font-family:Dosis,serif;font-weight:600;border-radius: 10px;border-color: #0b0b0b;">
                <h2 class="display-4 mb-3" style="font-weight:700;">Website giúp bạn những gì?</h2>
                <p class="lead" style="font-weight:700;">- Chia sẻ tài liệu học tập, kiểm tra, lời giải - miễn phí</p>
                <p class="lead" style="font-weight:700;">- Cung cấp các phần mềm, trò chơi hay cùng với source code</p>
                <p class="lead" style="font-weight:700;">- Mở rộng kiến thức về IT với những bài hướng dẫn dễ hiểu nhất</p>
                <p class="lead" style="font-weight:700;">- Tham khảo các bài blog hay về công nghệ & cuộc sống</p>
                <p class="lead" style="font-weight:700;">- Diễn đàn hỏi đáp về các vấn đề trong lập trình, các vấn đề trong đời sống sinh viên</p>
                <br>
                <p class="lead" style="font-weight:700;color: grey"><i>Và còn nhiều thứ khác...</i></p>
                <br><br>
                <hr>
                <p class="mb-4">Wanna Join ? </p>
                <p class="mb-0" style="display: inline;"><a href="#contact-section" class="btn btn-primary px-3 py-2"
                                                            style="font-weight:700;background-color: orangered;border:0px;margin:0px;padding: 20px;">Đăng
                    Ký</a></p>
                <%
                    if (session.getAttribute("user") == null)
                        out.println("<p class=\"mb-0\" style=\"display: inline;\"><a href=\"login\" class=\"btn btn-primary px-3 py-2\" style=\"font-weight:700;border:0px;margin:0px;padding: 20px;\">Đăng Nhập</a></p>");
                %>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="col-12 justify-content-center">

    </div>
</div>

<hr>

<!--F static sign in-->
<div id="contact-section"><br><br><br>
    <div class="featured-section overlay-color-2" style="background-image: url('Resource/img/index_contact.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-md-6 mb-5 mb-md-0">
                    <img src="Resource/img/index_contact.jpg" alt="Image" class="img-fluid">
                </div>
                <div class="col-md-6 pl-md-5">
                    <div class="form-volunteer">
                        <h2 style="font-weight:600;font-family:Dosis;font-size:35px;color:black;text-align: center;">Đăng Ký CONTRIBUTOR</h2>
                        <form action="mailto:doanductin7122000@gmail.com" method="post" enctype="text/plain">
                            <div class="form-group">
                                <!-- <label for="name">Name</label> -->
                                <input type="text" class="form-control py-2" id="name" name="name"
                                       placeholder="Enter your name" required>
                            </div>
                            <div class="form-group">
                                <!-- <label for="email">Email</label> -->
                                <input type="text" class="form-control py-2" id="email" name="mail"
                                       placeholder="Enter your email" required>
                            </div>
                            <div class="form-group">
                                <!-- <label for="v_message">Email</label> -->
                                <textarea name="v_message" cols="30" rows="3" class="form-control py-2"
                                          placeholder="Write your message" required></textarea>
                                <!-- <input type="text" class="form-control py-2" id="email"> -->
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-white px-5 py-2" style="font-weight:600;font-family:Dosis;" value="Send Request">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="Common/_js.jsp"/>
<jsp:include page="Common/footer.jsp"/>
<script src="https://apps.elfsight.com/p/platform.js" defer></script>
<script>
    function showShortCut(){
        document.getElementById("new-ano-section").style.display="none";
        x= document.getElementById("short-cut-section");
        if (x.style.display==="block")
            x.style.display="none";
        else
            x.style.display="block";
    }
    function showNewAno(){
        document.getElementById("short-cut-section").style.display="none";
        x= document.getElementById("new-ano-section");
        if (x.style.display==="block")
            x.style.display="none";
        else
            x.style.display="block";
    }
</script>
</body>
</html>
