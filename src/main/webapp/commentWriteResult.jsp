<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국내음악 삽입 결과</title>
</head>
<body>
	<%
	int contentNo = Integer.parseInt((String) session.getAttribute("contentNo"));
	%>
	<c:choose>
		<c:when test="${commentNoCheck > 0}">
			<script type="text/javascript">
				alert("댓글 등록 실패.");
				history.go(-1);
			</script>
		</c:when>

		<c:when test="${result > 0}">
			<script type="text/javascript">
				alert("댓글을 등록했습니다.");
				location.href = "contentSee.jsp?contentNo=<%=contentNo%>";
			</script>
		</c:when>

		<c:when test="${result <= 0}">
			<script type="text/javascript">
				alert("댓글 등록 실패");
				history.go(-1);
			</script>
		</c:when>
	</c:choose>
</body>
</html>
