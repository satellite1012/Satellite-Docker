<%@ page import="main.java.Controllers.QAController" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Satellite | Q&A FPT</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="title" content="FPT Ask and Answer Forum">
    <meta name="description" content="Nơi dành cho các bạn sinh viên đặt những câu hỏi, những câu trả lời được đưa ra nhằm giúp các bạn tiếp cận với môi trường học tập nhanh hơn">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta name="author" content=Đoàn Đức Tín>
    <jsp:include page="../../Common/_css.jsp"/>
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
    </style>
    <c:if test="${sessionScope.log_QAFPTController != null}">
        <script>
            window.onload = function showLog() {
                Swal.fire({
                    icon: 'error',
                    title: '${sessionScope.log_QAFPTController}',
                    text: 'Satellite | ErrorLog',
                    footer: '<a href="https://www.facebook.com/satfomacej" target="_blank">You think this is a bug? contact admin now</a>'
                })
            };
        </script>
        <c:set var="log_QAFPTController" value="${null}" scope="session"/>
    </c:if>
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
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0" nonce="4TU3IejE"></script>
<div style="z-index: 999; position: fixed;bottom: 20px;left: 28px" class="fb-share-button" data-href="http://satellite-fpt.azurewebsites.net/qaFPT.action" data-layout="button" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fsatellite-fpt.azurewebsites.net%2FqaFPT.action&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a></div>

<jsp:include page="../../Common/header.jsp"/>

<div style="padding-top:120px;background-image: url('../../Resource/img/background.jpg');background-size: cover;background-blend-mode: darken"
     data-stellar-background-ratio="0.5">
    <div class="container-fluid">
        <div class="row align-items-center justify-content-center text-center">

            <!--Search box-->
            <div id="search-section" class="search" style="width:80%;background: white;padding: 10px">
                    <c:if test="${sessionScope.user ne null}">
                        <c:if test="${sessionScope.user.uRole eq 3}">
                            <button onclick="addQAGuest()" class="btn-success" style="border-radius:5px;border: 0;padding: 10px;">ASK SOME QUESTION</button>
                        </c:if>
                        <c:if test="${sessionScope.user.uRole ne 3}">
                            <button onclick="addQA()" class="btn-success" style="border-radius:5px;border: 0;padding: 10px;">ASK SOME QUESTION</button>
                        </c:if>
                    </c:if>
                    <c:if test="${sessionScope.user eq null}">
                        <button onclick="addQAGuest()" class="btn-success" style="border-radius:5px;border: 0;padding: 10px;">ASK SOME QUESTION</button>
                    </c:if>
                    <input style="border: 1px solid" id="searchBoxInput" type="text" placeholder="Tìm kiếm tiêu đề câu hỏi" onkeyup="searchQA()">
                    <input style="border-radius: 5px" type="submit" value="Search">
            </div>

            <!--Script for search-->
            <script>
                var items = [];

                function searchQA() {
                    var text = document.getElementById("searchBoxInput").value.toLowerCase();
                    //hidden
                    var temp = findQA('');
                    temp.forEach(beginSearch);

                    //update
                    var obj = findQA(text);
                    obj.forEach(update);
                }

                function findQA(s) {
                    s = s.split(' ');
                    return items.filter(function (item) {
                        return s.every(function (el) {
                            return item.content.indexOf(el) > -1;
                        });
                    });
                }

                function update(item, index) {
                    var s = document.getElementById("card-num-" + item.index);
                    if (s != null) {

                        s.style.display = "";
                    }
                }

                function beginSearch(item, index) {
                    var s = document.getElementById("card-num-" + item.index);
                    if (s != null) {

                        s.style.display = "none";
                    }
                }
            </script>
            <br><br><br>

            <!--QA FPT LIST-->
            <section id="qa_list_section" class="card1-list card1-font" style="background: none;">

                <!--Add qa button-->
                <c:if test="${not empty sessionScope.user}">
                    <c:if test="${sessionScope.user.uRole ne 3}">
                        <article onclick="addQA()" id="card-num-" class="card1"
                                 style="height: 500px; background: linear-gradient(to right, #8e0e00, #1f1c18); ">
                            <header class="card1-header">
                                <p>Đặt câu hỏi</p>
                                <h2 style="font-weight:700">Bạn đang thắc mắc vấn đề gì nào?</h2>
                            </header>

                            <div class="card1-author">
                                <a class="author-avatar" href="#">
                                    <img src="../../Resource/img/QA/plus.png" alt="none"/>
                                </a>

                                <div class="author-name">
                                    <div class="author-name-prefix">Ban sẽ hỏi với tên</div>
                                        ${sessionScope.user.uDigitalName}
                                </div>

                            </div>
                        </article>
                    </c:if>
                    <c:if test="${sessionScope.user.uRole eq 3}">
                        <article onclick="addQAGuest()" id="card-num-" class="card1"
                                 style="height: 500px; background: linear-gradient(to right, #8e0e00, #1f1c18); ">
                            <header class="card1-header">
                                <p>Đặt câu hỏi</p>
                                <h2 style="font-weight:700">Bạn đang thắc mắc vấn đề gì nào?</h2>
                            </header>

                            <div class="card1-author">
                                <a class="author-avatar" href="#">
                                    <img src="../../Resource/img/QA/plus.png" alt="none"/>
                                </a>

                                <div class="author-name">
                                    <div class="author-name-prefix">Ban sẽ hỏi với tên</div>
                                        Anonymous
                                </div>

                            </div>
                        </article>
                    </c:if>
                </c:if>
                <c:if test="${empty sessionScope.user}">
                        <article onclick="addQAGuest()" id="card-num-" class="card1"
                                 style="height: 500px; background: linear-gradient(to right, #8e0e00, #1f1c18); ">
                            <header class="card1-header">
                                <p>Đặt câu hỏi</p>
                                <h2 style="font-weight:700">Bạn đang thắc mắc vấn đề gì nào?</h2>
                            </header>

                            <div class="card1-author">
                                <a class="author-avatar" href="#">
                                    <img src="../../Resource/img/QA/plus.png" alt="none"/>
                                </a>

                                <div class="author-name">
                                    <div class="author-name-prefix">Ban sẽ hỏi với tên</div>
                                    Anonymous
                                </div>

                            </div>
                        </article>
                </c:if>

                <!--List of question cards-->
                <c:forEach var="i" items="<%=QAController.qaListFPT%>" varStatus="loop">
                    <article onclick="location.href='viewQAFPT?id=${i.id}'"
                             id="card-num-${loop.count}" class="card1" style="height: 500px;">
                        <header class="card1-header">
                            <p>${i.datecreated}</p>
                            <h2 style="font-weight:700">${i.title}</h2>
                        </header>

                        <c:if test="${i.relation_user.uRole ne 3}">
                            <div class="card1-author">
                                <a class="author-avatar" href="#">
                                    <img src="${i.image}" alt="none"/>
                                </a>
                                <svg class="half-circle" viewBox="0 0 106 57">
                                    <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
                                </svg>
                                <div class="author-name">
                                    <div class="author-name-prefix">${i.relation_user.role}</div>
                                        ${i.relation_user.uDigitalName}
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${i.relation_user.uRole eq 3}">
                            <div class="card1-author">
                                <a class="author-avatar" href="#">
                                    <img src="${i.image}" alt="none"/>
                                </a>
                                <svg class="half-circle" viewBox="0 0 106 57" style="stroke: darkcyan">
                                    <path d="M102 4c0 27.1-21.9 49-49 49S4 31.1 4 4"></path>
                                </svg>
                                <div class="author-name">
                                    <div class="author-name-prefix">ANONYMOUS</div>
                                    Người dùng ẩn danh
                                </div>
                            </div>
                        </c:if>

                        <div class="tags">
                            <a onclick="showQADetailBox(${i.id},'${i.title}','${i.image}','${i.content}',${i.answered})">POP UP</a>
                            <a href="#">${i.answered}&nbsp;Answer(s)</a>
                        </div>

                        <!--Index for search-->
                        <script>
                            var s1 = '${i.title}';
                            s1 = s1.toLowerCase();
                            var obj = {
                                index: ${i.id},
                                content: s1
                            };
                            items.push(obj);
                        </script>
                    </article>
                </c:forEach>

            </section>
        </div>
    </div>
</div>

<jsp:include page="../../Common/_js.jsp"/>
<jsp:include page="../../Common/footer.jsp"/>

<!--Function-->
<script>
    function showQADetailBox(id, title, image, content, answered){
    }

    function previewFile() {
        const preview = document.getElementById("preview-avatar");
        const file = document.getElementById("imgFile").files[0];
        const reader1 = new FileReader();
        reader1.addEventListener("load", function () {
            var b64 = reader1.result;
            document.getElementById("imgBase64").value = b64;
            preview.src = reader1.result;
        }, false);

        if (file) {
            reader1.readAsDataURL(file);
        }
    }
</script>

<!--AddQA-->
<script>
    function addQAGuest() {
        user_id=4;
        Swal.fire({
            width: 1100,
            title: '<span style="color:orangered;"><strong>Gửi câu hỏi với tên </strong>Anonymous</span>',
            icon: 'info',
            html:
                '<div class="container"><div class="row">' +
                '<div class="col-8">'+
                'Tiêu đề câu hỏi (ngắn gọn, thu hút)<br><input id="qa_upload_title" type="text"><br><hr>' +
                'Chi tiết câu hỏi<br><textarea id="qa_upload_des" type="text"></textarea><br><hr>' +
                '</div>' +

                '<div class="col-4">'+
                '<img id="preview-avatar" class="header-image" src="https://cdn.iconscout.com/icon/free/png-256/gallery-image-picture-landscape-potrait-album-wallpaper-4-2914.png" style="max-width: 200px;max-height: 200px">'+
                '<input onchange="previewFile()" id="imgFile" type="file" style="background-color:#007bff;display: inline-block;max-width: 200px;padding: 5px 9px 5px 9px;border-radius:8px;font-size: 20px;margin:20px;color:white">'+
                '<input id="imgBase64" type="hidden" name="imgBase64">'+
                '</div>' +

                '</div></div>'+
                '<button onclick="addqaAPI('+user_id+')" style="padding:0px 30px 0px 30px;font-size:30px;border-radius:5px;background-color:orangered;color:white;">CONFIRM and POST</button>',
            showCloseButton: true,
            showCancelButton: true,
            showConfirmButton: false,
            focusConfirm: false,
            cancelButtonText:
                'Hủy bỏ',
            cancelButtonAriaLabel: 'Thumbs down'
        });
    }
</script>
<script>
    function addQA() {
        user_id=${sessionScope.user.id};
        Swal.fire({
            width: 1100,
            title: '<span style="color:orangered;"><strong>Gửi câu hỏi với tên </strong>${sessionScope.user.uDigitalName}</span>',
            icon: 'info',
            html:
                '<div class="container"><div class="row">' +
                '<div class="col-8">'+
                'Tiêu đề câu hỏi (ngắn gọn, thu hút)<br><input id="qa_upload_title" type="text"><br><hr>' +
                'Chi tiết câu hỏi<br><textarea id="qa_upload_des" type="text"></textarea><br><hr>' +
                '</div>' +

                '<div class="col-4">'+
                '<img id="preview-avatar" class="header-image" src="https://cdn.iconscout.com/icon/free/png-256/gallery-image-picture-landscape-potrait-album-wallpaper-4-2914.png" style="max-width: 200px;max-height: 200px">'+
                '<input onchange="previewFile()" id="imgFile" type="file" style="background-color:#007bff;display: inline-block;max-width: 200px;padding: 5px 9px 5px 9px;border-radius:8px;font-size: 20px;margin:20px;color:white">'+
                '<input id="imgBase64" type="hidden" name="imgBase64">'+
                '</div>' +

                '</div></div>'+
                '<button onclick="addqaAPI(user_id)" style="padding:0px 30px 0px 30px;font-size:30px;border-radius:5px;background-color:orangered;color:white;">CONFIRM and POST</button>',
            showCloseButton: true,
            showCancelButton: true,
            showConfirmButton: false,
            focusConfirm: false,
            cancelButtonText:
                'Hủy bỏ',
            cancelButtonAriaLabel: 'Thumbs down'
        });
    }
</script>

<!--AJAX-->
<script>
    function addqaAPI(user) {
        title=document.getElementById("qa_upload_title").value;
        des=document.getElementById("qa_upload_des").value;
        image="https://cdn.shopify.com/s/files/1/0066/0842/0979/articles/how-to-make-any-question-essential-with-three-easy-steps-735700_grande.jpg?v=1581637313";
        //image=document.getElementById("imgBase64").value;
        data = title+"bug->bug" +des + "bug->bug" + image + "bug->bug" + user;
        $.ajax({
            type: 'POST',
            url: '/addQaFPT',
            //contentType: 'application/json',
            data: {data},
        }).done(function(result) {
            if(result.toString().substring(0,7)==="//ERROR"){
                Swal.fire({
                    position: 'top-end',
                    icon: 'error',
                    title: result.toString().substring(7),
                    showConfirmButton: false,
                    timer: 2000
                })
            }else {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: "Thành công, câu hỏi của bạn sẽ hiện lên trang chủ sau khi được duyệt",
                    showConfirmButton: false,
                    timer: 2000
                })
            }
        });
    }
</script>

<!--Datatable-->
<script>
    $(document).ready(function () {
        $('#qaTable').DataTable();
    });
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
