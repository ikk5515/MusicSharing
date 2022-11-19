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
<title>국내음악 삽입 Logic</title>
</head>
<body> 
	<%@ include file="dbconn.jsp"%>

	<%
	request.setCharacterEncoding("utf-8");
	int korno;
	String korTitle = request.getParameter("korTitle");
	String korSinger = request.getParameter("korSinger");
	String korYoutube = request.getParameter("korYoutube");
	String korKind = request.getParameter("korKind");
	String userId = (String) session.getAttribute("userId");

	PreparedStatement pstat = null;
	ResultSet rs = null;

	PreparedStatement pstat1 = null;
	ResultSet rs1 = null;

	PreparedStatement pstat2 = null;
	ResultSet rs2 = null;

	String sql1 = "select * from korMusic where korTitle = ?";
	String sql2 = "insert into korMusic values (?,?,?,?,?,?,now())";
	String sql3 = "select korno FROM korMusic ORDER BY korno DESC";

	int result = 0;
	int korTitleCheck = 0;

	pstat2 = conn.prepareStatement(sql3);
	rs2 = pstat2.executeQuery();
	if (rs2.next()) {
		korno = rs2.getInt(1) + 1;
	} else {
		korno = 1;
	}
	
	// PreparedStatement 생성 => 테이블에 korTitle가 이미 있는지 체크
	pstat1 = conn.prepareStatement(sql1);
	pstat1.setString(1, korTitle);
	rs1 = pstat1.executeQuery();
	
	if (rs1.next()) {
		// 테이블에 이미 같은 곡이 있을경우
		korTitleCheck = 1;
	} else {
		// 같은 노래가 없는 경우 => 입력 가능
		pstat = conn.prepareStatement(sql2);
		pstat.setInt(1, korno);
		pstat.setString(2, korTitle);
		pstat.setString(3, korSinger);
		pstat.setString(4, korYoutube);
		pstat.setString(5, korKind);
		pstat.setString(6, userId);
		result = pstat.executeUpdate();
	}
	request.setAttribute("korTitleCheck", korTitleCheck);
	request.setAttribute("result", result);

	conn.close();
	rs1.close();
	rs2.close();
	pstat1.close();
	pstat2.close();
	%>
	<jsp:forward page="korWriteResult.jsp"></jsp:forward>
</body>
</html>