<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="../resource/css/common.css" rel="stylesheet"/>
    <link href="../resource/css/join.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://kit.fontawesome.com/946fabfe17.js" crossorigin="anonymous"></script>
    <script src="../resource/js/common.js"></script>
    <script src="../resource/js/join.js"></script>
    <script src="../resource/js/member.js"></script>
</head>
<body>
   	<jsp:include page="../header.jsp"></jsp:include>
    <!-- 메인 -->
    <div id="container">
        <div class="innercon">
            <div class="row">
                <div class="location_area member">
                    <div class="box_inner">
                        <h2 class="tit_page">LEGO <span class="in">in the</span> World</h2>
                        <!-- 경계선 -->
                        <p class="location">MEMBER <span class="path">/</span> 회원가입</p>
                    </div>
                </div>
                <!-- 회원정보 입력 -->
                <div class="body_text_area">
                    <form name="regFrm" action="memberProc.jsp" method="post" class="appForm">
                        <fieldset>
                            <legend>회원가입 입력 양식</legend>
                            <p class="info_pilsoo pilsoo_item">필수입력</p>
                            <ul class="app_list">
                                <!-- 아이디 -->
                                <li class="clear">
                                    <label for="user_id" class="tit_lbl pilsoo_item">아이디</label>
                                    <input class="w100p" id="user_id" placeholder="아이디를 입력해주세요" type="text" name="user_id" required>
                                </li>
                                <!-- 이름 -->
                                <li class="clear">
                                    <label for="user_name" class="tit_lbl pilsoo_item">작성자명</label>
                                    <div class="app_content">
                                        <input class="w100p" id="user_name" placeholder="이름을 입력해주세요" type="text" name="user_name" required>
                                    </div>
                                </li>
                                <!-- 비밀번호 -->
                                <li class="clear">
                                    <label for="user_pass" class="tit_lbl pilsoo_item">비밀번호</label>
                                    <div class="app_content">
                                        <input class="w100p" id="user_pass" placeholder="비밀번호를 입력해주세요" type="password" name="user_pass" required>
                                    </div>
                                </li>
                                <!-- 비밀번호 확인 -->
                                <li class="clear">
                                    <label for="pwd2_lbl" class="tit_lbl pilsoo_item">비밀번호 확인</label>
                                    <div class="app_content">
                                        <input class="w100p" id="pwd2_lbl" placeholder="비밀번호를 다시 한번 입력해주세요" type="password" name="pwd2_lbl" required>
                                    </div>
                                </li>
                                <!-- 우편번호 -->
                                <li class="clear">
                                    <label for="zipcode" class="tit_lbl">우편번호</label>
                                    <div class="app_content">
                                        <input class="postcode" name="zipcode" id="postcode" readonly>
                                        <input type="button" value="우편번호찾기" name="zipcode2" onClick="findAddr();">
                                    </div>
                                </li>
                                <!-- 주소 -->
                                <li class="clear">
                                    <label for="user_address" class="tit_lbl">주소</label>
                                    <input id="addr" class="w100p" name="user_address" placeholder="주소 넣기">
                                </li>
                                <!-- 상세주소 -->
                                <li class="clear">
                                    <label for="detailaddress" class="tit_lbl">상세주소</label>
                                    <input class="w100p" name="detailaddress" placeholder="상세주소 넣기">
                                </li>
                                <!-- 핸드폰 번호 -->
                                <li class="clear">
                                    <label for="user_tel" class="tit_lbl">핸드폰 번호</label>
                                    <div class="app_content">
                                        <input class="w100p" id="phone_lbl" placeholder="&ldquo;-&rdquo; 포함하여 입력해주세요 비밀번호를 찾을 시 필수로 필요합니다." type="tel" name="user_tel">
                                    </div>
                                </li>
                                <!-- 생일 -->
                                <li class="clear">
                                    <label for="birthday" class="tit_lbl">생일</label>
                                    <div class="app_content">
                                        <input class="w100p" id="phone_lbl" placeholder="생년월일 6자리 숫자만 입력해주세요" type="text" name="birthday">
                                    </div>
                                </li>
                                <!-- 이메일 -->
                                <li>
                                    <label for="email" class="tit_lbl">이메일</label>
                                    <div class="app_content email_area">
                                        <input title="이메일 주소" id="email_lbl" class="w100p" type="text" name="email" placeholder="abc123@Lego.com 비밀번호를 찾을 시 필수로 필요합니다.">
                                    </div>
                                </li>
                                <li class="clear">
                                    <span class="tit_lbl">개인정보 활용 동의</span>
                                    <div class="app_content checkbox_area">
                                        <input class="css-checkbox" id="agree_lbl" type="checkbox" name="">
                                        <label for="agree_lbl">동의함</label>
                                    </div>
                                </li>
                            </ul>
                            <p class="btn_line">
                                <input type="submit" class="btn_baseColor" value="회원가입" onClick="return validate();">
                            </p>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>