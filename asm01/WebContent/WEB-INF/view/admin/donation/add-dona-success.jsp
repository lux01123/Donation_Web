<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add donation success</title>
<!-- Customer CSS -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/addForm.css" />
</head>
<body>
	<div class="parent">
		<div class="child">
			<h1>Thêm đợt từ thiện / cập nhật thông tin thành công</h1>
			<div class="add-button">
				<c:url var="addDonationLink" value="/donation/listFind">
				</c:url>
				<a href="${addDonationLink}">Quay lại trang trước</a>
			</div>
		</div>
	</div>
</body>
</html>