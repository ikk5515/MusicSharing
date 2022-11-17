<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	
	<%
		String userId = (String)session.getAttribute("userId");
		String userPw = request.getParameter("userPw");
		
		PreparedStatement pstat = null;
		int result = 0;
		
		String sql = "update userInfo set userPw=? where userId= '"+ userId + "'";
		
		pstat = conn.prepareStatement(sql);
		pstat.setString(1, userPw);
		
		result = pstat.executeUpdate();
		
		request.setAttribute("result", result);
		
		pstat.close();
		conn.close();
	%>
	
	<jsp:forward page="updateMypageResult.jsp"></jsp:forward>
</body>
</html>