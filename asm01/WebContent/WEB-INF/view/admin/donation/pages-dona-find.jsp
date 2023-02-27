<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Danh sách đợt quyên góp</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- Custom css -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/adminPage.css" />
<script src="${pageContext.request.contextPath}/resources/js/mainJs.js"></script>
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
<!-- Java script -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>

<body>
	<!-- Form update -->
	<div class="form-popup" id="myForm">
		<form class="form-container">
			<h3 align="left" class="text-primary">Cập nhật thông tin</h3>
			<table>
				<tbody>
					<tr>
						<td><input id="idDona" type="text"
							style="visibility: hidden;"></td>
					</tr>
					<tr>
						<td>Mã đợt quyên góp:</td>
						<td><input id="code" type="text" class="" value="" /></td>
					</tr>
					<tr>
						<td>Tên đợt quyên góp:</td>
						<td><input id="name" type="text" class="" value="" /></td>
					</tr>
					<tr>
						<td>Ngày bắt đầu:</td>
						<td><input id="startDate" type="text" class="" value="" /></td>
					</tr>
					<tr>
						<td>Ngày kết thúc:</td>
						<td><input id="endDate" type="text" class="" value="" /></td>
					</tr>
					<tr>
						<td>Tổ chức</td>
						<td><input id="organizationName" type="text" class=""
							value="" /></td>
					</tr>
					<tr>
						<td>Số điện thoại</td>
						<td><input id="phoneNumber" type="text" class="" value="" /></td>
					</tr>
					<tr>
						<td>Nội dung</td>
						<td><input id="description" type="text" class="" value="" /></td>
					</tr>
				</tbody>
			</table>
			<button onclick="closeForm()" type="button" class="btn bg-dark text-white">Đóng</button>
			<button onclick="saveEdit()" type="submit" class="btn bg-primary text-white">Lưu</button>
		</form>
	</div>

	<!-- Display -->
	<div class="container">
		<!-- Content -->
		<h2 align="left" class="text-primary">Danh sách đợt quyên góp</h2>
		<hr />

		<!-- Add donation link -->
		<div class="add-button">
			<c:url var="addDonaLink" value="/donation/formAddDona">
			</c:url>
			<a href="${addDonaLink}">Thêm mới</a>
		</div>

		<!-- Find donation -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<form class="form-inline"
				action="<c:url value = "/donation/listFind "/>">
				<input class="form-control mr-sm-2" name="kw" type="text"
					placeholder="Nhập từ khóa">
				<button class="btn btn-success" type="submit">Search</button>
			</form>
		</nav>

		<!-- Table to show the data fetched from the database -->
		<table class="table" align="center">
			<thead>
				<tr>
					<th>Mã</th>
					<th>Tên</th>
					<th>Ngày bắt đầu</th>
					<th>Ngày kết thúc</th>
					<th>Tổ chức</th>
					<th>Số điện thoại</th>
					<th>Tổng tiền</th>
					<th>Trạng thái</th>
					<th>Hành động</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tempDona" items="${donations}">
					<!-- Link for action -->
					<c:url var="changeStatusLink" value="/donation/changeStatus">
						<c:param name="donaId" value="${tempDona.id}" />
					</c:url>
					<c:url var="updateLink" value="/donation/showFormForUpdate">
						<c:param name="donaId" value="${tempDona.id}" />
					</c:url>
					<c:url var="deleteLink" value="/donation/delete">
						<c:param name="donaId" value="${tempDona.id}" />
					</c:url>
					<c:url var="infoLink" value="/donation/showInfo">
						<c:param name="donaId" value="${tempDona.id}" />
					</c:url>
					<!-- Display info -->
					<tr>
						<td>${tempDona.code}</td>
						<td>${tempDona.name}</td>
						<td>${tempDona.startDate}</td>
						<td>${tempDona.endDate}</td>
						<td>${tempDona.organizationName}</td>
						<td>${tempDona.phoneNumber}</td>
						<td>${tempDona.money}VND</td>
						<!-- Check status for display -->
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
						<td>
							<ul class="pagination">
								<li class="page-item">
									<!-- Show info --> 
									<a class="page-link bg-primary text-white" href="${infoLink}">Chi tiết</a>	
									<!-- Change status -->
									<c:set var="stsChange" value="Quyên góp" /> 
									<c:set var="stsVisible" value="" /> 
									<c:choose>
										<c:when test="${tempDona.status == 0}">
											<c:set var="stsChange" value="Quyên góp" />
										</c:when>
										<c:when test="${tempDona.status == 1}">
											<c:set var="stsChange" value="Kết thúc" />
										</c:when>
										<c:when test="${tempDona.status == 2}">
											<c:set var="stsChange" value="Đóng" />
										</c:when>
										<c:otherwise>
											<c:set var="stsChange" value="Đã kết thúc" />
											<c:set var="stsVisible" value="hidden;" />
										</c:otherwise>
									</c:choose> 
									<a class="page-link bg-success text-white" href="${changeStatusLink}"
									style="visibility:${stsVisible}"
									onclick="if(!(confirm('Bạn có muốn thay đổi trạng thái ?'))) return false">${stsChange}</a>
									<!-- Update info -->
									<button id="buttonEdit" class="open-button" style="visibility:${stsVisible}"
										onclick="showEdit('${tempDona.id}')">Cập nhật</button> 
									<!-- Delete donation --> <c:set var="deleVisible" value="" />
									<c:choose>
										<c:when test="${tempDona.status != 0}">
											<c:set var="deleVisible" value="hidden;" />
										</c:when>
									</c:choose> <a class="page-link bg-danger text-white" href="${deleteLink}"
									style="visibility:${deleVisible}"
									onclick="if(!(confirm('Bạn có muốn xóa đợt quyên góp này ?'))) return false">Xóa</a>
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
						href="<c:url value = "/donation/listFind/" />?page=${i}">${i}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>