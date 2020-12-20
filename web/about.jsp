<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Satellite | About</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Trang thông tin tác giả">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta name="author" content=Đoàn Đức Tín>
    <jsp:include page="Common/_css.jsp"/>
</head>
<body>

<!--Facebook-->
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0" nonce="4TU3IejE"></script>
<div style="z-index: 999; position: fixed;bottom: 20px;left: 28px" class="fb-share-button" data-href="http://satellite-fpt.azurewebsites.net/about.action" data-layout="button" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fsatellite-fpt.azurewebsites.net%2Fabout.action&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a></div>

<jsp:include page="Common/header.jsp"/>

<div class="container-fluid">
    <video class="col-12" style="position: fixed;padding:0;" src="Resource/img/About/video.mp4" autoplay controls
           loop></video>
</div>
<div class="block-31" style="position: relative;">
    <div class="owl-carousel loop-block-31 ">
        <div class="block-30 block-30-sm item" style="background-image: url('Resource/img/background1.jpg');"
             data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row align-items-center justify-content-center text-center">
                    <div class="col-md-8">
                        <br><br><br><br><br><br><br>
                        <h2 class="heading mb-5">Website Credits</h2>
                        <h6 style="color:white;font-size:18px;">Maybe you don't know, i made this web by myself 1000%</h6>
                        <br><br><br><br><br><br>
                        <p style="font-family: arial,serif;color:white;font-size:20px;margin:0;">Bắt đầu</p>
                        <a href="#about-section">
                            <span class=" icon-keyboard_arrow_down" style="size: 88px;font-size:88px;"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<section id="about-section">
    <div class="site-section border-top" style="font-family: arial,serif;">
        <div class="container">
            <div class="col-md-12 text-center" style="border-radius:5px;background-color: rgba(0, 0, 0, 0.78);padding-top: 20px;">
                <h2 style="font-size: 80px;color:orange;">Chức năng chính</h2>
                <br>
                <p class="lead" style="color:white;">Hướng dẫn cách sử dụng cổng thông tin lập trình</p>
                <br>
                <br>
            </div>
            <br>
            <br>
            <div class="row" style="border-radius: 5px">
                <div class="col-md-4" style="background-color: rgba(0, 0, 0, 0.55);border-left:20px;">
                    <div class="media block-6" style="padding: 25px 10px 25px 12px">
                        <div class="icon" style="font-size: 39px">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-file-zip-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M4 0h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2zm2.5 8.5a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v.938l.4 1.599a1 1 0 0 1-.416 1.074l-.93.62a1 1 0 0 1-1.109 0l-.93-.62a1 1 0 0 1-.415-1.074l.4-1.599V8.5zm2 .938V8.5h-1v.938a1 1 0 0 1-.03.243l-.4 1.598.93.62.93-.62-.4-1.598a1 1 0 0 1-.03-.243zM7.5 3V2h-1V1H8v1h1v1H8v1h1v1H8v1h1v1H7.5V6h-1V5h1V4h-1V3h1z"/>
                            </svg>
                        </div>
                        <div class="media-body">
                            <h3 class="heading" style="color:white;">Document | Tài Liệu</h3>
                            <p>Truy cập vào các tài liệu học tập, các đề thi cũng như xem một số bài tập mẫu sưu tầm từ nhiều nguồn khác nhau và có đáp án.
                                Lưu ý, vì đáp án do nhóm mình cung cấp, nên không chắc là hoàn toàn đúng, nhưng tỉ lệ
                                cao sẽ đúng :)))</p>
                            <p><a href="document" class="link-underline" style="color:orange;">Truy cập ngay</a></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4" style="background-color: rgba(0, 0, 0, 0.55);">
                    <div class="media block-6" style="padding: 25px 10px 25px 12px">
                        <div class="icon" style="font-size: 39px">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-terminal-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M0 3a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3zm9.5 5.5h-3a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1zm-6.354-.354L4.793 6.5 3.146 4.854a.5.5 0 1 1 .708-.708l2 2a.5.5 0 0 1 0 .708l-2 2a.5.5 0 0 1-.708-.708z"/>
                            </svg>
                        </div>
                        <div class="media-body">
                            <h3 class="heading" style="color:white;">Project | Sản Phẩm Và Dự Án</h3>
                            <p>Bao gồm các game, phần mềm như, tool hack, tool auto,... Do mình tự làm và một số do team làm hoặc một số phần mềm hay được lấy trên mạng. Được chia làm 2 loại tính phí và trả phí
                                , thường là miễn phí, tùy mục đích các bạn có thể tải về để sử dụng. Một số dự án sẽ cho mua source code cho các
                                bạn tham khảo.</p>
                            <p><a href="projects" class="link-underline" style="color:orange;">Truy cập ngay</a></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4" style="background-color: rgba(0, 0, 0, 0.55);">
                    <div class="media block-6" style="padding: 25px 10px 25px 12px">
                        <div class="icon" style="font-size: 39px"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cup-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M1 2a1 1 0 0 1 1-1h11a1 1 0 0 1 1 1v1h.5A1.5 1.5 0 0 1 16 4.5v7a1.5 1.5 0 0 1-1.5 1.5h-.55a2.5 2.5 0 0 1-2.45 2h-8A2.5 2.5 0 0 1 1 12.5V2zm13 10h.5a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.5-.5H14v8z"/>
                        </svg>
                        </div>
                        <div class="media-body">
                            <h3 class="heading" style="color:white;">Blog | Về Lập Trình & Đời Sống</h3>
                            <p>Những bài viết về đời sống, giải thuật, về lập trình, về cài đặt phần mềm hoặc hướng dẫn mọi thứ
                                liên quan đến lĩnh vực IT bằng Tiếng Việt nên sẽ dễ hiểu hơn nhiều tài liệu trên mạng
                                hiện nay.</p>
                            <p><a href="blog" class="link-underline" style="color:orange;">Truy cập ngay</a></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4" style="background-color: rgba(0, 0, 0, 0.55);">
                    <div class="media block-6" style="padding: 25px 10px 25px 12px">
                        <div class="icon" style="font-size: 39px"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-code-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                            <path fill-rule="evenodd" d="M6.854 4.646a.5.5 0 0 1 0 .708L4.207 8l2.647 2.646a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 0 1 .708 0zm2.292 0a.5.5 0 0 0 0 .708L11.793 8l-2.647 2.646a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708 0z"/>
                        </svg></div>
                        <div class="media-body">
                            <h3 class="heading" style="color:white;">Forum | Thảo Luận</h3>
                            <p>Diễn đàn cho các bạn đặt câu hỏi về lập trình, các thắc mắc cũng như vấn đề bạn gặp phải trong lập trình và chúng tôi (hoặc người khác) sẽ tham gia thảo luận và trả lời cho bạn</p>
                            <p><a href="#" class="link-underline" style="color:darkgrey;">Đang chờ ra mắt</a></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4" style="background-color: rgba(0, 0, 0, 0.55);">
                    <div class="media block-6" style="padding: 25px 10px 25px 12px">
                        <div class="icon" style="font-size: 39px"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat-left-dots-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H4.414a1 1 0 0 0-.707.293L.854 15.146A.5.5 0 0 1 0 14.793V2zm5 4a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                        </svg></div>
                        <div class="media-body">
                            <h3 class="heading" style="color:white;">Q&A | Diễn Đàn Hỏi Đáp</h3>
                            <p>Diễn đàn hỏi đáp dành riêng cho sinh viên FPT về các vấn đề thực tiễn hiện nay trong môi trường sinh viên, một số câu hỏi lấy từ CFS, hoặc Gmail, các bạn cũng có thể tham gia tranh luận và đặt câu hỏi</p>
                            <p><a href="qaFPT" class="link-underline" style="color:orange;">Truy cập ngay</a></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4" style="background-color: rgba(0, 0, 0, 0.55);">
                    <div class="media block-6" style="padding: 25px 10px 25px 12px">
                        <div class="icon" style="font-size: 39px"><span class="ion-ios-contacts"></span></div>
                        <div class="media-body">
                            <h3 class="heading" style="color:white;">Social | Mạng Xã Hội</h3>
                            <p>Những bài viết về giải thuật, về lập trình, về cài đặt phần mềm hoặc hướng dẫn mọi thứ
                                liên quan đến lĩnh vực IT bằng Tiếng Việt, cam đoan dễ hiểu hơn nhiều tài liệu trên mạng
                                hiện nay.</p>
                            <p><a href="#" class="link-underline" style="color:darkgrey;">Đang phát triển</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="featured-section overlay-color-2" style="background-image: url('${pageContext.request.contextPath}/images/bg_3.jpg');">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <img src="Resource/img/About/ava1.jpg" alt="Avatar" class="img-fluid">
            </div>
            <div class="col-md-8 pl-md-5" style="font-family: arial,serif;">
                <span class="featured-text d-block mb-3" style="font-size:20px;">Người sáng lập</span>
                <h2>Đoàn Đức Tín - đang là sinh viên</h2>
                <p class="mb-3">_ Đừng làm sập web nhé, làm cho vui với để luyện công là chính :)))</p>
                <br><br><br>
                <span class="fund-raised d-block mb-1">Thanks for visited this website</span>
                <p style="font-size: 10px">
                    <a href="view_cv_satellite1012.action" class="btn btn-success btn-hover-white py-3 px-5" target="_blank">Read full CV</a>
                    <a style="float:right" href="https://www.facebook.com/satfomacej/" class="fa fa-facebook" target="_blank"></a>
                    <a href="https://www.youtube.com/channel/UC5GhMOrdYiRoSQqikipk26Q?view_as=subscriber" target="_blank"
                       class="fa fa-youtube" style="float:right;"></a>
                    <a class="fa fa-google" style="float:right;" onclick="viewSatelliteEmail()" target="_blank"></a>
                    <a href="https://www.instagram.com/ductinitlk/?hl=vi" class="fa fa-instagram" style="float:right;" target="_blank"></a>
                    <a href="https://twitter.com/oncTn3" class="fa fa-twitter" style="float:right;" target="_blank"></a>
                    <a href="#" class="fa fa-linkedin" style="float:right;background-color: grey;"></a>
                    <a href="https://github.com/satellite1012" class="fa fa-reddit" style="float:right;" target="_blank"></a>
                </p>
            </div>

            <div class="site-section fund-raisers">
                <div class="container">
                    <div class="row mb-3 justify-content-center">
                        <div class="col-md-8 text-center">
                            <span class="featured-text d-block mb-3" style="font-size:20px;font-family: arial,serif;">SPECIAL THANKS TO</span>
                            <p class="lead" style="font-style: italic;font-family: arial,serif;font-size:12px;">People who
                                supported in the process of creating this project</p>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-md-6 col-lg-4 mb-5">
                            <div class="person-donate text-center">
                                <img src="Resource/img/About/ava2.jpg" alt="Image placeholder" class="img-fluid">
                                <div class="donate-info">
                                    <h2 style="font-family: Arial, Baskerville, monospace;font-weight: 700">PHẠM DUY ĐẠT</h2>
                                    <span class="time d-block mb-3" style="color:green;">SE1401-K14-FUDN</span>
                                    <span class="d-block mb-3"
                                          style="border-radius:5px;height: 150px;font-size:15px;background-color: rgba(0,0,0,0.5);color:white;font-family: arial,serif;"><span
                                            style="color:orange;">[@${requestScope.Contributor1.uName} ${requestScope.Contributor1.uDatecreated}]</span>&nbsp;${requestScope.Contributor1.uCmt_descrip}</span>
                                    <a href="view_user?userId_view=${requestScope.Contributor1.id}" class="btn btn-success btn-hover-white py-3 px-5"
                                       style="border:2px solid white;background-color: orange;">View Profile</a><br><br>
                                    <a href="#" class="btn btn-success btn-hover-white py-3 px-5"
                                       style="border:2px solid white;background-color: gray;">Read full CV</a>
                                    <br><br>
                                    <div style="font-size: 10px">
                                    <a href="https://www.facebook.com/SeiSilver" class="fa fa-facebook" target="_blank"></a>
                                    <a href="#" class="fa fa-twitter" style="background-color: grey;"></a>
                                    <a href="#" class="fa fa-reddit" style="background-color: grey;"></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-4 mb-5">
                            <div class="person-donate text-center">
                                <img src="Resource/img/About/ava3.png" alt="Image placeholder" class="img-fluid">
                                <div class="donate-info">
                                    <h2 style="font-family: Arial, Baskerville, monospace;font-weight: 700">TRẦN PHI ANH</h2>
                                    <span class="time d-block mb-3" style="color:green;">SE1415-K14-FUDN</span>
                                    <span class="d-block mb-3"
                                          style="border-radius:5px;font-size:15px;background-color: rgba(0,0,0,0.5);color:white;font-family: arial,serif;height: 150px;"><span
                                            style="color:orange;">[@${requestScope.Contributor2.uName} ${requestScope.Contributor2.uDatecreated}]</span>&nbsp;${requestScope.Contributor2.uCmt_descrip}</span>
                                    <a href="view_user?userId_view=${requestScope.Contributor2.id}" class="btn btn-success btn-hover-white py-3 px-5"
                                       style="border:2px solid white;background-color: orange;">View Profile</a><br><br>
                                    <a href="#" class="btn btn-success btn-hover-white py-3 px-5"
                                       style="border:2px solid white;background-color: gray;">Read full CV</a>
                                    <br><br>
                                    <div style="font-size: 10px">
                                    <a href="https://www.facebook.com/Anhtpde140084" class="fa fa-facebook" target="_blank"></a>
                                    <a href="#" class="fa fa-twitter" style="background-color: grey;"></a>
                                    <a href="#" class="fa fa-reddit" style="background-color: grey;"></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-4 mb-5">
                            <div class="person-donate text-center">
                                <img src="Resource/img/About/ava4.jpg" alt="Image placeholder" class="img-fluid">
                                <div class="donate-info">
                                    <h2 style="font-family: Arial, Baskerville, monospace;font-weight: 700">NGUYỄN ĐỨC CÔNG</h2>
                                    <span class="time d-block mb-3" style="color:green;">SE1415-K14-FUDN</span>
                                    <span class="d-block mb-3"
                                          style="border-radius:5px;font-size:15px;background-color: rgba(0,0,0,0.5);height: 150px;color:white;font-family: arial,serif;"><span
                                            style="color:orange;">[@${requestScope.Contributor3.uName} ${requestScope.Contributor3.uDatecreated}]</span>&nbsp;${requestScope.Contributor3.uCmt_descrip}</span>
                                    <a href="view_user?userId_view=${requestScope.Contributor3.id}" class="btn btn-success btn-hover-white py-3 px-5"
                                       style="border:2px solid white;background-color: orange;">View Profile</a><br><br>
                                    <a href="#" class="btn btn-success btn-hover-white py-3 px-5"
                                       style="border:2px solid white;background-color: gray;">Read full CV</a>
                                    <br><br>
                                    <div style="font-size: 10px">
                                    <a href="https://www.facebook.com/profile.php?id=100007058220882"
                                       class="fa fa-facebook" target="_blank"></a>
                                    <a href="https://www.youtube.com/channel/UCl28LlV7YvIvaQzVhhVbteQ?view_as=subscriber&fbclid=IwAR3aV9tXTDbuRnRJSh129DV2vy5jMt8s4MK0hrNfvDflGynSxVzCYk2VSUQ"
                                       class="fa fa-youtube" target="_blank"></a>
                                    <a href="#" class="fa fa-reddit" style="background-color: grey;"></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div> <!-- .section -->
        </div>
    </div>
</div>
<script>
    function viewSatelliteEmail() {
        swal("Email: doanductin7122000@gmail.com | tinddde140094@fpt.edu.vn");
    }
</script>
<jsp:include page="Common/_js.jsp"/>
<jsp:include page="Common/footer.jsp"/>

</body>
</html>
