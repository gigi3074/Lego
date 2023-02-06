<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idkey");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- 외부 스크립트 코드-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/946fabfe17.js" crossorigin="anonymous"></script>
    <!-- 슬릭 -->
    <link rel="stylesheet" href="/lego/resource/css/slick.css"> 
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!-- 기본 css,js -->
    <link href="resource/css/common.css" rel="stylesheet"/>
    <script src="resource/js/common.js"></script>
</head>
<body>
	 <!-- 해더 -->
    <header>
        <div class="innercon">
            <div class="row">
                <!-- 로고 -->
                <div class="header_area clear">
                    <div class="header_cont">
                        <div class="logo clear">
                            <a href="/lego/index.jsp">
                                
                            </a>
                        </div>
                    <!-- 로그인 -->
                        <div class="login_box">
                            <ul class="login_ul clear">
	                            <% 	
	                            	if(session.getAttribute("idkey")!=null){
	                            %>
	                            <li><a href=""><p class="login">얼굴</p><%=id %>님</a></li>
	                            <li><a href="/lego/member/logout.jsp"><p class="join">가입</p>로그아웃</a></li>
	                            <%
	                            	}else{
	                            	
	                        	 %>
                                <li><a href="/lego/member/login.jsp"><p class="login">얼굴</p> 로그인 </a></li>
                                <li><a href="/lego/member/member.jsp"><p class="join">가입</p> 회원가입 </a></li>
                                <%
                                 } 
                                 %>
                                <li class="btn"><a href="#"><i class="fa-solid fa-bars"></i></a>
                                    <ul class="menuitemsr">
                                        <li class="menuitemsr01 gnb_menu"><a href="https://www.lego.com/ko-kr/aboutus">레고나라 소개</a></li>
                                        <li class="menuitemsr02 gnb_menu"><a href="#">시대/시즌 시리즈</a>
                                            <ul class="menu_submenu2_1 mini_submenu">
                                                <li><a href="/lego/item/menu_01.jsp">크리스마스</a></li>
                                                <li><a href="">스타워즈</a></li>
                                                <li><a href="">해리포터</a></li>
                                                <li><a href="">중세</a></li>
                                                <li><a href="">현대</a></li>
                                            </ul></li>
                                        <li class="menuitemsr03 gnb_menu"><a href="#">건축/기타 시리즈</a>
                                            <ul class="menu_submenu3_1 mini_submenu">
                                                <li><a href="">랜드마크</a></li>
                                                <li><a href="">자동차</a></li>
                                                <li><a href="">피규어</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                <!-- 네비 -->
                    <nav>
                        <ul class="gnb clear">
                            <li><a href="https://www.lego.com/ko-kr/aboutus">레고나라 소개</a></li>
                            <li><a href="#">시대/시즌 시리즈</a>
                                <ul class="submenu">
                                    <li><a href="/lego/item/menu_01.jsp">크리스마스</a></li>
                                    <li><a href="">스타워즈</a></li>
                                    <li><a href="">해리포터</a></li>
                                    <li><a href="">중세</a></li>
                                    <li><a href="">현대</a></li>
                                </ul></li>
                            <li><a href="#">건축/기타 시리즈</a>
                                <ul class="submenu">
                                    <li><a href="">랜드마크</a></li>
                                    <li><a href="">자동차</a></li>
                                    <li><a href="">피규어</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
</body>
</html>