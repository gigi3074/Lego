<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idkey");	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 외부 스크립트 코드-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/946fabfe17.js" crossorigin="anonymous"></script>
    <!-- 기본 css,js -->
    <link href="../resource/css/common.css" rel="stylesheet"/>
    <script src="../resource/js/common.js"></script>
    <!-- 해당 페이지용 -->
    <link href="../resource/css/login.css" rel="stylesheet"/>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
    <div class="innercon">
        <div class="login">
            <div class="title">
                <h3>Lego Account</h3>
                <figure>
                    <img src="../resource/img/img03.png" alt="레고얼굴">
                </figure>
            </div>
            <form name="loginfrm" method="post" action="loginProc.jsp">
                <table>
                    <tr>
                        <th colspan="2">사용자 아이디</th>
                    </tr>
                    <tr>
                        <td colspan="2"><input name="id" type="text"></td>
                    </tr>
                    <tr>
                        <th colspan="2">비밀번호</th>
                    </tr>
                    <tr>
                        <td colspan="2"><input name="pw" type="password"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input class="btn_login" type="submit" value="로그인">
                        </td>
                    </tr>
                    <tr>
                        <td><a class="link" href="">사용자 아이디를 잊었나요?</a></td>
                        <td><a class="link" href="">비밀번호를 잊었나요?</a></td>
                    </tr>
                    <tr>
                        <td colspan="2">LEGO® Account가 없습니까?<br>
                            <a class="link" href="join.html">계정 만들기</a></td>
                    </tr>
                    <tr>
                        <td colspan="2"><hr> 또는 <hr></td>
                    </tr>
                    <tr>
                        <td colspan="2"><button class="social-button facebook" aria-label="계속  Facebook" data-platform="facebook">계속  Facebook</button></td>
                    </tr>
                    <tr>
                        <td colspan="2"><button class="social-button google" aria-label="계속  Google" data-platform="google">계속  Google</button></td>
                    </tr>
                    <tr>
                        <td colspan="2"><button class="social-button apple-id" aria-label="계속  Apple" data-platform="apple">계속  Apple</button></td>
                    </tr>
                </table>
               
            </form>
        </div>
    </div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>