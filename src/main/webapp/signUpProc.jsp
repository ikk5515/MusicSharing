<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 Logic</title>
</head>
<body>

	<%@ include file="dbconn.jsp"%>

	<%
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userNick = request.getParameter("userNick");
		String userEmail = request.getParameter("userEmail");
		
		PreparedStatement pstat = null;
		ResultSet rs = null;
		
		PreparedStatement pstat1 = null;
		ResultSet rs1 = null;
		
		PreparedStatement pstat2 = null;
		ResultSet rs2 = null;
		
		String sql1 = "select * from userInfo where userId = ?";
		String sql2 = "insert into userInfo values (?,?,?,?)";
		String sql3 = "select * from userInfo where userEmail = ?";
		String sql4 = "select * from userInfo where userNick = ?";
		
		int userIdCheck = 0;
		int userEmailCheck = 0;
		int userNickCheck = 0;
		int result = 0;
		
		// PreparedStatement 생성 => 테이블에 userId가 이미 있는지 체크
		pstat = conn.prepareStatement(sql1);
		pstat.setString(1, userId);
		rs = pstat.executeQuery();
		
		pstat1 = conn.prepareStatement(sql3);
		pstat1.setString(1, userEmail);
		rs1 = pstat1.executeQuery();
		
		pstat2 = conn.prepareStatement(sql4);
		pstat2.setString(1, userNick);
		rs2 = pstat2.executeQuery();
		
		if (rs.next()) {
			// 테이블에 이미 아이디,이메일,닉네임이 있는경우
			userIdCheck = 1;
			
		} else {
			if (rs1.next()) {
				userEmailCheck = 1;
			} else {
				if (rs2.next()) {
					userNickCheck = 1;
				} else {
					// 사번이 없는 경우 => 입력 가능
					pstat = conn.prepareStatement(sql2);
					pstat.setString(1, userId);
					pstat.setString(2, userPw);
					pstat.setString(3, userNick);
					pstat.setString(4, userEmail);
					result = pstat.executeUpdate();
				}
			}
		}
		request.setAttribute("userIdCheck", userIdCheck);
		request.setAttribute("userEmailCheck", userEmailCheck);
		request.setAttribute("userNickCheck", userNickCheck);
		request.setAttribute("result", result);
		
		conn.close();
		pstat.close();
		rs.close();
		rs1.close();
		rs2.close();
		pstat1.close();
		pstat2.close();
	%>
	<jsp:forward page="signUpResult.jsp"></jsp:forward>
</body>
</html>