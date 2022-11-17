<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과 페이지</title>
</head>
<body>
	<c:choose>
		<c:when test="${userCheck == 1}">
			<script type="text/javascript">
				location.href = "korMainBoard.jsp";
			</script>
		</c:when>

		<c:when test="${userCheck == 0}">
			<script type="text/javascript">
				alert("비밀번호가 일치하지 않습니다.");
				history.go(-1);
			</script>
		</c:when>

		<c:when test="${userCheck == -1}">
			<script type="text/javascript">
				alert("존재하지 않는 아이디입니다.");
				history.go(-1);
			</script>
		</c:when>
	</c:choose>
</body>
</html>
