<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idkey");
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LEGO</title>
    <!-- 외부 스크립트 코드-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/946fabfe17.js" crossorigin="anonymous"></script>
    <!-- 기본 css,js -->
    <link href="resource/css/common.css" rel="stylesheet"/>
    <link href="resource/css/index.css" rel="stylesheet"/>
    <script src="resource/js/index.js"></script>
    <script src="resource/js/common.js"></script>
    <!-- 해당 페이지용 -->
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	    <!-- 메인이미지 -->
	    <div class="rwap">
	        <div class="innercon">
	            <div class="row">
	                <article class="article_img">
	                    <section id="imgslide">
	                        <img src="resource/img/img06.jpg" alt="크리스마스레고">
	                        <img src="resource/img/img05.jpg" alt="군중레고">
	                        <img src="resource/img/img07.jpg" alt="스타워즈레고">
	                    </section>
	                </article>
	            </div>
	        </div>
	    </div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>