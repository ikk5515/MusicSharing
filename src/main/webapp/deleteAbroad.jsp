<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해외음악 삭제 Logic</title>
</head>
<body>

	<%@ include file="dbconn.jsp"%>

	<%
	String abrno = request.getParameter("abrno");
	
	PreparedStatement pstat = null;
	ResultSet rs = null;
	
	PreparedStatement pstat1 = null;
	
	
	
	String sql1 = "select * from abroadMusic where abrno = ?";
	String sql2 = "delete from abroadMusic where abrno = ?";
	
	
	pstat = conn.prepareStatement(sql1);
	pstat.setString(1, abrno);
	rs = pstat.executeQuery();
	
	int abrnoCheck = 0;
	int result = 0;
	if (rs.next()) {
		if (rs.getString(1).equals(abrno)){
			abrnoCheck = 1;	
		}
		
		pstat1 = conn.prepareStatement(sql2);
		pstat1.setString(1, abrno);
		result = pstat1.executeUpdate();
	}
	request.setAttribute("abrnoCheck", abrnoCheck);
	request.setAttribute("result", result);
	conn.close();
	rs.close();
	pstat.close();
%>
	<jsp:forward page="deleteAbroadAction.jsp"></jsp:forward>
</body>
</html>