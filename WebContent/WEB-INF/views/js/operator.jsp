<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../global/header.jsp"/>
<div class="container" style="width:1000px; margin:0 auto;">
	<div class="row display-table">
    <div class="col-xs-12 col-sm-4 display-cell" >
	    <ul class="nav nav-pills nav-stacked">
		<li class="dropdown active"><a onclick="opr.sysout()">배열출력</a></li>	
		<li class="dropdown active"><a onclick="opr.score()">성적출력</a></li>	
		<li class="dropdown active"><a onclick="opr.grade()">성적표1</a></li>
		<li class="dropdown active"><a onclick="opr.gender()">주민번호</a></li>
		<li class="dropdown active"><a onclick="opr.bigNum()">큰수찾기</a></li>
		<li class="dropdown active"><a onclick="opr.gugudan()">구구단</a></li>
		<li class="dropdown active"><a onclick="opr.sum1to100()">100까지합</a></li>
		<li class="dropdown active"><a onclick="opr.oddSum()">짝과홀수의합</a></li>
		<li class="dropdown active"><a onclick="opr.liveScript()">라이브스크립트</a></li>
	    </ul>
    </div>
    <div class="col-xs-12 col-sm-8 display-cell" id="result" style="border: 1px solid black;height: 500px">
        연산 결과
    </div>
</div>
</div>	
<script type="text/javascript">
function liveScript() {
	alert('라이브스크립트 시절(객체기반언어가 아닌 시절)은 이렇게 했답니다.')
}
var opr = {
	sysout : function() {
		var arr = ['사과','배','감','귤'];
		for ( var i in arr) {
			console.log(arr[i]+'\t');
		}
	},
	score : function() {
		var result = '';
		var avengers = [];
		avengers.push({name : '아이언',kor : 90,eng : 90,math : 90});
		avengers.push({name : '헐크',kor : 80,eng : 80,math : 80});
		avengers.push({name : '캡아',kor : 70,eng : 70,math : 70});
		for ( var i in avengers) {
			avengers[i].getSum = function() {
				result = this.kor + this.eng + this.math; 
				return result;
			}
			avengers[i].getAvg = function() {
				result = this.getSum()/3;
				return result;
			}
			console.log('이름 :'+avengers[i].name+'합계 :'+avengers[i].getSum()+'평균 : '+avengers[i].getAvg());
		}
		result = '============ 어벤저스 성적표 ============ \n';
		result += '이름\t국어\t영어\t수학\t총점\t평균\n';
		result += '-------------------------------------\n';
		for ( var i in avengers) {
			{
				with(avengers[i]){
					result += name + ':\t'+kor+':\t'+eng+':\t'+math
						+':\t'+getSum()+':\t'+getAvg()+'\n';
				}
			}
		}
		/*
		with 키워드는 배열에 담긴 하나의 객체를 의미한다.
		즉 예를 들어
		var iron = {name : '아이언',kor : 90,eng : 90,math : 90}
		이렇게 선언된 하나의 객체를 avengers.push(iron) 이라고 줄 경우
		출력문에서 with 를 사용하지 않는다면 iron.name 이런 식으로 일일히
		명시해야 하기 때문에 with 를 사용한다
		*/
		console.log('어벤저스 성적표 : '+result);
	},
	
	grade : function(){
		var kor = Number(prompt('국어점수')), eng = Number(prompt('영어점수')), math =Number(prompt('수학점수'));
		/*
		90 a
		80 b
		70 c
		60 d
		미만이f
		*/
		var sum = kor+eng+math;
		var avg = sum/3;
		if (avg >= 90 && avg <= 100) {
			console.log('A학점')
		} else if(avg >= 80 && avg <= 89){
			console.log('B학점')
		} else if(avg >= 70 && avg <= 79){
			console.log('C학점')
		} else if(avg >= 60 && avg <= 69){
			console.log('D학점')
		} else {
			console.log('F학점')
		}
	},
	
	gender : function() {
		/* 
		800101-1234567 일 경우 flag 값은 1 이다라고 정의함
		*/
		var ssn = prompt('800101-1234567 로 입력해주세요');
		var flag = ssn.charAt(7); // 라면 성별을 판별하는 로직을 switch - case 로 완성하시오
		// 자바의 switch case 와 동일
		switch (flag) {
		case 1:
			console.log('남자')
			break;

		default:
			break;
		}
		document.getElementById("result").innerHTML = "입력한 주민번호 성별  : "+flag;
	},
	bigNum : function() {
		/* 80, 70, 60 일 경우 if 문으로 최대값 을 구하는 로직을 완성하시오 */
	},
	gugudan : function() {
		var i=0,j=0,hap=0,result='' ;
		j = Number(prompt('단을 입력'));
		for (var i=1; i <= 9; i++) {
			// 7단 구구단을 출력하시오
			hap = j*i
			result += (j+'*'+i+'='+ hap)+'<br/>' ;
		}
		document.getElementById("result").innerHTML = result;
	},
	sum1to100 : function() {
		var sum=0,i=0;
		while (i==100) {
			/* 1부터 100까지의 합을 출력하시오*/
			i++;
			sum +=i;
		}
		console.log('합계:'+sum)
	},
	oddSum : function() {
		var oddSum=0,evenSum=0;
		for (var int = 0; int < 100; int++) {
			// 1부터 100 까지 수 중에서 홀수의 합 oddSum 과 
			// 짝수들의 합 evenSum 을 구하시오
		}
	}
}
</script>