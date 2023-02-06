<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bMgr" class="board.BoardMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{padding: 20px}
	input{margin-bottom:"10px"}
</style>
<%
	request.setCharacterEncoding("UTF-8");
	boolean result;
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	if(request.getParameter("pass")!=null){
		String inPass = request.getParameter("pass");
		BoardBean bean= (BoardBean)session.getAttribute("bean");
		String dbPass = bean.getPass();
		if(inPass.equals(dbPass)){
			result = bMgr.deleteBoard(num);
			if(result){
				String url = "list.jsp?nowPage="+nowPage;
				response.sendRedirect(url);
			}else{
%>
		<script>
			alert("답변이 있어서 삭제할 수 없습니다.");
			history.go(-2);
		</script>
<%
		
		}
	}else{
%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>

<%
		}
	}else{
	
%>
</head>
<body>
	<form method="post" name="delFrm" action="delete.jsp">
		<table align="center" width="700px">
			<tr><td align="center" bgcolor="#F76A59">사용자의 비밀번호를 입력해주세요</td></tr>
			<tr>
				<td align="center"><input type="password" name="pass" required></td>
			</tr>
			<tr>
				<td><hr/></td>
			</tr>	
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="삭제완료">
					<input type="reset" value="다시쓰기">
					<input type="button" value="뒤로" onClick="history.back()">
				</td>
			</tr>
		</table>
		<input type="hidden" name="nowPade" value="<%=nowPage%>">
		<input type="hidden" name="num" value="<%=num%>">
	</form>
	<%} %>
</body>
</html>