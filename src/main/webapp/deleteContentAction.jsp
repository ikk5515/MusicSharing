<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문글 삭제 화면</title>
</head>
<body>
	<c:choose>
		<c:when test="${contentNoCheck != 1}">
			<script type="text/javascript">
				alert("유효하지 않은 글입니다.");
				location.href = "qaMainBoard.jsp";
			</script>
		</c:when>
		<c:when test="${result == 1}">
			<script type="text/javascript">
				alert("삭제 완료");
				location.href = "qaMainBoard.jsp";
			</script>
		</c:when>

		<c:when test="${result != 1}">
			<script type="text/javascript">
				alert("삭제 실패");
				history.go(-1);
			</script>
		</c:when>
	</c:choose>

</body>
</html>