<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage update 로직</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>

	<%
	String userID = null;
	if (session.getAttribute("userId") != null) {
		userID = (String) session.getAttribute("userId");
	}

	Statement stat = null;
	ResultSet rs = null;

	String sql = "select * from userInfo where userId = '" + userID + "'";

	stat = conn.createStatement();
	rs = stat.executeQuery(sql);

	int result = 0;

	if (rs.next()) {
		result = 1;
		request.setAttribute("userId", rs.getString(1));
		request.setAttribute("userPw", rs.getString(2));
		request.setAttribute("userNick", rs.getString(3));
		request.setAttribute("userEmail", rs.getString(4));
	}

	request.setAttribute("result", result);

	rs.close();
	stat.close();
	conn.close();
	%>

	<jsp:forward page="updateMypage.jsp"></jsp:forward>

</body>
</html>