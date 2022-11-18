<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <title>로그인</title>

	<style>
		body {font-family: "Lato", sans-serif;}
		
		.main-head{height: 150px;background: #FFF;}
		.sidenav {height: 100%;background-color: #2c3e50;overflow-x: hidden;padding-top: 20px;}
		.main {padding: 0px 10px;}
		
		@media screen and (max-height: 450px) {.sidenav {padding-top: 15px;}}
		@media screen and (max-width: 450px) {
		.login-form{margin-top: 10%;}
		.register-form{margin-top: 10%;}
		}
		
		@media screen and (min-width: 768px){
    	.main{margin-left: 40%;}
		.sidenav{width: 40%;position: fixed;z-index: 1;top: 0;left: 0;}
    	.login-form{margin-top: 80%;}
    	.register-form{margin-top: 20%;}
		}
		
		input[type="text"] {
			border: none;
			border-bottom: solid 2px #2c3e50;
		}
		input[type="password"] {
			border: none;
			border-bottom: solid 2px #2c3e50;
		}
		form{display:inline}
		
		.login-main-text{margin-top: 30%;margin-left: 5%;padding: 60px;color: #fff;}
		.login-main-text-font{font-size: 3.5rem; font-weight:bolder;}
		.login-main-text h2{font-weight: 300;}+
		.btn-black{background-color: #000 !important;color: #fff;}
		.label-font-size{font-size: 1.25rem}
		.href-font{color: #1abc9c;}
		.a{text-decoration-color : #1abc9c;}
		.href-font:hover{color:#15967D;border-color:#15967D}
		
		.btn-num1{margin-left: 100%; width: 35%;height: 80%; bottom: -10px; position: absolute; font-size: 3rem; text-align: center;}
		.btn-num2{margin-left: 106%; width: 35%;font-size: 2rem;text-align: center; left: -15px ;padding-botton: 10%;position: absolute;}
		
		
		.btn-primary2{color:#fff;background-color:#1abc9c;border-color:#1abc9c}
		.btn-primary2:hover{color:#fff;background-color:#15967D;border-color:#15967D}
		.btn-primary2.focus,
		.btn-primary2:focus{box-shadow:0 0 0 .2rem rgba(19,138,114,.54)}
		.btn-primary2.disabled,
		.btn-primary:disabled{color:#fff;background-color:#007bff;border-color:#007bff}
		.btn-primary2:not(:disabled):not(.disabled).active,
		.btn-primary2:not(:disabled):not(.disabled):active,.show>
		.btn-primary2.dropdown-toggle{color:#fff;background-color:#0062cc;border-color:#005cbf}
		.btn-primary2:not(:disabled):not(.disabled).active:focus,
		.btn-primary2:not(:disabled):not(.disabled):active:focus,.show>
		.btn-primary2.dropdown-toggle:focus{box-shadow:0 0 0 .2rem rgba(19,138,114,.54)}
	</style>
	
</head>
<body>
	<script type="text/javascript">
		function check() {
			if (!form.userId.value) {
				alert("아이디를 입력하세요.");
				form.userId.focus();
				return false;
			}
			if (!form.userPw.value) {
				alert("비밀번호를 입력하세요.");
				form.userPw.focus();
				return false;
			}
		}
	</script>

	<div class="sidenav">
         <div class="login-main-text">
            <h2 class="login-main-text-font">Music Sharing<br>Login Page</h2>
            <p>회원가입 하시고 다양한 노래를 공유해보세요! <a class="href-font" href="signUp.jsp">회원가입</a></p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form action="loginProc.jsp" name="form" onsubmit="return check()">
                  <div action="loginProc.jsp" class="form-group">
                     <label class="label-font-size">아이디</label>
                     <input type="text" class="form-control" name="userId" placeholder="아이디">
                  </div>
                  <div class="form-group">
                     <label class="label-font-size">비밀번호</label>
                     <input type="password" class="form-control" name="userPw" placeholder="비밀번호">
                  </div>
                  <button type="submit" class="btn btn-primary btn-num1">Login</button>
               </form>
               <button class="btn btn-primary2 btn-num2" onclick="location.href='mainPage.jsp'">돌아가기</button>
            </div>
         </div>
      </div>
</body>
</html>