<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../global/header.jsp"/>
<div id="join">
		<div class="joinTop">
			<h2 class="text-center">회원가입</h2>
		</div>
		<div class="joinCenter row">
			<form>
				<fieldset class="joinField">
					<div class="form-group">
					 	<label for="input_id" class="col-sm-4 control-label">아이디</label>
					 	<div class="col-sm-4">
							<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요"/>
						</div>
					</div>
					<div class="form-group">
						<label for="input_pw" class="col-sm-4 control-label">비밀번호</label>
					 	<div class="col-sm-4">
							<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요"/>
						</div>
					</div>
					<div class="form-group">
						<label for="input_pw_check" class="col-sm-4 control-label">비밀번호 확인</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" name="passwordCheck" id="passwordCheck" placeholder="비밀번호를 확인하세요"/>
						</div>
					</div>
					<div class="form-group">
						<label for="input_name" class="col-sm-4 control-label">이름</label>
					 	<div class="col-sm-4">
							<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요"/>
						</div>
					</div>
					<div class="form-group">
						<label for="input_name" class="col-sm-4 control-label">주소</label>
					 	<div class="col-sm-4">
							<input type="text" class="form-control" id="addr" name="addr" placeholder="주소를 입력하세요"/>
						</div>
					</div>
					<div class="form-group">
						<label for="input_name" class="col-sm-4 control-label">생년월일</label>
					 	<div class="col-sm-4">
							<input type="date" class="form-control" id="birth" name="birth" placeholder="생년월일을 입력하세요"/>
						</div>
					</div>
					<div class="form-group">
						<label for="input_name" class="col-sm-4 control-label">전공과목</label>
					 	<div class="col-sm-4">
							<input type="checkbox" class="form-control" id="subject" name="subject" value="java"/>
							<input type="checkbox" class="form-control" id="subject" name="subject" value="JSP"/>
							<input type="checkbox" class="form-control" id="subject" name="subject" value="SQL"/>
							<input type="checkbox" class="form-control" id="subject" name="subject" value="Spring"/>
							<input type="checkbox" class="form-control" id="subject" name="subject" value="파이썬"/>
							<input type="checkbox" class="form-control" id="subject" name="subject" value="노드js"/>
							<input type="checkbox" class="form-control" id="subject" name="subject" value="안드로이트"/>
						</div>
					</div>
					<div class="form-group">
						<label for="input_name" class="col-sm-4 control-label">전공</label>
						<select name="major" id="">
							<option value="computer">컴퓨터 전공</option>
							<option value="info">정보통신</option>
							<option value="sucurity">정보보안</option>
						</select>	
					</div>
				
					<div class="input_button text-center">
						<button id="joinButton">회원가입</button>
						<input type="reset" id="cancleButton" class="btn btn-primary" value ="취소"/>
					</div>
						
				</fieldset>
			</form>
		</div>
	</div>
<script>
$(function(){
	$form = $('form');
	$form.addClass('form-horizontal');
	$('#joinBtn').addClass('btn btn-primary').click(function() {
	
	$form.attr('method','post').attr('action','${context}/member/join.do').submit();
	});
	$('#cancleBtn').addClass('btn btn-primary').click(function() {
		$form.reset();
	});
});

</script>
<!-- 

var id = $('input:text[name=id]').val();
	var password = $('input:text[name=password]').val();
	var name = $('input:text[name=name]').val();
	var birth = $('input:text[name=birth]').val();
	var addr = $('input:radio[name=addr]').val();
	var major = $('select[name=major] option:selected').val();
	var subjects =forTag.checkbox($('input:checkbox[name=addr]:checked'));
	alert('아이디:'+id+',비번:'+password+', 이름:'
			+name+'생년월일:'+birth+'주소:'+addr+
			', 전공:'+major+', 과목 :'+subject);
			
 var formTag = {};
	formTag.checkbox = function(subjects) {
		var temp = [];
		subjects.each(function() {
			temp.push($(this).val());
		});
		return temp;
	};
	
 -->