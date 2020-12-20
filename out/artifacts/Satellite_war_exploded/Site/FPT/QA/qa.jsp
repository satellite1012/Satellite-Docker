<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Q&A | ${requestScope.QASelected.title}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="title" content=" ${requestScope.QASelected.title}">
    <meta name="description" content=" ${requestScope.QASelected.content}">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta name="author" content="Đoàn Đức Tín">
    <jsp:include page="${pageContext.request.contextPath}/Common/_css.jsp"/>
    <style>
        .search {
            border: 2px solid darkorange;
            overflow: auto;
            border-radius: 5px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
        }

        .search input[type="text"] {
            border: 0px;
            width: 67%;
            padding: 10px 10px;
        }

        .search input[type="text"]:focus {
            outline: 0;
        }

        .search input[type="submit"] {
            border: 0px;
            background: none;
            background-color: darkorange;
            color: #fff;
            float: right;
            padding: 10px;
            border-radius-top-right: 5px;
            -moz-border-radius-top-right: 5px;
            -webkit-border-radius-top-right: 5px;
            border-radius-bottom-right: 5px;
            -moz-border-radius-bottom-right: 5px;
            -webkit-border-radius-bottom-right: 5px;
            cursor: pointer;
        }

        @media only screen and (min-width: 150px) and (max-width: 780px) { {
        }
            .search {
                width: 95%;
                margin: 0 auto;
            }

        }

        .no-box-shadow {
            box-shadow: none
        }

        .no-box-shadow:focus {
            box-shadow: none
        }

        .day {
            font-size: 15px
        }

        .heart {
            border-radius: 22px
        }

        .heart-icon {
            color: orange;
        }

        .comment-text {
            font-size: 18px
        }

        .delete {
            font-size: 13px;
            cursor: pointer
        }

        .ck-editor {
            width: 100% !important;
        }
        .tags {
            margin: 1rem 0 2rem;
            padding: .5rem 0 1rem;
            line-height: 2;
            margin-bottom: 0;
        }

        .tags a {
            font-style: normal;
            font-weight: 700;
            font-size: .5rem;
            color: #232323;
            text-transform: uppercase;
            font-size: .66rem;
            border: 3px solid #000000;
            border-radius: 2rem;
            padding: .2rem .85rem .25rem;
            position: relative;
        }

        .tags a:hover {
            font-weight: 700;
            background: linear-gradient(90deg, #ff8a00,#e52e71);
            text-shadow: none;
            -webkit-text-fill-color: transparent;
            -webkit-background-clip: text;
            -webkit-box-decoration-break: clone;
            border-color: #ff5900;
        }
    </style>
    <c:if test="${sessionScope.log_CmtController != null}">
        <script>
            window.onload = function showLog() {
                Swal.fire({
                    icon: 'error',
                    title: '${sessionScope.log_CmtController}',
                    text: 'Satellite | ErrorLog',
                    footer: '<a href="https://www.facebook.com/satfomacej" target="_blank">You think this is a bug? contact admin now</a>'
                })
            };
        </script>
        <c:set var="log_CmtController" value="${null}" scope="session"/>
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

<div style="background-size: cover;background-blend-mode: darken">
    <div class="container-fluid">

        <!--COMMENT-->
        <div id="cmtsection" class="container mt-5 mb-5">
            <div class="d-flex justify-content-center row">
                <div class="col-md-12">

                    <!--Preview selected question-->
                    <div id="qa_list_div">

                        <div class="p-3 bg-white mt-2 rounded">
                            <div class="d-flex justify-content-between">
                                <div class="d-flex flex-row user"><img class="rounded-circle img-fluid img-responsive"
                                                                       style="max-width: 50px;max-height: 50px"
                                                                       src="${requestScope.QASelected.relation_user.uImage}" alt="none">
                                    <div class="d-flex flex-column ml-2">
                                        <a style="color:black;"
                                           href="${pageContext.request.contextPath}/profile/${requestScope.QASelected.relation_user.uName}">

                                            <c:if test="${requestScope.QASelected.relation_user.uRole eq 0}">
                                    <span style="color: orangered;font-weight: 700">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-credit-card-2-front"
                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd"
                                            d="M14 3H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"></path>
                                      <path d="M2 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1z"></path>
                                      <path fill-rule="evenodd"
                                            d="M2 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5z"></path>
                                    </svg>&nbsp;ADMIN
                                    </span>
                                            </c:if>
                                            <c:if test="${requestScope.QASelected.relation_user.uRole eq 1}">
                                    <span style="color: darkorange;font-weight: 700">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-credit-card-2-front"
                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd"
                                            d="M14 3H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"></path>
                                      <path d="M2 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1z"></path>
                                      <path fill-rule="evenodd"
                                            d="M2 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5z"></path>
                                    </svg>&nbsp;MOD
                                    </span>
                                            </c:if>
                                            <c:if test="${requestScope.QASelected.relation_user.uRole eq 2}">
                                    <span style="color: cadetblue;font-weight: 700">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-credit-card-2-front"
                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd"
                                            d="M14 3H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"></path>
                                      <path d="M2 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1z"></path>
                                      <path fill-rule="evenodd"
                                            d="M2 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5z"></path>
                                    </svg>&nbsp;USER
                                    </span>
                                            </c:if>
                                            <c:if test="${requestScope.QASelected.relation_user.uRole eq 3}">
                                    <span style="color: gray;font-weight: 700">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-credit-card-2-front"
                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd"
                                            d="M14 3H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"></path>
                                      <path d="M2 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1z"></path>
                                      <path fill-rule="evenodd"
                                            d="M2 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5z"></path>
                                    </svg>&nbsp;GUEST
                                    </span>
                                            </c:if>

                                            <span onmouseleave="this.style.color='black'"
                                                  onmouseover="this.style.color='blue'"
                                                  class="font-weight-bold">@${requestScope.QASelected.relation_user.uName}&nbsp;&nbsp;&nbsp;
                                    <span style="color: green;font-weight: 700">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-check2-circle"
                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd"
                                            d="M15.354 2.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L8 9.293l6.646-6.647a.5.5 0 0 1 .708 0z"></path>
                                      <path fill-rule="evenodd"
                                            d="M8 2.5A5.5 5.5 0 1 0 13.5 8a.5.5 0 0 1 1 0 6.5 6.5 0 1 1-3.25-5.63.5.5 0 1 1-.5.865A5.472 5.472 0 0 0 8 2.5z"></path>
                                    </svg>&nbsp;Được kiểm duyệt
                                    </span>
                                </span></a>
                                        <span class="day">${requestScope.QASelected.datecreated}
                                            <div class="tags" style="display:inline-block;margin: 0;padding: 0">
                                            <a style="color:blue;padding:0 8px 0 8px;margin: 0;display: inline-block" onclick="showScanQrBox()">SCAN QR</a>
                                            <a style="padding:0 8px 0 8px;margin: 0;display: inline-block" onclick="showQADetailBox(${requestScope.QASelected.id},'${requestScope.QASelected.title}','${QASelected.image}','${QASelected.content}',${QASelected.answered})">POP UP</a>
                                            <a style="color:darkorange;padding:0 8px 0 8px;margin: 0;display: inline-block" href="qaFPT">XEM CÂU HỎI KHÁC</a>
                                            </div>
                                        </span></div>
                                </div>
                                <div class="d-flex align-items-center px-3 heart border" style="height: 100%">
                                    <span class="ml-2"
                                          style="font-weight: 600;color:green;font-size: 10px">Có ${requestScope.QASelected.answered} phản hồi được duyệt</span>
                                </div>
                            </div>
                            <div class="comment-text text-justify mt-2">
                                <h5><b style="font-family: Dosis,sans-serif;font-weight: 600">${requestScope.QASelected.title}</b>
                                </h5>
                                <p style="font-family: Dosis,sans-serif">${requestScope.QASelected.content}</p>
                            </div>
                        </div>

                    </div>

                    <!--Area for input comment-->
                    <div id="cmt-section" class="d-flex flex-row align-items-center add-comment p-2 bg-white rounded"
                         style="border: 4px solid orange;padding: 10px">
                        <c:if test="${empty sessionScope.user}">
                            <img class="rounded-circle" src="https://freesvg.org/img/1538346433.png" width="40" alt="">
                        </c:if>
                        <c:if test="${not empty sessionScope.user}">
                            <img class="rounded-circle" src="${sessionScope.user.uImage}" width="40" alt="">
                        </c:if>
                        <label for="editor"></label><textarea required name="blogContent" id="editor"
                                                              placeholder="Bình luận, suy nghĩ và câu trả lời của ban cho câu hỏi bên trên"></textarea>
                    </div>

                    <!--Submit comment-->
                    <c:if test="${empty sessionScope.user}">
                        <div class="p-3 bg-white mt-2 rounded text-center" style="font-weight: 700">
                            <h5 style="font-weight: 700">Bình luận sẽ có tương tác thấp hơn nếu bạn chưa đăng nhập</h5>
                            <button id="add_cmt_button_1" onclick="postCommentGuest(this)"
                                    class="btn btn-success btn-sm px-3"
                                    style="border:0;font-weight: 600;background-color: orange;color:white;padding: 8px 20px 6px 20px">Đăng Bình Luận</button>
                            <a href="login.action">
                                <button class="btn btn-success btn-sm px-3"
                                        style="border:0;font-weight: 600;background-color: grey;color:white;padding: 8px 20px 6px 20px">
                                    Đăng Nhập
                                </button>
                            </a>
                        </div>
                    </c:if>
                    <c:if test="${not empty sessionScope.user}">
                        <c:if test="${sessionScope.user.uRole eq 3}">
                            <div class="p-3 bg-white mt-2 rounded text-center">
                                <h5 style="font-weight: 600">Tương tác sẽ thấp hơn nếu bạn bình luận dưới dạng ẩn
                                    danh</h5>
                                <button id="add_cmt_button_2" onclick="postCommentGuest(this)"
                                        class="btn btn-success btn-sm px-3"
                                        style="border:0;font-weight: 600;background-color: orange;color:white;padding: 8px 20px 6px 20px">Đăng Bình Luận</button>
                                <a href="user_logout.action">
                                    <button class="btn btn-success btn-sm px-3"
                                            style="border:0;background-color: grey;color:white;padding: 8px 20px 6px 20px ;font-weight: 600">
                                        Đăng Xuất Khỏi Tài Khoản Khách
                                    </button>
                                </a>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.user.uRole ne 3}">
                            <div class="p-3 bg-white mt-2 rounded text-center">
                                <h5 style="font-weight: 600">Bạn sẽ bình luận với tên <span
                                        style="color:orange">${sessionScope.user.uDigitalName}</span></h5>
                                <button id="add_cmt_button_3" onclick="postComment(this)"
                                        class="btn btn-success btn-sm px-3"
                                        style="border:0;font-weight: 600;background-color: orange;color:white;padding: 8px 20px 6px 20px">Đăng Bình Luận</button>
                            </div>
                        </c:if>
                    </c:if>

                    <div id="cmt_fpt_list_all">

                        <!-- Top Comment List -->

                        <!-- All Comment List -->
                        <c:if test="${empty requestScope.CmtList}">
                            <hr>
                            <p style="text-align:center;font-family: Arial,sans-serif;font-size: 14px;font-weight: 700;color: grey">
                                <i>Chưa có câu trả lời nào</i></p>
                        </c:if>
                        <c:if test="${not (empty requestScope.CmtList)}%>">
                            <hr>
                            <p style="text-align:center;font-family: Arial,sans-serif;font-size: 14px;font-weight: 700;color: orange">
                                <i>Câu trả lời nhiều like hơn được ưu tiên hiển thị</i></p>
                        </c:if>

                        <div id="cmt_fpt_list_new">
                            <c:forEach var="i" items="${requestScope.CmtList}" varStatus="loop">
                                <div id="cmt-number-${loop.count}" class="p-3 bg-white rounded"
                                     style="border: 1px solid grey;">
                                    <div class="d-flex justify-content-between">
                                        <div class="d-flex flex-row user"><img
                                                class="rounded-circle img-fluid img-responsive"
                                                style="max-width: 50px;max-height: 50px"
                                                src="${i.relation_user.uImage}" alt="none">
                                            <div class="d-flex flex-column ml-2">

                                                <!--IF TOP COMMENT-->
                                                <c:if test="${loop.count eq 1}">
                                                    <a style="color:black"
                                                       href="${pageContext.request.contextPath}/profile/${i.relation_user.uName}">

                                                        <c:if test="${i.relation_user.uRole eq 0}">
                                            <span style="color: orangered;font-weight: 700">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16"
                                                 class="bi bi-credit-card-2-front" fill="currentColor"
                                                 xmlns="http://www.w3.org/2000/svg">
                                              <path fill-rule="evenodd"
                                                    d="M14 3H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"></path>
                                              <path d="M2 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1z"></path>
                                              <path fill-rule="evenodd"
                                                    d="M2 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5z"></path>
                                            </svg>&nbsp;ADMIN
                                            </span>
                                                        </c:if>
                                                        <c:if test="${i.relation_user.uRole eq 1}">
                                            <span style="color: darkorange;font-weight: 700">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16"
                                                 class="bi bi-credit-card-2-front" fill="currentColor"
                                                 xmlns="http://www.w3.org/2000/svg">
                                              <path fill-rule="evenodd"
                                                    d="M14 3H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"></path>
                                              <path d="M2 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1z"></path>
                                              <path fill-rule="evenodd"
                                                    d="M2 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5z"></path>
                                            </svg>&nbsp;MOD
                                            </span>
                                                        </c:if>
                                                        <c:if test="${i.relation_user.uRole eq 2}">
                                            <span style="color: cadetblue;font-weight: 700">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16"
                                                 class="bi bi-credit-card-2-front" fill="currentColor"
                                                 xmlns="http://www.w3.org/2000/svg">
                                              <path fill-rule="evenodd"
                                                    d="M14 3H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"></path>
                                              <path d="M2 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1z"></path>
                                              <path fill-rule="evenodd"
                                                    d="M2 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5z"></path>
                                            </svg>&nbsp;USER
                                            </span>
                                                        </c:if>
                                                        <c:if test="${i.relation_user.uRole eq 3}">
                                            <span style="color: gray;font-weight: 700">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16"
                                                 class="bi bi-credit-card-2-front" fill="currentColor"
                                                 xmlns="http://www.w3.org/2000/svg">
                                              <path fill-rule="evenodd"
                                                    d="M14 3H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"></path>
                                              <path d="M2 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1z"></path>
                                              <path fill-rule="evenodd"
                                                    d="M2 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5z"></path>
                                            </svg>&nbsp;GUEST
                                            </span>
                                                        </c:if>

                                                        <span onmouseleave="this.style.color='black'"
                                                              onmouseover="this.style.color='blue'"
                                                              class="font-weight-bold hover">@${i.relation_user.uName}&nbsp;&nbsp;&nbsp;<span
                                                                id="top-comment-${loop.count}"
                                                                style="color: orange;font-weight: 700">
                                                        <svg width="1em" height="1em" viewBox="0 0 16 16"
                                                             class="bi bi-star-fill" fill="currentColor"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                                                        </svg>&nbsp;TOP COMMENT
                                                        </span></span>
                                                    </a>
                                                </c:if>

                                                <!--IF NOT TOP COMMENT-->
                                                <c:if test="${loop.count ne 1}">
                                                    <a style="color:black"
                                                       href="${pageContext.request.contextPath}/profile/${i.relation_user.uName}">

                                                        <c:if test="${i.relation_user.uRole eq 0}">
                                            <span style="color: orangered;font-weight: 700">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16"
                                                 class="bi bi-credit-card-2-front" fill="currentColor"
                                                 xmlns="http://www.w3.org/2000/svg">
                                              <path fill-rule="evenodd"
                                                    d="M14 3H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"></path>
                                              <path d="M2 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1z"></path>
                                              <path fill-rule="evenodd"
                                                    d="M2 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5z"></path>
                                            </svg>&nbsp;ADMIN
                                            </span>
                                                        </c:if>
                                                        <c:if test="${i.relation_user.uRole eq 1}">
                                            <span style="color: darkorange;font-weight: 700">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16"
                                                 class="bi bi-credit-card-2-front" fill="currentColor"
                                                 xmlns="http://www.w3.org/2000/svg">
                                              <path fill-rule="evenodd"
                                                    d="M14 3H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"></path>
                                              <path d="M2 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1z"></path>
                                              <path fill-rule="evenodd"
                                                    d="M2 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5z"></path>
                                            </svg>&nbsp;MOD
                                            </span>
                                                        </c:if>
                                                        <c:if test="${i.relation_user.uRole eq 2}">
                                            <span style="color: cadetblue;font-weight: 700">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16"
                                                 class="bi bi-credit-card-2-front" fill="currentColor"
                                                 xmlns="http://www.w3.org/2000/svg">
                                              <path fill-rule="evenodd"
                                                    d="M14 3H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"></path>
                                              <path d="M2 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1z"></path>
                                              <path fill-rule="evenodd"
                                                    d="M2 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5z"></path>
                                            </svg>&nbsp;USER
                                            </span>
                                                        </c:if>
                                                        <c:if test="${i.relation_user.uRole eq 3}">
                                            <span style="color: gray;font-weight: 700">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16"
                                                 class="bi bi-credit-card-2-front" fill="currentColor"
                                                 xmlns="http://www.w3.org/2000/svg">
                                              <path fill-rule="evenodd"
                                                    d="M14 3H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"></path>
                                              <path d="M2 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1z"></path>
                                              <path fill-rule="evenodd"
                                                    d="M2 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5z"></path>
                                            </svg>&nbsp;GUEST
                                            </span>
                                                        </c:if>

                                                        <span onmouseleave="this.style.color='black'"
                                                              onmouseover="this.style.color='blue'"
                                                              class="font-weight-bold hover">@${i.relation_user.uName}&nbsp;&nbsp;</span>
                                                    </a>
                                                </c:if>
                                                <span class="day">${i.datecreated}</span>
                                            </div>
                                        </div>
                                        <c:set var="likeID" value="cmt_liked_of_${i.id}"/>
                                        <c:if test="${sessionScope[likeID]!=null}">
                                            <div
                                                    class="d-flex align-items-center px-3 heart border">
                                                <i class="fa fa-heart heart-icon"></i>
                                                <span style="font-weight: 600;color:orange">${i.validate}</span>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <span id="cmt-section-of-${loop.count}" class="ml-2"
                                                      style="font-weight: 600;color:green"><svg width="1em" height="1em"
                                                                                                viewBox="0 0 16 16"
                                                                                                class="bi bi-trophy-fill"
                                                                                                fill="currentColor"
                                                                                                xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd"
                                            d="M2.5.5A.5.5 0 0 1 3 0h10a.5.5 0 0 1 .5.5c0 .538-.012 1.05-.034 1.536a3 3 0 1 1-1.133 5.89c-.79 1.865-1.878 2.777-2.833 3.011v2.173l1.425.356c.194.048.377.135.537.255L13.3 15.1a.5.5 0 0 1-.3.9H3a.5.5 0 0 1-.3-.9l1.838-1.379c.16-.12.343-.207.537-.255L6.5 13.11v-2.173c-.955-.234-2.043-1.146-2.833-3.012a3 3 0 1 1-1.132-5.89A33.076 33.076 0 0 1 2.5.5zm.099 2.54a2 2 0 0 0 .72 3.935c-.333-1.05-.588-2.346-.72-3.935zm10.083 3.935a2 2 0 0 0 .72-3.935c-.133 1.59-.388 2.885-.72 3.935z"></path>
                                    </svg>&nbsp;${i.relation_user.uStrength_creation}</span>
                                            </div>
                                        </c:if>
                                        <c:if test="${sessionScope[likeID]==null}">
                                            <div id="cmt-like-of-${i.id}"
                                                 onclick="addlike(${i.id},${i.relation_qa.id},${i.validate},${i.relation_user.uStrength_creation})"
                                                 class="d-flex align-items-center px-3 heart border">
                                                <i class="fa fa-heart heart-icon" style="color: gray"></i>
                                                <span style="font-weight: 600;color:orange">${i.validate}</span>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <span class="ml-2" style="font-weight: 600;color:green"><svg width="1em"
                                                                                                             height="1em"
                                                                                                             viewBox="0 0 16 16"
                                                                                                             class="bi bi-trophy-fill"
                                                                                                             fill="currentColor"
                                                                                                             xmlns="http://www.w3.org/2000/svg">
                                                  <path fill-rule="evenodd"
                                                        d="M2.5.5A.5.5 0 0 1 3 0h10a.5.5 0 0 1 .5.5c0 .538-.012 1.05-.034 1.536a3 3 0 1 1-1.133 5.89c-.79 1.865-1.878 2.777-2.833 3.011v2.173l1.425.356c.194.048.377.135.537.255L13.3 15.1a.5.5 0 0 1-.3.9H3a.5.5 0 0 1-.3-.9l1.838-1.379c.16-.12.343-.207.537-.255L6.5 13.11v-2.173c-.955-.234-2.043-1.146-2.833-3.012a3 3 0 1 1-1.132-5.89A33.076 33.076 0 0 1 2.5.5zm.099 2.54a2 2 0 0 0 .72 3.935c-.333-1.05-.588-2.346-.72-3.935zm10.083 3.935a2 2 0 0 0 .72-3.935c-.133 1.59-.388 2.885-.72 3.935z"></path>
                                                </svg>&nbsp;${i.relation_user.uStrength_creation}</span>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="comment-text text-justify mt-2">
                                        <div style="font-family: Dosis,sans-serif">${i.comment}</div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                    </div>

                </div>
            </div>
        </div>

    </div>
</div>

<jsp:include page="${pageContext.request.contextPath}/Common/_js.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/Common/footer.jsp"/>

<!--POPUP-->
<script>
    function showQADetailBox(id, title, image, content, answered){
        Swal.fire({
            title: title,
            text: content,
            imageUrl: image,
            imageWidth: "100%",
            imageHeight: "100%",
            imageAlt: 'Custom image',
        })
    }
    function showScanQrBox(){
        Swal.fire({
            title: 'Scan',
            text: 'Share this question to your friends !',
            imageUrl: 'https://api.qrserver.com/v1/create-qr-code/?size=350x350&data=https://satellite-fpt.azurewebsites.net/viewQAFPT?id=${QASelected.id}',
            imageWidth: "100%",
            imageHeight: "100%",
            imageAlt: 'Custom image',
        })
    }
</script>

<!--AddCmt-->
<script>
    function postCommentGuest(a) {
        if (a.innerHTML !== 'Đăng Bình Luận') return;
        a.innerHTML = '<i class="fa fa-circle-o-notch fa-spin" style="padding: 0;margin: 0"></i>\n';
        comment = myEditor.getData();
        addCmtAPI(comment, ${requestScope.QASelected.id}, 4);
    }
</script>
<script>
    function postComment(a) {
        if (a.innerHTML !== 'Đăng Bình Luận') return;
        a.innerHTML = '<i class="fa fa-circle-o-notch fa-spin" style="padding: 0;margin: 0"></i>\n';
        comment = myEditor.getData();
        userid =${sessionScope.user.id};
        addCmtAPI(comment, ${requestScope.QASelected.id}, userid);
    }
</script>

<!--AddLike-->
<script>
    function addlike(id, qa_id, like, temp) {
        document.getElementById("cmt-like-of-" + id).innerHTML = ' <i class="fa fa-heart heart-icon"></i>\n' +
            '                                                <span style="font-weight: 600;color:orange">' + (like + 1) + '</span>\n' +
            '                                                &nbsp;&nbsp;&nbsp;&nbsp;\n' +
            '                                                <span class="ml-2" style="font-weight: 600;color:green"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trophy-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">\n' +
            '                                                  <path fill-rule="evenodd" d="M2.5.5A.5.5 0 0 1 3 0h10a.5.5 0 0 1 .5.5c0 .538-.012 1.05-.034 1.536a3 3 0 1 1-1.133 5.89c-.79 1.865-1.878 2.777-2.833 3.011v2.173l1.425.356c.194.048.377.135.537.255L13.3 15.1a.5.5 0 0 1-.3.9H3a.5.5 0 0 1-.3-.9l1.838-1.379c.16-.12.343-.207.537-.255L6.5 13.11v-2.173c-.955-.234-2.043-1.146-2.833-3.012a3 3 0 1 1-1.132-5.89A33.076 33.076 0 0 1 2.5.5zm.099 2.54a2 2 0 0 0 .72 3.935c-.333-1.05-.588-2.346-.72-3.935zm10.083 3.935a2 2 0 0 0 .72-3.935c-.133 1.59-.388 2.885-.72 3.935z"/>\n' +
            '                                                </svg>&nbsp;' + (temp) + '</span>';
        addlikeAPI(id);
    }
</script>

<!--API-->
<script>
    function addlikeAPI(id) {
        data = id;
        $.ajax({
            type: 'POST',
            url: '/likeCmt',
            //contentType: 'application/json',
            data: {data},
        }).done(function (result) {
            if (result.toString().substring(0, 7) === "//ERROR") {
                Swal.fire({
                    position: 'top-end',
                    icon: 'error',
                    title: result.toString().substring(7),
                    showConfirmButton: false,
                    timer: 2000
                })
            } else {

            }
        });
    }

    function addCmtAPI(comment, qa, user) {
        data = comment + "bug->bug" + qa + "bug->bug" + user + "bug->bug";
        $.ajax({
            type: 'POST',
            url: '/addCmt',
            //contentType: 'application/json',
            data: {data},
        }).done(function (result) {
            if (result.toString().substring(0, 7) === "//ERROR") {
                Swal.fire({
                    position: 'top-end',
                    icon: 'error',
                    title: result.toString().substring(7),
                    showConfirmButton: false,
                    timer: 2000
                })
            } else {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: "Thành công, bình luận của bạn đã được thêm vào cuối danh sách",
                    showConfirmButton: false,
                    timer: 2000
                })
                document.getElementById("cmt_fpt_list_all").innerHTML = result;
            }
            x = document.getElementById("add_cmt_button_1");
            if (x !== null) {
                x.innerHTML = "Đăng Bình Luận";
            } else {
                x = document.getElementById("add_cmt_button_2");
                if (x !== null) {
                    x.innerHTML = "Đăng Bình Luận";
                } else {
                    x = document.getElementById("add_cmt_button_3");
                    x.innerHTML = "Đăng Bình Luận";
                }
            }
        });
    }
</script>

<!--Editor-->
<script src="https://cdn.ckeditor.com/ckeditor5/22.0.0/classic/ckeditor.js"></script>
<script>
    var myEditor;
    ClassicEditor
        .create(document.querySelector('#editor'))
        .then(editor => {
            console.log('Editor was initialized', editor);
            myEditor = editor;
        })
        .catch(err => {
            console.error(err.stack);
        });
</script>
</body>
</html>
