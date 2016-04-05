<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/> 
<img src="${context}/resources/img/main/0000.jpg" alt="" width="100%" height="400px"/>
	<br />
	<!-- <a href="${context}/member/login_form.do"> 로그인 화면 이동</a> -->
	<div>
		<h4><a href="${context}/member/login_form.do"> 로그인 이동</a></h4>
		<h4><a href="${context}/member/join_form.do">회원가입 이동</a></h4>
		<h4><a href="${context}/admin/login_form.do">관리자 이동</a></h4>
	</div>
<script>
$(function() {
	$('#admin_login').click(function(){
		var id = prompt('관리자 아이디'), pw = prompt('관리자 비밀번호')	
	})
})


</script>
<jsp:include page="footer.jsp"/>
