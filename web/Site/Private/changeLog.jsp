<%@page import="main.java.Database.ChangeLogModel.ChangeLog" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Satellite | Logs</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Quá trình phát triển của website">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta name="author" content="Đoàn Đức Tín">
    <link href="https://fonts.googleapis.com/css?family=Overpass:300,400,500|Dosis:400,700" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resource/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resource/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resource/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resource/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resource/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resource/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resource/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resource/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resource/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resource/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resource/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resource/css/fancybox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resource/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resource/css/style.css">
</head>
<body>

<!--Facebook-->
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0" nonce="4TU3IejE"></script>
<div style="z-index: 999; position: fixed;bottom: 20px;left: 28px" class="fb-share-button" data-href="http://satellite-fpt.azurewebsites.net/view_change_log.action" data-layout="button" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fsatellite-fpt.azurewebsites.net%2Fview_change_log.action&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a></div>

<img class="img-fluid" src="${pageContext.request.contextPath}/Resource/img/background1.jpg" style="position: fixed;width: 100%" alt="Trình duyệt của bạn không hỗ trợ ảnh này">

<p style="width:100%;margin:0;z-index:99;background: rgba(0,0,0,0.5);position: fixed;color:white; font-weight: 600;text-align: center">Tech: Struct2, Servlet, <strike style="color:red">Maven</strike>, Docker, Git, AzureCLI, DynamicHandler, MySQL, NoSQL, Hashing Password, Prevent CSRF</p>
<p style="width:100%;margin:0;z-index:99;background: rgba(0,0,0,0.5);position: fixed;color:white; font-weight: 600;text-align: center;bottom: 0">API & Service: GoogleLogin, OAuth, GoogleAdsense, GoogleSearch, DMCAProtection, FacebookShare, FacebookComment, Linking QRCODE, SWAL, Datatables</p>

<br><br>
<div class="container align-items-center">
    <%
        ArrayList<ChangeLog> a = null;
        try {
            a = (ArrayList<ChangeLog>) request.getAttribute("logList");
            if (a == null) throw new Exception("Null");
        } catch (Exception e) {
            response.sendRedirect("index");
        }
        assert a != null;
        for (int i = a.size() - 1; i >= 0; i--) {
            ChangeLog k = a.get(i);
            out.println("<div class=\"row\">"
                    + "<div class=\"border-top col-12\" style=\"background-color: rgba(0,0,0,0.5);\">"
                    + "<br>"
                    + "<p style=\"text-align: center;color:red;font-size:22px\">" + k.getlDatecreated() + "</p>"
                    + "<p style=\"text-align: center;color:white;font-size:22px\">" + k.getlTitle() + "</p>"
                    + "<p style=\"text-align: center;color:white;font-size:18px;font-family:arial;\">" + k.getlDescription() + "</p>"
                    + "</div></div><hr>");
        }
    %>
</div>
</body>
</html>
