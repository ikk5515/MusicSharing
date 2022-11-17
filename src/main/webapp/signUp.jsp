<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<!-- Bootstrap CSS -->
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
				<h4 class="mb-3">회원가입</h4>
				<form action="signUpProc.jsp" name="form" class="validation-form"
					onsubmit="return check()" novalidate="">

					<div class="mb-3">
						<label for="userId">아이디</label> <input type="text"
							class="form-control" name="userId" id="uId" placeholder=""
							required oninput="">
						<div class="invalid-feedback">아이디를 입력해주세요.</div>
					</div>
					<div class="alert alert-danger" id="alert-danger5">아이디는 공백없이
						영문과 숫자를 포함해 6~20자 사이로 입력해주세요.</div>
					<div class="alert alert-danger" id="alert-danger6">아이디에 공백 없이
						입력해주세요.</div>

					<div class="mb-3">
						<label for="userEmail">이메일</label> <input type="email"
							class="form-control" name="userEmail"
							placeholder="email@example.com" required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="userPw">비밀번호</label> <input type="password"
							class="form-control" name="userPw" id="pwd1" placeholder=""
							required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="userPw2">비밀번호 확인</label> <input type="password"
							class="form-control" name="userPw2" id="pwd2" placeholder=""
							required>
						<div class="invalid-feedback">비밀번호 확인을 입력해주세요.</div>
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
						<label for="userNick">닉네임</label> <input type="text"
							class="form-control" name="userNick" id="uNick" placeholder=""
							required>
						<div class="invalid-feedback">닉네임을 입력해주세요.</div>
					</div>
					<div class="alert alert-danger" id="alert-danger7">닉네임에 공백 없이
						입력해주세요.</div>
					<div class="alert alert-danger" id="alert-danger8">닉네임은 2~8글자
						사이로 입력해주세요.</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit"
						id="submit">가입 완료</button>
				</form>
				<br>
				<button class="btn btn-primary2 btn-lg btn-block"
					onclick="location.href='mainPage.jsp'">가입 취소</button>
			</div>
		</div>
	</div>
</body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<script type="text/javascript">
	function check() {
		if(!form.userId.value) {
			alert("아이디를 입력하세요.");
			form.userId.focus();
			return false;
		} if(!form.userEmail.value) {
			alert("이메일을 입력하세요.");
			form.userEmail.focus();
			return false;
		} if(!form.userPw.value) {
			alert("비밀번호를 입력하세요.");
			form.userPw.focus();
			return false;
		} if(!form.userNick.value) {
			alert("닉네임을 입력하세요.");
			form.userNick.focus();
			return false;
		}
	}
</script>

<script type="text/javascript">
	$(function(){
		$("#alert-danger5").hide();
		$("#alert-danger6").hide();
		$("#submit").attr("disabled", "disabled");
	
		$('#uId').focusout(function(){
			var uId = $('input[name=userId]').val();
    		var reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$/
    		if(uId != ""){
    			if(uId.length < 6 || uId.length > 20 || !reg.test(uId)){
        			$("#alert-danger5").show();
        			$("#alert-danger6").hide();
        			$("#submit").attr("disabled", "disabled");
    			} else {
        			if(form.uId.value.search(/\s/) != -1){
        				$("#alert-danger5").hide();
            			$("#alert-danger6").show();
            			$("#submit").attr("disabled", "disabled");    
        			} else {
            			$("#alert-danger5").hide();
            			$("#alert-danger6").hide();
            			$("#submit").removeAttr("disabled");
        			}
    			}
    		}
		});
	});
</script>

<script type="text/javascript">
	$(function(){
		$("#alert-danger7").hide();
		$("#alert-danger8").hide();
		$("#submit").attr("disabled", "disabled");
	
		$('#uNick').focusout(function(){
			var uNick = $('input[name=userNick]').val();
    		var reg = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]{2,6}$/
    		if(uNick != ""){
    			if(uNick.length < 2 || uNick.length > 6 || !reg.test(uNick)){
        			$("#alert-danger8").show();
        			$("#alert-danger7").hide();
        			$("#submit").attr("disabled", "disabled");
    			} else {
        			if(form.uId.value.search(/\s/) != -1){
        				$("#alert-danger7").show();
        				$("#alert-danger8").hide();
            			$("#submit").attr("disabled", "disabled");    
        			} else {
            			$("#alert-danger7").hide();
            			$("#alert-danger8").hide();
            			$("#submit").removeAttr("disabled");
        			}
    			}
    		}
		});
	});
</script>


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