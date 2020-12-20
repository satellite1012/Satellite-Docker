<%@ page import="java.time.LocalDateTime" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Satellite | Blog</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="description" content="Blog cá nhân, chia sẻ các kiến thức về lập trình, thuật toán và mẹo hay trong công việc cũng như cuộc sống">
      <meta name="keywords" content="HTML,CSS,XML,JavaScript">
      <meta name="author" content=Đoàn Đức Tín>
    <jsp:include page="Common/_css.jsp" />
  </head>
  <body>

  <!--Facebook-->
  <div id="fb-root"></div>
  <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0" nonce="4TU3IejE"></script>
  <div style="z-index: 999; position: fixed;bottom: 20px;left: 28px" class="fb-share-button" data-href="http://satellite-fpt.azurewebsites.net/blog.action" data-layout="button" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fsatellite-fpt.azurewebsites.net%2Fblog.action&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a></div>

  <jsp:include page="Common/header.jsp" />
        <div class="block-31" style="position: relative;">
            <div class="owl-carousel loop-block-31 ">
                <div class="block-30 item" style="background-image: url('${pageContext.request.contextPath}/Resource/img/background.jpg');" data-stellar-background-ratio="0.5">
                    <div class="container-fluid">
                        <div class="row align-items-center justify-content-center text-center">
                            <div class="col-md-11" style="font-weight: 700;font-family: Dosis, sans-serif">
                                <br><br>
                                <h2 class="heading mb-5">BLOGGER BETA VERSION</h2>
                                <h5 class="heading mb-5" style="font-weight:600;color:white;font-size:35px;">Phiên bản chính thức sẽ ra mắt sớm, tuy nhiên bạn vẫn có thể thử xem demo tại link bên dưới</h5>
                                <br>
                                <p style="color:white;font-size:20px;margin:0;"></p>
                                <a target="_blank" href="http://satellite-blog.azurewebsites.net/">
                                    <button class="btn-success" style="font-weight:600;border-radius:10px;font-size:29px;">BETA 2.0.271020</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <jsp:include page="Common/_js.jsp" />
        <jsp:include page="Common/footer.jsp" />
  </body>
</html>
