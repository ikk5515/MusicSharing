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
	String commentNo = request.getParameter("commentNo");
	
	PreparedStatement pstat = null;
	ResultSet rs = null;
	
	PreparedStatement pstat1 = null;
	
		
	String sql1 = "select * from comment where commentNo = ?";
	String sql2 = "delete from comment where commentNo = ?";
	
	
	pstat = conn.prepareStatement(sql1);
	pstat.setString(1, commentNo);
	rs = pstat.executeQuery();
	
	int commentNoCheck = 0;
	int result = 0;
	if (rs.next()) {
		if (rs.getString(1).equals(commentNo)){
			commentNoCheck = 1;	
		}
		
		pstat1 = conn.prepareStatement(sql2);
		pstat1.setString(1, commentNo);
		result = pstat1.executeUpdate();
	}
	request.setAttribute("CommentNoCheck", commentNoCheck);
	request.setAttribute("result", result);
	conn.close();
	rs.close();
	pstat.close();
%>
	<jsp:forward page="deleteCommentAction.jsp"></jsp:forward>
</body>
</html>