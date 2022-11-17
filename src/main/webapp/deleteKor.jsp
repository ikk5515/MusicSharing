<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국내음악 삭제 Logic</title>
</head>
<body>

	<%@ include file="dbconn.jsp"%>

	<%
	String korno = request.getParameter("korno");
	
	PreparedStatement pstat = null;
	ResultSet rs = null;
	
	PreparedStatement pstat1 = null;

	
	
	String sql1 = "select * from korMusic where korno = ?";
	String sql2 = "delete from korMusic where korno = ?";
	
	
	pstat = conn.prepareStatement(sql1);
	pstat.setString(1, korno);
	rs = pstat.executeQuery();
	
	int kornoCheck = 0;
	int result = 0;
	if (rs.next()) {
		if (rs.getString(1).equals(korno)){
			kornoCheck = 1;	
		}
		
		pstat1 = conn.prepareStatement(sql2);
		pstat1.setString(1, korno);
		result = pstat1.executeUpdate();
	} else {
		kornoCheck = -1;
	}
	request.setAttribute("kornoCheck", kornoCheck);
	request.setAttribute("result", result);
	conn.close();
	rs.close();
	pstat.close();
%>
	<jsp:forward page="deleteKorAction.jsp"></jsp:forward>
</body>
</html>