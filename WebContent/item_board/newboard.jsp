<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.*" %>
<%
	//로그인
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idkey");
	int num =  Integer.parseInt(request.getParameter("item_no"));
	
	if(request.getParameter("item_no") != null){
		   num = Integer.parseInt(request.getParameter("item_no"));
		}
%>
<!DOCTYPE html>
<jsp:useBean id="bMgr" class="board.BoardMgr"/>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <!-- 외부 스크립트 코드-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
        <script src="https://kit.fontawesome.com/946fabfe17.js" crossorigin="anonymous"></script>
        <!-- 슬릭 -->
        <link rel="stylesheet" href="css/slick.css"> 
        <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <!-- 기본 css,js -->
        <link href="/lego/resource/css/common.css" rel="stylesheet"/>
        <script src="/lego/resource/js/common.js"></script>
        <!-- 해당 페이지용 -->
        <link href="/lego/resource/css/newboard.css" rel="stylesheet"/>
        <script src="/lego/resource/js/newboard.js"></script>
    </head>
<body>
    <jsp:include page="/header.jsp"></jsp:include>
    <!-- 메인 -->
    <div class="innercon">
        <form method="post" name="postFrm" action="boardPost" enctype="multipart/form-data">
            <div class="newpost">
                <table>
                    <tr class="tab_title"><td colspan="2">Review</td></tr>
                    <tr class="star_line">
                        <td>평점</td>
                        <td>
                            <span class="star">
                                ★★★★★
                                <span>★★★★★</span>
                                <input name="item_star" type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="5">
                            </span>
                        </td>			
                    </tr>
                    <tr>
                        <td>제목</td>
                        <td><input name="board_sub" size="30"></td>
                    </tr>	
                    <tr rowspan="10">
                        <td>내용</td>
                        <td><textarea name="board_con" rows="10" cols="65"></textarea></td>
                    </tr>	
                    <tr>
                        <td>비밀 번호</td>
                        <td><input type="password" name="board_pass"></td>
                    </tr>	
                    <tr class="re_potoarea">
                        <td>리뷰 사진</td>
                        <td>
                            <label class="re_poto_btn" for="re_poto"><i class="fa-solid fa-plus"></i></label>
                            <input name="board_pic" id="re_poto" type='file' onchange="readURL(this);"/>
                            <div class="re_poto">
                                <img id="blah" src="/lego/resource/img/board/pngegg.png" alt="your image" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><hr/>
                    </tr>
                    <tr class="new_post_btn">
                        <td colspan="2">
                            <input type="submit" value="리뷰등록">
                            <input type="reset" value="다시쓰기">
                            <input type="button" value="돌아가기" onClick="location.href='Christmas.jsp?item_no=1'">
                        </td>
                    </tr>
                </table>
                <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
                <input type="hidden" name="uer_id" value="<%=id %>"/>
                <input type="hidden" name="item_no" value="<%=num %>"/>
            </div>
        </form>
    </div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>