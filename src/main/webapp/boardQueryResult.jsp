<%@page import="music.korMusic"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" style="text-align: center;">
		<tr>
			<td colspan="6">국내 음악 추천 목록</td>
		</tr>

		<tr bgcolor="orange">
			<th>번호</th>
			<th>제목</th>
			<th>가수</th>
			<th>유튜브 링크</th>
			<th>장르</th>
			<th>게시 날짜</th>
		</tr>

		<%
		response.setContentType("text/html;charset=utf8");
		request.setCharacterEncoding("utf-8");

		ArrayList<korMusic> list = (ArrayList<korMusic>) request.getAttribute("list");
		%>

		<c:forEach var="korMusic" items="${list }">
			<tr>
				<td>${korMusic.getKorno() }</td>
				<td>${korMusic.getKorTitle() }</td>
				<td>${korMusic.getKorSinger() }</td>
				<td>${korMusic.getKorYoutube() }</td>
				<td>${korMusic.getKorKind() }</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<br>
</body>
</html>