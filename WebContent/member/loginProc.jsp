<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String msg = "로그인에 실패 하였습니다";
	String url = "login.jsp";
	
	boolean result = mMgr.loginMember(id, pw);
	if(result){
		session.setAttribute("idkey", id);
		msg = "로그인 하였습니다.";
		url = "../index.jsp";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("<%=msg %>");
	location.href="<%=url%>";
</script>
</head>
<body>

</body>
</html>