<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		Connection conn = null;
	
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcURL = "jdbc:mysql://localhost:3306/userInfoDB";
		String dbUser = "";
		String dbPass = "password";
		
		
		conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);
	%>

</body>
</html>