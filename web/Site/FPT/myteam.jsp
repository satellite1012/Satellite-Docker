<%@ page import="main.java.Controllers.ProductController" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Satellite | Team</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="description" content="Các dự án của team bọn mình (nhiều team khác nhau)">
      <meta name="keywords" content="HTML,CSS,XML,JavaScript">
      <meta name="author" content="Đoàn Đức Tín">
    <jsp:include page="${pageContext.request.contextPath}/Common/_css.jsp" />
    <style>
          @import url('https://fonts.googleapis.com/css?family=Muli&display=swap');

          .courses-container {
          }

          .course {
          linear-gradient(to bottom, #ADB2B6, #ABAEB3);
              border-radius: 10px;
              box-shadow: 0 10px 10px rgba(0, 0, 0, 0.2);
              display: flex;
              max-width: 100%;
              margin: 20px;
              overflow: hidden;
              width: 100%;
          }

          .course h6 {
              opacity: 0.6;
              margin: 0;
              letter-spacing: 1px;
              text-transform: uppercase;
          }

          .course h2 {
              letter-spacing: 1px;
              margin: 10px 0;
          }

          .course-preview {
              position: relative;
              background: linear-gradient(90deg, rgba(245,135,0,1) 0%, rgba(231,129,12,0.7) 100%); color: #fff;
              padding: 30px;
              max-width: 250px;
          }

          .course-preview a {
              color: #fff;
              display: inline-block;
              font-size: 12px;

              opacity: 0.6;
              margin-top: 30px;
              text-decoration: none;
          }

          .course-info {
              padding: 30px;
              position: relative;
              width: 100%;
          }

          .progress-container {
              position: absolute;
              top: 30px;
              right: 30px;
              text-align: right;
              width: 150px;
          }

          .progress {
              background-color: #ddd;
              border-radius: 3px;
              height: 5px;
              width: 100%;
          }

          .progress::after {
              border-radius: 3px;
              background-color: #2A265F;
              content: '';
              position: absolute;
              top: 0;
              left: 0;
              height: 5px;
              width: 0%;
          }

          .progress-text {
              font-size: 10px;
              opacity: 0.6;
              letter-spacing: 1px;
          }

          .btn1 {
              background-color: orange;
              border: 0;
              border-radius: 50px;
              box-shadow: 0 10px 10px rgba(0, 0, 0, 0.2);
              color: #fff;
              font-size: 16px;
              padding: 12px 25px;
              bottom: 30px;
              right: 30px;
              letter-spacing: 1px;
              font-weight: 600;
          }
          .btn1:hover{
              background: #009FFF;  /* fallback for old browsers */
              background: -webkit-linear-gradient(to right, #ec2F4B, #009FFF);  /* Chrome 10-25, Safari 5.1-6 */
              background: linear-gradient(to right, #ec2F4B, #009FFF); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
          }
          .concac:hover{
              color:orange;
          }
          html, body {
              overflow-x: hidden;
          }

      </style>
  </head>
  <body>

  <!--Facebook-->
  <div id="fb-root"></div>
  <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0" nonce="4TU3IejE"></script>
  <div style="z-index: 999; position: fixed;bottom: 20px;left: 28px" class="fb-share-button" data-href="http://satellite-fpt.azurewebsites.net/myteam.action" data-layout="button" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fsatellite-fpt.azurewebsites.net%2Fmyteam.action&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a></div>

  <jsp:include page="../../Common/header.jsp" />

        <div style="padding-top:120px;padding-bottom:90px;background-image: url('../../Resource/img/bgMyApp.jpg');background-attachment: fixed;background-size: cover;background-blend-mode: darken;"
             data-stellar-background-ratio="0.5">
            <div class="container-fluid">
                <div class="row align-items-center justify-content-center text-center">
                    <div class="col-md-10">
                        <table id="gameTable">
                            <thead style="display: none">
                            <tr>
                                <th>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="i" items="<%=ProductController.productList_Web%>">
                                <tr style="background: none"><td>
                                    <div class="courses-container" style="width:100%;  ">
                                        <div class="course" style="margin:0;height: 400px; background: linear-gradient(to right, rgba(255,255,255,0.2) 0%,
                                                rgba(255,255,255,1) 60%), url('${i.pImage}'); background-size: contain">

                                            <div class="course-preview" style="min-width: 250px;max-width: 250px">
                                                <h6 style="font-weight: 600">${i.pType}</h6>
                                                <hr>
                                                <h2 style="font-weight: 600">${i.pName}</h2>
                                                <hr>
                                                <a class="concac" style="font-weight: 500;font-size: 20px;" onclick='showInstructionProduct()'>How to download <i class="fas fa-chevron-right"></i></a>
                                                <div style="font-size: 10px;float:left;bottom: 10px;position: absolute">
                                                    <li>Created on ${i.pDatecreated}</li>
                                                    <li>Latest update on ${i.pDateupdate}</li>
                                                </div>
                                            </div>

                                            <div class="course-info" style="padding-left: 0;padding-right: 0">
                                                <div class="progress-container">
                                                    <div class="progress"></div>
                                                    <span class="progress-text" style="font-weight: 600">Not yet rating</span>
                                                </div>
                                                <h6 style="font-weight: 600">Details</h6><hr>
                                                <h2 style="font-size: 22px;font-weight: 600;font-family: Arial,serif;text-align: left;    background-image: linear-gradient(-90deg, rgba(245,135,0,1) 0%, rgba(231,129,12,0.7) 100%);padding: 14px;color:white">${i.pDetails}</h2>
                                                <div style="right: 10px;position: absolute;bottom: 10px;">
                                                    <br><br><br><hr>
                                                    <c:if test="${not empty i.pLink_ANDROID}">
                                                        <a  href="${i.pLink_ANDROID}" target="_blank" ><button class="btn1"><i class="fab fa-android"></i>&nbsp;&nbsp;ANDROID Version</button></a>
                                                    </c:if>
                                                    <c:if test="${not empty i.pLink_IOS}">
                                                        <a  href="${i.pLink_IOS}" target="_blank"><button class="btn1"><i class="fab fa-apple"></i>&nbsp;&nbsp;IOS Version</button></a>
                                                    </c:if>
                                                    <c:if test="${not empty i.pLink_PC}">
                                                        <a  href="${i.pLink_PC}" target="_blank"><button  class="btn1"><i class="fas fa-desktop"></i>&nbsp;&nbsp;PC Version</button></a>
                                                    </c:if>
                                                    <c:if test="${not empty i.pLink_MT5}">
                                                        <a href="${i.pLink_MT5}" target="_blank"><button   class="btn1"><i class="fas fa-chart-line"></i>&nbsp;&nbsp;MT5</button></a>
                                                    </c:if>
                                                    <c:if test="${not empty i.pLink_LINUX}">
                                                        <a href="${i.pLink_LINUX}" target="_blank"><button  class="btn1"><i class="fab fa-ubuntu"></i>&nbsp;&nbsp;LINUX Version</button></a>
                                                    </c:if>
                                                    <c:if test="${not empty i.pLink_SOURCE}">
                                                        <a href="${i.pLink_SOURCE}" target="_blank"><button  class="btn1"><i class="fas fa-code"></i>&nbsp;&nbsp;Source Code</button></a>
                                                    </c:if>
                                                    <c:if test="${not empty i.pLink_WEB}">
                                                        <a href="${i.pLink_WEB}" target="_blank"><button  class="btn1"><i class="fas fa-eye"></i>&nbsp;&nbsp;VIEW WEBSITE NOW</button></a>
                                                    </c:if>
                                                </div>

                                                <div style="left: 15px;position: absolute;bottom: 5px;">
                                                    <p style="color: wheat;font-weight: 700;font-size: 14px;background: rgba(0,0,0,0.4);padding: 4px;border-radius: 4px">Version ${i.pVersion}</p>
                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                    <br><br>
                                </td></tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../../Common/_js.jsp" />
        <!--LOADER-->
        <div id="ftco-loader" class="fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"></circle><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"></circle></svg></div>
        <jsp:include page="../../Common/footer.jsp" />

        <script>
            $(document).ready( function () {
                $('#gameTable').DataTable();
            } );

            window.onload=function() {
                var a=document.getElementById('gameTable_length');
                var b=document.getElementById('gameTable_filter');
                var c=document.getElementById('gameTable_info');
                var d=document.getElementById('gameTable_paginate');
                document.getElementById('gameTable').style.borderBottom='3px solid white'

                a.style.color = 'white';
                a.style.fontSize = '25px';
                a.style.fontWeight = '600';
                a.style.paddingTop ='8px';
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

                document.getElementsByClassName("fullscreen").item(0).style.display = "none";
                document.getElementsByClassName("fullscreen").item(1).style.display = "none";
            }
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
