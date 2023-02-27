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
<!-- Customer CSS -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/addForm.css" />
</head>
<body>
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

	<!-- User donation -->
	<table class="table" align="center">
		<thead>
			<tr>
				<th>Họ tên</th>
				<th>Tiền quyên góp</th>
				<th>Nội dung</th>
				<th>Trạng thái</th>
				<th>Hành động</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="userDona" items="${theList}">
				<!-- Link for action -->
				<c:url var="confirmSlink" value="/donation/confirmS">
					<c:param name="theId" value="${userDona.id}" />
				</c:url>
				<c:url var="confirmFlink" value="/donation/confirmF">
					<c:param name="theId" value="${userDona.id}" />
				</c:url>
				<tr>
					<td>${userDona.name}</td>
					<td>${userDona.money}</td>
					<td>${userDona.text}</td>
					<c:set var="sts" value="Chưa xác nhận" />
					<c:choose>
						<c:when test="${userDona.status == 1}">
							<c:set var="sts" value="Đã xác nhận" />
						</c:when>
						<c:when test="${userDona.status == 2}">
							<c:set var="sts" value="Xác nhận không thành công" />
						</c:when>
						<c:otherwise>
							<c:set var="sts" value="Chưa xác nhận" />
						</c:otherwise>
					</c:choose>
					<td>${sts}</td>
					<td>
						<ul class="pagination">
							<li class="page-item"><c:set var="confirmVisible"
									value="hidden;" /> <c:choose>
									<c:when test="${userDona.status == 0}">
										<c:set var="confirmVisible" value="" />
									</c:when>
									<c:otherwise>
										<c:set var="confirmVisible" value="hidden;" />
									</c:otherwise>
								</c:choose> <a class="page-link" href="${confirmSlink}"
								style="visibility:${confirmVisible}"
								onclick="if(!(confirm('Bạn có muốn xác nhận quyên góp này ?'))) return false">Xác
									nhận</a> <a class="page-link" href="${confirmFlink}"
								style="visibility:${confirmVisible}"
								onclick="if(!(confirm('Bạn có muốn hủy xác nhận quyên góp này ?'))) return false">Hủy
									xác nhận</a></li>
						</ul>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- Close button -->
	<div>
		<a href="${pageContext.request.contextPath}/donation/listFind"
			id="close-button">Close</a>
	</div>
</body>
</html>