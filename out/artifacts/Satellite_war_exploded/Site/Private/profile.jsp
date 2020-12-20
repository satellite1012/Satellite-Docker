<%@page import="main.java.Database.UserModel.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User userSelected=null,userLogin=null;
    String role=null,roleColor=null;
    int editnable=2;
    try {
        //Get user
        userSelected = (User) session.getAttribute("user_selected");
        userLogin = (User) session.getAttribute("user");

        //Get role
        //0: admin edit
        //1: user edit
        //2: guest not edit
        if (userLogin==null) editnable=2;
        else if (userLogin.getuRole()==0) editnable=0;
        else if (userLogin.getId()==userSelected.getId()&&userLogin.getId()!=4) editnable=1;
        else editnable=2;

        //Progressing Role
        role = "";
        switch (userSelected.getuRole()) {
            case 0:
                role = "O W N E R";
                roleColor = "orange";
                break;
            case 1:
                role = "C O N T R I B U T O R";
                roleColor = "yellow";
                break;
            case 2:
                role = "P R I M A R Y   U S E R";
                roleColor = "cyan";
                break;
            case 3:
                role = "G U E S T   A C C O U N T";
                roleColor = "white";
                break;
        }
    } catch (Exception e) {
        response.sendRedirect("login");
    }
%>
        
<!DOCTYPE html>
<html>
    <head>
        <title>Satellite | <%=userSelected.getuName()%></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Trang cá nhân của <%=userSelected.getuName()%>">
        <meta name="keywords" content="HTML,CSS,XML,JavaScript">
        <meta name="author" content=Đoàn Đức Tín>

        <link rel="stylesheet" href="Resource/assets1/css/LineIcons.css">
        <link rel="stylesheet" href="Resource/assets1/css/magnific-popup.css">
        <link rel="stylesheet" href="Resource/assets1/css/default.css">
        <link rel="stylesheet" href="Resource/assets1/css/style.css">
        <c:if test="${sessionScope.log_UserController != null}">
            <script>
                window.onload = function showLog() {
                    Swal.fire({
                        icon: 'error',
                        title: '${sessionScope.log_UserController}',
                        text: 'Satellite | ErrorLog',
                        footer: '<a href="https://www.facebook.com/satfomacej" target="_blank">You think this is a bug? contact admin now</a>'
                    })
                };
            </script>
            <c:set var="log_UserController" value="${null}" scope="session"/>
        </c:if>
        <jsp:include page="/Common/_css.jsp" />
    </head>
    <body>

    <!--Facebook-->
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0" nonce="4TU3IejE"></script>
    <div style="font-size:40px;z-index: 999; position: fixed;bottom: 20px;left: 28px"  class="fb-share-button" data-href="http://satellite-fpt.azurewebsites.net/view_user?userId_view=<%=userSelected.getId()%>" data-layout="button" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fsatellite-fpt.azurewebsites.net%2Fview_user%3FuserId_view%3D<%=userSelected.getId()%>&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ tài khoản này</a></div>

    <jsp:include page="/Common/header.jsp" />
        <% assert userSelected != null; %>

        <!--====== PRELOADER PART START ======-->
        <div class="preloader">
            <div class="loader_34">
                <div class="ytp-spinner">
                    <div class="ytp-spinner-container">
                        <div class="ytp-spinner-rotator">
                            <div class="ytp-spinner-left">
                                <div class="ytp-spinner-circle" ></div>
                            </div>
                            <div class="ytp-spinner-right">
                                <div class="ytp-spinner-circle" ></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--====== PRELOADER ENDS START ======-->
        <div class="block-31" style="position: relative;">
            <div class="owl-carousel loop-block-31 ">
              <div class="block-30 item" style="background-image: url('${pageContext.request.contextPath}/Resource/img/Profile/bg.jpg');" data-stellar-background-ratio="0.5">
                <div class="container">
                  <div class="row align-items-center justify-content-center text-center">
                    <div class="col-md-12">
                      <br><br><br><br><br>
                      <h2 class="heading mb-3">Xin chào, <%=userSelected.getuName()%></h2>
                      <h5 style="font-family: arial,serif;color:<%=roleColor%>;text-align: center;"><%=role%></h5>
                      <br><br><br><br><br><br>
                      <p style="color:white;font-size:20px;margin:0;">Account Details</p>
                      <a href="#account-section">         
                      <span class=" icon-keyboard_arrow_down" style="size: 88px;font-size:88px;"></span>
                      </a>
                    </div>
                  </div>       
                </div>       
              </div>
            </div>
        </div>
        
        <!--====== ABOUT PART START ======-->
        <section id="account-section" style="margin-top: 40px" >
            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-6" style="margin-left: 120px;">
                        <div class="about-content mt-30">
                            <div class="single-service text-center mt-30">
                                <h2 class="about-title" style="font-family:arial,serif;color:orangered;font-size: 30px;margin-bottom: 0;"><%=userSelected.getuDigitalName()%></h2>
                                <p style="font-family:arial,serif;"><%=role%></p>
                                <br><hr><br>
                                <c:if test="<%=editnable==1%>">
                                    <button onclick="editUser1(<%=userSelected.getId()%>,'<%=userSelected.getuName()%>','<%=userSelected.getuPass()%>','<%=userSelected.getuDigitalName()%>','<%=userSelected.getuPhone()%>','<%=userSelected.getuDob()%>','<%=userSelected.getuLocation()%>','<%=userSelected.getuCmt_title()%>','<%=userSelected.getuCmt_descrip()%>',<%=userSelected.getuStrength_backend()%>,<%=userSelected.getuStrength_frontend()%>,<%=userSelected.getuStrength_alogrythm()%>,<%=userSelected.getuStrength_designer()%>,<%=userSelected.getuStrength_creation()%>)" style="background-color:#007bff;padding: 5px 9px 5px 9px;border-radius:8px;font-size: 20px;color:white" ><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                    </svg>&nbsp;&nbsp;Chỉnh sửa thông tin</button>
                                </c:if>
                                <c:if test="<%=editnable==0%>">
                                    <button onclick="editUser0(<%=userSelected.getId()%>,'<%=userSelected.getuName()%>','<%=userSelected.getuPass()%>','<%=userSelected.getuDigitalName()%>','<%=userSelected.getuPhone()%>','<%=userSelected.getuDob()%>','<%=userSelected.getuLocation()%>','<%=userSelected.getuCmt_title()%>','<%=userSelected.getuCmt_descrip()%>',<%=userSelected.getuStrength_backend()%>,<%=userSelected.getuStrength_frontend()%>,<%=userSelected.getuStrength_alogrythm()%>,<%=userSelected.getuStrength_designer()%>,<%=userSelected.getuStrength_creation()%>)" style="background-color:#007bff;padding: 5px 9px 5px 9px;border-radius:8px;font-size: 20px;color:white"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                    </svg>&nbsp;&nbsp;Chỉnh sửa thông tin</button>
                                </c:if>
                            </div>
                        </div> <!-- about content -->
                    </div>

                    <div class="col-xl-4 offset-xl-1 col-lg-5 single-service text-center mt-30" style="margin: 28px;">
                        <img id="preview-avatar" class="header-image" src="<%=userSelected.getuImage()%>" style="max-width: 200px;max-height: 200px">
                        <br>
                        <c:if test="<%=editnable<2%>">
                            <input onchange="previewFile()" name='image' type='file' style="background-color:#007bff;display: inline-block;max-width: 200px;padding: 5px 9px 5px 9px;border-radius:8px;font-size: 20px;margin:20px;color:white">
                            <input id="imgBase64" type="hidden" name="imgBase64">

                            <button  onclick="editImage(<%=userSelected.getId()%>)" style="background-color:#007bff;padding: 5px 9px 5px 9px;border-radius:8px;font-size: 20px;color:white; display: inline-block;margin:20px;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                            </svg>&nbsp;&nbsp;UPLOAD</button>
                        </c:if>
                    </div>
                </div> <!-- row -->

                <c:if test="${sessionScope.user.uRole eq 0}">
                    <div class="row">
                        <div class="col-md-10" style="margin-left: 120px;">
                            <div class="about-content mt-30">
                                <div class="single-service text-center mt-30">
                                    <h2 class="about-title" style="font-family:arial,serif;color:orangered;font-size: 30px;margin-bottom: 0;">ADMIN FUNCTION</h2>
                                    <p style="font-family:arial,serif;"><%=role%></p>
                                    <br><hr><br>
                                    <button onclick="reloadQAFPTList()" style="background-color:#007bff;padding: 5px 9px 5px 9px;border-radius:8px;font-size: 20px;color:white" ><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                    </svg>&nbsp;&nbsp;Reload QA FPT List</button>
                                    <button onclick="reloadToolList()" style="background-color:#007bff;padding: 5px 9px 5px 9px;border-radius:8px;font-size: 20px;color:white" ><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                    </svg>&nbsp;&nbsp;Reload Tool List</button>
                                    <button onclick="reloadProductList()" style="background-color:#007bff;padding: 5px 9px 5px 9px;border-radius:8px;font-size: 20px;color:white" ><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                    </svg>&nbsp;&nbsp;Reload Product List</button>
                                </div>
                            </div> <!-- about content -->
                        </div>

                    </div> <!-- row -->
                </c:if>

                <div class="row">
                    <div class="col-lg-5" style="margin:0px 4vw">
                        <div class="about-content mt-30">
                            <div class="single-service text-center mt-30">
                                <h2 class="about-title" style="font-family:arial,serif;color:orangered;font-size: 30px;margin-bottom: 0;"><%=userSelected.getuCmt_title()%></h2>
                                <p style="font-family:arial,serif;"><%=userSelected.getuCmt_descrip()%></p>
                            </div>
                            <div class="single-service text-center mt-30" style="border: 3px solid orange">
                            <div class="service-icon">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hexagon-half" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="color:orangered;font-size: 80px;">
                                <path fill-rule="evenodd" d="M14 4.577L8 1v14l6-3.577V4.577zM8.5.134a1 1 0 0 0-1 0l-6 3.577a1 1 0 0 0-.5.866v6.846a1 1 0 0 0 .5.866l6 3.577a1 1 0 0 0 1 0l6-3.577a1 1 0 0 0 .5-.866V4.577a1 1 0 0 0-.5-.866L8.5.134z"></path>
                                </svg>
                            </div>
                            <div class="service-content" style="font-family: Arial, sans-serif">
                                <h4 class="service-title"><a href="#" style="color:orangered;">TÀI NGUYÊN STONE : <%=userSelected.getuStone()%> </a><a href="#getstone-section"><button class="btn-success" style="margin-left:10px;font-size:45px;padding: 0 10px 10px 10px">+</button></a></h4>
                                <hr><h6 style="font-size: 18px;">Sử dụng <span style="color:orangered;">STONE</span> để xem tài liệu tính phí hoặc tải các phần mềm ở trang <a href="projects.action" style="color:orangered;">PROJECT</a></h6>
                            </div>
                            </div><br>
                            <ul class="clearfix">
                                <li>
                                    <div class="single-info d-flex align-items-center">
                                        <div class="info-icon">
                                            <i class="lni-calendar"></i>
                                        </div>
                                        <div class="info-text">
                                            <p><span>Date of birth:</span> <%=userSelected.getuDob()%></p>
                                        </div>
                                    </div> <!-- single info -->
                                </li>
                                <li>
                                    <div class="single-info d-flex align-items-center">
                                        <div class="info-icon">
                                            <i class="lni-envelope"></i>
                                        </div>
                                        <div class="info-text">
                                            <p><span>Email:</span> <%=userSelected.getuEmail()%></p>
                                        </div>
                                    </div> <!-- single info -->
                                </li>
                                <li>
                                    <div class="single-info d-flex align-items-center">
                                        <div class="info-icon">
                                            <i class="lni-phone-handset"></i>
                                        </div>
                                        <div class="info-text">
                                            <p><span>Phone:</span> <%=userSelected.getuPhone()%></p>
                                        </div>
                                    </div> <!-- single info -->
                                </li>
                                <li>
                                    <div class="single-info d-flex align-items-center">
                                        <div class="info-icon">
                                            <i class="lni-map-marker"></i>
                                        </div>
                                        <div class="info-text">
                                            <p><span>Location:</span> <%=userSelected.getuLocation()%></p>
                                        </div>
                                    </div> <!-- single info -->
                                </li>
                            </ul>
                        </div> <!-- about content -->
                    </div>

                    <div class="col-xl-5 col-lg-5 single-service text-center mt-30" style="margin:30px 4vw">
                        <div class="about-skills pt-25">
                            <div class="skill-item mt-25">
                                <div class="skill-header">
                                    <h6 class="skill-title">BACK - END</h6>
                                    <div class="skill-percentage">
                                        <div class="count-box counted">
                                            <span class="counter"><%=userSelected.getuStrength_backend()%></span>
                                        </div>
                                        %
                                    </div>
                                </div>
                                <div class="skill-bar">
                                    <div class="bar-inner">
                                        <div class="bar progress-line" data-width="<%=userSelected.getuStrength_backend()%>" style="background-color:orangered;"></div>
                                    </div>
                                </div>
                            </div> <!-- skill item -->
                            <div class="skill-item mt-25">
                                <div class="skill-header">
                                    <h6 class="skill-title">FRONT - END</h6>
                                    <div class="skill-percentage">
                                        <div class="count-box counted">
                                            <span class="counter"><%=userSelected.getuStrength_frontend()%></span>
                                        </div>
                                        %
                                    </div>
                                </div>
                                <div class="skill-bar">
                                    <div class="bar-inner">
                                        <div class="bar progress-line" data-width="<%=userSelected.getuStrength_frontend()%>" style="background-color:orangered;"></div>
                                    </div>
                                </div>
                            </div> <!-- skill item -->
                            <div class="skill-item mt-25">
                                <div class="skill-header">
                                    <h6 class="skill-title">ALGORITHM</h6>
                                    <div class="skill-percentage">
                                        <div class="count-box counted">
                                            <span class="counter"><%=userSelected.getuStrength_alogrythm()%></span>
                                        </div>
                                        %
                                    </div>
                                </div>
                                <div class="skill-bar">
                                    <div class="bar-inner">
                                        <div class="bar progress-line" data-width="<%=userSelected.getuStrength_alogrythm()%>" style="background-color:orangered;"></div>
                                    </div>
                                </div>
                            </div> <!-- skill item -->
                            <div class="skill-item mt-25">
                                <div class="skill-header">
                                    <h6 class="skill-title">PHOTOSHOP / DESIGN</h6>
                                    <div class="skill-percentage">
                                        <div class="count-box counted">
                                            <span class="counter"><%=userSelected.getuStrength_designer()%></span>
                                        </div>
                                        %
                                    </div>
                                </div>
                                <div class="skill-bar">
                                    <div class="bar-inner">
                                        <div class="bar progress-line" data-width="<%=userSelected.getuStrength_designer()%>" style="background-color:orangered;"></div>
                                    </div>
                                </div>
                            </div> <!-- skill item -->
                            <div class="skill-item mt-25">
                                <div class="skill-header">
                                    <h6 class="skill-title">CREATION</h6>
                                    <div class="skill-percentage">
                                        <div class="count-box counted">
                                            <span class="counter"><%=userSelected.getuStrength_creation()%></span>
                                        </div>
                                        %
                                    </div>
                                </div>
                                <div class="skill-bar">
                                    <div class="bar-inner">
                                        <div class="bar progress-line" data-width="<%=userSelected.getuStrength_creation()%>" style="background-color:orangered;"></div>
                                    </div>
                                </div>
                            </div> <!-- skill item -->
                            <br><br><hr><br>
                            <p style="font-weight:600;color:orange;font-family: Dosis, sans-serif"><b>Ngày tạo tài khoản: </b><span style="color:wheat"><b><%=userSelected.getuDatecreated()%></b></span></p>
                            <p style="font-weight:600;color:orange;font-family: Dosis, sans-serif"><b>Ngày chỉnh sửa gần nhất: </b><span style="color:wheat"><b><%=userSelected.getuDateupdate()%></b></span></p>
                        </div> <!-- about skills -->
                    </div>
                </div> <!-- row -->
            </div> <!-- container -->
        </section>
        <!--====== ABOUT PART ENDS ======-->

        <hr style="display: block;height: 1px;order: 0;border-top: 4px solid #ccc;margin: 1em 0;padding: 0;"/>

        <!--====== WORK PART START ======-->
        <section id="getstone-section" style="margin-top: 40px">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="section-title pb-25" style="text-align:center;">
                            <h2 class="title" style="color:orange">NHẬN THÊM STONE</h2>
                            <p style="font-size:18px;font-weight:600;color:black;font-family:arial,serif;">Mọi thứ là FREE, đừng tin bất kỳ ai bán tài nguyên cho bạn, STONE được thêm vào nhằm đảm bảo các trang tài liệu không bị quá tải bởi nhiều lượt download trong ngày</p>
                        </div> <!-- section title -->
                    </div>
                </div> <!-- row -->
                <br>
                <div class="row">
                    
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <h2 style="font-family:arial,serif;color:orange;text-align: center;">GIỚI THIỆU BẠN BÈ</h2>
                        <div class="single-work text-center mt-30">
                            <div class="work-image">
                                <img src="Resource/img/Profile/work1.jpg" alt="work">
                            </div>
                            <div class="work-overlay">
                                <div class="work-content">
                                    <h3 class="work-title">Chia sẻ website hoặc bài viết bên dưới trên facebook, sau khi chia sẻ 3 ngày, hãy gửi link bài chia sẻ về <a style="color:cyan;" href="https://www.facebook.com/satfomacej/" >ĐOÀN ĐỨC TÍN</a> và nhận STONE (1 Like = 10 STONE)</h3>
                                    <ul>
                                        <li><a class="image-popup" href="Resource/img/Profile/work1.jpg"><i class="lni-plus"></i></a></li>
                                        <li><a href="https://www.facebook.com/satfomacej/posts/1181478785534332" target="_blank"><i class="lni-link"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div> <!-- single work -->
                    </div>
                    
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <h2 style="font-family:arial,serif;color:orange;text-align: center;">BAO NƯỚC</h2>
                        <div class="single-work text-center mt-30">
                            <div class="work-image">
                                <img src="Resource/img/Profile/work2.jpg" alt="work">
                            </div>
                            <div class="work-overlay">
                                <div class="work-content">
                                    <h3 class="work-title">Gạ kèo các admins đi cafe và nhận ngay 200 STONE</h3>
                                    <ul>
                                        <li><a class="image-popup" href="Resource/img/Profile/work2.jpg"><i class="lni-plus"></i></a></li>
                                        <li><a href="https://www.facebook.com/groups/2519386961490453" target="_blank"><i class="lni-link"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div> <!-- single work -->
                    </div>
                    
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <h2 style="font-family:arial,serif;color:orange;text-align: center;">XIN XỎ</h2>
                        <div class="single-work text-center mt-30">
                            <div class="work-image">
                                <img src="Resource/img/Profile/work3.jpg" alt="work">
                            </div>
                            <div class="work-overlay">
                                <div class="work-content">
                                    <h3 class="work-title">XIN XỎ</h3>
                                    <ul>
                                        <li><a class="image-popup" href="Resource/img/Profile/work3.jpg"><i class="lni-plus"></i></a></li>
                                        <li><a href="https://www.youtube.com/watch?v=jtsFB-lwc3M" target="_blank"><i class="lni-link"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div> <!-- single work -->
                    </div>
                    
                </div> <!-- row -->
            </div> <!-- container -->
        </section>
        <!--====== WORK PART ENDS ======-->

        <hr style="display: block;height: 1px;order: 0;border-top: 4px solid #ccc;margin: 1em 0;padding: 0;"/>

        <!--====== PRICING PART START ======-->
        <section id="pricing" style="margin-top: 40px">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="section-title text-center pb-25" style="font-family: Dosis, sans-serif">
                            <h2 class="title">CÁC LOẠI TÀI KHOẢN</h2>
                            <p style="font-size: 18px;">Chọn dịch vụ phù hợp với nhu cầu của bạn</p>
                        </div> <!-- section title -->
                    </div>
                </div> <!-- row -->
                <div class="row justify-content-center">

                    <!--GUEST-->
                    <div class="col-lg-4 col-md-8 col-sm-9">
                        <div class="single-pricing text-center mt-30">
                            <div class="pricing-package">
                                <h4 class="package-title" style="background-color: dimgrey">GUEST ACCOUNT</h4>
                            </div>
                            <div class="pricing-body" style="height:170vh;font-family: arial,serif;">
                                <div class="pricing-text">
                                    <p>Tài khoản công khai với mật khẩu và tên người dùng là <span style="color:orangered">guest</span>, dùng để các bạn thử nghiệm tính năng của website trước khi đăng ký tài khoản chính thức</p>
                                    <span class="price" style="color:green;">0.000 VNĐ</span>
                                </div>
                                <div class="pricing-list">
                                    <ul>
                                        <li style="padding: 10px">Truy cập được một số tài liệu thường</li><hr>
                                        <li style="padding: 10px">Xem được Blog và tải một số Project</li><hr>
                                        <li style="padding: 10px">Tham gia, tương tác trên các diễn đàn dưới dạng ẩn danh</li><hr>
                                        <li style="padding: 10px">Không có quyền chỉnh sửa hoặc xóa bình luận</li><hr>
                                        <li style="padding: 10px">Profile tĩnh, không thể chỉnh sửa</li>
                                    </ul>
                                </div>
                                <div class="pricing-btn">
                                    <a onmouseover="this.style.color='white';this.style.backgroundColor='orange'"
                                       onmouseleave="this.style.color='orange';this.style.backgroundColor=''"
                                       class="main-btn" href="login.action" style="font-weight:700;box-shadow: none;color: orange; border: 1px solid orange;">TRY NOW</a>
                                </div>
                            </div>
                        </div> <!-- single pricing -->
                    </div>

                    <!--USER-->
                    <div class="col-lg-4 col-md-8 col-sm-9">
                        <div class="single-pricing active text-center mt-30">
                            <div class="pricing-package" style="background-color:cadetblue;">
                                <h4 class="package-title">PRIMARY USER</h4>
                            </div>
                            <div class="pricing-body" style="height:170vh;font-family: arial,serif;">
                                <div class="pricing-text">
                                    <p>Tài khoản thông dụng dùng dành cho hầu hết người dùng, <a href="login.action" style="color:orange;">ĐĂNG KÝ</a> và username, password sẽ được gửi về gmail của bạn nhanh chóng sau khi các admins kiểm duyệt thành công</p>
                                    <span class="price" style="color:green;">0.000 VNĐ</span>
                                </div>
                                <div class="pricing-list" style="font-family: arial,serif;">
                                    <ul>
                                        <li style="padding: 10px">Truy cập được toàn bộ tài liệu công khai</li><hr>
                                        <li style="padding: 10px">Xem được toàn bộ Blogs và Projects</li><hr>
                                        <li style="padding: 10px">Tham gia, tương tác trên các diễn đàn hỏi đáp với tên thật</li><hr>
                                        <li style="padding: 10px">Có thể chỉnh sửa được thông tin cá nhân ở trang Profile</li><hr>
                                        <li style="padding: 10px"><span style="color:orange">[In dev]</span> Báo cáo tài liệu bị thay đổi</li><hr>
                                        <li style="padding: 10px"><span style="color:orange">[In dev]</span> Bình luận công khai dưới tài liệu</li><hr>
                                        <li style="padding: 10px">Nhận ngẫu nhiên từ <span style="color:red;">1000</span> đến <span style="color:red;">3000</span> <span
                                                style="color:orangered;">STONE</span> cho lần đăng nhập đầu tiên</li>
                                    </ul>
                                </div>
                                <div class="pricing-btn">
                                    <a onmouseover="this.style.color='white';this.style.backgroundColor='orange'"
                                       onmouseleave="this.style.color='orange';this.style.backgroundColor='white'"
                                       class="main-btn" href="login.action" style="background-color:white;box-shadow: none;font-weight:700;color: orange; border: 1px solid orange;">TRY NOW</a>
                                </div>
                            </div>
                        </div> <!-- single pricing -->
                    </div>

                    <!--MOD-->
                    <div class="col-lg-4 col-md-8 col-sm-9">
                        <div class="single-pricing text-center mt-30">
                            <div class="pricing-package" style="background-color:orange;">
                                <h4 class="package-title">CONTRIBUTOR</h4>
                            </div>
                            <div class="pricing-body" style="height:170vh;font-family: arial,serif;">
                                <div class="pricing-text">
                                    <p>In Development ...</p>
                                    <span class="price" style="color:darkgray">80.000 VND/Month</span>
                                </div>
                                <div class="pricing-list" style="font-family: arial,serif;">
                                    <ul>
                                        <li style="padding: 10px">Có được toàn bộ đặc quyền (trừ đặc quyền hạn chế) của PRIMARY USER</li><hr>
                                        <li style="padding: 10px">Xem được toàn bộ tài liệu ẩn trên trang chủ</li><hr>
                                        <li style="padding: 10px">Đăng blog ngay lập tức mà không cần duyệt</li><hr>
                                        <li style="padding: 10px">Đăng câu hỏi ngay lập tức mà không cần duyệt</li><hr>
                                        <li style="padding: 10px"><span style="color:orange">[COMMING SOON]</span> Mở dự án và đăng code (cần duyệt)<li><hr>
                                        <li style="padding: 10px">Vô hạn <span style="color:red">STONE</span></li>
                                    </ul>
                                </div>
                                <div class="pricing-btn">
                                    <a onmouseover="this.style.backgroundColor='darkgray'"
                                       onmouseleave="this.style.backgroundColor=''"
                                       class="main-btn" style="color: grey;border: 1px solid grey;box-shadow: none;">BUY NOW</a>
                                </div>
                            </div>
                        </div> <!-- single pricing -->
                    </div>
                </div> <!-- row -->
            </div> <!-- container -->
        </section>
<br><br>
        <!--====== BACK TOP TOP PART START ======-->
        <a href="#" class="back-to-top"><i class="lni-chevron-up"></i></a>

        <!--EDIT-->
        <script>
            function previewFile() {
                const preview = document.getElementById("preview-avatar");
                const file = document.querySelector('input[type=file]').files[0];
                const reader = new FileReader();
                reader.addEventListener("load", function () {
                    var b64 = reader.result;
                    document.getElementById("imgBase64").value = b64;
                    preview.src = reader.result;
                }, false);

                if (file) {
                    reader.readAsDataURL(file);
                }
            }
            function editImage(i){
                //imgBase64=document.getElementById("imgBase64").value;
                imgBase64="https://ichef.bbci.co.uk/news/640/cpsprodpb/2708/production/_105229990_trump.jpg";
                updateImageAPI(i,imgBase64);
            }
            //AJAX
            function updateImageAPI(id,imgBase64) {
                if (document.getElementById("imgBase64").value===""){
                    Swal.fire({
                        icon: 'error',
                        title: 'Bạn chưa tải hình ảnh nào ở hộp thoại bên trái',
                        text: 'Satellite | ErrorLog',
                        footer: '<a href="https://www.facebook.com/satfomacej" target="_blank">You think this is a bug? contact admin now</a>'
                    })
                }else {
                    $.ajax({
                        type: 'POST',
                        url: '/updateUserImage',
                        //contentType: 'application/json',
                        data: {id, imgBase64},
                        success: function (result) {
                            Swal.fire({
                                position: 'top-end',
                                icon: 'success',
                                title: 'Ảnh đã được cập nhật, bạn có thể F5 trang bây giờ',
                                showConfirmButton: false,
                                timer: 2000
                            })
                        },
                        error: function (error) {
                            Swal.fire({
                                position: 'top-end',
                                icon: 'failure',
                                title: 'Vui lòng thử một hình ảnh nhỏ hơn 2mb',
                                showConfirmButton: false,
                                timer: 2000
                            })
                        }
                    });
                }
            }
            function editUser0(i,un,pass,name,phone,dob,location,title,descrip,s1,s2,s3,s4,s5) {
                var today = new Date();
                var dd = String(today.getDate()).padStart(2, '0');
                var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                var yyyy = today.getFullYear();
                today = yyyy + '-' + mm + '-' + dd+" "+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
                Swal.fire({
                    width: 800,
                    title: '<span style="color:orangered;"><strong>Sửa thông tin tài khoản: Username = </strong>'+un+'</span>',
                    icon: 'info',
                    html:
                        '<form action="edit_user_0" method="post" style="font-size:22px;">' +
                        '<div class="container"><div class="row">' +
                        '<div class="col-6">'+
                        '<input type="hidden" name="userId_edit" value="'+i+'">'+
                        'Nhập password mới<br><input type="text" name="uPass_edit" value="'+pass+'"><br><hr>' +
                        'Nhập tên mới<br><input type="text" name="uName_edit" value="'+name+'"><br><hr>' +
                        'Nhập số điện thoại<br><input type="text" name="uPhone_edit" value="'+phone+'"><br><hr>' +
                        'Nhập ngày sinh<br><input type="date" name="uDob_edit" value="'+dob+'"><br><hr>' +
                        '</div><div class="col-6">'+
                        'Nhập nơi sinh sống<br><input type="text" name="uLocation_edit" value="'+location+'"><br><hr>' +
                        'Nhập tiêu đề giới thiệu<br><textarea type="text" name="uTitle_edit" >'+title+'</textarea><br><hr>' +
                        'Nhập thông tin mô tả<br><textarea type="text" name="uDescrip_edit" >'+descrip+'</textarea><br><hr>' +
                        'S1<input type="text" name="uS1_edit" value="'+s1+'">' +
                        'S2<input type="text" name="uS2_edit" value="'+s2+'">' +
                        'S3<input type="text" name="uS3_edit" value="'+s3+'">' +
                        'S4<input type="text" name="uS4_edit" value="'+s4+'">' +
                        'S5<input type="text" name="uS5_edit" value="'+s5+'"><br><hr>' +
                        '<input type="hidden" name="thisdate" value="'+today+'"><br><hr>' +
                        '</div></div></div>'+
                        '<input style="padding:0px 30px 0px 30px;font-size:30px;border-radius:5px;background-color:orangered;color:white;" type="submit" value="SỬA"></form>',
                    showCloseButton: true,
                    showCancelButton: true,
                    showConfirmButton: false,
                    focusConfirm: false,
                    cancelButtonText:
                        'Hủy bỏ',
                    cancelButtonAriaLabel: 'Thumbs down'
                });
            }
            function editUser1(i,un,pass,name,phone,dob,location,title,descrip,s1,s2,s3,s4,s5) {
                var today = new Date();
                var dd = String(today.getDate()).padStart(2, '0');
                var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                var yyyy = today.getFullYear();
                today = yyyy + '-' + mm + '-' + dd+" "+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
                Swal.fire({
                    width: 800,
                    title: '<span style="color:orangered;"><strong>Sửa thông tin tài khoản: Username = </strong>'+un+'</span>',
                    icon: 'info',
                    html:
                        '<form action="edit_user_1" method="post" style="font-size:22px;">' +
                        '<div class="container"><div class="row">' +
                        '<div class="col-6">'+
                        '<input type="hidden" name="userId_edit" value="'+i+'">'+
                        'Nhập password mới<br><input type="text" name="uPass_edit" value="'+pass+'"><br><hr>' +
                        'Nhập tên mới<br><input type="text" name="uName_edit" value="'+name+'"><br><hr>' +
                        'Nhập số điện thoại<br><input type="text" name="uPhone_edit" value="'+phone+'"><br><hr>' +
                        'Nhập ngày sinh<br><input type="date" name="uDob_edit" value="'+dob+'"><br><hr>' +
                        'Nhập nơi sinh sống<br><input type="text" name="uLocation_edit" value="'+location+'"><br><hr>' +
                        'Nhập tiêu đề giới thiệu<br><textarea type="text" name="uTitle_edit" >'+title+'</textarea><br><hr>' +
                        '</div><div class="col-6">'+
                        'Nhập thông tin mô tả<br><textarea type="text" name="uDescrip_edit" >'+descrip+'</textarea><br><hr>' +
                        'BA-END&nbsp&nbsp<input type="text" name="uS1_edit" value="'+s1+'"><br><br>' +
                        'FR-END&nbsp&nbsp<input type="text" name="uS2_edit" value="'+s2+'"><br><br>' +
                        'ALGORY&nbsp&nbsp<input type="text" name="uS3_edit" value="'+s3+'"><br><br>' +
                        'DESIGN&nbsp&nbsp<input type="text" name="uS4_edit" value="'+s4+'"><br><br>' +
                        'CREATE&nbsp&nbsp<input type="text" name="uS5_edit" value="'+s5+'"><br><hr>' +
                        '<input type="hidden" name="thisdate" value="'+today+'"><br><hr>' +
                        '</div></div></div>'+
                        '<input style="padding:0px 30px 0px 30px;font-size:30px;border-radius:5px;background-color:orangered;color:white;" type="submit" value="SỬA"></form>',
                    showCloseButton: true,
                    showCancelButton: true,
                    showConfirmButton: false,
                    focusConfirm: false,
                    cancelButtonText:
                        'Hủy bỏ',
                    cancelButtonAriaLabel: 'Thumbs down'
                });
            }
        </script>
        <script src="Resource/assets1/js/vendor/modernizr-3.6.0.min.js"></script>
        <script src="Resource/assets1/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="Resource/assets1/js/popper.min.js"></script>
        <script src="Resource/assets1/js/jquery.magnific-popup.min.js"></script>
        <script src="Resource/assets1/js/parallax.min.js"></script>
        <script src="Resource/assets1/js/waypoints.min.js"></script>
        <script src="Resource/assets1/js/jquery.counterup.min.js"></script>
        <script src="Resource/assets1/js/jquery.appear.min.js"></script>
        <script src="Resource/assets1/js/scrolling-nav.js"></script>
        <script src="Resource/assets1/js/jquery.easing.min.js"></script>
        <script src="Resource/assets1/js/main.js"></script>
        <jsp:include page="/Common/_js.jsp" />
        <jsp:include page="/Common/footer.jsp" />

    <c:if test="${sessionScope.user.uRole eq 0}">
    <script>
        //AJAX
        function reloadQAFPTList() {
            $.ajax({
                type: 'POST',
                url: '/reloadQAFPTList',
                //contentType: 'application/json',
                //data: {data},
            }).done(function(result) {
                if(result.toString().substring(0,7)==="//ERROR"){
                    Swal.fire({
                        position: 'top-end',
                        icon: 'error',
                        title: result.toString().substring(7),
                        showConfirmButton: false,
                        timer: 2000
                    })
                }else {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: "Thao tác thành công",
                        showConfirmButton: false,
                        timer: 2000
                    })
                }
            });
        }
        function reloadToolList() {
            $.ajax({
                type: 'POST',
                url: '/reloadToolList',
                //contentType: 'application/json',
                //data: {data},
            }).done(function(result) {
                if(result.toString().substring(0,7)==="//ERROR"){
                    Swal.fire({
                        position: 'top-end',
                        icon: 'error',
                        title: result.toString().substring(7),
                        showConfirmButton: false,
                        timer: 2000
                    })
                }else {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: "Thao tác thành công",
                        showConfirmButton: false,
                        timer: 2000
                    })
                }
            });
        }
        function reloadProductList() {
            $.ajax({
                type: 'POST',
                url: '/reloadProductList',
                //contentType: 'application/json',
                //data: {data},
            }).done(function(result) {
                if(result.toString().substring(0,7)==="//ERROR"){
                    Swal.fire({
                        position: 'top-end',
                        icon: 'error',
                        title: result.toString().substring(7),
                        showConfirmButton: false,
                        timer: 2000
                    })
                }else {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: "Thao tác thành công",
                        showConfirmButton: false,
                        timer: 2000
                    })
                }
            });
        }
    </script>
    </c:if>
    </body>
</html>
