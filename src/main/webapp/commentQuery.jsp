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
<title>댓글 등록 Logic</title>
</head>
<body> 
	<%@ include file="dbconn.jsp"%>

	<%
	request.setCharacterEncoding("utf-8");
	int commentNo;
	int contentNo = Integer.parseInt((String)session.getAttribute("contentNo"));
	String commentWrite = request.getParameter("commentWrite");
	String userNick = (String) session.getAttribute("userId");
	
	commentWrite = commentWrite.replace("\r\n", "<br>");
	
	PreparedStatement pstat = null;
	ResultSet rs = null;

	PreparedStatement pstat1 = null;
	ResultSet rs1 = null;

	PreparedStatement pstat2 = null;
	ResultSet rs2 = null;

	String sql1 = "select * from comment where commentNo = ?";
	String sql2 = "insert into comment values (?,?,?,?,now())";
	String sql3 = "select commentNo FROM comment ORDER BY commentNo DESC";

	int result = 0;
	int commentNoCheck = 0;

	pstat2 = conn.prepareStatement(sql3);
	rs2 = pstat2.executeQuery();
	if (rs2.next()) {
		commentNo = rs2.getInt(1) + 1;
	} else {
		commentNo = 1;
	}
	
	// PreparedStatement 생성 => 테이블에 abrTitle가 이미 있는지 체크
	pstat1 = conn.prepareStatement(sql1);
	pstat1.setInt(1, commentNo);
	rs1 = pstat1.executeQuery();
	
	if (rs1.next()) {
		// 테이블에 이미 같은 곡이 있을경우
		commentNoCheck = 1;
	} else {
		// 같은 노래가 없는 경우 => 입력 가능
		pstat = conn.prepareStatement(sql2);
		pstat.setInt(1, commentNo);
		pstat.setString(2, commentWrite);
		pstat.setString(3, userNick);
		pstat.setInt(4, contentNo);
		result = pstat.executeUpdate();
	}
	request.setAttribute("commentNoCheck", commentNoCheck);
	request.setAttribute("result", result);

	conn.close();
	rs1.close();
	rs2.close();
	pstat1.close();
	pstat2.close();
	%>
	<jsp:forward page="commentWriteResult.jsp"></jsp:forward>
</body>
</html>