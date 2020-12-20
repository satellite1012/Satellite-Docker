<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Document Portal</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Tài liệu chuyên ngành, yêu cầu đăng nhập để xem">
        <meta name="keywords" content="HTML,CSS,XML,JavaScript">
        <meta name="author" content="Đoàn Đức Tín">
        <jsp:include page="/Common/_css.jsp" />
        <script>
            window.onload=function abc(){
                document.getElementsByClassName("fullscreen").item(0).style.display = "none";
                document.getElementsByClassName("fullscreen").item(1).style.display = "none";
                let timerInterval
                Swal.fire({
                    position: 'top-end',
                    icon: 'info',
                    html: '<span style=" color:orangered">1. Ấn vào tên hoặc ảnh tài liệu để tải xuống</span>' +
                        '<br><hr><span style=" color:orangered">2. Reload quá nhiều sẽ gây lag server</span>'+
                        '<br><hr><span style=" ">Auto Closed: <b></b></span>',
                    showConfirmButton: false,
                    timer: 8000,
                    onBeforeOpen: () => {
                        Swal.showLoading()
                        timerInterval = setInterval(() => {
                            const content = Swal.getContent()
                            if (content) {
                                const b = content.querySelector('b')
                                if (b) {
                                    b.textContent = Swal.getTimerLeft()
                                }
                            }
                        }, 100)
                    }
                })
            }
        </script>
        <style>
            @import url("https://fonts.googleapis.com/css?family=Montserrat:400,400i,700");
            .card {
                background-color: #fff;
                max-width: 400px;
                display: flex;
                flex-direction: column;
                overflow: hidden;
                border-radius: 2rem;
                box-shadow: 0 1rem 1.5rem rgba(0,0,0,0.5);
            }
            .card .banner {

            }
            .card .banner svg {
                background-color: #fff;
                width: 8rem;
                height: 8rem;
                box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.3);
                border-radius: 50%;
                transform: translateY(50%);
                transition: transform 200ms cubic-bezier(0.18, 0.89, 0.32, 1.28);
            }
            .card .banner svg:hover {
                transform: translateY(50%) scale(1.3);
            }
            .card .menu {
                width: 100%;
                height: 5.5rem;
                padding: 1rem;
                display: flex;
                align-items: flex-start;
                justify-content: flex-end;
                position: relative;
                box-sizing: border-box;
            }
            .card .menu .opener {
                width: 2.5rem;
                height: 2.5rem;
                position: relative;
                border-radius: 50%;
                transition: background-color 100ms ease-in-out;
            }
            .card .menu .opener:hover {
                background-color: #f2f2f2;
            }
            .card .menu .opener span {
                background-color: #404040;
                width: 0.4rem;
                height: 0.4rem;
                position: absolute;
                top: 0;
                left: calc(50% - 0.2rem);
                border-radius: 50%;
            }
            .card .menu .opener span:nth-child(1) {
                top: 0.45rem;
            }
            .card .menu .opener span:nth-child(2) {
                top: 1.05rem;
            }
            .card .menu .opener span:nth-child(3) {
                top: 1.65rem;
            }
            .card h2.name {
                text-align: center;
                padding: 0 2rem 0.5rem;
                margin: 0;
            }
            .card .title {
                color: #a0a0a0;
                font-size: 0.85rem;
                text-align: center;
                padding: 0 2rem 1.2rem;
            }
            .card .actions {
                padding: 0 2rem 1.2rem;
                display: flex;
                flex-direction: column;
                order: 99;
            }
            .card .actions .follow-info {
                padding: 0 0 1rem;
                display: flex;
            }
            .card .actions .follow-info h2 {
                text-align: center;
                width: 50%;
                margin: 0;
                box-sizing: border-box;
            }
            .card .actions .follow-info h2 a {
                text-decoration: none;
                padding: 0.8rem;
                display: flex;
                flex-direction: column;
                border-radius: 0.8rem;
                transition: background-color 100ms ease-in-out;
            }
            .card .actions .follow-info h2 a span {
                color: #1c9eff;
                font-weight: bold;
                transform-origin: bottom;
                transform: scaleY(1.3);
                transition: color 100ms ease-in-out;
            }
            .card .actions .follow-info h2 a small {
                color: #afafaf;
                font-size: 0.85rem;
                font-weight: normal;
            }
            .card .actions .follow-info h2 a:hover {
                background-color: #f2f2f2;
            }
            .card .actions .follow-info h2 a:hover span {
                color: #007ad6;
            }
            .card .actions .follow-btn button {
                color: inherit;
                font: inherit;
                font-weight: bold;
                background-color: #ffd01a;
                width: 100%;
                border: none;
                padding: 1rem;
                outline: none;
                box-sizing: border-box;
                border-radius: 1.5rem/50%;
                transition: background-color 100ms ease-in-out, transform 200ms cubic-bezier(0.18, 0.89, 0.32, 1.28);
            }
            .card .actions .follow-btn button:hover {
                background-color: #efb10a;
                transform: scale(1.1);
            }
            .card .actions .follow-btn button:active {
                background-color: #e8a200;
                transform: scale(1);
            }
            .card .desc {
                text-align: justify;
                padding: 0 2rem 2.5rem;
                order: 100;
            }
        </style>
    </head>
    <body>
    <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0&appId=975426712965384&autoLogAppEvents=1" nonce="pORLbxWu"></script>

        <jsp:include page="/Common/header.jsp" />
        <img class="img-responsive" src="Resource/img/Document/document_portal_bg.jpg"
             alt="Trình duyệt không hỗ trợ ảnh này" style="position:fixed;width:100%;height: 100%;"/>
        <br><br>
        <!-- Document -->
        <div id="document-section" style="padding-top:120px;padding-bottom:90px;background-image: url('${pageContext.request.contextPath}/Resource/img/background.jpg');background-size: cover;background-blend-mode: darken"
                 data-stellar-background-ratio="0.5">
        <div class="container-fluid">

            <div class="row mb-3 justify-content-center">
                <div class="col-md-12 text-center" style="background-color: rgba(0,0,0,0.7);">
                    <h2 style="font-size: 40px;color:white;font-family: arial,serif;padding:18px;border-radius:10px;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-file-earmark-medical-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M2 3a2 2 0 0 1 2-2h5.293a1 1 0 0 1 .707.293L13.707 5a1 1 0 0 1 .293.707V13a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V3zm7 2V2l4 4h-3a1 1 0 0 1-1-1zm-2.5.5a.5.5 0 0 0-1 0v.634l-.549-.317a.5.5 0 1 0-.5.866L5 7l-.549.317a.5.5 0 1 0 .5.866l.549-.317V8.5a.5.5 0 1 0 1 0v-.634l.549.317a.5.5 0 1 0 .5-.866L7 7l.549-.317a.5.5 0 1 0-.5-.866l-.549.317V5.5zm-2 4.5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zm0 2a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5z"></path>
                    </svg>&nbsp;&nbsp;${requestScope.dm_list[0].dCourseTitle}</h2>
                </div>
            </div>

            <div class="row mb-3 justify-content-center">
                <div class="col-md-8 text-center" style="background-color: rgba(0,0,0,0.7);padding:18px;border-radius:10px;">
                    <p class="lead" style="font-size: 25px;color:white;font-family: arial,serif;"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bookmark" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M8 12l5 3V3a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2v12l5-3zm-4 1.234l4-2.4 4 2.4V3a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1v10.234z"></path>
                    </svg>&nbsp;&nbsp;${requestScope.dm_list[0].dCourseDescription}</p>
                </div>
            </div>

        </div>

        <div class="container-fluid">
            <div class="col-md-12 block-11">
              <div class="nonloop-block-11 owl-carousel" style="font-family: arial,serif;">
                
                <c:forEach var="i" items="${requestScope.dm_list}">
                    <div class="card" style="min-height: 800px">
                        <div class="banner" style="   background-image: url(${i.dImage});
                        background-position: center;
                        background-repeat: no-repeat;
                        background-size: cover;
                        height: 11rem;
                        display: flex;
                        align-items: flex-end;
                        justify-content: center;
                        box-sizing: border-box;">
                        </div>
                        <br><br>
                        <h2 class="name" style="font-weight: 600">${i.dTitle}</h2>
                        <div class="title">${i.dSubject}</div>
                        <div class="actions">
                            <div class="follow-info">
                                <h2><a href="#"><span style="color:darkorange;font-size: 20px">${i.dDatecreated}</span><small>Created on</small></a></h2>
                                <h2><a href="#"><span style="color:darkorange;font-size: 20px">${i.dDateupdate}</span><small>Updated on</small></a></h2>
                            </div>
                            <div class="follow-btn"><a href="${i.dLink}" style="color:black" target="_blank"><button onclick="incView(${i.id})">Download [Viewed ${i.dView} times]</button></a></div>
                        </div>
                        <div class="desc">${i.dDescription}</div>
                    </div>
                </c:forEach>

              </div>
            </div>
        </div>

            <div class="container">
                <div class="fb-comments" data-href="https://www.facebook.com/satfomacej/posts/1181478785534332" data-numposts="5" data-width="100%" style="background: white"></div>
            </div>
        </div>
        <!-- End document -->



        <jsp:include page="/Common/_js.jsp" />
        <!--LOADER-->
        <div id="ftco-loader" class="fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"></circle><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"></circle></svg></div>
        <jsp:include page="/Common/footer.jsp" />

    <script>
        function incView(id) {
            $.ajax({
                type: 'POST',
                url: '/inc_view_document',
                //contentType: 'application/json',
                data: {id},
            }).done(function(result) {
            });
        }
    </script>
    </body>

</html>
