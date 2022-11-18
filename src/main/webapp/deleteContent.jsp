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
	String contentNo = request.getParameter("contentNo");
	
	PreparedStatement pstat = null;
	ResultSet rs = null;
	
	PreparedStatement pstat1 = null;

	
	
	String sql1 = "select * from contentAll where contentNo = ?";
	String sql2 = "delete from contentAll where contentNo = ?";
	
	
	pstat = conn.prepareStatement(sql1);
	pstat.setString(1, contentNo);
	rs = pstat.executeQuery();
	
	int contentNoCheck = 0;
	int result = 0;
	if (rs.next()) {
		if (rs.getString(1).equals(contentNo)){
			contentNoCheck = 1;	
		}
		pstat1 = conn.prepareStatement(sql2);
		pstat1.setString(1, contentNo);
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