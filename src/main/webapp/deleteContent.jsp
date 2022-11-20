<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문글 삭제 Logic</title>
</head>
<body>

	<%@ include file="dbconn.jsp"%>

	<%
	int contentNo = Integer.parseInt((String) session.getAttribute("contentNo"));

	PreparedStatement pstat = null;
	ResultSet rs = null;

	PreparedStatement pstat1 = null;

	PreparedStatement pstat2 = null;
	ResultSet rs2 = null;

	PreparedStatement pstat3 = null;
	ResultSet rs3 = null;

	String sql1 = "select * from contentAll where contentNo = ?";
	String sql2 = "delete from contentAll where contentNo = ?";
	String sql3 = "delete from comment where contentNo = ?";
	String sql4 = "select * from comment where contentNo = ?";

	pstat = conn.prepareStatement(sql1);
	pstat.setInt(1, contentNo);
	rs = pstat.executeQuery();

	pstat2 = conn.prepareStatement(sql4);
	pstat2.setInt(1, contentNo);
	rs2 = pstat2.executeQuery();

	
	int contentNoCheck = 0;
	int result = 0;
	int result1 = 0;
	if (rs2.next()) {
		pstat3 = conn.prepareStatement(sql3);
		pstat3.setInt(1, contentNo);
		result1 = pstat3.executeUpdate();
	}
	if (rs.next()) {
		if (rs.getString(1).equals(Integer.toString(contentNo))) {
			contentNoCheck = 1;
		}
		pstat1 = conn.prepareStatement(sql2);
		pstat1.setInt(1, contentNo);
		result = pstat1.executeUpdate();
	} else {
		contentNoCheck = -1;
	}
	request.setAttribute("contentNoCheck", contentNoCheck);
	request.setAttribute("result", result);
	conn.close();
	rs.close();
	pstat.close();
	%>
	<jsp:forward page="deleteContentAction.jsp"></jsp:forward>
</body>
</html>