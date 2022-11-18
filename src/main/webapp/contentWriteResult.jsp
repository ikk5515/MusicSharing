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
	<c:choose>
		<c:when test="${result > 0}">
			<script type="text/javascript">
				alert("질문을 등록했습니다.");
				location.href = "qaMainBoard.jsp";
			</script>
		</c:when>

		<c:when test="${result <= 0}">
			<script type="text/javascript">
				alert("등록 실패");
				history.go(-1);
			</script>
		</c:when>
	</c:choose>
</body>
</html>
