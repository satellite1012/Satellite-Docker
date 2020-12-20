<%@ page import="main.java.Controllers.ProductController" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico"/>
    <title>Satellite | Product | App</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Nơi chia sẻ các phần mềm do mình viết, một số có cho tải mã nguồn">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta name="author" content=Đoàn Đức Tín>
    <jsp:include page="../../Common/_css.jsp"/>
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
                Atable();
                LoadCircle();
            };
        </script>
    </c:if>
    <style>
        :root{
            --primary: #2175f5;
        }

        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body{
            background-color: #efefef;
        }

        .container{
            min-height: 100vh;
            justify-content: center;
            align-items: center;
            padding: 40px;
            overflow: hidden;
        }

        .app-card{
            display: flex;
            justify-content: center;
            align-items: center;
            width: 860px;
        }

        .shoeBackground{
            position: relative;
            width: 50%;
            height: 475px;
            box-shadow: -15px 0 35px rgba(0, 0, 0, 0.1),
            0 -15px 35px rgba(0, 0, 0, 0.1),
            0 15px 35px rgba(0, 0, 0, 0.1);
            transition: .5s;
        }

        .gradients{
            position: absolute;
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
        }

        .gradient{
            position: absolute;
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
            z-index: -2;
        }

        .first{
            z-index: 0;
            animation: 1s width ease;
        }

        @keyframes width{
            from{
                width: 0%;
            }
            to{
                width: 100%;
            }
        }

        .second{
            z-index: 0;
        }

        .gradient[color="blue"]{
            background-image: linear-gradient(45deg, #0136af, #22abfa);
        }

        .gradient[color="red"]{
            background-image: linear-gradient(45deg, #d62926, #ee625f);
        }

        .gradient[color="green"]{
            background-image: linear-gradient(45deg, #11998e, #1ce669);
        }

        .gradient[color="orange"]{
            background-image: linear-gradient(45deg, #fc4a1a, #f7b733);
        }

        .gradient[color="black"]{
            background-image: linear-gradient(45deg, #111, #666);
        }

        .logo{
            position: absolute;
            width: 100px;
            left: 20px;
            top: 20px;
        }

        .share{
            position: absolute;
            top: 15px;
            right: 15px;
            background-color: #fff;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            text-align: center;
            font-size: 1.3rem;
            text-decoration: none;
            color: #007bff;
            transition: .5s;
        }

        .share:hover{
            color: darkorange;
            transform: scale(1.1);
        }

        .share i{
            line-height: 50px;
        }

        .nike{
            position: absolute;
            top: 85px;
            left: 15px;
            font-size: 11rem;
            text-transform: uppercase;
            line-height: .9;
            color: #fff;
            opacity: .1;
        }

        .shoe{
            position: absolute;
            width: 140%;
            opacity: 0;
            bottom: 0;
            right: 0;
            transform: rotate(-20deg);
            transition: .5s;
        }

        .shoe.show{
            opacity: 1;
        }

        .info{
            width: 50%;
            background-color: #fff;
            z-index: 1;
            padding: 35px 40px;
            box-shadow: 15px 0 35px rgba(0, 0, 0, 0.1),
            0 -15px 35px rgba(0, 0, 0, 0.1),
            0 15px 35px rgba(0, 0, 0, 0.1);
        }

        .shoeName{
            padding: 0 0 10px 0;
        }

        .shoeName div{
            display: flex;
            align-items: center;
        }

        .shoeName div .big{
            margin-right: 10px;
            font-size: 2rem;
            color: #333;
            line-height: 1;
        }

        .shoeName div .new{
            background-color: var(--primary);
            text-transform: uppercase;
            color: #fff;
            padding: 3px 10px;
            border-radius: 5px;
            transition: .5s;
        }

        .shoeName .small{
            font-weight: 500;
            color: #444;
            margin-top: 3px;
            text-transform: capitalize;
        }

        .shoeName, .description, .color-container, .size-container{
            border-bottom: 1px solid #dadada;
        }

        .description{
            padding: 10px 0;
        }

        .title{
            color: #3a3a3a;
            font-weight: 600;
            font-size: 1.2rem;
            text-transform: uppercase;
        }

        .text{
            color: #555;
            font-size: 17px;
        }

        .color-container{
            padding: 10px 0;
        }

        .colors{
            padding: 8px 0;
            display: flex;
            align-items: center;
        }

        .color{
            width: 25px;
            height: 25px;
            border-radius: 50%;
            margin: 0 10px;
            border: 5px solid;
            cursor: pointer;
            transition: .5s;
        }

        .color[color="blue"]{
            background-color: #2175f5;
            border-color: #2175f5;
        }

        .color[color="red"]{
            background-color: #f84848;
            border-color: #f84848;
        }

        .color[color="green"]{
            background-color: #29b864;
            border-color: #29b864;
        }

        .color[color="orange"]{
            background-color: #ff5521;
            border-color: #ff5521;
        }

        .color[color="black"]{
            background-color: #444;
            border-color: #444;
        }

        .color.active{
            border-color: #fff;
            box-shadow: 0 0 10px .5px rgba(0, 0, 0, 0.2);
            transform: scale(1.1);
        }

        .size-container{
            padding: 10px 0;
            margin-bottom: 10px;
        }

        .sizes{
            padding: 8px 0;
            display: flex;
            align-items: center;
        }

        .size{
            padding-right: 3px;
            padding-left: 3px;
            width: fit-content;
            height: 40px;
            border-radius: 6px;
            background-color: #eee;
            margin: 0 10px;
            text-align: center;
            line-height: 40px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: .3s;
        }

        .size.active{
            background-color: darkorange;
            color: #fff;
            transition: .5s;
        }

        .buy-price{
            padding-top: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .price{
            color: #333;
            display: flex;
            align-items: flex-start;
        }

        .price h1{
            font-size: 2.1rem;
            font-weight: 600;
            line-height: 1;
        }

        .price i{
            font-size: 1.4rem;
            margin-right: 1px;
        }

        .buy{
            padding: .7rem 1rem;
            background-color: darkorange;
            text-decoration: none;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 500;
            font-size: 1.1rem;
            transition: .5s;
        }

        .buy:hover{
            transform: scale(1.1);
        }

        .buy i{
            margin-right: 2px;
        }

        @media (max-width: 1070px){
            .shoe{
                width: 135%;
            }
        }

        @media (max-width: 1000px){
            .app-card{
                flex-direction: column;
                width: 100%;
                box-shadow: 0 0 35px 1px rgba(0, 0, 0, 0.2);
            }

            .app-card > div{
                width: 100%;
                box-shadow: none;
            }

            .shoe{
                width: 100%;
                transform: rotate(-5deg) translateY(-50%);
                top: 55%;
                right: 2%;
            }

            .nike{
                top: 20%;
                left: 5%;
            }
        }

        @media (max-width: 600px){
            .share{
                width: 40px;
                height: 40px;
            }

            .share i {
                font-size: 1rem;
                line-height: 40px;
            }

            .logo{
                width: 70px;
            }
        }

        @media (max-width: 490px){
            .nike{
                font-size: 7rem;
            }

            .shoeName div .big{
                font-size: 1.3rem;
            }

            .small{
                font-size: 1rem;
            }

            .new{
                padding: 2px 6px;
                font-size: .9rem;
            }

            .title{
                font-size: .9rem;
            }

            .text{
                font-size: .8rem;
            }

            .buy{
                padding: .5rem .8rem;
                font-size: .8rem;
            }

            .price h1{
                font-size: 1.5rem;
            }

            .price i{
                font-size: .9rem;
            }

            .size{
                width: fit-content;
                height: 30px;
                margin: 0 8px;
                font-size: .9rem;
                line-height: 30px;
            }

            .color{
                margin: 0 6px;
                width: 20px;
                height: 20px;
                border-width: 4px;
            }

            .share{
                width: 35px;
                height: 35px;
                top: 10px;
                right: 10px;
            }

            .share i{
                font-size: .8rem;
                line-height: 35px;
            }

            .logo{
                width: 60px;
                top: 10px;
                left: 10px;
            }

            .info{
                padding: 20px;
            }
        }

        @media (max-width: 400px){
            .buy i{
                display: none;
            }

            .container{
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<!--Facebook-->
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0" nonce="4TU3IejE"></script>
<div style="z-index: 999; position: fixed;bottom: 20px;left: 28px" class="fb-share-button" data-href="http://satellite-fpt.azurewebsites.net/myapp.action" data-layout="button" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fsatellite-fpt.azurewebsites.net%2Fmyapp.action&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a></div>

<jsp:include page="../../Common/header.jsp"/>

<div style="height:9vw;background-size: cover;background-image:url('${pageContext.request.contextPath}/Resource/img/QA/viewQA.png') ;background-blend-mode: darken"
     data-stellar-background-ratio="0.5">
</div>
<div style="background-color: seashell;background-attachment: fixed;background-size: cover;background-blend-mode: darken;">
    <br><br>
    <div class="row">
            <!--SideBar-->
            <div class="col-md-4 col-xs-12">
                <div class="container" style="background-color: blanchedalmond;overflow-y: scroll; height:800px;">
                    <div class="row align-items-center justify-content-center text-center" >
                        <div class="col-12">
                            <h2 style="font-weight: 700">WHAT IS THIS ?</h2>
                            <h4>New</h4>
                            <h4>New</h4>
                            <h4>New</h4>
                            <h4>New</h4><br>
                            <hr>
                            <h2 style="font-weight: 700">NEW UPDATE !</h2><br>
                            <h4>New</h4>
                            <h4>New</h4>
                            <h4>New</h4>
                            <h4>New</h4><br>
                            <hr>
                            <p style="font-family:Dosis,serif;font-weight:600;color:white;font-size:20px;margin:0;text-align: center">View Apps</p>
                            <a href="#item-section">
                                <span class=" icon-keyboard_arrow_down" style="text-align:center;size: 88px;font-size:88px;"></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!--List Item-->
            <div class="col-md-8 col-xs-12">
                <div id="item-section" class="container" style="padding: 0;display: flex;" >
                    <div class="row" style="overflow-y: scroll; height:800px;">
                        <div class="col-12">
                            <c:forEach var="i" items="<%=ProductController.productList_App%>">
                                <div class="app-card">
                                    <div class="shoeBackground">
                                        <div class="gradients">
                                            <div class="gradient second" color="orange"></div>
                                        </div>
                                        <h1 class="nike">SAT'S APP</h1>
                                        <img src="${pageContext.request.contextPath}/Resource/img/satelliteLogo.png" alt="" class="logo">
                                        <a href="#" class="share"><i class="fas fa-share-alt"></i></a>

                                        <img src="${i.pImage}" alt="" class="shoe show" color="orange">

                                    </div>
                                    <div class="info">
                                        <div class="shoeName">
                                            <div>
                                                <h1 class="big" style="font-weight: 700">${i.pName}</h1>
                                                <span class="new" style="background-color: darkorange">${i.pType}</span>
                                            </div>
                                            <h3 class="small">${i.pVersion}</h3>
                                        </div>
                                        <div class="description">
                                            <h3 class="title">App Info</h3>
                                            <p class="text" style="font-family: Arial, Baskerville, monospace">${i.pDetails}</p>
                                        </div>
                                        <div class="size-container">
                                            <h3 class="title">Download</h3>
                                            <div class="sizes">
                        <span id="btn-demo-${i.id}" style="padding-top: 4px;" onclick="changePrice(${i.id},'0 VNĐ')" class="size"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-eye-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                          <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                          <path fill-rule="evenodd" d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                        </svg>&nbsp;Demo</span>

                        <span id="btn-release-${i.id}" style="padding-top: 4px;" onclick="changePrice(${i.id},'0 VNĐ')" class="size active"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cloud-download-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                          <path fill-rule="evenodd" d="M8 0a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 4.095 0 5.555 0 7.318 0 9.366 1.708 11 3.781 11H7.5V5.5a.5.5 0 0 1 1 0V11h4.188C14.502 11 16 9.57 16 7.773c0-1.636-1.242-2.969-2.834-3.194C12.923 1.999 10.69 0 8 0zm-.354 15.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 14.293V11h-1v3.293l-2.146-2.147a.5.5 0 0 0-.708.708l3 3z"/>
                        </svg>&nbsp;Release</span>

                        <span id="btn-code-${i.id}" style="padding-top: 4px;" onclick="changePrice(${i.id},'100.000VNĐ')" class="size"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-code-slash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                          <path fill-rule="evenodd" d="M4.854 4.146a.5.5 0 0 1 0 .708L1.707 8l3.147 3.146a.5.5 0 0 1-.708.708l-3.5-3.5a.5.5 0 0 1 0-.708l3.5-3.5a.5.5 0 0 1 .708 0zm6.292 0a.5.5 0 0 0 0 .708L14.293 8l-3.147 3.146a.5.5 0 0 0 .708.708l3.5-3.5a.5.5 0 0 0 0-.708l-3.5-3.5a.5.5 0 0 0-.708 0zm-.999-3.124a.5.5 0 0 1 .33.625l-4 13a.5.5 0 0 1-.955-.294l4-13a.5.5 0 0 1 .625-.33z"/>
                        </svg>&nbsp;Code</span>
                                            </div>
                                        </div>
                                        <div class="buy-price">
                                            <a onclick="checkout(${i.id})" class="buy" onmouseenter="this.style='background-color:darkorange;font-weight: 600;color:white'" onmouseleave="this.style='border:2px solid darkorange;background-color:white;font-weight: 600;color:darkorange'" style="border:2px solid darkorange;background-color:white;font-weight: 600;color:darkorange"><i class="fas fa-shopping-cart"></i>Download</a>
                                            <div class="price">
                                                <h1 id="price-of-${i.id}">0 VNĐ</h1>
                                            </div>
                                        </div>
                                    </div>
                                </div><br>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
<jsp:include page="../../Common/_js.jsp"/>
<jsp:include page="../../Common/footer.jsp"/>

<!--Additional-->
<script src="https://apps.elfsight.com/p/platform.js" defer></script>
<script src="${pageContext.request.contextPath}/Resource/js/product.js"></script>

<script>
    $(document).ready( function () {
        $('#gameTable').DataTable();
    } );
</script>

<script>
    function checkout(id){

    }
    function changePrice(id,stone){
        document.getElementById("price-of-"+id).innerHTML=stone;
    }
</script>
</body>
</html>
