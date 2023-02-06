<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.*" %>
<%-- <%@ page import="wish_lists.*, java.util.*" %> --%>
<jsp:useBean id="bMgr" class="board.BoardMgr"/>
<%-- <jsp:useBean id="wMgr" class="wish_lists.WishMgr"/> --%>
<%
	request.setCharacterEncoding("UTF-8");
	//로그인
	String id = (String)session.getAttribute("idkey");
	int num = Integer.parseInt(request.getParameter("item_no"));
	
	//like

	BoardBean likebean = bMgr.getBoard(num);
	int like = likebean.getLike_count();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Christmas tree</title>
    <!-- 외부 스크립트 코드-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/946fabfe17.js" crossorigin="anonymous"></script>
    <!-- 슬릭 -->
    <link rel="stylesheet" href="/lego/resource/css/slick.css"> 
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js" defer></script>
    <!-- 해당 페이지용 -->
    <link href="/lego/resource/css/Christmas.css" rel="stylesheet"/>
    <script src="/lego/resource/js/Christmas.js" defer charset="UTF-8"></script>
</head>
<body>
    <jsp:include page="/header.jsp"></jsp:include>
    <!-- 메인 -->
    <div class="innercon">
        <section>
            <div class="link_line">
                <a href="../index.jsp">Home</a>
                <a href="../item/menu_01.jsp">Christmas</a>
                <a href="Christmas.jsp?item_no=1">Christmas Tree</a>
            </div>
            <div class="img_area">
                <!-- 제품 이미지 -->
                <div class="innerBox">
                    <div class="main_img_slice">
                        <div><a href=""><img class="small" src="/lego/resource/img/item_img/main01.png" alt=""></a></div>
                        <div><a href=""><img class="small" src="/lego/resource/img/item_img/main02.png" alt=""></a></div>
                        <div><a href=""><img class="small" src="/lego/resource/img/item_img/main03.png" alt=""></a></div>
                        <div><a href=""><img class="small" src="/lego/resource/img/item_img/main04.png" alt=""></a></div>
                        <div><a href=""><img class="small" src="/lego/resource/img/item_img/main05.png" alt=""></a></div>
                        <div><a href=""><img class="small" src="/lego/resource/img/item_img/main06.png" alt=""></a></div>
                    </div>
                    <div class="main_img">
                        <img id="big_img" src="/lego/resource/img/item_img/main01.png" alt="">
                    </div>
                </div>
                <!-- 제품 가격, 평점, 주의사항, 하트&장바구니,조립설명서 -->
                <div class="item_nav">
                    <h4>크리스마스 트리</h4>
                    <h5>60,000원</h5>
                    <% if(id == null || id == ""){%>
                    <button class="btn_like" onclick="likeCheck()"><i class="fa-solid fa-heart"></i> ${vo.good}</button>
                    <%}else if(like == 1){ %>
                    <button class="done_like" style="color: #BF2604;text-shadow: 0;" onclick="cancelCheck()"><i class="fa-solid fa-heart"></i> ${vo.good}</button>
                    <%}else{ %>
                    <button class="btn_like" onclick="likeCheck()"><i class="fa-solid fa-heart"></i> ${vo.good}</button>
                    <%} %>
                    <%=like %>
                    <div class="warning">
                        <p>경고!<br>
                            질식 위험. 작은 부품 및 작은 공 포함.</p>
                        <figure>
                            <img src="../resource/img/item_img/img01.png" alt="경고">
                        </figure>
                    </div>
                    <div class="guidelines">
                        <div class="info"><i class="fa-regular fa-envelope"></i> 알림 받기<i class="fa-solid fa-chevron-right"></i></div>
                        <div class="delivery"><i class="fa-solid fa-cart-flatbed"></i> 배송 및 반품 <i class="fa-solid fa-chevron-right"></i></div>
                        <div class="assembly_manual"><i class="fa-regular fa-file-lines"></i>조립설명서 <i class="fa-solid fa-chevron-right"></i></div>
                    </div>
                </div>
                <!-- 참고사항 -->
                <div class="item_notes">
                    <div class="item_age notes">
                        <img src="../resource/img/item_img/no_age.png" alt="연령">
                        <h2>12+</h2>
                        <p>연령</p>
                    </div>
                    <div class="item_blocks notes">
                        <img src="../resource/img/item_img/no_blocks.png" alt="부품수">
                        <h2>784</h2>
                        <p>부품수</p>
                    </div>
                    <div class="item_point notes">
                        <img src="../resource/img/item_img/no_point.png" alt="포인트">
                        <h2>330</h2>
                        <p>포인트</p>
                    </div>
                    <div class="item_number notes">
                        <img src="../resource/img/item_img/no_number.png" alt="제품번호">
                        <h2>40573</h2>
                        <p>제품번호</p>
                    </div>
                </div>
            </div>
            <!-- 추천제품 -->
            <div class="recom_slice">
                <div class="recom_title"><h2>추천제품</h2></div>
                <div class="re_slider">
                    <div class="recom_box reb1">
                        <a href="">
                            <div class="re_img">
                                <img src="../resource/img/item_img/re_img01.jpeg" alt="추천1">
                            </div>
                            <div class="txt">
                                <h4>크리스마스 화환 2-in-1</h4>
                                <h5>55,000원</h5>
                            </div>
                        </a>
                        <div class="btn">
                            <button>장바구니 담기</button>
                        </div>
                    </div>
                    <div class="recom_box reb2">
                        <div class="re_img">
                            <img src="../resource/img/item_img/re_img02.png" alt="추천1">
                        </div>
                        <div class="txt">
                            <h4>크리스마스 화환 2-in-1</h4>
                            <h5>55,000원</h5>
                        </div>
                        <div class="btn">
                            <button>장바구니 담기</button>
                        </div>
                    </div>
                    <div class="recom_box reb3">
                        <div class="re_img">
                            <img src="../resource/img/item_img/re_img03.jpeg" alt="추천1">
                        </div>
                        <div class="txt">
                            <h4>크리스마스 화환 2-in-1</h4>
                            <h5>55,000원</h5>
                        </div>
                        <div class="btn">
                            <button>장바구니 담기</button>
                        </div>
                    </div>
                    <div class="recom_box reb4">
                        <div class="re_img">
                            <img src="../resource/img/item_img/re_img04.png" alt="추천1">
                        </div>
                        <div class="txt">
                            <h4>크리스마스 화환 2-in-1</h4>
                            <h5>55,000원</h5>
                        </div>
                        <div class="btn">
                            <button>장바구니 담기</button>
                        </div>
                    </div>
                    <div class="recom_box reb5">
                        <div class="re_img">
                            <img src="../resource/img/item_img/re_img05.jpeg" alt="추천1">
                        </div>
                        <div class="txt">
                            <h4>크리스마스 화환 2-in-1</h4>
                            <h5>55,000원</h5>
                        </div>
                        <div class="btn">
                            <button>장바구니 담기</button>
                        </div>
                    </div>
                    <div class="recom_box reb6">
                        <div class="re_img">
                            <img src="../resource/img/item_img/re_img06.jpeg" alt="추천1">
                        </div>
                        <div class="txt">
                            <h4>크리스마스 화환 2-in-1</h4>
                            <h5>55,000원</h5>
                        </div>
                        <div class="btn">
                            <button>장바구니 담기</button>
                        </div>
                    </div>
                    <div class="recom_box reb7">
                        <div class="re_img">
                            <img src="../resource/img/item_img/re_img07.jpeg" alt="추천1">
                        </div>
                        <div class="txt">
                            <h4>크리스마스 화환 2-in-1</h4>
                            <h5>55,000원</h5>
                        </div>
                        <div class="btn">
                            <button>장바구니 담기</button>
                        </div>
                    </div>
                    <div class="recom_box reb8">
                        <div class="re_img">
                            <img src="../resource/img/item_img/re_img08.png" alt="추천1">
                        </div>
                        <div class="txt">
                            <h4>크리스마스 화환 2-in-1</h4>
                            <h5>55,000원</h5>
                        </div>
                        <div class="btn">
                            <button>장바구니 담기</button>
                        </div>
                    </div>
                    <div class="recom_box reb9">
                        <div class="re_img">
                            <img src="../resource/img/item_img/re_img09.png" alt="추천1">
                        </div>
                        <div class="txt">
                            <h4>크리스마스 화환 2-in-1</h4>
                            <h5>55,000원</h5>
                        </div>
                        <div class="btn">
                            <button>장바구니 담기</button>
                        </div>
                    </div>
                    <div class="recom_box reb10">
                        <div class="re_img">
                            <img src="../resource/img/item_img/re_img010.png" alt="추천1">
                        </div>
                        <div class="txt">
                            <h4>크리스마스 화환 2-in-1</h4>
                            <h5>55,000원</h5>
                        </div>
                        <div class="btn">
                            <button>장바구니 담기</button>
                        </div>
                    </div>
                    <div class="recom_box reb11">
                        <div class="re_img">
                            <img src="../resource/img/item_img/re_img011.png" alt="추천1">
                        </div>
                        <div class="txt">
                            <h4>크리스마스 화환 2-in-1</h4>
                            <h5>55,000원</h5>
                        </div>
                        <div class="btn">
                            <button>장바구니 담기</button>
                        </div>
                    </div>
                    <div class="recom_box reb12">
                        <div class="re_img">
                            <img src="../resource/img/item_img/re_img012.png" alt="추천1">
                        </div>
                        <div class="txt">
                            <h4>크리스마스 화환 2-in-1</h4>
                            <h5>55,000원</h5>
                        </div>
                        <div class="btn">
                            <button>장바구니 담기</button>
                        </div>
                    </div>
                    </div>
            </div>
            <!-- 제품상세정보 -->
            <div class="item_area">
                <div class="innercon">
                    <button class="item_btn">
                        <div class="details_btn">
                            <h4>제품상세정보</h4>
                            <i class="fa-solid fa-plus"></i>
                        </div>
                    </button>
                    <div class="item_details">
                        <div class="txt">
                            <p>아름다운 레고® 크리스마스 트리(40573) 조립 키트로 눈길을 사로잡는 연말연시 테마의 전시용 작품을 만들어보아요. 장식과 양초를 이용해 색색의 트리를 만들고 장식 매트 위에 세운 후 노란색 별을 꼭대기에 붙이면 완벽한 트리가 완성됩니다. 하나의 커다란 트리 하나를 만들거나, 아니면 반으로 나눠 작은 트리 2개를 만들어보세요. 이게 바로 2-in-1 모델의 묘미 아니겠어요!</p>
                            <ul>
                                <li>뭔가 다른 크리스마스 트리 – 레고® 크리스마스 트리(40573) 조립 키트로 연말연시 테마의 중앙 장식물을 만들어보세요. 이용 가능 연령대는 12세 이상이며, 자기 자신 또는 특별한 사람을 위한 선물로 두말이 필요 없습니다</li>
                                <li>2-in-1 조립 모델 – 1개의 트리 또는 2개의 작은 트리를 골라 만들 수 있습니다. 어느 쪽을 선택하든, 가지마다 온갖 장식을 더하여 재미있게 꾸며보세요</li>
                                <li>치수 – 키큰 트리의 크기는 높이 30cm이고, 중간 크기 트리는 높이 23cm이며, 작은 트리는 16cm입니다. 1개 또는 2개의 트리를 골라 만들어보세요</li>
                            </ul>
                        </div>
                        <div class="img">
                            <figure><img src="../resource/img/item_img/main02.png" alt="상품이미지"></figure>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="review.jsp"></jsp:include>
        </section>
    </div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>