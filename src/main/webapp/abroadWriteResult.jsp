<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해외음악 삽입 결과</title>
</head>
<body>
	<c:choose>
		<c:when test="${abrTitleCheck > 0}">
			<script type="text/javascript">
				alert("이미 등록된 노래입니다.");
				history.go(-1);
			</script>
		</c:when>

		<c:when test="${result > 0}">
			<script type="text/javascript">
				alert("노래를 등록했습니다.");
				location.href = "boardQuery.jsp?tab=abroadMusic";
			</script>
		</c:when>

		<c:when test="${result <= 0}">
			<script type="text/javascript">
				alert("이미 등록된 노래입니다.");
				history.go(-1);
			</script>
		</c:when>
	</c:choose>
</body>
</html>