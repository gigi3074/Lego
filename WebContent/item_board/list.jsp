
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.*" %>
<!DOCTYPE html>
<jsp:useBean id="bMgr" class="board.BoardMgr"/>
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
	int totalRecord = 0;	// 전체레코드(=행) 수
	int numPerPage = 10;	// 1페이지당 레코드 수
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
	
	String keyField = "";
	String keyWord = "";
	ArrayList<BoardBean> alist = null;
	if(request.getParameter("keyWord") != null){
	   keyWord = request.getParameter("keyWord");
	   keyField = request.getParameter("keyField");
	}
	
	start = (nowPage * numPerPage)-numPerPage + 1;	// 각 페이지당 시작번호
	end = nowPage*numPerPage;						// 10 - db에서 가져올 해당 페이지 마지막 번호
	totalRecord = bMgr.getTotalCount(keyField, keyWord);	// 전체 레코드
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage); // 게시글이 54개일 때 페이지 수는 총 6개가 나와야 됨. 그렇기에 더블로해서 소수점 나오게 하고 올림처리함
	nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock);
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
%>
<script>
	function read(num){
      readFrm.num.value = num;
      readFrm.action = "read.jsp";
      readFrm.submit();
	}
	function pageing(page){
	      readFrm.nowPage.value = page;
	      readFrm.submit();
	}
	function block(value){
	      readFrm.nowPage.value = <%=pagePerBlock %>*(value-1)+1;
	      readFrm.submit();
	}
	function list(){
	      listFrm.action = "list.jsp";
	      listFrm.submit();
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	main{width: 800px; margin: 0 auto;}
	body{background-color: #F5D57C;}
	h1{text-align: center;}
	a{text-decoration: none; color: #000;}
	hr{margin: 20px auto;}
	.number {display: inline-block; width: 700px; height:20px; margin: 10px 25%;}
	.number a{margin-left: 15px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
	.number input{float: right; margin-right: 50px}
</style>
</head>
<body>
	<div id="main">
		<h1>JSPBoard</h1>
		<table align="center" width="700px">
			<tr>
				<td colspan="5">Total : <%=totalRecord %>Articles(<font color="red">/<%=totalPage %>page</font>)</td>
			</tr>
			<tr>
				<th width="10%" bgcolor="#D44644">번 호</th>
				<th width="45%" bgcolor="#D44644">제 목</th>
				<th width="10%" bgcolor="#D44644">이 름</th>
				<th width="15%" bgcolor="#D44644">날 짜</th>
				<th width="10%" bgcolor="#D44644">조회수</th>
			</tr>
			<%
				alist = bMgr.getBoardList(keyField, keyWord, start, end);
				listSize = alist.size();
				if(alist.isEmpty()){
					out.print("<tr><td colspan='5'> 등록된 게시물이 없습니다.</td></tr>");
				}else{
					for(int i = 0; i < end;i++){
						if(i == listSize)
							break;
						
						BoardBean bean = alist.get(i);
						int num = bean.getBoard_no();
						String subject = bean.getBoard_sub();
						String id = bean.getUser_id();
						String board_date = bean.getBoard_date().substring(0,11);

						int pos = bean.getPos();
			%>
			<tr>
				<td align="center"><%=totalRecord-(nowPage-1)*numPerPage-i %></td>
				<td>
					<%
						if(pos > 0) {
							for(int j = 0; j <pos; j++){
								out.print("&emsp;⤷");
							}//for
						}//if
					%>
					<a href="javascript:read('<%=num%>')"><%=subject %></a> <!-- 제목 -->
				</td>
				<td align="center"><%=id %></td>
				<td align="center"><%=board_date %></td>
				<td align="center"></td>
			</tr>
			<%
				}
			}
			%>
			<tr><td colspan="5"><br/></td></tr>
			<tr>
				<!-- 페이지 처리 시작 -->
				<td colspan="2" align="center">
				<%
					// 1블록 pageStart : 1 2블록 pageStart:6
					int pageStart = (nowBlock-1)*pagePerBlock+1;
					int pageEnd = (pageStart + pagePerBlock <= totalPage) ? (pageStart + pagePerBlock) : totalPage+1 ;
					
					if(totalPage != 0){
						if(nowBlock > 1){
				%>
						<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
				<%
						}
						out.print("&nbsp;");
						for(;pageStart < pageEnd; pageStart++){
				%>
						<a href="javascript:pageing('<%=pageStart%>')">
						<%if(pageStart == nowPage){ %>
							<font color="blue">
							<%} %>
							[<%=pageStart %>]
						<%if(pageStart == nowPage){ %>
							</font>
						<%} %>
						</a>
				<%
						}// for문 닫기
						out.print("&nbsp;");
						if(totalBlock > nowBlock){%>
							<a href = "javascript:block('<%=nowBlock+1%>')">...next</a>
				<%		}
					}//if닫기
				%>
				</td>
				<!-- 페이징 처리 끝 -->
				<td colspan="3" align="right">
					<a href="newboard.jsp">[글쓰기]</a>&nbsp;
					<a href="menu_01_01.jsp">[처음으로]</a>&nbsp;
					<a href="../index.jsp">[HOME]</a>
				</td>
			</tr>
		</table>

		<hr width="700px"/>
		<form name="searchFrm" method="get" action="list.jsp">
			<table align="center" width="700px">
				<tr>
					<td align="center">
						<select name="keyField">
							<option value="name"> 이름
							<option value="subject"> 제목
							<option value="content"> 내용
						</select>
						<input name="keyWord" required>
						<input type="submit" value="찾기">
						<input type="hidden" name="nowPage" value="1">
					</td>
				</tr>
			</table>
		</form>
		<!-- 처음으로 누르면 화면을 reload하기 -->
		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true">
			<input type="hidden" name="nowPage" value="1">
		</form>
		
		<!-- 제목을 누르면 상세보기 페이지 보기 -->
		<form name="readFrm" method="get">
			<input type="hidden" name="num">
			<input type="hidden" name="nowPage" value="<%=nowPage %>">
			<input type="hidden" name="keyField" value="<%=keyField %>">
			<input type="hidden" name="keyWord" value="<%=keyWord %>">
		</form>
		</div>
</body>
</html>