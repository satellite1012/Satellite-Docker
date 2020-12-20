<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Satellite | Security Warning</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Website hiện đang quá tải">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta name="author" content=Đoàn Đức Tín>
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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico"/>

    <style>
        html, body {
            overflow-x: hidden;
        }
    </style>

</head>
<body>
<%@page import="main.java.Database.UserModel.User" %>

<style>
    #nav1_header:hover {
        color: darkorange;
    }

    #nav2_header:hover {
        color: darkorange;
    }

    #nav3_header:hover {
        color: darkorange;
    }

    #nav4_header:hover {
        color: darkorange;
    }

    #nav5_header:hover {
        color: darkorange;
    }

    #nav6_header:hover {
        color: darkorange;
    }

    #nav7_header:hover {
        color: darkorange;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <div class="col-6 col-xl-2">
            <img src="${pageContext.request.contextPath}/Resource/img/satelliteLogo.png"
                 style="border:0;padding:0;margin:0;width:80%;height: 80%"
                 alt="Trình duyệt của bạn không hỗ trợ ảnh này">
            <a href="index.action" class="mb-0"></a>
        </div>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>
        <div class="col-12 collapse navbar-collapse" id="ftco-nav" style="font-family: arial,serif;">
            <ul class="navbar-nav ml-auto">
                <li id="nav-item-home" class="nav-item" style="padding:10px 10px 0 10px;"><a id="a1_header"
                                                                                             href="http://satellite-fpt.azurewebsites.net/"
                                                                                             class="nav-link"><p
                        id="nav1_header" style="font-weight: 700">Home</p></a></li>
                <li id="nav-item-document" class="nav-item" style="padding:10px 10px 0 10px;"><a id="a2_header"
                                                                                                 href="document.action"
                                                                                                 class="nav-link"><p
                        id="nav2_header" style="font-weight: 700">Document</p></a></li>
                <li id="nav-item-project" class="nav-item" style="padding:10px 10px 0 10px;"><a id="a3_header"
                                                                                                href="projects.action"
                                                                                                class="nav-link"><p
                        id="nav3_header" style="font-weight: 700">Projects</p></a></li>
                <li id="nav-item-qa" class="nav-item" style="padding:10px 10px 0 10px;"><a id="a7_header"
                                                                                           href="qa.action"
                                                                                           class="nav-link"><p
                        id="nav7_header" style="font-weight: 700">Q&A FPT</p></a></li>
                <li id="nav-item-blog" class="nav-item" style="padding:10px 10px 0 10px;"><a id="a4_header"
                                                                                             href="blog.action"
                                                                                             class="nav-link"><p
                        id="nav4_header" style="font-weight: 700">Blog</p></a></li>
                <li id="nav-item-about" class="nav-item" style="padding:10px 10px 0 10px;"><a id="a5_header"
                                                                                              href="about.action"
                                                                                              class="nav-link"><p
                        id="nav5_header" style="font-weight: 700">About</p></a></li>
                <li id="nav-item-team" class="nav-item" style="padding:10px 10px 0 10px;"><a id="a6_header"
                                                                                             href="myteam.action"
                                                                                             class="nav-link"><p
                        id="nav6_header" style="font-weight: 700">My Team</p></a></li>
                <script>
                    const s = document.title;
                    if (s === "Satellite | Home") {
                        document.getElementById('nav-item-home').classList.add('active');
                        document.getElementById('nav1_header').style = "color:orange";
                        document.getElementById('nav1_header').style.fontWeight = '700';
                    } else if (s === "Satellite | About") {
                        document.getElementById('nav-item-about').classList.add('active');
                        document.getElementById('nav5_header').style = "color:orange";
                        document.getElementById('nav5_header').style.fontWeight = '700';
                    } else if (s === "Satellite | Document") {
                        document.getElementById('nav-item-document').classList.add('active');
                        document.getElementById('nav2_header').style = "color:orange";
                        document.getElementById('nav2_header').style.fontWeight = '700';
                    } else if (s === "Satellite | Team") {
                        document.getElementById('nav-item-team').classList.add('active');
                        document.getElementById('nav6_header').style = "color:orange";
                        document.getElementById('nav6_header').style.fontWeight = '700';
                    } else if (s === "Satellite | Projects") {
                        document.getElementById('nav-item-project').classList.add('active');
                        document.getElementById('nav3_header').style = "color:orange";
                        document.getElementById('nav3_header').style.fontWeight = '700';
                    } else if (s === "Satellite | Blog") {
                        document.getElementById('nav-item-blog').classList.add('active');
                        document.getElementById('nav4_header').style = "color:orange";
                        document.getElementById('nav4_header').style.fontWeight = '700';
                    } else if (s === "Satellite | Q&A FPT") {
                        document.getElementById('nav-item-qa').classList.add('active');
                        document.getElementById('nav7_header').style = "color:orange";
                        document.getElementById('nav7_header').style.fontWeight = '700';
                    } else if (s === "Document Portal") {
                        document.getElementById('nav-item-document').classList.add('active');
                        document.getElementById('nav2_header').style = "color:cyan";
                        document.getElementById('nav2_header').style.fontWeight = '700';
                    } else if (s === "Satellite | Product | Java") {
                        document.getElementById('nav-item-project').classList.add('active');
                        document.getElementById('nav3_header').style = "color:cyan";
                        document.getElementById('nav3_header').style.fontWeight = '700';
                    } else if (s === "Satellite | Product | App") {
                        document.getElementById('nav-item-project').classList.add('active');
                        document.getElementById('nav3_header').style = "color:cyan";
                        document.getElementById('nav3_header').style.fontWeight = '700';
                    } else if (s === "Satellite | Product | Game") {
                        document.getElementById('nav-item-project').classList.add('active');
                        document.getElementById('nav3_header').style = "color:cyan";
                        document.getElementById('nav3_header').style.fontWeight = '700';
                    } else if (s === "Satellite | Security Warning" || s === "Satellite | 404") {
                        document.getElementById('nav2_header').style = "color:#4f4f4f";
                        document.getElementById('nav3_header').style = "color:#4f4f4f";
                        document.getElementById('nav4_header').style = "color:#4f4f4f";
                        document.getElementById('nav5_header').style = "color:#4f4f4f";
                        document.getElementById('nav6_header').style = "color:#4f4f4f";
                        document.getElementById('nav7_header').style = "color:#4f4f4f";
                        document.getElementById("a2_header").href = "#";
                        document.getElementById("a3_header").href = "#";
                        document.getElementById("a4_header").href = "#";
                        document.getElementById("a5_header").href = "#";
                        document.getElementById("a6_header").href = "#";
                        document.getElementById("a7_header").href = "#";
                    }

                </script>
                <li style="padding:10px 10px 0 10px;font-weight: 600;font-family: Dosis,serif">
                    <div class="dropdown">
                        <%
                            User s = (User) session.getAttribute("user");
                            if (s != null) {
                                out.println("<button type=\"button\" class=\"btn btn-primary dropdown-toggle\""
                                        + " data-toggle=\"dropdown\" style=\"background:none;font-weight:700;margin-top:15px;color:cyan;border-color:cyan;\">" + s.getuDigitalName() + "</button>");

                                out.println("<div class=\"dropdown-menu\" style=\"background-color:rgb(255, 204, 102);\">");
                                out.println("<a href=\"#\" class=\"dropdown-item\" style=\"float:center;font-weight:600;font-family:Dosis;background-color:orangered;color:white;\">" +
                                        "<svg width=\"1em\" height=\"1em\" viewBox=\"0 0 16 16\" class=\"bi bi-archive\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
                                        "  <path fill-rule=\"evenodd\" d=\"M2 5v7.5c0 .864.642 1.5 1.357 1.5h9.286c.715 0 1.357-.636 1.357-1.5V5h1v7.5c0 1.345-1.021 2.5-2.357 2.5H3.357C2.021 15 1 13.845 1 12.5V5h1z\"/>\n" +
                                        "  <path fill-rule=\"evenodd\" d=\"M5.5 7.5A.5.5 0 0 1 6 7h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5zM15 2H1v2h14V2zM1 1a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H1z\"/>\n" +
                                        "</svg>" +
                                        "\t&nbsp;\t&nbsp;Stone: " + s.getuStone() + "</a>");

                                out.println("<form id=\"profileForm\" action=\"view_user\">" +
                                        "<input type=\"hidden\" name=\"userId_view\" value=\"" + s.getId() + "\"/></form>" +
                                        "<a onclick=\"profileForm()\" class=\"dropdown-item\" style=\"font-weight:600;font-family:Dosis;color:black\">" +
                                        "<svg width=\"1em\" height=\"1em\" viewBox=\"0 0 16 16\" class=\"bi bi-people\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
                                        "  <path fill-rule=\"evenodd\" d=\"M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8zm-7.995-.944v-.002.002zM7.022 13h7.956a.274.274 0 0 0 .014-.002l.008-.002c-.002-.264-.167-1.03-.76-1.72C13.688 10.629 12.718 10 11 10c-1.717 0-2.687.63-3.24 1.276-.593.69-.759 1.457-.76 1.72a1.05 1.05 0 0 0 .022.004zm7.973.056v-.002.002zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816zM4.92 10c-1.668.02-2.615.64-3.16 1.276C1.163 11.97 1 12.739 1 13h3c0-1.045.323-2.086.92-3zM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4z\"/>\n" +
                                        "</svg>\t&nbsp;\t&nbsp;Profile</a>");

                                out.println("<a href=\"#\" class=\"dropdown-item\" style=\"float:center;color:gray;font-weight:600;font-family:Dosis;\">Dashboard</a>");

                                out.println("<hr>"
                                        + "<a href=\"user_logout\" class=\"dropdown-item\" style=\"font-weight:600;font-family:Dosis;background-color:orangered;color:white;\"><svg width=\"1em\" height=\"1em\" viewBox=\"0 0 16 16\" class=\"bi bi-door-open\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
                                        "  <path fill-rule=\"evenodd\" d=\"M1 15.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5zM11.5 2H11V1h.5A1.5 1.5 0 0 1 13 2.5V15h-1V2.5a.5.5 0 0 0-.5-.5z\"/>\n" +
                                        "  <path fill-rule=\"evenodd\" d=\"M10.828.122A.5.5 0 0 1 11 .5V15h-1V1.077l-6 .857V15H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117z\"/>\n" +
                                        "  <path d=\"M8 9c0 .552.224 1 .5 1s.5-.448.5-1-.224-1-.5-1-.5.448-.5 1z\"/>\n" +
                                        "</svg>\t&nbsp;\t&nbsp;Đăng xuất</a>"
                                        + "</div>");
                            } else {
                                out.println("<a href=\"login\"><button type=\"button\" class=\"btn btn-primary\""
                                        + " style=\"background:none;font-weight:700;margin-top:15px;color:orange;\">Đăng Nhập</button></a>");
                            }
                        %>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<script>
    function profileForm() {
        document.getElementById("profileForm").submit();
    }
</script>

<div class="block-31" style="position: relative;">
    <div class="owl-carousel loop-block-31 ">
        <div class="block-30 block-30-sm item"
             style="background-image: url('${pageContext.request.contextPath}/Resource/img/background.jpg');"
             data-stellar-background-ratio="0.5">
            <div class="container-fluid">
                <div class="row align-items-center justify-content-center text-center">
                    <div class="col-md-11">
                        <br><br><br><br><br><br><br>
                        <h2 class="heading mb-5">SERVER IS OVERLOAD</h2>
                        <h5 class="heading mb-4" style="font-weight:700;color:orange;font-size:35px;">Server đang bị quá tải vì có nhiều lượt truy cập gần đây</h5>
                        <br>
                        <a href="http://satellite-fpt.azurewebsites.net/" style="font-weight:600;font-size:22px;">
                            Vui lòng thử lại sau 1-2 tiếng</a>
                        <br><br><br><br><br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!--TEMPLATE-->
<script src="${pageContext.request.contextPath}/Resource/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/Resource/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath}/Resource/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/Resource/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/Resource/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/Resource/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/Resource/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath}/Resource/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/Resource/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/Resource/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/Resource/js/jquery.fancybox.min.js"></script>
<script src="${pageContext.request.contextPath}/Resource/js/aos.js"></script>
<script src="${pageContext.request.contextPath}/Resource/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/Resource/js/main.js"></script>

<!--DISABLE KEY-->
<script>
    document.onkeydown = function (e) {
        if (event.keyCode === 123) {
            return false;
        }
        if (e.ctrlKey && e.keyCode === 'E'.charCodeAt(0)) {
            return false;
        }
        if (e.ctrlKey && e.shiftKey && e.keyCode === 'I'.charCodeAt(0)) {
            return false;
        }
        if (e.ctrlKey && e.shiftKey && e.keyCode === 'J'.charCodeAt(0)) {
            return false;
        }
        if (e.ctrlKey && e.keyCode === 'U'.charCodeAt(0)) {
            return false;
        }
        if (e.ctrlKey && e.keyCode === 'S'.charCodeAt(0)) {
            return false;
        }
        if (e.ctrlKey && e.keyCode === 'H'.charCodeAt(0)) {
            return false;
        }
        if (e.ctrlKey && e.keyCode === 'A'.charCodeAt(0)) {
            return false;
        }
        if (e.ctrlKey && e.keyCode === 'F'.charCodeAt(0)) {
            return false;
        }
        if (e.ctrlKey && e.keyCode === 'E'.charCodeAt(0)) {
            return false;
        }
    };
    document.addEventListener('contextmenu', event => event.preventDefault());
</script>

<!--ALERT-->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<!--ICON-->
<script src="https://kit.fontawesome.com/5f7869f3ba.js" crossorigin="anonymous"></script>

<!--Start of Tawk.to Script-->
<script type="text/javascript">
    var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
    (function () {
        var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
        s1.async = true;
        s1.src = 'https://embed.tawk.to/5f3e740ccc6a6a5947ad6066/default';
        s1.charset = 'UTF-8';
        s1.setAttribute('crossorigin', '*');
        s0.parentNode.insertBefore(s1, s0);
    })();
</script>

<!--CHAT-->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

<script>
    function Atable() {
        var a = document.getElementById('gameTable_length');
        var b = document.getElementById('gameTable_filter');
        var c = document.getElementById('gameTable_info');
        var d = document.getElementById('gameTable_paginate');
        document.getElementById('gameTable').style.borderBottom = '3px solid white'

        a.style.color = 'white';
        a.style.fontSize = '25px';
        a.style.fontWeight = '600';
        a.style.paddingTop = '8px';
        a.style.border = '3px solid white';

        b.style.color = 'white';
        b.style.fontWeight = '600';
        b.style.fontSize = '25px';
        b.style.marginTop = '18px';

        c.style.color = 'white';
        c.style.fontWeight = '600';
        c.style.fontSize = '25px';

        d.style.color = 'white';
        d.style.fontWeight = '600';
        d.style.fontSize = '25px';

    }

    function LoadCircle() {
        document.getElementsByClassName("fullscreen").item(0).style.display = "none";
        document.getElementsByClassName("fullscreen").item(1).style.display = "none";
    }

    function ShowLog_Product() {
        Swal.fire({
            width: 800,
            html: '<li type="color:orangered">Toàn bộ product trong này là do bọn mình làm 100%</li><br>' +
                '<li type="color:orangered">Tên tác giả cho từng sản phẩm được hiển thị ở dưới cùng</li>' +
                '<li type="color:orangered">Phần mềm là miễn phí, vì vậy các bạn không nên đổi tên tác giả trong code </li>',
            title: '<h2 type="color:orangered">Xin các bạn hãy dành thời gian đọc cái này</h2>',
            imageUrl: 'https://www.lazyengineers.com/wp-content/uploads/2016/02/free1.jpg',
            imageWidth: 600,
            imageHeight: 400,
            imageAlt: 'Custom image'
        })
    }

    function ShowIns_Link() {
        Swal.fire({
            width: 800,
            html: 'Một số tài liệu đã được chuyển thành link rút gọn nhằm thêm kinh phí quảng cáo duy trì website, đây là cách truy cập cho những bạn không biết',
            title: 'CHÚ Ý',
            imageUrl: "Resource/img/Ins/linkrutgon.gif",
            videoWidth: 1000,
            videoHeight: 1000,
        })
    }

    function ShowLog_Home() {
        Swal.fire({
            width: 800,
            html: 'Bạn ơi, hãy đeo khẩu trang khi ra đường nhé!',
            title: 'Dịch COVID-19 đang diễn biến phức tạp',
            imageUrl: 'https://image.viettimes.vn/w800/Uploaded/2020/livospwi/2020_05_07/2-4018582_752020.jpg',
            imageWidth: 700,
            imageHeight: 500,
            imageAlt: 'Custom image'
        })
    }

    function ShowLog_Document() {
        Swal.fire({
            title: 'Cảnh báo rủi ro khi xem và Quyền Sở Hữu Trí Tuệ',
            width: 700,
            html: "<span style=\"color:orangered\">Tài liệu xuất phát từ đâu?</span><br>" +
                "<li> Bài tập của các thành viện trong nhóm TỰ LÀM</li><br>" +
                "<li> Slide thầy cô cung cấp phục vụ cho việc học</li><br>" +
                "<li> Bài tập mẫu trên các trang lớn như Sanfoudy, Quizzlet, CourseHero, ...</li><br>" +
                "<li> Đề thi tổng hợp từ các trang thông qua việc search keyword trên google</li><br>" +
                "<hr><span style=\"color:orangered\">Lưu ý thông tin thêm</span><br>" +
                "<li> Không nên xóa tên tác giả</li><br>" +
                "<li> Mình sẽ kiểm tra database thường xuyên và bạn nào hết stone mình sẽ bơm thêm :)))</li><br>" +
                "<li> Không khuyến khích tình trạng chép hoàn toàn bài tập của nhóm, hãy thử sức mình và tự làm lại nhé</li><br><br><br> Cảm ơn các bạn đã đọc<br>" +
                "<hr><span style=\"color:orangered\">satellite1012</span><br>",
            icon: 'warning',
            showCancelButton: true,
            showConfirmButton: false,
            confirmButtonColor: '',
            cancelButtonColor: '#3085d6',
            cancelButtonText: 'OK!'
        })
    }
</script>

<footer class="site-footer"
        style="padding-bottom: 0;margin-bottom: 0;background-color: #222;font-family: arial,serif;padding-top:20px;">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-5">
                        <h2 style="color:yellow;" class="footer-heading mb-4">About Us</h2>
                        <p>This website is owner by SATELLITE, developed and expanded through the management of Doan Duc
                            Tin and some admins, suported by some person, please do not copy this content by using
                            source viewer of your browser. To see more, go to <a href="about.action"
                                                                                 style="color: orange;">About Page</a>
                        </p>
                    </div>
                    <div class="col-md-5 ml-auto">
                        <h2 style="color:yellow;" class="footer-heading mb-4">Important Nearest Update</h2>
                        <p>Click below to see more about the latest update</p>
                        <ul class="list-unstyled">
                            <a href="#" target="_blank" class="smoothscroll">
                                <li><span style="color:gray">6 September 2020:</span> 3.0.060920</li>
                            </a>
                            <a href="#" target="_blank" class="smoothscroll">
                                <li><span style="color:gray">10 August 2020:</span> 2.9.100820</li>
                            </a>
                            <a href="#" target="_blank" class="smoothscroll">
                                <li><span style="color:gray">25 July 2020:</span> 2.7.250720</li>
                            </a>
                            <a href="#" target="_blank" class="smoothscroll">
                                <li><span style="color:gray">27 June 2020:</span> 2.0.270620 Alpha</li>
                            </a>
                        </ul>
                    </div>
                    <div class="col-md-2">
                        <h2 style="color:yellow;" class="footer-heading mb-4">Follow Us</h2>
                        <a href="https://www.facebook.com/groups/2519386961490453/" target="_blank"
                           class="pl-0 pr-3"><span class="icon-facebook"></span></a>
                        <a href="https://www.youtube.com/channel/UC_F0-leCzB71aE1lEBMvqGw?view_as=subscriber"
                           target="_blank" class=""><span class="icon-youtube-play"></span></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row pt-5 mt-5 text-center">
            <div class="col-md-12">
                <div class="border-top pt-5">
                    <p>
                        Copyright &copy;
                        <script>
                            document.write(new Date().getUTCFullYear());
                        </script>
                        All rights reserved | This page is made with <i class="icon-heart text-danger"
                                                                        aria-hidden="true"></i> by <a
                            href="https://www.facebook.com/satfomacej" target="_blank">Đoàn Đức Tín</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</footer>
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"></circle>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00"></circle>
    </svg>
</div>

</body>
</html>
