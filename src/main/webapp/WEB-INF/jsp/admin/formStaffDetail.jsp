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
	<%@ include file="/WEB-INF/jsp/common-admin/assets.jsp"%>
	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<%@ include file="/WEB-INF/jsp/common-admin/header.jsp"%>
		<div class="content mt-3">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="col-md-8 col-sm-12 col-xs-8">
									<a href="<%=request.getContextPath()%>/admin/new/staff"
										class="btn btn-danger my-2 my-sm-0">New Staff</a>
								</div>							
							</div>
							<c:choose>
								<c:when test="${empty listStaffs}">
									<img src="/images/no-data.png"
										style="margin: auto; position: absolute; top: 140%; left: 42%;">
								</c:when>
								<c:otherwise>

									<div class="card-body">
										<table id="bootstrap-data-table-export"
											class="table table-bordered">

											<tr>
												<th>Staff Name</th>
												<th>Time Start</th>
												<th>Time End</th>
												<th>Shift</th>
												<th>Salon Name</th>
												<th></th>
											</tr>
											<c:forEach var="staff" items="${listStaffs}">
												<tr>
													<td>${staff.fullName}</td>
													<td>${staff.timeStart}</td>

													<td>${staff.timeEnd}</td>
													<td>${staff.shift}</td>
													<td class="salon-name">${staff.salons}</td>

													<td><a
														href="<%=request.getContextPath()%>/admin/staff/edit?staff-id=${staff.employeeId}"
														style="color: white;">
															<button type="button" class="btn btn-primary btn-sm"
																style="width: 80px">Edit</button> <br>
													</a> <a
														href="<%=request.getContextPath()%>/admin/staff/delete?staff-id=${staff.employeeId}"
														style="color: white;"> <br>
															<button type="button" class="btn btn-danger btn-sm"
																style="width: 80px">Delete</button>
													</a></td>
												</tr>
											</c:forEach>
										</table>
									</div>
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<div
												class="dataTables_paginate paging_simple_numbers pagintion"
												id="bootstrap-data-table-export_paginate"
												style="margin-left: 20px">
												<ul class="pagination a">
													<li class="paginate_button page-item previous"
														id="bootstrap-data-table-export_previous"><c:choose>
															<c:when test="${currentPage > 1}">
																<c:if test="${keyword!=null}">
																	<a
																		href="/admin/staffs?page=1&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link">First</a>
																</c:if>
																<c:if test="${keyword==null}">
																	<a href="/admin/staffs?page=1"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link">First</a>
																</c:if>
															</c:when>
															<c:otherwise>
																<span><a href="#"
																	aria-controls="bootstrap-data-table-export"
																	class="page-link">First</a></span>
															</c:otherwise>
														</c:choose></li>
													<li class="paginate_button page-item previous "
														id="bootstrap-data-table-export_previous"><c:choose>
															<c:when test="${currentPage > 1}">
																<c:if test="${keyword!=null}">
																	<a
																		href="/admin/staffs?page=${currentPage - 1}&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link">Previous</a>
																</c:if>
																<c:if test="${keyword==null}">
																	<a href="/admin/staffs?page=${currentPage - 1}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link">Previous</a>
																</c:if>
															</c:when>
															<c:otherwise>
																<span><a href="#"
																	aria-controls="bootstrap-data-table-export"
																	class="page-link">Previous</a></span>
															</c:otherwise>
														</c:choose></li>
													<c:forEach var="i" begin="1" end="${totalPages}">
														<c:choose>
															<c:when test="${i==currentPage}">
																<c:if test="${keyword!=null}">
																	<li class="paginate_button page-item active"><a
																		href="/admin/staffs?page=${currentPage}&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link" id="url-a">${i}</a></li>
																</c:if>
																<c:if test="${keyword==null}">
																	<li class="paginate_button page-item active"><a
																		href="/admin/staffs?page=${currentPage}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link" id="url-a">${i}</a></li>
																</c:if>
															</c:when>
															<c:otherwise>
																<c:if test="${keyword!=null}">
																	<li class="paginate_button page-item"><a
																		href="/admin/staffs?page=${i}&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link" id="url-a">${i}</a></li>
																</c:if>
																<c:if test="${keyword==null}">
																	<li class="paginate_button page-item"><a
																		href="/admin/staffs?page=${i}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link" id="url-a">${i}</a></li>
																</c:if>
															</c:otherwise>
														</c:choose>

													</c:forEach>
													<li class="paginate_button page-item next"
														id="bootstrap-data-table-export_next"><c:choose>
															<c:when test="${currentPage < totalPages}">
																<c:if test="${keyword!=null}">
																	<a
																		href="/admin/staffs?page=${currentPage + 1}&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link">Next</a>
																</c:if>
																<c:if test="${keyword==null}">
																	<a href="/admin/staffs?page=${currentPage + 1}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link">Next</a>
																</c:if>
															</c:when>
															<c:otherwise>
																<span><a href="#"
																	aria-controls="bootstrap-data-table-export"
																	class="page-link">Next</a></span>
															</c:otherwise>
														</c:choose></li>
													<li class="paginate_button page-item next"
														id="bootstrap-data-table-export_next"><c:choose>
															<c:when test="${currentPage < totalPages}">
																<c:if test="${keyword!=null}">
																	<a
																		href="/admin/staffs?page=${totalPages}&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link">Last</a>
																</c:if>
																<c:if test="${keyword==null}">
																	<a href="/admin/staffs?page=${totalPages}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link">Last</a>
																</c:if>
															</c:when>
															<c:otherwise>
																<span><a href="#"
																	aria-controls="bootstrap-data-table-export"
																	class="page-link">Last</a></span>
															</c:otherwise>
														</c:choose></li>
												</ul>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->
	<%@ include file="/WEB-INF/jsp/common-admin/script.jsp"%>
	<script>
	$(document).ready(() => {
		var salonName = $('.salon-name').html();
		var deleteChar = salonName.slice(1, -1);
		$('.salon-name').html('');
		$('.salon-name').append(deleteChar).html();
	})
</script>
</body>
</html>