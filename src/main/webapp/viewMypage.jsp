<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 조회</title>
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
				<h4 class="mb-3">회원정보</h4>
				<form name="form" class="validation-form" novalidate="">

					<div class="mb-3">
						<label for="userId">아이디</label><h2>${userId }</h2>
					</div>
					<div class="mb-3">
						<label for="userEmail">이메일</label><h2>${userEmail }</h2>
					</div>

					<div class="mb-3">
						<label for="userNick">닉네임</label> <h2>${userNick }</h2>
					</div>

					<div class="mb-4"></div>
				</form>
				<button class="btn btn-primary btn-lg btn-block" onclick="location.href='updateMypageProc.jsp?userId=${userId}'">수정 하기</button>
				<br>
				<button class="btn btn-primary2 btn-lg btn-block"
					onclick="location.href='boardQuery.jsp?tab=korMusic'">돌아가기</button>
			</div>
		</div>
	</div>
</body>

</body>
</html>