<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 로직</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>

	<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String userNick = null;
	String userEmail = null;

	PreparedStatement pstat = null;
	ResultSet rs = null;
	
	PreparedStatement pstat1 = null;
	ResultSet rs1 = null;

	String sql1 = "SELECT userPw FROM userInfo WHERE userId = ?";
	String sql2 = "select * from userInfo where userId = ?";

	int userCheck = -1;

	// PreparedStatement 생성 => 테이블에 userId가 이미 있는지 체크
	pstat = conn.prepareStatement(sql1);
	pstat.setString(1, userId);
	rs = pstat.executeQuery();

	if (rs.next()) {
		// 테이블에 이미 아이디가 있는경우
		if (rs.getString(1).equals(userPw)) {
			userCheck = 1; // 로그인 성공
			
			pstat1 = conn.prepareStatement(sql2);
			pstat1.setString(1, userId);
			rs1 = pstat1.executeQuery();
			
			request.setAttribute("userNick", userNick);
			request.setAttribute("userEmail", userEmail);
			
			session.setAttribute("userId", userId);
			session.setAttribute("userPw", userPw);
			session.setAttribute("userNick", userNick);
			session.setAttribute("userEmail", userEmail);
		} else if (!rs.getString(1).equals(userPw)) {
			userCheck = 0; // 비밀번호 불일치
		} else {
			userCheck = -1; // 존재하지 않는 아이디
		}

	}
	request.setAttribute("userCheck", userCheck);
	conn.close();
	pstat.close();
	rs.close();
	%>
	<jsp:forward page="loginAction.jsp"></jsp:forward>
</body>
</html>