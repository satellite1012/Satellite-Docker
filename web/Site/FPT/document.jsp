<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Satellite | Document</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Nơi chia sẻ tài liệu học tập về các chuyên ngành thông dụng được sưu tầm và tổng hợp từ nhiều nguồn">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta name="author" content="Đoàn Đức Tín">
    <c:if test="${sessionScope.log_HomeController_DocumentRole != null}">
        <c:if test="${sessionScope.log_DocumentController == null}">
            <script>
                window.onload = function showRule() {
                    //ShowLog_Document();
                        Swal.fire({
                            icon: 'error',
                            title: 'THÔNG BÁO KHẨN',
                            text: 'Vì gần thi cuối kỳ, nên tất cả tính năng xem tài liệu quá trình và để thi các năm trước sẽ bị ẩn để tránh tình trạng gian lận hoặc học theo đề mẫu xong thi rớt đổ admin -_-, bắt đầu từ tuần sau',
                            footer: '<a href="#" target="_blank" style="color:blue;font-weight: 700;font-family: Arial, Baskerville, monospace">Ngày mở lại dự kiến: 30/11/2020, sinh nhật ad 10.12 nha :)))</a>'
                        })

                }
            </script>
        </c:if>
    </c:if>
    <c:if test="${sessionScope.log_DocumentController != null}">
        <script>
            window.onload = function showLog() {
                Swal.fire({
                    icon: 'error',
                    title: '${sessionScope.log_DocumentController}',
                    text: 'Satellite | ErrorLog',
                    footer: '<a href="https://www.facebook.com/satfomacej" target="_blank">You think this is a bug? contact admin now</a>'
                })
            };
        </script>
        <c:set var="log_DocumentController" value="${null}" scope="session"/>
    </c:if>

    <jsp:include page="../../Common/_css.jsp"/>
</head>
<body>

<!--Facebook-->
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0&appId=975426712965384&autoLogAppEvents=1" nonce="pORLbxWu"></script>
<div style="z-index: 999; position: fixed;bottom: 20px;left: 28px" class="fb-share-button" data-href="http://satellite-fpt.azurewebsites.net/document.action" data-layout="button" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fsatellite-fpt.azurewebsites.net%2Fdocument.action&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a></div>

<jsp:include page="../../Common/header.jsp"/>

<div style="padding-top:120px;padding-bottom:90px;background-image: url('../../Resource/img/background.jpg');background-attachment: fixed;background-size: cover;background-blend-mode: darken"
     data-stellar-background-ratio="0.5">
      <div class="container">
                <div class="row align-items-center justify-content-center text-center">
                    <div class="col-md-11">
                        <br><br><br>
                        <h2 style="color:white;font-size: 55px;font-weight: 700;font-family: Dosis, sans-serif">Document Portal</h2>
                        <h5
                                style="background-color: rgba(0,0,0,0.5);padding:18px;border-radius:10px;color:cyan;font-family:arial,serif;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-question-octagon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M4.54.146A.5.5 0 0 1 4.893 0h6.214a.5.5 0 0 1 .353.146l4.394 4.394a.5.5 0 0 1 .146.353v6.214a.5.5 0 0 1-.146.353l-4.394 4.394a.5.5 0 0 1-.353.146H4.893a.5.5 0 0 1-.353-.146L.146 11.46A.5.5 0 0 1 0 11.107V4.893a.5.5 0 0 1 .146-.353L4.54.146zM5.1 1L1 5.1v5.8L5.1 15h5.8l4.1-4.1V5.1L10.9 1H5.1z"/>
                            <path d="M5.25 6.033h1.32c0-.781.458-1.384 1.36-1.384.685 0 1.313.343 1.313 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.007.463h1.307v-.355c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.326 0-2.786.647-2.754 2.533zm1.562 5.516c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
                        </svg>
                            &nbsp;&nbsp;Hướng dẫn cách xem tài liệu
                            <button class="btn-outline-warning" onclick="showInstructionD1()"
                                    style="color:orange;background: none;border-radius: 4px;"> TẠI ĐÂY
                            </button>
                        </h5>
                        <h5
                                style="background-color: rgba(0,0,0,0.5);padding:18px;border-radius:10px;color:cyan;font-family:arial,serif;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cloud-upload" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M4.406 1.342A5.53 5.53 0 0 1 8 0c2.69 0 4.923 2 5.166 4.579C14.758 4.804 16 6.137 16 7.773 16 9.569 14.502 11 12.687 11H10a.5.5 0 0 1 0-1h2.688C13.979 10 15 8.988 15 7.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 2.825 10.328 1 8 1a4.53 4.53 0 0 0-2.941 1.1c-.757.652-1.153 1.438-1.153 2.055v.448l-.445.049C2.064 4.805 1 5.952 1 7.318 1 8.785 2.23 10 3.781 10H6a.5.5 0 0 1 0 1H3.781C1.708 11 0 9.366 0 7.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383z"/>
                            <path fill-rule="evenodd" d="M7.646 4.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V14.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3z"/>
                        </svg>
                            &nbsp;&nbsp;Đóng góp tài liệu hoặc đề thi <a
                                href="https://docs.google.com/forms/d/e/1FAIpQLSepOiRp8xAGXkNOOA8gm--qSi6AiXsZC7dmDplAgi7e3ICeDw/viewform"
                                target="_blank">
                            <button class="btn-outline-warning"
                                    style="color:orange;background: none;border-radius: 4px;"> TẠI ĐÂY
                            </button>
                        </a>
                        </h5>
                        <br><br>
                        <p  style="font-family:Dosis,serif;font-weight:600;color:white;font-size:20px;margin:0;">Xem ngay</p>
                        <a href="#document-section">
                            <span class=" icon-keyboard_arrow_down" style="size: 88px;font-size:88px;"></span>
                        </a>
                    </div>
                </div>
            </div>
</div>

<!-- DE -->
<div id="document-section" class="site-section fund-raisers bg-light" style="font-family: arial,serif;">

    <!--Head of DE-->
    <div class="container">
        <div class="row mb-3 justify-content-center"
             style="padding-top:25px;border-radius:15px;background-image: linear-gradient(orangered,black);background-image: url('https://chuyengiahoangphuc.com/wp-content/uploads/2018/08/dark-blue-triangles-web-abstract-background-loop-4k-4096x2304_nez3oanrl__F0000.png');">
            <div class="col-md-8 text-center">
                <h2 style="font-size: 40px;color:white;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-folder-symlink-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2l.04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14h10.348a2 2 0 0 0 1.991-1.819l.637-7A2 2 0 0 0 13.81 3zM2.19 3c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 0 1 1-.98h3.672a1 1 0 0 1 .707.293L7.586 3H2.19zm9.608 5.271l-3.182 1.97c-.27.166-.616-.036-.616-.372V9.1s-2.571-.3-4 2.4c.571-4.8 3.143-4.8 4-4.8v-.769c0-.336.346-.538.616-.371l3.182 1.969c.27.166.27.576 0 .742z"/>
                </svg>&nbsp;&nbsp;[DE/SE] KỸ THUẬT PHẦN MỀM</h2>
                <p class="lead" style="font-size: 4vh;color:white;font-family: arial,serif;">Bao gồm: Slide, Bài tập,
                    Assignment, Đề thi mẫu</p>
                <p class="lead" style="font-size: 3vh;color:cyan;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-checklist" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                    <path fill-rule="evenodd" d="M7 5.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm-1.496-.854a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0zM7 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm-1.496-.854a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/>
                </svg>&nbsp;&nbsp;Các khóa học được cập nhật lần cuối vào 02/11/20</p>
                <c:if test="${sessionScope.user==null}">
                    <p class="lead" style="font-size: 3vh;color:red;">Không thể xem tài liệu khi chưa đăng nhập
                        <button style="padding-top:3px;background: none;font-size: 12px;color:white" onclick="showInstructionLogin()"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-question-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path d="M5.25 6.033h1.32c0-.781.458-1.384 1.36-1.384.685 0 1.313.343 1.313 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.007.463h1.307v-.355c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.326 0-2.786.647-2.754 2.533zm1.562 5.516c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
                        </svg> How to login with FPT mail</button></p>
                </c:if>
            </div>
        </div>
    </div>

    <!--List of DE-->
    <c:if test="${user!=null}">
        <div class="container-fluid">
            <div class="col-md-12 block-11">
                <div class="nonloop-block-11 owl-carousel">

                    <div class="card fundraise-item" style="box-shadow: 2px 2px 2px 2px grey">
                        <form action="view_normal_document.action">
                            <input type="hidden" name="documentID" value="SE1">

                            <img class="card-img-top"
                                 src="https://github.com/satellite1012/SatelliteWebImage/blob/master/se1.png?raw=true"
                                 alt="Image placeholder">
                            <div class="card-body">
                                <h2 class="card-title" style="color:green;font-family:arial,serif;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hexagon-half" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M14 4.577L8 1v14l6-3.577V4.577zM8.5.134a1 1 0 0 0-1 0l-6 3.577a1 1 0 0 0-.5.866v6.846a1 1 0 0 0 .5.866l6 3.577a1 1 0 0 0 1 0l6-3.577a1 1 0 0 0 .5-.866V4.577a1 1 0 0 0-.5-.866L8.5.134z"/>
                                </svg>&nbsp;MIỄN PHÍ</h2>
                                <h3 class="card-title">SOFTWARE ENGINEERING <input type="submit" class="btn-success"
                                                                                   value="TRUY CẬP"
                                                                                   style="float: right;font-size: 30px;">
                                </h3>
                                <p class="card-text">Kỳ 1</p>
                                <span class="donation-time mb-3 d-block" style="color:green;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-broadcast-pin" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                  <path fill-rule="evenodd" d="M3.05 3.05a7 7 0 0 0 0 9.9.5.5 0 0 1-.707.707 8 8 0 0 1 0-11.314.5.5 0 0 1 .707.707zm2.122 2.122a4 4 0 0 0 0 5.656.5.5 0 0 1-.708.708 5 5 0 0 1 0-7.072.5.5 0 0 1 .708.708zm5.656-.708a.5.5 0 0 1 .708 0 5 5 0 0 1 0 7.072.5.5 0 1 1-.708-.708 4 4 0 0 0 0-5.656.5.5 0 0 1 0-.708zm2.122-2.12a.5.5 0 0 1 .707 0 8 8 0 0 1 0 11.313.5.5 0 0 1-.707-.707 7 7 0 0 0 0-9.9.5.5 0 0 1 0-.707z"/>
                                  <path d="M10 8a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
                                  <path fill-rule="evenodd" d="M8 8.5a.5.5 0 0 1 .5.5v6.5a.5.5 0 0 1-1 0V9a.5.5 0 0 1 .5-.5z"/>
                                </svg>&nbsp;&nbsp;Ngành học này vẫn hoạt động</span>
                                <div class="progress custom-progress-success">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 72%"
                                         aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="fund-raised d-block" style="font-family:arial,serif;">Có 28% tài liệu mới chưa được cập nhật</span>
                            </div>

                        </form>
                    </div>

                    <div class="card fundraise-item" style="box-shadow: 2px 2px 2px 2px grey">
                        <form action="view_normal_document.action">
                            <input type="hidden" name="documentID" value="SE2">

                            <img class="card-img-top"
                                 src="https://github.com/satellite1012/SatelliteWebImage/blob/master/se2.png?raw=true"
                                 alt="Image placeholder">
                            <div class="card-body">
                                <h2 class="card-title" style="color:orange;font-family:arial,serif;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hexagon-half" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M14 4.577L8 1v14l6-3.577V4.577zM8.5.134a1 1 0 0 0-1 0l-6 3.577a1 1 0 0 0-.5.866v6.846a1 1 0 0 0 .5.866l6 3.577a1 1 0 0 0 1 0l6-3.577a1 1 0 0 0 .5-.866V4.577a1 1 0 0 0-.5-.866L8.5.134z"/>
                                </svg>&nbsp;88 STONE</h2>
                                <h3 class="card-title">SOFTWARE ENGINEERING <input type="submit" class="btn-warning"
                                                                                   value="TRUY CẬP"
                                                                                   style="float: right;font-size: 30px;">
                                </h3>
                                <p class="card-text">Kỳ 2</p>
                                <span class="donation-time mb-3 d-block" style="color:green;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-broadcast-pin" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                  <path fill-rule="evenodd" d="M3.05 3.05a7 7 0 0 0 0 9.9.5.5 0 0 1-.707.707 8 8 0 0 1 0-11.314.5.5 0 0 1 .707.707zm2.122 2.122a4 4 0 0 0 0 5.656.5.5 0 0 1-.708.708 5 5 0 0 1 0-7.072.5.5 0 0 1 .708.708zm5.656-.708a.5.5 0 0 1 .708 0 5 5 0 0 1 0 7.072.5.5 0 1 1-.708-.708 4 4 0 0 0 0-5.656.5.5 0 0 1 0-.708zm2.122-2.12a.5.5 0 0 1 .707 0 8 8 0 0 1 0 11.313.5.5 0 0 1-.707-.707 7 7 0 0 0 0-9.9.5.5 0 0 1 0-.707z"/>
                                  <path d="M10 8a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
                                  <path fill-rule="evenodd" d="M8 8.5a.5.5 0 0 1 .5.5v6.5a.5.5 0 0 1-1 0V9a.5.5 0 0 1 .5-.5z"/>
                                </svg>&nbsp;&nbsp;Ngành học này vẫn hoạt động</span>
                                <div class="progress custom-progress-success">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 97%"
                                         aria-valuenow="97" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="fund-raised d-block" style="font-family:arial,serif;">Có 3% tài liệu mới chưa được cập nhật</span>
                            </div>

                        </form>
                    </div>

                    <div class="card fundraise-item" style="box-shadow: 2px 2px 2px 2px grey">
                        <form action="view_normal_document.action">
                            <input type="hidden" name="documentID" value="SE3">

                            <img class="card-img-top"
                                 src="https://github.com/satellite1012/SatelliteWebImage/blob/master/se3.png?raw=true"
                                 alt="Image placeholder">
                            <div class="card-body">
                                <h2 class="card-title" style="color:orange;font-family:arial,serif;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hexagon-half" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M14 4.577L8 1v14l6-3.577V4.577zM8.5.134a1 1 0 0 0-1 0l-6 3.577a1 1 0 0 0-.5.866v6.846a1 1 0 0 0 .5.866l6 3.577a1 1 0 0 0 1 0l6-3.577a1 1 0 0 0 .5-.866V4.577a1 1 0 0 0-.5-.866L8.5.134z"/>
                                </svg>&nbsp;124 STONE</h2>
                                <h3 class="card-title">SOFTWARE ENGINEERING <input type="submit" class="btn-warning"
                                                                                   value="TRUY CẬP"
                                                                                   style="float: right;font-size: 30px;">
                                </h3>
                                <p class="card-text">Kỳ 3</p>
                                <span class="donation-time mb-3 d-block" style="color:green;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-broadcast-pin" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                  <path fill-rule="evenodd" d="M3.05 3.05a7 7 0 0 0 0 9.9.5.5 0 0 1-.707.707 8 8 0 0 1 0-11.314.5.5 0 0 1 .707.707zm2.122 2.122a4 4 0 0 0 0 5.656.5.5 0 0 1-.708.708 5 5 0 0 1 0-7.072.5.5 0 0 1 .708.708zm5.656-.708a.5.5 0 0 1 .708 0 5 5 0 0 1 0 7.072.5.5 0 1 1-.708-.708 4 4 0 0 0 0-5.656.5.5 0 0 1 0-.708zm2.122-2.12a.5.5 0 0 1 .707 0 8 8 0 0 1 0 11.313.5.5 0 0 1-.707-.707 7 7 0 0 0 0-9.9.5.5 0 0 1 0-.707z"/>
                                  <path d="M10 8a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
                                  <path fill-rule="evenodd" d="M8 8.5a.5.5 0 0 1 .5.5v6.5a.5.5 0 0 1-1 0V9a.5.5 0 0 1 .5-.5z"/>
                                </svg>&nbsp;&nbsp;Ngành học này vẫn hoạt động</span>
                                <div class="progress custom-progress-success">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 92%"
                                         aria-valuenow="92" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="fund-raised d-block" style="font-family:arial,serif;">Có 8% tài liệu mới chưa được cập nhật</span>
                            </div>

                        </form>
                    </div>

                    <div class="card fundraise-item" style="box-shadow: 2px 2px 2px 2px grey">
                        <form action="view_normal_document.action">
                            <input type="hidden" name="documentID" value="SE4">

                            <img class="card-img-top"
                                 src="https://github.com/satellite1012/SatelliteWebImage/blob/master/se4.png?raw=true"
                                 alt="Image placeholder">
                            <div class="card-body">
                                <h2 class="card-title" style="color:orange;font-family:arial,serif;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hexagon-half" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M14 4.577L8 1v14l6-3.577V4.577zM8.5.134a1 1 0 0 0-1 0l-6 3.577a1 1 0 0 0-.5.866v6.846a1 1 0 0 0 .5.866l6 3.577a1 1 0 0 0 1 0l6-3.577a1 1 0 0 0 .5-.866V4.577a1 1 0 0 0-.5-.866L8.5.134z"/>
                                </svg>&nbsp;177 STONE</h2>
                                <h3 class="card-title">SOFTWARE ENGINEERING <input type="submit" class="btn-warning"
                                                                                   value="TRUY CẬP"
                                                                                   style="float: right;font-size: 30px;">
                                </h3>
                                <p class="card-text">Kỳ 4</p>
                                <span class="donation-time mb-3 d-block" style="color:green;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-broadcast-pin" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                  <path fill-rule="evenodd" d="M3.05 3.05a7 7 0 0 0 0 9.9.5.5 0 0 1-.707.707 8 8 0 0 1 0-11.314.5.5 0 0 1 .707.707zm2.122 2.122a4 4 0 0 0 0 5.656.5.5 0 0 1-.708.708 5 5 0 0 1 0-7.072.5.5 0 0 1 .708.708zm5.656-.708a.5.5 0 0 1 .708 0 5 5 0 0 1 0 7.072.5.5 0 1 1-.708-.708 4 4 0 0 0 0-5.656.5.5 0 0 1 0-.708zm2.122-2.12a.5.5 0 0 1 .707 0 8 8 0 0 1 0 11.313.5.5 0 0 1-.707-.707 7 7 0 0 0 0-9.9.5.5 0 0 1 0-.707z"/>
                                  <path d="M10 8a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
                                  <path fill-rule="evenodd" d="M8 8.5a.5.5 0 0 1 .5.5v6.5a.5.5 0 0 1-1 0V9a.5.5 0 0 1 .5-.5z"/>
                                </svg>&nbsp;&nbsp;Ngành học này vẫn hoạt động</span>
                                <div class="progress custom-progress-success">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 99%"
                                         aria-valuenow="99" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="fund-raised d-block" style="font-family:arial,serif;">Có 1% tài liệu mới chưa được cập nhật</span>
                            </div>

                        </form>
                    </div>

                    <div class="card fundraise-item" style="box-shadow: 2px 2px 2px 2px grey">
                        <form action="view_normal_document.action">
                            <input type="hidden" name="documentID" value="SE5">

                            <img class="card-img-top"
                                 src="https://github.com/satellite1012/SatelliteWebImage/blob/master/se5.png?raw=true"
                                 alt="Image placeholder">
                            <div class="card-body">
                                <h2 class="card-title" style="color:red;font-family:arial,serif;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hexagon-half" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M14 4.577L8 1v14l6-3.577V4.577zM8.5.134a1 1 0 0 0-1 0l-6 3.577a1 1 0 0 0-.5.866v6.846a1 1 0 0 0 .5.866l6 3.577a1 1 0 0 0 1 0l6-3.577a1 1 0 0 0 .5-.866V4.577a1 1 0 0 0-.5-.866L8.5.134z"/>
                                </svg>&nbsp;45 STONE</h2>
                                <h3 class="card-title">SOFTWARE ENGINEERING
                                    <input type="submit" class="btn-warning"
                                           value="XEM TRƯỚC"
                                           style="float: right;font-size: 30px;">
                                </h3>
                                <p class="card-text">Kỳ 5</p>
                                <span class="donation-time mb-3 d-block" style="color:green;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-broadcast-pin" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                  <path fill-rule="evenodd" d="M3.05 3.05a7 7 0 0 0 0 9.9.5.5 0 0 1-.707.707 8 8 0 0 1 0-11.314.5.5 0 0 1 .707.707zm2.122 2.122a4 4 0 0 0 0 5.656.5.5 0 0 1-.708.708 5 5 0 0 1 0-7.072.5.5 0 0 1 .708.708zm5.656-.708a.5.5 0 0 1 .708 0 5 5 0 0 1 0 7.072.5.5 0 1 1-.708-.708 4 4 0 0 0 0-5.656.5.5 0 0 1 0-.708zm2.122-2.12a.5.5 0 0 1 .707 0 8 8 0 0 1 0 11.313.5.5 0 0 1-.707-.707 7 7 0 0 0 0-9.9.5.5 0 0 1 0-.707z"/>
                                  <path d="M10 8a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
                                  <path fill-rule="evenodd" d="M8 8.5a.5.5 0 0 1 .5.5v6.5a.5.5 0 0 1-1 0V9a.5.5 0 0 1 .5-.5z"/>
                                </svg>&nbsp;&nbsp;Ngành học này vẫn hoạt động</span>
                                <div class="progress custom-progress-success">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 69%"
                                         aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="fund-raised d-block" style="font-family:arial,serif;color:red;">Chưa học, tài liệu đang được sưu tầm</span>
                            </div>

                        </form>
                    </div>

                    <div class="card fundraise-item" style="box-shadow: 2px 2px 2px 2px grey">
                        <form action="#">
                            <input type="hidden" name="documentID" value="SE6">

                            <img class="card-img-top"
                                 src="https://github.com/satellite1012/SatelliteWebImage/blob/master/se6.png?raw=true"
                                 alt="Image placeholder">
                            <div class="card-body">
                                <h2 class="card-title" style="color:red;font-family:arial,serif;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hexagon-half" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M14 4.577L8 1v14l6-3.577V4.577zM8.5.134a1 1 0 0 0-1 0l-6 3.577a1 1 0 0 0-.5.866v6.846a1 1 0 0 0 .5.866l6 3.577a1 1 0 0 0 1 0l6-3.577a1 1 0 0 0 .5-.866V4.577a1 1 0 0 0-.5-.866L8.5.134z"/>
                                </svg>&nbsp;? STONE</h2>
                                <h3 class="card-title">SOFTWARE ENGINEERING
                                </h3>
                                <p class="card-text">Kỳ 6</p>
                                <span class="donation-time mb-3 d-block" style="color:green;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-broadcast-pin" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                  <path fill-rule="evenodd" d="M3.05 3.05a7 7 0 0 0 0 9.9.5.5 0 0 1-.707.707 8 8 0 0 1 0-11.314.5.5 0 0 1 .707.707zm2.122 2.122a4 4 0 0 0 0 5.656.5.5 0 0 1-.708.708 5 5 0 0 1 0-7.072.5.5 0 0 1 .708.708zm5.656-.708a.5.5 0 0 1 .708 0 5 5 0 0 1 0 7.072.5.5 0 1 1-.708-.708 4 4 0 0 0 0-5.656.5.5 0 0 1 0-.708zm2.122-2.12a.5.5 0 0 1 .707 0 8 8 0 0 1 0 11.313.5.5 0 0 1-.707-.707 7 7 0 0 0 0-9.9.5.5 0 0 1 0-.707z"/>
                                  <path d="M10 8a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
                                  <path fill-rule="evenodd" d="M8 8.5a.5.5 0 0 1 .5.5v6.5a.5.5 0 0 1-1 0V9a.5.5 0 0 1 .5-.5z"/>
                                </svg>&nbsp;&nbsp;Ngành học này vẫn hoạt động</span>
                                <div class="progress custom-progress-success">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 5%"
                                         aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="fund-raised d-block" style="font-family:arial,serif;color:red;">Chưa học, tài liệu đang được sưu tầm</span>
                            </div>

                        </form>
                    </div>

                    <div class="card fundraise-item" style="box-shadow: 2px 2px 2px 2px grey">
                        <form action="#">
                            <input type="hidden" name="documentID" value="SE7">

                            <img class="card-img-top"
                                 src="https://github.com/satellite1012/SatelliteWebImage/blob/master/se7.png?raw=true"
                                 alt="Image placeholder">
                            <div class="card-body">
                                <h2 class="card-title" style="color:red;font-family:arial,serif;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hexagon-half" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M14 4.577L8 1v14l6-3.577V4.577zM8.5.134a1 1 0 0 0-1 0l-6 3.577a1 1 0 0 0-.5.866v6.846a1 1 0 0 0 .5.866l6 3.577a1 1 0 0 0 1 0l6-3.577a1 1 0 0 0 .5-.866V4.577a1 1 0 0 0-.5-.866L8.5.134z"/>
                                </svg>&nbsp;? STONE</h2>
                                <h3 class="card-title">SOFTWARE ENGINEERING
                                </h3>
                                <p class="card-text">Kỳ 7</p>
                                <span class="donation-time mb-3 d-block" style="color:green;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-broadcast-pin" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                  <path fill-rule="evenodd" d="M3.05 3.05a7 7 0 0 0 0 9.9.5.5 0 0 1-.707.707 8 8 0 0 1 0-11.314.5.5 0 0 1 .707.707zm2.122 2.122a4 4 0 0 0 0 5.656.5.5 0 0 1-.708.708 5 5 0 0 1 0-7.072.5.5 0 0 1 .708.708zm5.656-.708a.5.5 0 0 1 .708 0 5 5 0 0 1 0 7.072.5.5 0 1 1-.708-.708 4 4 0 0 0 0-5.656.5.5 0 0 1 0-.708zm2.122-2.12a.5.5 0 0 1 .707 0 8 8 0 0 1 0 11.313.5.5 0 0 1-.707-.707 7 7 0 0 0 0-9.9.5.5 0 0 1 0-.707z"></path>
                                  <path d="M10 8a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"></path>
                                  <path fill-rule="evenodd" d="M8 8.5a.5.5 0 0 1 .5.5v6.5a.5.5 0 0 1-1 0V9a.5.5 0 0 1 .5-.5z"></path>
                                </svg>&nbsp;&nbsp;Ngành học này vẫn hoạt động</span>
                                <div class="progress custom-progress-success">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 5%"
                                         aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="fund-raised d-block" style="font-family:arial,serif;color:red;">Chưa học, tài liệu đang được sưu tầm</span>
                            </div>

                        </form>
                    </div>

                    <div class="card fundraise-item" style="box-shadow: 2px 2px 2px 2px grey">
                        <form action="#">
                            <input type="hidden" name="documentID" value="SE8">

                            <img class="card-img-top"
                                 src="https://github.com/satellite1012/SatelliteWebImage/blob/master/se8.png?raw=true"
                                 alt="Image placeholder">
                            <div class="card-body">
                                <h2 class="card-title" style="color:red;font-family:arial,serif;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hexagon-half" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M14 4.577L8 1v14l6-3.577V4.577zM8.5.134a1 1 0 0 0-1 0l-6 3.577a1 1 0 0 0-.5.866v6.846a1 1 0 0 0 .5.866l6 3.577a1 1 0 0 0 1 0l6-3.577a1 1 0 0 0 .5-.866V4.577a1 1 0 0 0-.5-.866L8.5.134z"/>
                                </svg>&nbsp;? STONE</h2>
                                <h3 class="card-title">SOFTWARE ENGINEERING
                                </h3>
                                <p class="card-text">Kỳ 8</p>
                                <span class="donation-time mb-3 d-block" style="color:green;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-broadcast-pin" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                  <path fill-rule="evenodd" d="M3.05 3.05a7 7 0 0 0 0 9.9.5.5 0 0 1-.707.707 8 8 0 0 1 0-11.314.5.5 0 0 1 .707.707zm2.122 2.122a4 4 0 0 0 0 5.656.5.5 0 0 1-.708.708 5 5 0 0 1 0-7.072.5.5 0 0 1 .708.708zm5.656-.708a.5.5 0 0 1 .708 0 5 5 0 0 1 0 7.072.5.5 0 1 1-.708-.708 4 4 0 0 0 0-5.656.5.5 0 0 1 0-.708zm2.122-2.12a.5.5 0 0 1 .707 0 8 8 0 0 1 0 11.313.5.5 0 0 1-.707-.707 7 7 0 0 0 0-9.9.5.5 0 0 1 0-.707z"></path>
                                  <path d="M10 8a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"></path>
                                  <path fill-rule="evenodd" d="M8 8.5a.5.5 0 0 1 .5.5v6.5a.5.5 0 0 1-1 0V9a.5.5 0 0 1 .5-.5z"></path>
                                </svg>&nbsp;&nbsp;Ngành học này vẫn hoạt động</span>
                                <div class="progress custom-progress-success">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 5%"
                                         aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="fund-raised d-block" style="font-family:arial,serif;color:red;">Chưa học, tài liệu đang được sưu tầm</span>
                            </div>

                        </form>
                    </div>

                    <div class="card fundraise-item" style="box-shadow: 2px 2px 2px 2px grey">
                        <form action="#">
                            <input type="hidden" name="documentID" value="SE9">

                            <img class="card-img-top"
                                 src="https://github.com/satellite1012/SatelliteWebImage/blob/master/se9.png?raw=true"
                                 alt="Image placeholder">
                            <div class="card-body">
                                <h2 class="card-title" style="color:red;font-family:arial,serif;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hexagon-half" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M14 4.577L8 1v14l6-3.577V4.577zM8.5.134a1 1 0 0 0-1 0l-6 3.577a1 1 0 0 0-.5.866v6.846a1 1 0 0 0 .5.866l6 3.577a1 1 0 0 0 1 0l6-3.577a1 1 0 0 0 .5-.866V4.577a1 1 0 0 0-.5-.866L8.5.134z"/>
                                </svg>&nbsp;? STONE</h2>
                                <h3 class="card-title">SOFTWARE ENGINEERING
                                </h3>
                                <p class="card-text">Kỳ 9</p>
                                <span class="donation-time mb-3 d-block" style="color:green;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-broadcast-pin" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                  <path fill-rule="evenodd" d="M3.05 3.05a7 7 0 0 0 0 9.9.5.5 0 0 1-.707.707 8 8 0 0 1 0-11.314.5.5 0 0 1 .707.707zm2.122 2.122a4 4 0 0 0 0 5.656.5.5 0 0 1-.708.708 5 5 0 0 1 0-7.072.5.5 0 0 1 .708.708zm5.656-.708a.5.5 0 0 1 .708 0 5 5 0 0 1 0 7.072.5.5 0 1 1-.708-.708 4 4 0 0 0 0-5.656.5.5 0 0 1 0-.708zm2.122-2.12a.5.5 0 0 1 .707 0 8 8 0 0 1 0 11.313.5.5 0 0 1-.707-.707 7 7 0 0 0 0-9.9.5.5 0 0 1 0-.707z"/>
                                  <path d="M10 8a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
                                  <path fill-rule="evenodd" d="M8 8.5a.5.5 0 0 1 .5.5v6.5a.5.5 0 0 1-1 0V9a.5.5 0 0 1 .5-.5z"/>
                                </svg>&nbsp;&nbsp;Ngành học này vẫn hoạt động</span>
                                <div class="progress custom-progress-success">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 5%"
                                         aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="fund-raised d-block" style="font-family:arial,serif;color:red;">Chưa học, tài liệu đang được sưu tầm</span>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>
    </c:if></div>
<!-- End DE -->

<hr style="display: block;height: 1px;order: 0;border-top: 4px solid #ccc;margin: 1em 0;padding: 0;"/>

<!-- DS -->
<div id="document-section" class="site-section fund-raisers bg-light" style="font-family: arial,serif;">

    <!--Head of DS-->
    <div class="container">
        <div class="row mb-3 justify-content-center"
             style="padding-top:25px;border-radius:15px;background-image: linear-gradient(orangered,black);background-image: url('https://chuyengiahoangphuc.com/wp-content/uploads/2018/08/dark-blue-triangles-web-abstract-background-loop-4k-4096x2304_nez3oanrl__F0000.png')">
            <div class="col-md-8 text-center">
                <h2 style="font-size: 40px;color:white;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-folder-symlink-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2l.04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14h10.348a2 2 0 0 0 1.991-1.819l.637-7A2 2 0 0 0 13.81 3zM2.19 3c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 0 1 1-.98h3.672a1 1 0 0 1 .707.293L7.586 3H2.19zm9.608 5.271l-3.182 1.97c-.27.166-.616-.036-.616-.372V9.1s-2.571-.3-4 2.4c.571-4.8 3.143-4.8 4-4.8v-.769c0-.336.346-.538.616-.371l3.182 1.969c.27.166.27.576 0 .742z"/>
                </svg>&nbsp;&nbsp;[DS] QUẢN TRỊ KINH DOANH</h2>
                <p class="lead" style="font-size: 4vh;color:white;font-family: arial,serif;">Hiện tại chưa có bất kỳ
                    tài liệu nào về lĩnh vực này, các bạn có thể đóng góp thêm <a
                            href="https://docs.google.com/forms/d/e/1FAIpQLSepOiRp8xAGXkNOOA8gm--qSi6AiXsZC7dmDplAgi7e3ICeDw/viewform"
                            target="_blank">tại đây
                    </a></p>
                <p class="lead" style="font-size: 3vh;color:cyan;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-checklist" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                    <path fill-rule="evenodd" d="M7 5.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm-1.496-.854a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0zM7 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm-1.496-.854a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/>
                </svg>&nbsp;&nbsp;Các khóa học được cập nhật lần cuối vào 02/11/20</p>
                <c:if test="${sessionScope.user==null}">
                    <p class="lead" style="font-size: 3vh;color:red;">Không thể xem tài liệu khi chưa đăng nhập
                    <button style="padding-top:3px;background: none;font-size: 12px;color:white" onclick="showInstructionLogin()"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-question-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M5.25 6.033h1.32c0-.781.458-1.384 1.36-1.384.685 0 1.313.343 1.313 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.007.463h1.307v-.355c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.326 0-2.786.647-2.754 2.533zm1.562 5.516c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
                    </svg> How to login with FPT mail</button></p>
                </c:if>
            </div>
        </div>
    </div>

    <!--List of DS-->

</div>
<!-- End DS -->

<hr style="display: block;height: 1px;order: 0;border-top: 4px solid #ccc;margin: 1em 0;padding: 0;"/>

<!-- Remote Document -->
<div id="document-section" class="site-section fund-raisers bg-light" style="font-family: arial,serif;">

    <div class="container">
        <div class="row mb-3 justify-content-center"
             style="padding-top:25px;border-radius:15px;background-image: linear-gradient(orangered,black);">
            <div class="col-md-8 text-center">
                <h2 style="font-size: 40px;color:white;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-file-earmark-zip-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M2 3a2 2 0 0 1 2-2h.5v1h1v1h-1v1h1v1h-1v1h1v1H7V6H6V5h1V4H6V3h1V2H6V1h3.293a1 1 0 0 1 .707.293L13.707 5a1 1 0 0 1 .293.707V13a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V3zm7 2V2l4 4h-3a1 1 0 0 1-1-1zM5.5 7.5a1 1 0 0 0-1 1v.938l-.4 1.599a1 1 0 0 0 .416 1.074l.93.62a1 1 0 0 0 1.109 0l.93-.62a1 1 0 0 0 .415-1.074l-.4-1.599V8.5a1 1 0 0 0-1-1h-1zm0 1.938V8.5h1v.938a1 1 0 0 0 .03.243l.4 1.598-.93.62-.93-.62.4-1.598a1 1 0 0 0 .03-.243z"/>
                </svg>&nbsp;&nbsp;Truy cập nhanh các tài liệu bí mật</h2>
                <p class="lead" style="font-size: 4vh;color:white;font-family: arial,serif;">Nhập mã tài liệu (được
                    cung cấp
                    nội bộ) vào bên dưới</p>
                <p class="lead" style="font-size: 3vh;color:cyan;">Cập nhật lần cuối vào 02/11/2020</p>
                <p class="lead" style="font-size: 10px;color:grey;">Demo: <span id="copyText" style="color:darkgoldenrod">F&@#)FM(!#@*^$GF(*#^FG!#KC#&?44#!$&*!#MH($M#f4f3~~~~~3f24f</span>&nbsp;<button onclick="copyFunction()">Copy</button></p>
                <form action="view_remote_document.action">
                    <label>
                        <input id="copyInput" type="text" name="hash" placeholder="Nhập Code" required/>
                    </label>
                    <input  type="submit" class="btn-success"
                           value="TRUY CẬP"
                           style="font-size: 20px;border-radius: 5px" />
                </form>

            </div>
        </div>
    </div>

</div>
<!-- End Remote Document -->

<div class="container">
    <div class="fb-comments" data-href="https://www.facebook.com/satfomacej/posts/1181478785534332" data-numposts="5" data-width="100%"></div>
</div>

<jsp:include page="../../Common/_js.jsp"/>
<jsp:include page="../../Common/footer.jsp"/>

<script>

    function copyFunction() {
        var copyText = document.getElementById("copyText");
        document.getElementById("copyInput").value=copyText.innerHTML;
    }

    function showInstructionLogin() {
        Swal.fire({
            width: 1000,
            height: 1000,
            imageUrl:"Resource/img/Ins/login.gif",
            videoWidth: 1000,
            videoHeight: 1000,
            showCloseButton: true,
            showCancelButton: false,
            showConfirmButton: false,
        })
    }
    function showInstructionD1() {
        Swal.fire({
            width: 1000,
            height: 1000,
            imageUrl:"Resource/img/Ins/document1.gif",
            videoWidth: 1000,
            videoHeight: 1000,
            showCloseButton: true,
            showCancelButton: false,
            showConfirmButton: false,
        })
    }
</script>
</body>
</html>
