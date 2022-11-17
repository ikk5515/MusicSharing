<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 업데이트</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
body {
	min-height: 100vh;
	background-color: #2c3e50;
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}

.btn-primary2 {
	color: #fff;
	background-color: #1abc9c;
	border-color: #1abc9c
}

.btn-primary2:hover {
	color: #fff;
	background-color: #15967D;
	border-color: #15967D
}

.btn-primary2.focus, .btn-primary2:focus {
	box-shadow: 0 0 0 .2rem rgba(19, 138, 114, .54)
}

.btn-primary2.disabled, .btn-primary:disabled {
	color: #fff;
	background-color: #007bff;
	border-color: #007bff
}

.btn-primary2:not(:disabled):not(.disabled).active, .btn-primary2:not(:disabled):not(.disabled):active,
	.show>.btn-primary2.dropdown-toggle {
	color: #fff;
	background-color: #0062cc;
	border-color: #005cbf
}

.btn-primary2:not(:disabled):not(.disabled).active:focus, .btn-primary2:not(:disabled):not(.disabled):active:focus,
	.show>.btn-primary2.dropdown-toggle:focus {
	box-shadow: 0 0 0 .2rem rgba(19, 138, 114, .54)
}
</style>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원정보 수정</h4>
				<form action="updateMypageQuery.jsp" name="form"
					class="validation-form" novalidate="">

					<div class="mb-3">
						<label for="userId">아이디</label>
						<h2>${userId }</h2>
					</div>
					<div class="mb-3">
						<label for="userEmail">이메일</label>
						<h2>${userEmail}</h2>
					</div>

					<div class="mb-3">
						<label for="userPw">새 비밀번호</label> <input type="password"
							class="form-control" name="userPw" id="pwd1" placeholder=""
							required>
					</div>

					<div class="mb-3">
						<label for="userPw2">새 비밀번호 확인</label> <input type="password"
							class="form-control" name="userPw2" id="pwd2" placeholder=""
							required>
					</div>
					<div class="alert alert-success" id="alert-success2">비밀번호가
						일치합니다.</div>
					<div class="alert alert-danger" id="alert-danger2">비밀번호가 일치하지
						않습니다.</div>
					<div class="alert alert-danger" id="alert-danger3">비밀번호에 공백
						없이 입력해주세요.</div>
					<div class="alert alert-danger" id="alert-danger4">비밀번호는 영문과
						숫자를 특수문자를 모두 포함해 8~16자 사이로 입력해주세요.</div>

					<div class="mb-3">
						<label for="userNick">닉네임</label>
						<h2>${userNick }</h2>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit"
						id="submit">수정 하기</button>
				</form>
				<br>
				<button class="btn btn-primary2 btn-lg btn-block"
					onclick="location.href='boardQuery.jsp?tab=korMusic'">수정 취소</button>
			</div>
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
    	$(function(){
    		$("#submit").attr("disabled", "disabled");
        	$("#alert-success2").hide();
        	$("#alert-danger2").hide();
        	$("#alert-danger3").hide();
        	$("#alert-danger4").hide();
        	$('#pwd2').focusout(function(){
            	var pwd1 = $('input[name=userPw]').val();
            	var pwd2 = $('input[name=userPw2]').val();
            	var reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/
            	if(pwd1 != "" || pwd2 != ""){
            		if(pwd1.length < 8 || pwd1.length > 16 || !reg.test(pwd2)){
            			$("#alert-success2").hide();
            			$("#alert-danger2").hide();
                		$("#alert-danger3").hide();
                		$("#alert-danger4").show();
                		$("#submit").attr("disabled", "disabled");
            		} else {
                		if(form.userPw.value.search(/\s/) != -1 || form.userPw2.value.search(/\s/) != -1){
                			$("#alert-success2").hide();
                			$("#alert-danger2").hide();
                    		$("#alert-danger3").show();
                    		$("#alert-danger4").hide();
                    		$("#submit").attr("disabled", "disabled");    
                		} else {
                    		if(pwd1 == pwd2){
                        		$("#alert-success2").show();
                        		$("#alert-danger2").hide();
                        		$("#alert-danger3").hide();
                        		$("#alert-danger4").hide();
                        		$("#submit").removeAttr("disabled");
                    		}else{
                        		$("#alert-success2").hide();
                        		$("#alert-danger3").hide();
                        		$("#alert-danger4").hide();
                        		$("#alert-danger2").show();
                        		$("#submit").attr("disabled", "disabled");
                    		}
                		}
            		}
            	}
        	});
        	$('#pwd1').focusout(function(){
            	var pwd1 = $('input[name=userPw]').val();
            	var pwd2 = $('input[name=userPw2]').val();
            	var reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/
            	if(pwd1 != "" || pwd2 != ""){
            		if(pwd1.length < 8 || pwd1.length > 16 || !reg.test(pwd1)){
            			$("#alert-success2").hide();
            			$("#alert-danger2").hide();
                		$("#alert-danger3").hide();
                		$("#alert-danger4").show();
                		$("#submit").attr("disabled", "disabled");
            		} else {
                		if(form.userPw.value.search(/\s/) != -1 || form.userPw2.value.search(/\s/) != -1){
                			$("#alert-success2").hide();
                			$("#alert-danger2").hide();
                    		$("#alert-danger3").show();
                    		$("#alert-danger4").hide();
                    		$("#submit").attr("disabled", "disabled");    
                		} else {
                    		if(pwd1 == pwd2){
                        		$("#alert-success2").show();
                        		$("#alert-danger2").hide();
                        		$("#alert-danger3").hide();
                        		$("#alert-danger4").hide();
                        		$("#submit").removeAttr("disabled");
                    		}else{
                        		$("#alert-success2").hide();
                        		$("#alert-danger3").hide();
                        		$("#alert-danger4").hide();
                        		$("#alert-danger2").show();
                        		$("#submit").attr("disabled", "disabled");
                    		}
                		}
            		}    
            	}
        	});
    	});
</script>


</html>