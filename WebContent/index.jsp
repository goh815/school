<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<title>인덱스화면</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
</head>
<body>
 <img src="${context}/resources/img/main/waiting.gif" id = "image" alt="" style="margin: 30%" />
</body>
<script type="text/javascript">
	$(document).ready(function(){
		
			location.href = '${context}/global/main.do';

	});
</script>
</html>  