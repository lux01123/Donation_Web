<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add new donation</title>
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
				<form:form action="saveDonation" modelAttribute="donation"
					method="POST">
					<table>
						<tbody>
							<tr>
								<td><label>Mã đợt quyên góp</label></td>
								<td><form:input path="code" /></td>
							</tr>
							<tr>
								<td><label>Tên đợt quyên góp</label></td>
								<td><form:input path="name" /></td>
							</tr>
							<tr>
								<td><label>Ngày bắt đầu</label></td>
								<td><form:input path="startDate" placeholder="mm/dd/yy" /></td>
							</tr>
							<tr>
								<td><label>Ngày kết thúc</label></td>
								<td><form:input path="endDate" placeholder="mm/dd/yy" /></td>
							</tr>
							<tr>
								<td><label>Tổ chức</label></td>
								<td><form:input path="organizationName" /></td>
							</tr>
							<tr>
								<td><label>Số điện thoại</label></td>
								<td><form:input path="phoneNumber" /></td>
							</tr>
							<tr>
								<td><label>Nội dung</label></td>
								<td><form:input path="description" /></td>
							</tr>
						</tbody>
					</table>
					<div>
						<a href="${pageContext.request.contextPath}/donation/listFind"
							id="close-button">Close</a> <input type="submit" value="Save"
							class="save" id="save-button" />
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>