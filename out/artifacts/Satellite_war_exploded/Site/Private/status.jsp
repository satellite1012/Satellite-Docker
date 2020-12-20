<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Satellite | Status</title>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <jsp:include page="/Common/_css.jsp" />
    </head>    
    <body>
        <jsp:include page="/Common/header.jsp" />

        <div class="block-31" style="position: relative;">
        <div class="owl-carousel loop-block-31 ">
        <div class="block-30 block-30-sm item" style="background-image: url('${pageContext.request.contextPath}/Resource/img/background.jpg');" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-11">
            <%
            Object header = request.getAttribute("statusHeader");
            Object detail = request.getAttribute("statusDetail");
            Object statusColor = request.getAttribute("statusColor");
            out.println("<h2 class=\"heading mb-3\" style=\"color:"+statusColor+";\">"+header+"</h2>");  
            if (statusColor.equals("cyan")){
                out.println("<a href=\"index\"><h5 style=\"color:"+statusColor+";\">"+detail+"</h5></a>");
            }else{           
                out.println("<h5 style=\"font-size:28px;color:orange;\">"+detail+"</h5>");
            }
            %>
            </div>
          </div>
        </div>
        </div>
        </div>
        </div>
            
        <jsp:include page="/Common/_js.jsp" />
        <jsp:include page="/Common/footer.jsp" />
    </body>
</html>
