<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${kornoCheck != 1}">
			<script type="text/javascript">
				alert("유효하지 않은 노래입니다.");
				location.href = "abroadMainBoard.jsp";
			</script>
		</c:when>
		<c:when test="${result == 1}">
			<script type="text/javascript">
				alert("삭제 완료");
				location.href = "korMainBoard.jsp";
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