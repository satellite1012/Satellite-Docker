<%@ page import="java.time.LocalDateTime" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Satellite | 404</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Không tìm thấy">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta name="author" content="Đoàn Đức Tín">
    <jsp:include page="${pageContext.request.contextPath}/Common/_css.jsp" />
</head>
<body>

<jsp:include page="${pageContext.request.contextPath}/Common/header.jsp" />
<div class="block-31" style="position: relative;">
    <div class="owl-carousel loop-block-31 ">
        <div class="block-30 item" style="background-image: url('${pageContext.request.contextPath}/Resource/img/background.jpg');" data-stellar-background-ratio="0.5">
            <div class="container-fluid">
                <div class="row align-items-center justify-content-center text-center">
                    <div class="col-md-11" style="font-weight: 700;font-family: Dosis, sans-serif">
                        <br><br>
                        <h2 class="heading mb-5" style="font-weight: 700;color: darkorange">404 NOT FOUND</h2>
                        <h5 class="heading mb-5" style="font-weight:600;color:white;font-size:35px;">This file(s) or action not exited, or you don't have permission</h5>
                        <br>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="${pageContext.request.contextPath}/Common/_js.jsp" />
<jsp:include page="${pageContext.request.contextPath}/Common/footer.jsp" />
</body>
</html>
