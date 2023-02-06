<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
	<form method="post" name="postFrm" action="boardPost" enctype="multipart/form-data">
		<table align="center" width="700px">
			<tr><td colspan="2" align="center" bgcolor="#F76A59"s>글쓰기</td></tr>
			<tr>
				<td>성명</td>
				<td><input name="neme" size="30"></td>			
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="subject" size="30"></td>
			</tr>	
			<tr rowspan="10">
				<td>내용</td>
				<td><textarea name="content" rows="10" cols="65"></textarea></td>
			</tr>	
			<tr>
				<td>비밀 번호</td>
				<td><input type="password" name="pass"></td>
			</tr>	
			<tr>
				<td>파일찾기</td>
				<td><input type="file" name="filename" value="파일 선택"></td>
			</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">
					<input type="reset" value="다시쓰기">
					<input type="button" value="리스트" onClick="location.href='list.jsp'">
				</td>
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
	</form>
</body>
</html>