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
<title>해외음악 삽입 Logic</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>

	<%
	request.setCharacterEncoding("utf-8");
	int abrno;
	String abrTitle = request.getParameter("abrTitle");
	String abrSinger = request.getParameter("abrSinger");
	String abrYoutube = request.getParameter("abrYoutube");
	String abrKind = request.getParameter("abrKind");
	String userId = (String) session.getAttribute("userId");

	PreparedStatement pstat = null;
	ResultSet rs = null;

	PreparedStatement pstat1 = null;
	ResultSet rs1 = null;

	PreparedStatement pstat2 = null;
	ResultSet rs2 = null;

	String sql1 = "select * from abroadMusic where abrTitle = ?";
	String sql2 = "insert into abroadMusic values (?,?,?,?,?,?,now())";
	String sql3 = "select abrno FROM abroadMusic ORDER BY abrno DESC";

	int result = 0;
	int abrTitleCheck = 0;

	pstat2 = conn.prepareStatement(sql3);
	rs2 = pstat2.executeQuery();
	if (rs2.next()) {
		abrno = rs2.getInt(1) + 1;
	} else {
		abrno = 1;
	}
	
	// PreparedStatement 생성 => 테이블에 abrTitle가 이미 있는지 체크
	pstat1 = conn.prepareStatement(sql1);
	pstat1.setString(1, abrTitle);
	rs1 = pstat1.executeQuery();
	
	if (rs1.next()) {
		// 테이블에 이미 같은 곡이 있을경우
		abrTitleCheck = 1;
	} else {
		// 같은 노래가 없는 경우 => 입력 가능
		pstat = conn.prepareStatement(sql2);
		pstat.setInt(1, abrno);
		pstat.setString(2, abrTitle);
		pstat.setString(3, abrSinger);
		pstat.setString(4, abrYoutube);
		pstat.setString(5, abrKind);
		pstat.setString(6, userId);
		result = pstat.executeUpdate();
	}
	request.setAttribute("abrTitleCheck", abrTitleCheck);
	request.setAttribute("result", result);

	conn.close();
	rs1.close();
	rs2.close();
	pstat1.close();
	pstat2.close();
	%>
	<jsp:forward page="abroadWriteResult.jsp"></jsp:forward>
</body>
</html>