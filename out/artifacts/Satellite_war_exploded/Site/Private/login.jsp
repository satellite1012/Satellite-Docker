<%@ page import="java.time.LocalDateTime" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id"
          content="888567468389-5h2gfmlvp5blgria6dnauldlbniloaio.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>

    <jsp:include page="/Common/_css.jsp"/>
    <link rel="stylesheet" type="text/css" href="Resource/css/login.css">
    <link rel="stylesheet" type="text/css" href="Resource/css/bootstrap.min.css">
    <title>Satellite | Assigned</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Trang đăng nhập">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta name="author" content=Đoàn Đức Tín>
</head>
<body style="background-image:url('${pageContext.request.contextPath}/Resource/img/bgLogin.jpg');text-shadow:1px 1px black;">
<br>
<br>
<div class="container" style="border-radius:12px;background: rgba(0,0,0,0.7)">
    <div class="row">
        <div class="col-md-12 rightNum1 heade">
            <div class="rightNum2">
                <h1 class="text-center" style="font-weight: 600">Chào mừng bạn đã quay trở lại</h1>
                <br>
                <h2 class="text-center" style="font-weight:600;color:orange;text-shadow:1px 1px black;">Để có thể sử dụng mọi tính năng,
                    vui lòng đăng nhập</h2>
                <c:if test="${sessionScope.log_UserController != null}">
                    <h5 style="text-align: center;padding: 18px;border-radius: 10px;color: red;background-color: rgba(0, 0, 0, 0.6);font-family: arial,serif;">${sessionScope.log_UserController}</h5>
                    <c:set var="log_UserController" value="${null}" scope="session"  />
                </c:if>
            </div>
        </div>
    </div>
    <div class="row" style="padding-bottom: 110px;">
        <div class="col-md-4 ">
        </div>
        <div class="col-md-4 rightNum1 heade">
            <div class="rightNum2">
                <form action="user_login" method="post">
                    <p class="text-center" style="color:white;">Don't have an account? <a
                            href="https://www.facebook.com/satfomacej" style="color:orange;">Contact admin</a></p>
                    <input type="text" class="form-control" id="uName" name="username" placeholder="Username" required>
                    <small id="userError" class=" text-danger"></small>
                    <input type="password" class="form-control" id="pWord" name="password" placeholder="Password" required>
                    <input type="checkbox" id="chk" style="font-size:18px;color:white;"> <small style="color:white;">Remember me</small>
                    <input type="submit" class="btn btn-info"
                           style="margin:15px 10px 0px 0px; background-color:orange; float:right; "
                           value="LOGIN"/>
                </form>
                <br>
                <form action="user_login" method="post">
                    <input type="hidden" name="username" value="guest">
                    <input type="hidden" name="password" value="guest">
                    <input type="submit" class="btn btn-info"
                           style="margin:23px 10px 0 0; background-color:green; float:right; "
                           value="LOGIN AS GUEST"/>
                </form>
                <br>
                <form id="emailLoginForm" action="user_login_mail" method="post">
                    <input id="digitalName" type="hidden" name="digitalName" value="">
                    <input id="email" type="hidden" name="email" value="">
                    <input id="image" type="hidden" name="image" value="">
                    <input id="token" type="hidden" name="token" value="">
                    <input id="thisdate" type="hidden" name="thisdate" value="">
                </form>
                <script>
                    //Sign out
                    var auth2 = gapi.auth2.getAuthInstance();
                    auth2.signOut();
                </script>
                <div id="googlebutton">
                    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
                </div>

                <script>
                    function onSignIn(googleUser) {
                        var today = new Date();
                        var dd = String(today.getDate()).padStart(2, '0');
                        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                        var yyyy = today.getFullYear();
                        today = yyyy + '-' + mm + '-' + dd+" "+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
                        //Sign out
                        var auth2 = gapi.auth2.getAuthInstance();
                        auth2.signOut();
                        // Get data
                        var profile = googleUser.getBasicProfile();
                        document.getElementById("digitalName").value = profile.getName();
                        document.getElementById("email").value = profile.getEmail();
                        document.getElementById("image").value=profile.getImageUrl();
                        document.getElementById("token").value = googleUser.getAuthResponse().id_token;
                        document.getElementById("thisdate").value = today;
                        // Submit to validate
                        if (profile !== null) document.getElementById("emailLoginForm").submit();
                    }
                </script>
            </div>
        </div>
        <div class="col-md-4">
        </div>
    </div>
</div>

<jsp:include page="/Common/_js.jsp"/>
<script src="${pageContext.request.contextPath}/Resource/js/login.js"></script>
<script type="text/javascript" src="Resource/js/bootstrap.min.js"></script>
</body>
</html>