<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Danh sách người dùng</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- Custom css -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/adminPage.css" />
</head>

<body>
	<div class="container">
		<!-- Content -->
		<h2 align="left" class="text-primary">Danh sách người dùng</h2>
		<hr />

		<!-- Add user link -->
		<div class="add-button">
			<c:url var="addUserLink" value="/user/formAddUser">
			</c:url>
			<a href="${addUserLink}">Thêm mới</a>
		</div>

		<!-- Find user -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<form class="form-inline" action="<c:url value = "/user/listFind "/>">
			<input class="form-control mr-sm-2" name="kw" type="text"
				placeholder="Nhập từ khóa">
			<button class="btn btn-success" type="submit">Search</button>
		</form>
		</nav>

		<!-- Table to show the data fetched from the database -->
		<table class="table" align="center">
			<thead>
				<tr>
					<th>Họ tên</th>
					<th>Email</th>
					<th>Số điện thoại</th>
					<th>Tài khoản</th>
					<th>Vai trò</th>
					<th>Trạng thái</th>
					<th>Hành động</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="tempUser" items="${users}">

					<!-- Link for action -->

					<c:url var="updateLink" value="/user/showFormForUpdate">
						<c:param name="userId" value="${tempUser.id}" />
					</c:url>
					<c:url var="deleteLink" value="/user/delete">
						<c:param name="userId" value="${tempUser.id}" />
					</c:url>
					<c:url var="infoLink" value="/user/showInfo">
						<c:param name="userId" value="${tempUser.id}" />
					</c:url>
					<c:url var="changeStatusLink" value="/user/changeStatus">
						<c:param name="userId" value="${tempUser.id}" />
					</c:url>

					<!-- Display info -->
					<tr>
						<td>${tempUser.fullName}</td>
						<td>${tempUser.email}</td>
						<td>${tempUser.phoneNumber}</td>
						<td>${tempUser.userName}</td>
						<td>${tempUser.role}</td>
						<!-- Check status for display -->
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

						<td>
							<ul class="pagination">
								<li class="page-item">
								<a class="page-link bg-success text-white" href="${updateLink}">Cập nhật</a> 
								<a class="page-link bg-primary text-white" href="${infoLink}">Chi tiết</a>
								<a class="page-link bg-danger text-white" href="${deleteLink}"
									onclick="if(!(confirm('Bạn có muốn xóa tài khoản này ?'))) return false">Xóa</a>
								<c:set var="stsChange" value="Khóa" /> <c:choose>
									<c:when test="${tempUser.status mod 2 == 0}">
										<c:set var="stsChange" value="Khóa" />
									</c:when>
									<c:otherwise>
										<c:set var="stsChange" value="Mở" />
									</c:otherwise>
								</c:choose> 
								<a class="page-link bg-warning text-dark" href="${changeStatusLink}"
									onclick="if(!(confirm('Bạn có muốn khóa/mở tài khoản này ?'))) return false">${stsChange}</a>
								</li>
							</ul>
						</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- Display number result -->
		<div>
			<h6>Found ${total} result</h6>
		</div>

		<!-- Pagination links in spring mvc -->
		<div>
			<ul class="pagination">
				<c:forEach begin="1" end="${counter}" var="i">
					<li class="page-item"><a class="page-link"
						href="<c:url value = "/user/listFind/" />?page=${i}">${i}</a></li>
				</c:forEach>
			</ul>
		</div>

	</div>
</body>
</html>