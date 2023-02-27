<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add user success</title>
<!-- Customer CSS -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/addForm.css" />
</head>
<body>
	<div class="parent">
		<div class="child">
			<h1>Thêm người dùng mới / cập nhật thông tin vào danh sách thành
				công</h1>
			<div class="add-button">
				<c:url var="addUserLink" value="/user/listFind">
				</c:url>
				<a href="${addUserLink}">Quay lại trang trước</a>
			</div>
		</div>
	</div>
</body>
</html>