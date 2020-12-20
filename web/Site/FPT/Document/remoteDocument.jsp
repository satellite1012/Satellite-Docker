<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Satellite | RemoteDocument</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Tài liệu bí mật">
        <meta name="keywords" content="HTML,CSS,XML,JavaScript">
        <meta name="author" content="Đoàn Đức Tín">
        <jsp:include page="/Common/_css.jsp" />
    </head>
    <body>
        <jsp:include page="/Common/header.jsp" />
        <div style="padding-top:120px;padding-bottom:90px;background-image: url('${pageContext.request.contextPath}/Resource/img/background.jpg');background-size: cover;background-blend-mode: darken"
             data-stellar-background-ratio="0.5">
              <div class="container-fluid">
                        <div class="row align-items-center justify-content-center text-center">
                            <div class="col-md-11">    
                                <br>
                                <h2 class="heading mb-5" style="font-size: 55px;color:white;font-family: Dosis, sans-serif;font-weight: 600">Bạn đang xem một tài liệu giới hạn
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-emoji-smile" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="color:orange;">
                                    <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
                                    <path fill-rule="evenodd" d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683z"></path>
                                    <path d="M7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"></path>
                                    </svg></h2>
                                <h5 class="heading mb-3" style="font-weight: 600;color:cyan;font-size:30px;">${requestScope.header}&nbsp;&nbsp;&nbsp;&nbsp; <span
                                        style="font-weight: 600;color:orange;">${requestScope.date}</span></h5>
                                <a target="_blank" href="${requestScope.link}"><button class="btn-success" style="border-radius: 6px;font-size:22px;" >TẢI VỀ NGAY</button></a>
                                <hr><br><h6 style="font-weight:600;color:white;font-size:18px;font-family: arial,serif;"> Ngoài ra bạn còn có cơ hội hỗ trợ tài liệu các em xinh tươi khóa dưới nữa, ngại gì không share tài liệu của mình nào...</h6>
                                <a href="https://docs.google.com/forms/d/e/1FAIpQLSepOiRp8xAGXkNOOA8gm--qSi6AiXsZC7dmDplAgi7e3ICeDw/viewform" target="_blank">
                                <button class="btn-warning" style="font-family:Arial,serif;font-weight:600;padding: 5px 50px;border-radius: 6px;">GỬI NGAY</button></a>
                            </div>
                        </div>
                    </div>
        </div>

        <jsp:include page="/Common/footer.jsp"/>
        <jsp:include page="/Common/_js.jsp" />
    </body>
</html>
