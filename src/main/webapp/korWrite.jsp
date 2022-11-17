<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl을 사용하기 위한 선언 -->

<!DOCTYPE html>
<html lang="ko">
<head>
<!-- bootstrap을 css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<link href="css/styles2.css" rel="stylesheet" />
<script src="js/scripts2.js"></script>
<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
.select-size {
	width: 130px;
	height: 45px;
}

.container {
	margin-left: 25%;
	margin-top: 10%;
}

.font-setting {
	font-size: 2.25rem;
	margin-left: 13%;
	margin-bottom: 60%;
}

input[type="text"] {
	border: solid 1px black;
}

input[type="text"]:focus {
	background-color: #E0FFFF;
}

.btn-num1 {
	width: 120px;
	margin-left: 75%;
}

.btn-num2 {
	width: 120px;
	margin-left: 75%;
	margin-top: 3%;
}
</style>

<script type="text/javascript">
	function check() {
		if (!form.korTitle.value) {
			alert("곡명을 입력하세요.");
			form.korTitle.focus();
			return false;
		}
		if (!form.korSinger.value) {
			alert("가수를 입력하세요.");
			form.korSinger.focus();
			return false;
		}
		if (!form.korYoutube.value) {
			alert("Youtube URL을 입력하세요.");
			form.korYoutube.focus();
			return false;
		}
	}
</script>
</head>
<body>
<body id="page-top" style="background-color: #c4d3f6">
	<%
	// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
	String userID = null;
	if (session.getAttribute("userId") != null) {
		userID = (String) session.getAttribute("userId");
	}
	%>
	<%@ include file="dbconn.jsp"%>

	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-new a-font">Music
				Sharing</div>
			<div class="list-group list-group-flush">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="boardQuery.jsp?tab=korMusic">국내 음악</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="boardQuery.jsp?tab=abroadMusic">해외 음악</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">질문 게시판</a>
			</div>
		</div>
		<div id="page-content-wrapper">
			<!-- Top navigation-->
			<nav
				class="navbar navbar-expand-lg navbar-light bg-new border-bottom">
				<div class="container-fluid">
					<button class="btn btn-primary2" id="sidebarToggle">Menu</button>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
							<!-- <li class="nav-item active"><a class="nav-link" href="#!">Home</a></li> -->
							<!--  <li class="nav-item"><a class="nav-link" href="#!">Link</a></li> -->
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
								role="button" data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" style="color: #ffffff">${userId }</a>
								<div class="dropdown-menu dropdown-menu-end"
									aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="viewMypageQuery.jsp">마이페이지</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
								</div></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- Page content-->
			<div class="container">
				<a class="font-setting">국내 음악 등록</a>
				<form action="korQuery.jsp" class="form-horizontal" id="form"
					name="form" onsubmit="return check()">

					<!-- class에 사용되는 form-group, row 등은 부트스트랩에서 사용되는 class -->
					<div class="form-group row">
						<label class="col-sm-12 col-xs-12 col-form-label" for="title"
							style="font-weight: 1000; font-size: 1.25rem;">곡명</label>
						<div class="col-sm-5 col-xs-12">
							<input class="form-control" id="abrTitle" name="korTitle"
								placeholder="곡명" type="text" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-xs-12 col-form-label" for="title"
							style="font-weight: 1000; font-size: 1.25rem;">가수</label>
						<div class="col-sm-5 col-xs-12">
							<input class="form-control" id="abrSinger" name="korSinger"
								placeholder="가수" type="text" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-xs-12 col-form-label" for="title"
							style="font-weight: 1000; font-size: 1.25rem;">유튜브 링크</label>
						<div class="col-sm-5 col-xs-12">
							<input class="form-control" id="abrYoutube" name="korYoutube"
								placeholder="https://youtube.com" type="text" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-xs-12 col-form-label" for="title"
							style="font-weight: 1000; font-size: 1.25rem;">장르</label><br>
						<select name="korKind" id="abrKind" class="select-size btn-light"
							style="margin-left: 12px; font-size: 1.25rem; height: 40px;">
							<option value="발라드">발라드</option>
							<option value="힙합">힙합</option>
							<option value="재즈">재즈</option>
							<option value="락">락</option>
						</select>
					</div>

					<div class="form-group row">
						<div class="col-sm-5">
							<button class="btn btn-success btn-num1" type="submit"
								id="submit">등록</button>
							<a class="btn btn-primary btn-num2" href="korMainBoard.jsp"
								role="button" title="리스트"><i class="fa fa-list-ul"></i>목록</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>