<%@ page import="java.time.LocalDateTime" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

<!--DISABLE KEY
<script>
document.onkeydown = function(e) {
if(event.keyCode === 123) {
return false;
}
if(e.ctrlKey && e.keyCode === 'E'.charCodeAt(0)){
return false;
}
if(e.ctrlKey && e.shiftKey && e.keyCode === 'I'.charCodeAt(0)){
return false;
}
if(e.ctrlKey && e.shiftKey && e.keyCode === 'J'.charCodeAt(0)){
return false;
}
if(e.ctrlKey && e.keyCode === 'U'.charCodeAt(0)){
return false;
}
if(e.ctrlKey && e.keyCode === 'S'.charCodeAt(0)){
return false;
}
if(e.ctrlKey && e.keyCode === 'H'.charCodeAt(0)){
return false;
}
if(e.ctrlKey && e.keyCode === 'A'.charCodeAt(0)){
return false;
}
if(e.ctrlKey && e.keyCode === 'F'.charCodeAt(0)){
return false;
}
if(e.ctrlKey && e.keyCode === 'E'.charCodeAt(0)){
return false;
}
};
document.addEventListener('contextmenu', event => event.preventDefault());
</script>
-->

<!--ALERT-->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<!--ICON-->
<script src="https://kit.fontawesome.com/5f7869f3ba.js" crossorigin="anonymous"></script>

<!--Start of Tawk.to Script-->
<script type="text/javascript">
    var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
    (function(){
        var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
        s1.async=true;
        s1.src='https://embed.tawk.to/5f3e740ccc6a6a5947ad6066/default';
        s1.charset='UTF-8';
        s1.setAttribute('crossorigin','*');
        s0.parentNode.insertBefore(s1,s0);
    })();
</script>

<!--CHAT-->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

<!--My Function-->
<script>
    <!--Table-->
    function Atable(){
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

    }

    <!--Loader-->
    function LoadCircle(){
        document.getElementsByClassName("ftco-loader").style.display="none";
    }

    <!--Log-->
    function ShowLog_Product(){
            Swal.fire({
                width: 800,
                html: '<li type="color:orangered">Toàn bộ product trong này là do bọn mình làm 100%</li><br>' +
                    '<li type="color:orangered">Tên tác giả cho từng sản phẩm được hiển thị ở dưới cùng</li>'+
                    '<li type="color:orangered">Phần mềm là miễn phí, vì vậy các bạn không nên đổi tên tác giả trong code </li>',
                title: '<h2 type="color:orangered">Xin các bạn hãy dành thời gian đọc cái này</h2>',
                imageUrl: 'https://www.lazyengineers.com/wp-content/uploads/2016/02/free1.jpg',
                imageWidth: 600,
                imageHeight: 400,
                imageAlt: 'Custom image'
            })
    }
    function ShowIns_Link(){
        Swal.fire({
            width: 800,
            html: 'Một số tài liệu đã được chuyển thành link rút gọn nhằm thêm kinh phí quảng cáo duy trì website, đây là cách truy cập cho những bạn không biết',
            title: 'CHÚ Ý',
            imageUrl:"Resource/img/Ins/linkrutgon.gif",
            videoWidth: 1000,
            videoHeight: 1000,
        })
    }
    function ShowLog_Home(){
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
    function ShowLog_Document(){
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

<!--2D Matter-->
<script src="${pageContext.request.contextPath}/Resource/js/Matter.js" type="text/javascript"></script>