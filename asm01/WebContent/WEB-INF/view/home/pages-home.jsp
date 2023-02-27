<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- Custom css -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/adminPage.css" />
<style>
.form-popup {
	display: none;
	position: absolute;
	border: 3px solid #f1f1f1;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	z-index: 9;
	background-color: white;
}

.container {
	z-index: 1;
}
</style>
<!-- Script -->
<script
	src="${pageContext.request.contextPath}/resources/js/userdona.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>

<body>
	<!-- Form donation -->
	<div class="form-popup" id="myForm">
		<form class="form-container">
			<h3 align="left" class="text-primary">
				Quyên góp <input id="code" type="text" class="text-primary" value="" />
			</h3>
			<table>
				<tbody>
					<tr>
						<td><input id="idDona" type="text"
							style="visibility: hidden;"></td>
					</tr>
					<tr>
						<td>Họ tên</td>
						<td><input id="name" name = "uname" type="text" class="" value="" /></td>
					</tr>
					<tr>
						<td>Số tiền quyên góp</td>
						<td><input id="money" name = "dmoney" type="number" class="" value="" /></td>
					</tr>
					<tr>
						<td>Lời nhắn</td>
						<td><input id="text" type="text" class="" value="" /></td>
					</tr>
				</tbody>
			</table>
			<button onclick="closeForm()" type="button" class="btn bg-dark text-white">Đóng</button>
			<button onclick="saveUserDona()" type="button" class="btn bg-success text-white" id="submitDona">Quyên
				góp</button>
		</form>
	</div>
	<!-- Display -->
	<div class="container">
		<!-- Content -->
		<h2 align="center" class="text-primary">Các đợt quyên góp</h2>
		<hr />
		<!-- Table to show the data fetched from the database -->
		<table class="table" align="center">
			<thead>
				<tr>
					<th>Tên</th>
					<th>Ngày bắt đầu</th>
					<th>Ngày kết thúc</th>
					<th>Tổ chức</th>
					<th>Số điện thoại</th>
					<th>Hành động</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tempDona" items="${donations}">
					<!-- Link for action -->
					<c:url var="infoLink" value="/home/showInfo">
						<c:param name="donaId" value="${tempDona.id}" />
					</c:url>
					<!-- Display info -->
					<tr>
						<td><a class="page-link" href="${infoLink}">${tempDona.name}</a>
						</td>
						<td>${tempDona.startDate}</td>
						<td>${tempDona.endDate}</td>
						<td>${tempDona.organizationName}</td>
						<td>${tempDona.money}VND</td>
						<!-- Check status for display -->
						<c:set var="stsVisible" value="hidden;" />
						<c:set var="sts" value="Mới tạo" />
						<c:choose>
							<c:when test="${tempDona.status == 0}">
								<c:set var="sts" value="" />
								<c:set var="stsVisible" value="hidden;" />
							</c:when>
							<c:when test="${tempDona.status == 1}">
								<c:set var="sts" value="Quyên góp" />
								<c:set var="stsVisible" value="" />
							</c:when>
							<c:when test="${tempDona.status == 2}">
								<c:set var="sts" value="" />
								<c:set var="stsVisible" value="hidden;" />
							</c:when>
							<c:otherwise>
								<c:set var="sts" value="" />
								<c:set var="stsVisible" value="hidden;" />
							</c:otherwise>
						</c:choose>
						<td>
							<button style="visibility:${stsVisible}"
								onclick="showDona('${tempDona.id}', '${tempDona.name}')">${sts}</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- Pagination links in spring mvc -->
		<div>
			<ul class="pagination">
				<c:forEach begin="1" end="${counter}" var="i">
					<li class="page-item"><a class="page-link"
						href="<c:url value = "/home/listFind/" />?page=${i}">${i}</a></li>
				</c:forEach>
			</ul>
		</div>

		<!-- Footer -->
		<footer class="bg-primary text-white text-center text-lg-start">
			<!-- Grid container -->
			<div class="container p-4">
				<!--Grid row-->
				<div class="row">
					<!--Grid column-->
					<div class="col-lg-6 col-md-12 mb-4 mb-md-0">
						<h5 class="text-uppercase">Footer Content</h5>
						<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.
							Iste atque ea quis molestias. Fugiat pariatur maxime quis culpa
							corporis vitae repudiandae aliquam voluptatem veniam, est atque
							cumque eum delectus sint!</p>
					</div>
					<!--Grid column-->
					<!--Grid column-->
					<div class="col-lg-3 col-md-6 mb-4 mb-md-0">
						<h5 class="text-uppercase">Links</h5>
						<ul class="list-unstyled mb-0">
							<li><a href="#!" class="text-white">Link 1</a></li>
							<li><a href="#!" class="text-white">Link 2</a></li>
							<li><a href="#!" class="text-white">Link 3</a></li>
							<li><a href="#!" class="text-white">Link 4</a></li>
						</ul>
					</div>
					<!--Grid column-->
					<!--Grid column-->
					<div class="col-lg-3 col-md-6 mb-4 mb-md-0">
						<h5 class="text-uppercase mb-0">Links</h5>
						<ul class="list-unstyled">
							<li><a href="#!" class="text-white">Link 1</a></li>
							<li><a href="#!" class="text-white">Link 2</a></li>
							<li><a href="#!" class="text-white">Link 3</a></li>
							<li><a href="#!" class="text-white">Link 4</a></li>
						</ul>
					</div>
					<!--Grid column-->
				</div>
				<!--Grid row-->
			</div>
			<!-- Grid container -->
			<!-- Copyright -->
			<div class="text-center p-3"
				style="background-color: rgba(0, 0, 0, 0.2);">
				© 2023 Copyright: <a class="text-white"
					href="https://mdbootstrap.com/">MDBootstrap.com</a>
			</div>
			<!-- Copyright -->
		</footer>

	</div>
</body>
</html>