<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Donation infomation</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- Custom CSS -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/addForm.css" />
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
	src="${pageContext.request.contextPath}/resources/js/userdona2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>

<body>		
	<!-- Form donation -->
	<div class="form-popup" id="myForm">
		<form class="form-container">
			<h3 align="left" class="text-primary">
				Quyên góp 
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
	
	<div class="container">
		<div id="wrapper">
			<div id="header">
				<h2>Chi tiết đợt quyên góp</h2>
			</div>
		</div>
		
			<!-- Donation -->
			<table class="table" align="center">
				<thead>
					<tr>
						<th>Mã đợt quyên góp</th>
						<th>Tên đợt quyên góp</th>
						<th>Ngày bắt đầu</th>
						<th>Ngày kết thúc</th>
						<th>Tổng tiền quyên góp</th>
						<th>Trạng thái</th>
						<th>Tổ chức</th>
						<th>Số điện thoại</th>
						<th>Nội dung</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="tempDona" value="${donation}" />
					<tr>
						<td>${tempDona.code}</td>
						<td>${tempDona.name}</td>
						<td>${tempDona.startDate}</td>
						<td>${tempDona.endDate}</td>
						<td>${tempDona.money}VND</td>
						<c:set var="sts" value="Mới tạo" />
						<c:choose>
							<c:when test="${tempDona.status == 0}">
								<c:set var="sts" value="Mới tạo" />
							</c:when>
							<c:when test="${tempDona.status == 1}">
								<c:set var="sts" value="Đang quyên góp" />
							</c:when>
							<c:when test="${tempDona.status == 2}">
								<c:set var="sts" value="Kết thúc" />
							</c:when>
							<c:otherwise>
								<c:set var="sts" value="Đã đóng" />
							</c:otherwise>
						</c:choose>
						<td>${sts}</td>
						<td>${tempDona.organizationName}</td>
						<td>${tempDona.phoneNumber}</td>
						<td>${tempDona.description}</td>
					</tr>
				</tbody>
			</table>

			<!-- Button donation -->
			<c:set var="tempDonaForm" value="${donation}" />
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
			<button style="visibility:${stsVisible}" onclick="showDona('${tempDonaForm.id}')">Quyên góp</button>

			<!-- List user -->
			<h5>Cá nhân quyên góp</h5>
			<!-- User donation -->
			<table class="table" align="center">
				<thead>
					<tr>
						<th>Họ tên</th>
						<th>Tiền quyên góp</th>
						<th>Nội dung</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="userDona" items="${theList}">
						<tr>
							<td>${userDona.name}</td>
							<td>${userDona.money}</td>
							<td>${userDona.text}</td>							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- Close button -->
			<div>
				<a href="${pageContext.request.contextPath}/home/listFind"
					id="close-button">Close</a>
			</div>
	</div>
</body>
</html>