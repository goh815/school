<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>성적관리</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<c:choose>
	<c:when test="emty sessionScope.user">
		<jsp:include page="../global/default_header.jsp"/>
	</c:when>
	<c:otherwise>
		<c:catch>
			<c:when test="${user.level eq 'admin'} }"></c:when>
		</c:catch>
	</c:otherwise>
</c:choose>
<header style="width:100%;margin: 0 auto">
	<h3 style="color: white; text-align: center;">
		<a href="${context}/global/main.do">한빛 성적 관리</a>
 	</h3>
 	<p style="float:right; margin-right:50px;"><fmt:formatDate pattern="yyyy-MM-dd" value="${now}" /></p>
  	<span style="float: right; margin: center;"></span>
		<ul class="nav nav-pills">
			<li role="presentation" class="dropdown" style="margin-left: 100px">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
				자바스크립트 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="${context}/js/hello.do">자바스크립트 소개</a></li>
						<li><a href="${context}/js/var.do">변수</a></li>
						<li><a href="${context}/js/operator.do">연산자</a></li>
						<li><a href="${context}/js/function.do">함수</a></li>
						<li><a href="${context}/js/object.do">객체</a></li>
						<li><a href="${context}/js/bom.do">BOM</a></li>
						<li><a href="${context}/js/dom.do">DOM</a></li>
						<li><a href="${context}/js/form.do">form 태그</a></li>
						<li><a href="${context}/js/closure.do">클로저</a></li>
						<li><a href="${context}/js/pattern.do">패턴</a></li>
					</ul>
				</li>
				<li role="presentation" class="dropdown" style="margin-left: 100px">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
				jQuery <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="${context}/jquery/attr.do">attr</a></li>
						<li><a href="${context}/jquery/coer.do">coer</a></li>
						<li><a href="${context}/jquery/dom.do">dom</a></li>
						<li><a href="${context}/jquery/event.do">event</a></li>
						<li><a href="${context}/jquery/selector.do">selector</a></li>
						<li><a href="${context}/jquery/traversing.do">traversing</a></li>
					</ul>
				</li>
			</ul>
</header>