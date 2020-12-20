<%@ page import="main.java.Controllers.ToolController" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Satellite | FPT Tool</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="title" content="Công cụ cho sinh viên FPT">
    <meta name="description" content="Full bộ công cụ, website hỗ trợ việc học cho sinh viên fpt">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta name="author" content=Đoàn Đức Tín>
    <jsp:include page="${pageContext.request.contextPath}/Common/_css.jsp"/>
    <c:if test="${sessionScope.log_ToolController != null}">
        <script>
            window.onload = function showLog() {
                Swal.fire({
                    icon: 'error',
                    title: '${sessionScope.log_ToolController}',
                    text: 'Satellite | ErrorLog',
                    footer: '<a href="https://www.facebook.com/satfomacej" target="_blank">You think this is a bug? contact admin now</a>'
                })
            };
        </script>
        <c:set var="log_ToolController" value="${null}" scope="session"/>
    </c:if>
</head>
<body>
<!--Facebook-->
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0"
        nonce="4TU3IejE"></script>
<div style="z-index: 999; position: fixed;bottom: 20px;left: 28px" class="fb-share-button"
     data-href="http://satellite-fpt.azurewebsites.net/qaFPT.action" data-layout="button" data-size="large"><a
        target="_blank"
        href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fsatellite-fpt.azurewebsites.net%2FqaFPT.action&amp;src=sdkpreparse"
        class="fb-xfbml-parse-ignore">Chia sẻ</a></div>

<jsp:include page="${pageContext.request.contextPath}/Common/header.jsp"/>

<div style="height:9vw;background-size: cover;background-image:url('${pageContext.request.contextPath}/Resource/img/QA/viewQA.png') ;background-blend-mode: darken"
     data-stellar-background-ratio="0.5">
</div>

<div style="background-size: cover;background-blend-mode: darken;padding: 0">
    <div class="container-fluid">

        <!--Tool-->
        <div id="home-feature" class="site-section fund-raisers" style="background-color: #0088cc;"><br><br>
            <div class="container-fluid" >
                <div class="row mb-3 justify-content-center">
                    <div class="col-md-8 text-center" style="padding-top:10px;background-color: rgba(0,0,0,0.6);border-radius: 10px;">
                        <h2 style="font-size: 65px;color:white;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-tools" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M0 1l1-1 3.081 2.2a1 1 0 0 1 .419.815v.07a1 1 0 0 0 .293.708L10.5 9.5l.914-.305a1 1 0 0 1 1.023.242l3.356 3.356a1 1 0 0 1 0 1.414l-1.586 1.586a1 1 0 0 1-1.414 0l-3.356-3.356a1 1 0 0 1-.242-1.023L9.5 10.5 3.793 4.793a1 1 0 0 0-.707-.293h-.071a1 1 0 0 1-.814-.419L0 1zm11.354 9.646a.5.5 0 0 0-.708.708l3 3a.5.5 0 0 0 .708-.708l-3-3z"/>
                            <path fill-rule="evenodd" d="M15.898 2.223a3.003 3.003 0 0 1-3.679 3.674L5.878 12.15a3 3 0 1 1-2.027-2.027l6.252-6.341A3 3 0 0 1 13.778.1l-2.142 2.142L12 4l1.757.364 2.141-2.141zm-13.37 9.019L3.001 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026z"/>
                        </svg>&nbsp;&nbsp;TOOLS</h2>
                        <p class="lead" style="font-family: arial,serif;color:whitesmoke;">Công cụ, thư viện, bộ cài đặt và nhiều thứ
                            khác</p>
                    </div>
                </div>
                <br><br>

                <div class="row" style="font-family: arial,serif;background-image: url('https://chuyengiahoangphuc.com/wp-content/uploads/2018/08/dark-blue-triangles-web-abstract-background-loop-4k-4096x2304_nez3oanrl__F0000.png');">

                    <c:forEach var="i" items="<%=ToolController.toolList%>">
                        <div class="col-md-6 col-lg-3 mb-5" style="margin-bottom:0 !important; border: 3px solid black;"><a href="${i.tLink}" target="_blank">
                            <div class="person-donate text-center">
                                <br>
                                <img src="${i.tImage}" alt="Image placeholder" class="img-responsive"
                                     style="width:100%;height: 100%;">
                                <div class="donate-info">
                                    <h2 style="color:white;font-size:35px;">${i.tTitle}</h2>
                                    <span class="time d-block mb-2" style="font-size: 18px;color:wheat">${i.tDescription}</span>
                                    <hr>
                                    <h6 style="color:yellow;">${i.tWarning}</h6>
                                    <h6 style="color:orange;">${i.tDanger}</h6>
                                    <hr>
                                    <h6 style="color:greenyellow;">Cập nhật vào ngày ${i.tDateupdate}</h6>
                                </div>
                            </div>
                        </a></div>
                    </c:forEach>

                </div>
            </div>
        </div>


    </div>
</div>

<jsp:include page="${pageContext.request.contextPath}/Common/_js.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/Common/footer.jsp"/>

</body>
</html>
