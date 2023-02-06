<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="resource/js/test.js"></script>
    <link href="resource/css/test.css" rel="stylesheet"/>
</head>
<body>
	<h3>별점 처리 테스트</h3>
	<span id="star">
        ★★★★★
        <span>★★★★★</span>
        <input type="range" oninput="drawStar(this)" id="star" value="1" step="1" min="0" max="5">
     </span>
     
     <h3>test2</h3>
     <span id="star2">
        ★★★★★
        <span>★★★★★</span>
        <input type="range" id="star2" value="3" step="1" min="0" max="5">
     </span>
            <input type="range" id="a" name="ages" value="2" min="0" max="5" step="1">
     <div id="mydiv">
     
     </div>
</body>
</html>