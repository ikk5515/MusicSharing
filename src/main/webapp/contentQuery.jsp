<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문등록 Logic</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>

	<%
	request.setCharacterEncoding("utf-8");
	int contentNo;
	String contentTitle = request.getParameter("contentTitle");
	String contentWrite = request.getParameter("contentWrite");
	String userId = (String) session.getAttribute("userId");

	PreparedStatement pstat = null;
	ResultSet rs = null;

	PreparedStatement pstat1 = null;
	ResultSet rs1 = null;

	PreparedStatement pstat2 = null;
	ResultSet rs2 = null;

	String sql1 = "select * from contentAll where contentNo = ?";
	String sql2 = "insert into contentAll values (?,?,?,?,now())";
	String sql3 = "select contentNo FROM contentAll ORDER BY contentNo DESC";

	int result = 0;

	pstat2 = conn.prepareStatement(sql3);
	rs2 = pstat2.executeQuery();
	if (rs2.next()) {
		contentNo = rs2.getInt(1) + 1;
	} else {
		contentNo = 1;
	}

	pstat1 = conn.prepareStatement(sql1);
	pstat1.setInt(1, contentNo);
	rs1 = pstat1.executeQuery();

	if (rs1.next()) {
	} else {
		pstat = conn.prepareStatement(sql2);
		pstat.setInt(1, contentNo);
		pstat.setString(2, contentTitle);
		pstat.setString(3, contentWrite);
		pstat.setString(4, userId);
		result = pstat.executeUpdate();
	}

	request.setAttribute("result", result);

	conn.close();
	rs1.close();
	rs2.close();
	pstat1.close();
	pstat2.close();
	%>
	<jsp:forward page="contentWriteResult.jsp"></jsp:forward>
</body>
</html>