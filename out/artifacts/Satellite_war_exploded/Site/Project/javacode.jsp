<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="../../favicon.ico"/>
    <title>Satellite | Product | Java</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Full code java tổng hợp từ thaycacac, tuy cũ nhưng đa số vẫn còn đúng">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta name="author" content=Đoàn Đức Tín>
    <jsp:include page="../../Common/_css.jsp"/>
    <c:if test="${sessionScope.log_HomeController_JAVACODE != null}">
        <script>
            window.onload = function showLog() {
                Swal.fire({
                    width: 800,
                    html: '<li type="color:orangered">Source code được update sau mỗi kỳ, không nên tải hết (rất nặng)</li><br>' +
                          '<li type="color:orangered">Code miễn phí, nên giữ lại tên tác giả (trong code) giúp bọn mình </li>',
                    title: '<h2 type="color:orangered">Xin các bạn hãy dành thời gian đọc cái này</h2>',
                    imageUrl: 'https://www.lazyengineers.com/wp-content/uploads/2016/02/free1.jpg',
                    imageWidth: 600,
                    imageHeight: 400,
                    imageAlt: 'Custom image'
                })
            };
        </script>
        <c:set var="log_HomeController_JAVACODE" value="${null}" scope="session"/>
    </c:if>

</head>
<body>

<!--Facebook-->
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0" nonce="4TU3IejE"></script>
<div style="z-index: 999; position: fixed;bottom: 20px;left: 28px" class="fb-share-button" data-href="http://satellite-fpt.azurewebsites.net/javacode.action" data-layout="button" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fsatellite-fpt.azurewebsites.net%2Fjavacode.action&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a></div>

<jsp:include page="../../Common/header.jsp"/>

<div style="padding-top:120px;padding-bottom:90px;background-image: url('${pageContext.request.contextPath}/Resource/img/background.jpg');background-attachment: fixed;background-size: cover;background-blend-mode: darken;"
     data-stellar-background-ratio="0.5">
    <div class="container-fluid">
        <div class="row align-items-center justify-content-center text-center">
                    <div class="col-md-11">
                        <iframe width="100%" height="800px" src="https://app.box.com/embed/s/m0xw8idtz3sifuu6siyqccog7qvcogtj?sortColumn=date&view=list" frameborder="8" allowfullscreen webkitallowfullscreen msallowfullscreen></iframe>
                    </div>
        </div>
    </div>
</div>

<jsp:include page="../../Common/_js.jsp"/>
<jsp:include page="../../Common/footer.jsp"/>
<script src="https://apps.elfsight.com/p/platform.js" defer>
</script>
</body>
</html>
