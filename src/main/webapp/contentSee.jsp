<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="music.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 게시판</title>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<link href="css/styles2.css" rel="stylesheet" />
<script src="js/scripts2.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
	$('document').ready(function() {
		$('#btndelete input').on('click', function() {
			if (!confirm("정말 삭제하시겠습니까?")) {
				return false;
			} else {
				var currentRow = $(this).parent().parent().parent().parent();
				var col1 = currentRow.find('td:eq(1)').text();
				location.href = "deleteContent.jsp?contentNo=" + col1;
				return false;
			}

		});
	});
</script>
<!-- <script type="text/javascript">
	$('document').ready(
			function() {
				$('#btnWrite input').on(
						'click',
						function() {
							if (!confirm("댓글을 등록 하시겠습니까?")) {
								return false;
							} else {
								var currentRow = $(this).parent().parent()
										.parent().parent().parent();
								var col1 = currentRow.find('td:eq(1)').text();
								var currentRow2 = $(this).parent();
								var col2 = currentRow2.find('td:eq(0)').text();
								window.alert(col2);
								location.href = "commentQuery.jsp?contentNo="
										+ col1 + "&commentWrite=" + col2;
								return false;
							}

						});
			});
</script> -->
<script type="text/javascript">
	function check() {
		if (!form.commentWrite.value) {
			alert("댓글을 입력하세요.");
			form.commentWrite.focus();
			return false;
		}
	}
</script>

<style>
.container {
	width: 60%;
	margin-top: 5%;
}

.container2 {
	width: 100%;
	margin-left: 13%;
}

.page-center {
	width: 100%;
	justify-content: center;
	text-align: center;
}

.page-icon li {
	display: block;
	width: 10%;
	height: 10%;
}
</style>



<style>
/*//////////////////////////////////////////////////////////////////
[ FONT ]*/
@font-face {
	font-family: Poppins-Regular;
	src: url('../fonts/poppins/Poppins-Regular.ttf');
}

@font-face {
	font-family: Poppins-Bold;
	src: url('../fonts/poppins/Poppins-Bold.ttf');
}

/*//////////////////////////////////////////////////////////////////
[ RESTYLE TAG ]*/
* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

body, html {
	height: 100%;
	font-family: sans-serif;
}

/* ------------------------------------ */
a {
	margin: 0px;
	transition: all 0.4s;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
}

a:focus {
	outline: none !important;
}

a:hover {
	text-decoration: none;
}

/* ------------------------------------ */
h1, h2, h3, h4, h5, h6 {
	margin: 0px;
}

p {
	margin: 0px;
}

ul, li {
	margin: 0px;
	list-style-type: none;
}

/* ------------------------------------ */
input {
	display: block;
	outline: none;
	border: none !important;
}

textarea {
	display: block;
	outline: none;
}

textarea:focus, input:focus {
	border-color: transparent !important;
}

/* ------------------------------------ */
button {
	outline: none !important;
	border: none;
	background: transparent;
}

button:hover {
	cursor: pointer;
}

iframe {
	border: none !important;
}

/*//////////////////////////////////////////////////////////////////
[ Table ]*/
.limiter {
	width: 100%;
	margin: 0 auto;
}

.container-table100 {
	width: 100%;
	min-height: 85vh;
	background: #c4d3f6;
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-wrap: wrap;
	padding: 33px 30px;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	display: -ms-flexbox;
	display: flex;
}

.wrap-table100 {
	width: 1100px;
	border-radius: 10px;
	overflow: hidden;
	min-height: 30vh;
}

.table {
	width: 100%;
	display: table;
	margin: 0px;
}

@media screen and (max-width: 768px) {
	.table {
		display: block;
	}
}

.row {
	display: table-row;
	background: #fff;
}

.row.header {
	background: #6c7ae0;
}

@media screen and (max-width: 768px) {
	.row {
		display: block;
	}
	.row.header {
		padding: 0;
		height: 0px;
	}
	.row.header .cell {
		display: none;
	}
	.row .cell:before {
		font-family: Poppins-Bold;
		font-size: 12px;
		color: #808080;
		line-height: 1.2;
		text-transform: uppercase;
		font-weight: unset !important;
		margin-bottom: 13px;
		content: attr(data-title);
		min-width: 98px;
		display: block;
	}
}

.cell {
	display: table-cell;
}

@media screen and (max-width: 768px) {
	.cell {
		display: block;
	}
}

.row .cell {
	font-family: Poppins-Regular;
	font-size: 15px;
	color: #666666;
	line-height: 1.2;
	font-weight: unset !important;
	padding-top: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #f2f2f2;
}

.row.header .cell {
	font-family: Poppins-Regular;
	font-size: 18px;
	color: #fff;
	line-height: 1.2;
	font-weight: unset !important;
	padding-top: 19px;
	padding-bottom: 19px;
}

.row .cell:nth-child(1) {
	width: 360px;
	padding-left: 40px;
}

.row .cell:nth-child(2) {
	width: 160px;
}

.row .cell:nth-child(3) {
	width: 250px;
}

.row .cell:nth-child(4) {
	width: 190px;
}

.table, .row {
	width: 100% !important;
}

.tr-hover:hover {
	background-color: #ececff;
	cursor: pointer;
}

.tr-hover: {
	background-color: #ececff;
	cursor: pointer;
}

@media ( max-width : 768px) {
	.row {
		border-bottom: 1px solid #f2f2f2;
		padding-bottom: 18px;
		padding-top: 30px;
		padding-right: 15px;
		margin: 0;
	}
	.row .cell {
		border: none;
		padding-left: 30px;
		padding-top: 16px;
		padding-bottom: 16px;
	}
	.row .cell:nth-child(1) {
		padding-left: 30px;
	}
	.row .cell {
		font-family: Poppins-Regular;
		font-size: 18px;
		color: #555555;
		line-height: 1.2;
		font-weight: unset !important;
	}
	.table, .row, .cell {
		width: 100% !important;
	}
}
</style>
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->



</head>
<body id="page-top">

	<%@ include file="dbconn.jsp"%>

	<%
	// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
	String userID = null;
	if (session.getAttribute("userId") != null) {
		userID = (String) session.getAttribute("userId");
	}
	%>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-new a-font">Music
				Sharing</div>
			<div class="list-group list-group-flush">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="korMainBoard.jsp">국내 음악</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="abroadMainBoard.jsp">해외 음악</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="qaMainBoard.jsp">질문 게시판</a>
			</div>
		</div>
		<div id="page-content-wrapper" style="background: #c4d3f6">
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
			<%
			String contentNo = request.getParameter("contentNo");

			Statement stat = null;
			ResultSet rs = null;

			String sql = "select * from contentAll where contentNo = '" + contentNo + "'";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			while (rs.next()) {
				request.setAttribute("contentNo", rs.getString(1));
				request.setAttribute("contentTitle", rs.getString(2));
				request.setAttribute("contentWrite", rs.getString(3));
				request.setAttribute("userNick", rs.getString(4));
				request.setAttribute("contentDate", rs.getString(5));
			}

			final int ROWSIZE = 6; // 한 페이지에 보일 게시물

			final int BLOCK = 5; // 아래에 보일 페이지 최대 개수 1-5 / 6-10

			int pg = 1; // 기본 페이지 			

			if (request.getParameter("pg") != null) {
				pg = Integer.parseInt(request.getParameter("pg"));
			}
			int start = (pg * (ROWSIZE)) - (ROWSIZE);
			int end = (pg * ROWSIZE);

			int allPage = 0; // 전체 페이지 

			int startPage = ((pg - 1) / BLOCK * BLOCK) + 1;
			int endPage = ((pg - 1) / BLOCK * BLOCK) + BLOCK;

			/* allPage = (int) Math.ceil(count / (double) ROWSIZE); */

			if (endPage > allPage) {
				endPage = allPage;
			}

			Statement stat2 = null;
			ResultSet rs2 = null;

			String sqlList = "SELECT * from contentAll order by 1 limit " + start + ", " + 6 + "";

			stat2 = conn.createStatement(); /* Statment 객체생성 */
			rs2 = stat2.executeQuery(sqlList);
			%>
			<div class="limiter" style="background: #c4d3f6">
				<div class="container-table100">
					<div class="wrap-table100">
						<div class="table">
							<div class="row" style="padding-left: 0px; padding-right: 0px;">
								<form action="commentQuery.jsp" id="form" name="form"
									onsubmit="return check()"
									style="padding-left: 0px; padding-right: 0px;">
									<table class="table"
										style="text-align: center; border-bottom: #c4d3f6">
										<tr>
											<td style="width: 25%; height: 80px; background: #6c7ae0"
												id="contentNo"><a
												style="font-size: 1.5rem; color: #fff">게시물 번호</a></td>
											<%
											session.setAttribute("contentNo", contentNo);
											%>
											<td colspan="2" id="contentNo"><a
												style="font-size: 1.5rem;">${contentNo }</a></td>
										</tr>
										<tr>
											<td style="width: 25%; height: 80px; background: #6c7ae0"><a
												style="font-size: 1.5rem; color: #fff">제목</a></td>
											<td colspan="2"><a style="font-size: 1.5rem;">${contentTitle }</a></td>
										</tr>
										<tr>
											<td style="height: 80px; background: #6c7ae0"><a
												style="font-size: 1.75rem; color: #fff">작성자</a></td>
											<td colspan="2"><a style="font-size: 1.5rem;">${userNick }</a></td>
										</tr>
										<tr>
											<td style="height: 80px; background: #6c7ae0"><a
												style="font-size: 1.75rem; color: #fff">작성일자</a></td>
											<td colspan="2"><a style="font-size: 1.5rem;">${contentDate }</a></td>
										</tr>
										<tr>
											<td style="height: 80px; background: #6c7ae0;"><a
												style="font-size: 1.5rem; color: #fff; vertical-align: center;">내용</a>
											</td>
											<td colspan="2" style="min-height: 220px; text-align: left;"><a
												style="font-size: 1.5rem;">${contentWrite }</a></td>
										</tr>
										<tr style="background: #c4d3f6">
											<td></td>
											<td
												style="height: 80px; background: #c4d3f6; display: flex; justify-content: flex-end;"><input
												onclick="location.href='qaMainBoard.jsp'" value="목록"
												class="btn btn-primary2"
												style="height: 50px; width: 100px; margin-right: 10px;">
											</td>
											<td id="btndelete"><c:if
													test="${userId eq 'admin' || userId eq userNick }">
													<input type="submit" value="삭제" id="btndelete"
														class="btn btn-danger" style="height: 50px; width: 100px;">
												</c:if></td>
										</tr>
										<tr style="background: #c4d3f6;">
											<td style="height: 80px; background: #c4d3f6;"><a
												style="font-size: 1.5rem; color: #000; display: inline-block; margin-top: 30%;">댓글</a>
											</td>
											<td style=" margin-top: 5%;">
												<div class="col-sm-5 col-xs-12" style="background: #c4d3f6; margin-top: 10%;">
													<textarea class="form-control" id="commentWrite"
														style="width: 650px; height: 60px;" name="commentWrite"
														placeholder="댓글"></textarea>
												</div>
											</td>
											<td id="btnWrite"><button
													class="btn btn-success btn-num1" type="submit"
													value="댓글 등록" style="height: 50px; width: 120px;margin-top: 70px;"
													id="submit">댓글등록</button></td>
										</tr>
										<tr style="background: #c4d3f6;">
											<td></td>
											<td></td>
											<td><input onclick="location.href='commentPage.jsp'"
												class="btn btn-primary btn-num1" value="댓글 보기"
												style="height: 50px; width: 120px;"></td>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>