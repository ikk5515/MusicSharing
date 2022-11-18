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
				var currentRow = $(this).closest('tr');
				var col1 = currentRow.find('td:eq(0)').text();
				location.href = "deleteAbroad.jsp?abrno=" + col1;

			}

		});
	});
</script>

<style>
.container {
	width: 70%;
	margin-top: 5%;
}

.page-center {
	width: 100%;
	justify-content: center;
	text-align: center;
}

.pull-right {
	margin-left: 88%;
	margin-top: 3%;
	z-index: 10;
	margin-top: 3%;
}

.page-icon li {
	text-align: center;
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
	min-height: 100vh;
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
	min-height: 75vh;
}

.table {
	width: 100%;
	display: table;
	margin: 0;
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
	color: #ffffff;
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
	int count = 0;

	String sql = "select * from abroadMusic order by 1 desc limit 10";
	String sql2 = "select count(*) from abroadMusic";
	String sql3 = "select * from aboradMusic where abrno < ? order by abrno desc limit 10";

	Statement stat = null;
	ResultSet rs = null;

	Statement stat1 = null;
	ResultSet rs1 = null;

	stat = conn.createStatement(); /* Statment 객체생성 */
	rs = stat.executeQuery(sql); /* 쿼리 실행 */

	stat1 = conn.createStatement(); /* Statment 객체생성 */
	rs1 = stat1.executeQuery(sql2); /* 쿼리 실행 */

	/* RequestDispatcher 객체 이용
	 넘겨줄 페이지를 RequestDispatcher 객체에 넣고,
	 이 객체가 가지고 있는 forward 메소드를 이용하여 데이터를 전달한다. 
	*/
	%>
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
			<%
			while (rs1.next()) {
					count = rs1.getInt(1);
					break;
			}
			int countabrno = 0;
			while (rs.next()) {
				countabrno = rs.getInt(1);
				break;
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

			allPage = (int) Math.ceil(count / (double) ROWSIZE);

			if (endPage > allPage) {
				endPage = allPage;
			}

			Statement stat2 = null;
			ResultSet rs2 = null;

			String sqlList = "SELECT * from abroadMusic order by 1 limit " + start + ", "+ 6 + "";

			stat2 = conn.createStatement(); /* Statment 객체생성 */
			rs2 = stat2.executeQuery(sqlList);

			ArrayList<abroadMusic> list = new ArrayList<>();
			while (rs2.next()) {
				abroadMusic abroadMusic = new abroadMusic();
				abroadMusic.setAbrno(rs2.getInt(1));
				abroadMusic.setAbrTitle(rs2.getString(2));
				abroadMusic.setAbrSinger(rs2.getString(3));
				abroadMusic.setAbrYoutube(rs2.getString(4));
				abroadMusic.setAbrKind(rs2.getString(5));
				abroadMusic.setUserNick(rs2.getString(6));
				abroadMusic.setAbrdate(rs2.getString(7));
				list.add(abroadMusic); // 생성된 abroadMusic 객체를 리스트에 저장
			}
			request.setAttribute("count", count);
			request.setAttribute("list", list); // list를 request 영역에 저장
			%>
			<div class="limiter">
				<div class="container-table100">
					<div class="wrap-table100">
						<a
							style="margin-bottom: 20%; margin-top: 20%; margin-left: 35%; font-size: 2.25rem; background-color: #c4d3f6;">해외
							음악 추천 목록</a>
						<div class="table">
							<a>총 등록된 해외 음악 수: ${count }</a>
							<div class="row header">
								<table style="flex: 0.5;">
									<tr>
										<td><div class="cell">번호</div></td>
										<td><div class="cell">제목</div></td>
										<td><div class="cell">가수</div></td>
										<td><div class="cell">유튜브</div></td>
										<td><div class="cell">장르</div></td>
										<td><div class="cell">작성자</div></td>
										<td><div class="cell">등록일</div></td>
										<c:if test="${userId eq 'admin' }">
											<td><div class="cell">삭제</div></td>
										</c:if>
									</tr>
								</table>
							</div>
							<div class="row">
								<c:forEach var="abroadMusic" items="${list }">
									<table style="flex: 0.5; table-layout: fixed; height: 85px;">
										<tr class="tr-hover">
											<td><div class="cell" data-title="번호">${abroadMusic.getAbrno() }</div></td>
											<td><div class="cell" data-title="제목">${abroadMusic.getAbrTitle() }</div></td>
											<td><div class="cell" data-title="가수">${abroadMusic.getAbrSinger() }</div></td>
											<td><div class="cell" data-title="유튜브">
												<a href="${abroadMusic.getAbrYoutube()}"><img src="img/play-button.png" style="width: 35px; height: 35px;"></a>
											</div></td>
											<td><div class="cell" data-title="장르">${abroadMusic.getAbrKind() }</div></td>
											<td><div class="cell" data-title="작성자">${abroadMusic.getUserNick() }</div></td>
											<td><div class="cell" data-title="등록일">${abroadMusic.getAbrdate() }</div></td>
											<c:if test="${userId eq 'admin' }">
												<td id="btndelete"><input type="submit" value="삭제"
													class="btn btn-danger"
													style="width: 80px; height: 40px; margin-left: 17px;"></td>
											</c:if>
										</tr>
									</table>
								</c:forEach>
							</div>
						</div>
						<%
						response.setContentType("text/html;charset=utf8");
						request.setCharacterEncoding("utf-8");
						%>
						<a href="abroadWrite.jsp" class="btn btn-primary2 pull-right">노래
							등록하기</a>
						<div class="page-icon">
							<nav aria-label="Page navigation">
								<ul class="pagination pagination-lg page-center">
									<%
									if (pg > BLOCK) {
									%>
									<li class="page-item"><a href="abroadMainBoard.jsp?pg=1"
										class="page-link">맨 앞</a></li>
									<li class="page-item"><a
										href="abroadMainBoard.jsp?pg=<%=startPage - 1%>"
										class="page-link">이전</a></li>

									<%
									}
									%>

									<%
									for (int i = startPage; i <= endPage; i++) {
										if (i == pg) {
									%>
									<li class="page-item"><a class="page-link"><b>[<%=i%>]
										</b></a></li>
									<%
									} else {
									%>
									<li class="page-item"><a
										href="abroadMainBoard.jsp?pg=<%=i%>" class="page-link">[<%=i%>]
									</a></li>
									<%
									}
									}
									%>

									<%
									if (endPage < allPage) {
									%>
									<li class="page-item"><a
										href="abroadMainBoard.jsp?pg=<%=endPage + 1%>"
										class="page-link">다음</a></li>
									<li class="page-item"><a
										href="abroadMainBoard.jsp?pg=<%=allPage%>" class="page-link">맨
											뒤</a>
								</ul>
								<%
								}
								rs.close();
								rs1.close();
								stat.close();
								stat1.close();
								conn.close();
								stat2.close();
								stat2.close();
								%>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>