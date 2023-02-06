
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.*" %>
<!DOCTYPE html>
<jsp:useBean id="bMgr" class="board.BoardMgr"/>
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
	//로그인
	String id = (String)session.getAttribute("idkey");
	int num =  Integer.parseInt(request.getParameter("item_no"));
	
	// 페이징처리
	int totalRecord = 0;	// 전체레코드(=행) 수
	int numPerPage = 5;	// 1페이지당 레코드 수
	int pagePerBlock = 5; 	// 블록당 페이지 수 [1][2][3][4][5]
			
	int totalPage = 0;		// 전체 페이지 수 레코드 54개 : 총 6개
	int totalBlock = 0;		// 전체 블록 수 = 2개
	
	int nowPage = 1;		// 현재 해당하는 페이지
	if(request.getParameter("nowPage")!=null){
	      nowPage = Integer.parseInt(request.getParameter("nowPage"));
	   }
	int nowBlock = 1;		// 현재 해당하는 블록
	
	int start = 0;			// 54~43[1] - db테이블의 select시작번호(페이지에 해당하는 레코드수만 가져옴?)
	int end = 0;			// 10개씩 가져오기	
	int listSize = 0;		// 현재 읽어온 게시물의 수
	
	
	ArrayList<BoardBean> alist = null;
	if(request.getParameter("item_no") != null){
		   num = Integer.parseInt(request.getParameter("item_no"));
		}
	start = (nowPage * numPerPage)-numPerPage + 1;	// 각 페이지당 시작번호
	end = nowPage*numPerPage;						// 10 - db에서 가져올 해당 페이지 마지막 번호
	totalRecord = bMgr.getTotalCount(num);	// 전체 레코드
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage); // 게시글이 54개일 때 페이지 수는 총 6개가 나와야 됨. 그렇기에 더블로해서 소수점 나오게 하고 올림처리함
	nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock);
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
	int totalAvg = bMgr.getAvg(num);
%>
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
<link href="/lego/resource/css/common.css" rel="stylesheet"/>
<script src="/lego/resource/js/common.js"></script>
<link href="/lego/resource/css/review.css" rel="stylesheet"/>
<link href="/lego/resource/css/common.css" rel="stylesheet"/>
<link href="/lego/resource/css/Christmas.css" rel="stylesheet"/>
    <script src="/lego/resource/js/review.js"></script>
<script>

	function pageing(page){
	      readFrm.nowPage.value = page;
	      readFrm.submit();
	}
	function block(value){
	      readFrm.nowPage.value = <%=pagePerBlock %>*(value-1)+1;
	      readFrm.submit();
	}

</script>
</head>
<body>
	<!-- 리뷰게시판 -->
	<div class="review_area">
	    <div class="innercon">
	        <button class="re_btn">
	            <div class="re_title">
	                <h4>상품평</h4>
	                <i class="fa-solid fa-plus"></i>
	            </div>
	        </button>
	        <div class="review">
	            <!-- 리뷰 쓰기 버튼 -->
	            <div class="new_review">
	            <%
	            	if(id != null){
	            %>
	                <button><a href="newboard.jsp?item_no=<%=num%>">새로운 상품평 올리기</a></button>
	            <%
	            	}
	            %>
	            </div>
	            <!-- 별점별 카운팅 보기 -->
	            <div class="star_count">
	                <h1>평점 
	               		<span class="star">
                        ★★★★★
                        <span style="width:<%=totalAvg*20 %>%">
                            ★★★★★
                        </span>
	                </h1>
	                <div class="star5 count_box">
	                    <p>5별</p>
	                    <%	
	                		int star = 5;
	                		int starCount = bMgr.starCount(num, star);
	                	%>
	                    <div class="color_bar" style="width:<%=starCount*20 %>%"></div>
	                    <div class="base_bar"></div>
	                    <p class="count"><%=starCount %>리뷰</p>
	                </div>
	                <div class="star4 count_box">
	               		<%	
	                		star = 4;
	                		starCount = bMgr.starCount(num, star);
	                	%>
	                    <p>4별</p>
	                    <div class="color_bar" style="width:<%=starCount*20 %>%"></div>
	                    <div class="base_bar"></div>
	                    <p class="count"><%=starCount %>리뷰</p>
	                </div>
	                <div class="star3 count_box">
	                	<%	
	                		star = 3;
	                		starCount = bMgr.starCount(num, star);
	                	%>
	                    <p>3별</p>
	                    <div class="color_bar" style="width:<%=starCount*20 %>%"></div>
	                    <div class="base_bar"></div>
	                    <p class="count"><%=starCount %>리뷰</p>
	                </div>
	                <div class="star2 count_box">
	                	<%	
	                		star = 2;
	                		starCount = bMgr.starCount(num, star);
	                	%>
	                    <p>2별</p>
	                    <div class="color_bar" style="width:<%=starCount*20 %>%"></div>
	                    <div class="base_bar"></div>
	                    <p class="count"><%=starCount %>리뷰</p>
	                </div>
	                <div class="star1 count_box">
	                    <%	
	                		star = 1;
	                		starCount = bMgr.starCount(num, star);
	                	%>
	                    <p>1별</p>
	                    <div class="color_bar" style="width:<%=starCount*20 %>%"></div>
	                    <div class="base_bar"></div>
	                    <p class="count"><%=starCount %>리뷰</p>
	                </div>
	            </div>
	            <!-- 리뷰 -->
	            <div class="re_main">
	                <div class="title">
	                    <h1>Review</h1>
	                    <select name="" id="re_ch">
	                        <option value="">인기순</option>
	                        <option value="">날짜 : 최신순</option>
	                        <option value="">날짜 : 오래된순?</option>
	                        <option value="">평점 : 높은순</option>
	                        <option value="">평점 : 낮은순</option>
	                    </select>
	                </div>
	                <div class="board">
	                    <table>
		            <%
					   	
		            alist = bMgr.getBoardlist(num, start, end);
					listSize = alist.size();
					if(alist.isEmpty()){
						out.print("<tr><td colspan='3'> 등록된 게시물이 없습니다.</td></tr>");
					}else{
						for(int i = 0; i < end;i++){
							if(i == listSize)
								break;
							
							BoardBean bean = alist.get(i);
							int board_no = bean.getBoard_no();
							String subject = bean.getBoard_sub();
							String board_date = bean.getBoard_date().substring(0,11);
							String user_id = bean.getUser_id();
							int pos = bean.getPos();
		   			%>
	                        <tr>
	                            <th>No.<%=board_no %></th>
	                            <th>
	                            	<span class="star">
	                                ★★★★★
	                                <span style="width:<%=bean.getItem_star()*20 %>%">
	                                    ★★★★★
	                                </span>
	                            </th>
	                                
	                            <th><%=bean.getUser_id() %></th>
	                        </tr>
	                        <tr>
	                            <th><%=subject %></th>
	                            <th><%=board_date %></th>
	                            <th></th>
	                        </tr>
	                        <tr class="re_img">
	                            <td colspan="3"><%=bean.getBoard_pic() %></td>
	                        </tr>
	                        <tr class="re_txt">
	                            <td colspan="3"><%=bean.getBoard_con() %></td>   
	                        </tr>                
	                        <tr class="re_five">
	                            <td>도움이 되셨나요?</td>
	                            <td>ip : <%=bean.getBoard_ip() %></td>   
	                            <td><button>신고하기 <i class="fa-solid fa-chevron-right"></i></button></td>
	                        </tr>
	                        <tr class="like_dis">
	                            <td colspan="3">
	                                <button class="like_btn"><i class="fa-regular fa-thumbs-up"></i></button>
	                                <button class="dislike_btn"><i class="fa-regular fa-thumbs-down"></i></button>
	                            </td>   
	                        </tr>
				   			
				   			
				   			<%
							}
						}
						%>
	                        <tr>
								<!-- 페이지 처리 시작 -->
								<td colspan="3" align="center" class="page">
								<%
									// 1블록 pageStart : 1 2블록 pageStart:6
									int pageStart = (nowBlock-1)*pagePerBlock+1;
									int pageEnd = (pageStart + pagePerBlock <= totalPage) ? (pageStart + pagePerBlock) : totalPage+1 ;
									
									if(totalPage != 0){
										if(nowBlock > 1){
								%>
										<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
								<%
										}//if 두번째
										out.print("&nbsp;");
										for(;pageStart < pageEnd; pageStart++){
								%>
										<a href="javascript:pageing('<%=pageStart%>')">
										<%if(pageStart == nowPage){ %>
											<font style="color:'red'">
											<%} %>
											[<%=pageStart %>]
										<%if(pageStart == nowPage){ %>
											</font>
										<%} %>
										</a>
								<%
										}// for문 닫기
										out.print("&nbsp;");
										if(totalBlock > nowBlock){
								%>
											<a href = "javascript:block('<%=nowBlock+1%>')">...next</a>
								<%		
										}
									}//if닫기
								%>
								</td>
							</tr>
							<!-- 페이징 처리 끝 -->            
	                    </table>
	                    <!-- 처음으로 누르면 화면을 reload하기 -->
						<form name="listFrm" method="post">
							<input type="hidden" name="reload" value="true">
							<input type="hidden" name="nowPage" value="1">
						</form>
						<!-- 제목을 누르면 상세보기 페이지 보기 -->
						<form name="readFrm" method="get">
							<input type="hidden" name="item_no" value="<%=num %>">
							<input type="hidden" name="nowPage" value="<%=nowPage %>">
						</form>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>