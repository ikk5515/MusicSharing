<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과 페이지</title>
</head>
<body>
	<c:choose>
		<c:when test="${userIdCheck > 0}">
			<script type="text/javascript">
				alert("이미 등록된 아이디입니다.");
				history.go(-1);
			</script>
		</c:when>

		<c:when test="${userEmailCheck > 0}">
			<script type="text/javascript">
				alert("이미 등록된 이메일입니다.");
				history.go(-1);
			</script>
		</c:when>

		<c:when test="${userNickCheck > 0}">
			<script type="text/javascript">
				alert("이미 등록된 닉네임입니다.");
				history.go(-1);
			</script>
		</c:when>

		<c:when test="${result > 0}">
			<script type="text/javascript">
				alert("회원가입을 축하합니다.");
				location.href = "Login.jsp";
			</script>
		</c:when>

		<c:when test="${result <= 0}">
			<script type="text/javascript">
				alert("회원가입 실패");
				history.go(-1);
			</script>
		</c:when>
	</c:choose>
</body>
</html>