<%@ page import="main.java.Controllers.ProductController" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="../../favicon.ico"/>
    <title>Satellite | Product | Game</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Nơi chia sẻ các game do mình viết, một số có cho tải mã nguồn">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta name="author" content=Đoàn Đức Tín>
    <jsp:include page="../../Common/_css.jsp"/>
    <c:if test="${sessionScope.log_HomeController_APPGAME != null}">
        <script>
            window.onload = function showLog() {
                ShowLog_Product();
                Atable();
                LoadCircle();
            };
        </script>
        <c:set var="log_HomeController_APPGAME" value="${null}" scope="session"/>
    </c:if>
    <c:if test="${sessionScope.log_HomeController_APPGAME == null}">
        <script>
            window.onload = function showLog() {
                ShowLog_Product();
                Atable();
                LoadCircle();
            };
        </script>
    </c:if>
</head>
<body>

<!--Facebook-->
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0" nonce="4TU3IejE"></script>
<div style="z-index: 999; position: fixed;bottom: 20px;left: 28px" class="fb-share-button" data-href="http://satellite-fpt.azurewebsites.net/mygame.action" data-layout="button" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fsatellite-fpt.azurewebsites.net%2Fmygame.action&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a></div>

<jsp:include page="../../Common/header.jsp"/>


<jsp:include page="../../Common/_js.jsp"/>
<!--LOADER-->
<jsp:include page="../../Common/footer.jsp"/>
<script src="https://apps.elfsight.com/p/platform.js" defer></script>

<script>
$(document).ready( function () {
$('#gameTable').DataTable();
} );
</script>

<script>
    function showInstructionProduct() {
        Swal.fire({
            width: 1000,
            height: 1000,
            imageUrl:"Resource/img/Ins/product.gif",
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
