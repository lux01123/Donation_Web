<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>User infomation</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Customer CSS -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/addForm.css" />

</head>

<body>
	<div class="parent">
		<div class="child">
			<div id="wrapper">
				<div id="header">
					<h2>Thông tin người dùng</h2>
				</div>
			</div>

			<div id="container">
				<form:form>
					<c:set var="tempUser" value="${user}" />
					<table>
						<tbody>
							<tr>
								<td><label>Họ và tên:</label></td>
								<td>${tempUser.fullName}</td>
							</tr>
							<tr>
								<td><label>Email</label></td>
								<td>${tempUser.email}</td>
							</tr>
							<tr>
								<td><label>Số điện thoại</label></td>
								<td>${tempUser.phoneNumber}</td>
							</tr>
							<tr>
								<td><label>Địa chỉ</label></td>
								<td>${tempUser.userName}</td>
							</tr>
							<tr>
								<td><label>Tài khoản</label></td>
								<td>${tempUser.role}</td>
							</tr>
							<tr>
								<td><label>Mật khẩu</label></td>
								<td>${tempUser.password}</td>
							</tr>
							<tr>
								<td><label>Trạng thái</label></td>
								<c:set var="sts" value="Hoạt động" />
								<c:choose>
									<c:when test="${tempUser.status mod 2 == 0}">
										<c:set var="sts" value="Hoạt động" />
									</c:when>
									<c:otherwise>
										<c:set var="sts" value="Đã khóa" />
									</c:otherwise>
								</c:choose>
								<td>${sts}</td>
							</tr>
						</tbody>
					</table>

					<div>
						<a href="${pageContext.request.contextPath}/user/listFind"
							id="close-button">Close</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>