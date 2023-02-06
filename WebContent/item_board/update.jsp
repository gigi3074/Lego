<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	BoardBean bean = (BoardBean)session.getAttribute("bean");
	String subject = bean.getSubject();
	String name = bean.getName();
	String content = bean.getContent();
	
	// read.jsp에서 사용하는 것처럼 <jsp:useBean id="bMgr" class="board.BoardMgr"/> 해서 가져 올 수 있다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
	<form method="post" name="updateFrm" action="boardUpdate">
		<table align="center" width="700px">
			<tr><td colspan="2" align="center" bgcolor="#F76A59">수정하기</td></tr>
			<tr>
				<td>성명</td>
				<td><input name="name" size="30" value="<%=name%>"></td>			
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="subject" size="30" value="<%=subject%>"></td>
			</tr>	
			<tr rowspan="10">
				<td>내용</td>
				<td><textarea name="content" rows="10" cols="65"><%=content%></textarea></td>
			</tr>	
			<tr>
				<td>비밀 번호</td>
				<td><input type="password" name="pass" required> 수정시에는 비밀번호가 필요합니다</td>
			</tr>	
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정완료">
					<input type="reset" value="초기화">
					<input type="button" value="뒤로" onClick="history.back()">
				</td>
			</tr>
		</table>
		<input type="hidden" name="nowPade" value="<%=nowPage%>">
		<input type="hidden" name="num" value="<%=num%>">
	</form>
</body>
</html>