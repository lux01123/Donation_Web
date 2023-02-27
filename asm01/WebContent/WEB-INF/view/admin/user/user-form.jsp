<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>Add new user</title>

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
					<h2>Thêm mới</h2>
				</div>
			</div>

			<div id="container">
				<form:form action="saveUser" modelAttribute="user" method="POST">
					<form:hidden path="id" />
					<table>
						<tbody>
							<tr>
								<td><label>Họ và tên:</label></td>
								<td><form:input path="fullName" /></td>
							</tr>
							<tr>
								<td><label>Email</label></td>
								<td><form:input path="email" /></td>
							</tr>
							<tr>
								<td><label>Số điện thoại</label></td>
								<td><form:input path="phoneNumber" /></td>
							</tr>
							<tr>
								<td><label>Địa chỉ</label></td>
								<td><form:input path="address" /></td>
							</tr>
							<tr>
								<td><label>Tài khoản</label></td>
								<td><form:input path="userName" /></td>
							</tr>
							<tr>
								<td><label>Mật khẩu</label></td>
								<td><form:input path="password" /></td>
							</tr>
						</tbody>
					</table>
					<label>Chọn loại vai trò</label>
					<form:select path="role">
						<form:option value="User" label="User" />
						<form:option value="Admin" label="Admin" />
					</form:select>
					<div>
						<a href="${pageContext.request.contextPath}/user/listFind"
							id="close-button">Close</a> <input type="submit" value="Save"
							class="save" id="save-button" />
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>