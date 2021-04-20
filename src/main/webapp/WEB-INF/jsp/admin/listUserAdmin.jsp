<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Barber X - Barber Shop Template</title>
<%@ include file="/WEB-INF/jsp/common-admin/css.jsp"%>
</head>
<body>
	<!-- Left Panel -->
	<%@include file="/WEB-INF/jsp/common-admin/assets.jsp"%>
	<!-- Right Panel -->
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<%@include file="/WEB-INF/jsp/common-admin/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/common-admin/breadcrumbs.jsp"%>

		<!-- /header -->
		<div class="content mt-3">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-body">
								<table id="bootstrap-data-table-export"
									class="table table-bordered">
									<tr>
										<th>User Email</th>
										<th>Full Name</th>
										<th>Gender</th>
										<th>Phone</th>
										<th>Role</th>
										<th></th>
									</tr>
									<c:forEach var="listUserRole" items="${listUserRole}">
										<tr>
											<td>${listUserRole.clients.userEmail}</td>
											<td>${listUserRole.clients.firstName}
												${listUserRole.clients.lastName}</td>
											<td>${listUserRole.clients.gender}</td>
											<td>${listUserRole.clients.phone}</td>
											<c:choose>
												<c:when test="${listUserRole.roles.roleId == 'AD'}">
													<td style="color: pink; font-weight: bold;">
														Administrator</td>

												</c:when>
												<c:otherwise>
													<td style="color: blue;">User</td>
												</c:otherwise>
											</c:choose>
										
											<td><a
												href="/admin/usermanager?userid=${listUserRole.userRoleId}"
												style="color: white;">
													<button type="button" class="btn btn-danger btn-sm"
														style="width: 80px">Detail</button>
											</a></td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="dataTables_paginate paging_simple_numbers"
							id="bootstrap-data-table-export_paginate">
							<ul class="pagination">
								<li class="paginate_button page-item previous"
									id="bootstrap-data-table-export_previous"><c:choose>
										<c:when test="${currentPage > 1}">
											<a href="/admin/userdetail?page=1"
												aria-controls="bootstrap-data-table-export"
												class="page-link">First</a>
										</c:when>
										<c:otherwise>
											<span><a href=""
												aria-controls="bootstrap-data-table-export"
												class="page-link">First</a></span>
										</c:otherwise>
									</c:choose></li>
								<li class="paginate_button page-item previous"
									id="bootstrap-data-table-export_previous"><c:choose>
										<c:when test="${currentPage > 1}">
											<a href="/admin/userdetail?page=${currentPage - 1}"
												aria-controls="bootstrap-data-table-export"
												class="page-link">Previous</a>
										</c:when>
										<c:otherwise>
											<span><a href=""
												aria-controls="bootstrap-data-table-export"
												class="page-link">Previous</a></span>
										</c:otherwise>
									</c:choose></li>
								<c:forEach var="i" begin="1" end="${totalPages}">
									<c:choose>
										<c:when test="${i==currentPage}">
											<li class="paginate_button page-item active"><a
												href="/admin/userdetail?page=1"
												aria-controls="bootstrap-data-table-export"
												class="page-link ">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li class="paginate_button page-item"><a
												href="/admin/userdetail?page=${i}"
												aria-controls="bootstrap-data-table-export"
												class="page-link ">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<li class="paginate_button page-item next"
									id="bootstrap-data-table-export_next"><c:choose>
										<c:when test="${currentPage < totalPages}">
											<a href="/admin/userdetail?page=${currentPage + 1}"
												aria-controls="bootstrap-data-table-export"
												class="page-link">Next</a>
										</c:when>
										<c:otherwise>
											<span><a href=""
												aria-controls="bootstrap-data-table-export"
												class="page-link">Next</a></span>
										</c:otherwise>
									</c:choose></li>
								<li class="paginate_button page-item next"
									id="bootstrap-data-table-export_next"><c:choose>
										<c:when test="${currentPage < totalPages}">
											<a href="/admin/userdetail?page=${totalPages}"
												aria-controls="bootstrap-data-table-export"
												class="page-link">Last</a>
										</c:when>
										<c:otherwise>
											<span><a href=""
												aria-controls="bootstrap-data-table-export"
												class="page-link">Last</a></span>
										</c:otherwise>
									</c:choose></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- .animated -->
		</div>
		<!-- .content -->
	</div>
	<!-- /#right-panel -->
	<%@include file="/WEB-INF/jsp/common-admin/script.jsp"%>

</body>
</html>