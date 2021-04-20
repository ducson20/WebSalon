<%@ page language="java" contentType="text/html; charset=UTF-8"
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
									<a href="<%=request.getContextPath()%>/admin/new/salon"
										class="btn btn-danger my-2 my-sm-0">New Salon</a>
								</div>
								
							</div>
							<c:choose>
								<c:when test="${empty listSalons}">
									<img src="/images/no-data.png"
										style="margin: auto; position: absolute; top: 140%; left: 42%;">
								</c:when>
								<c:otherwise>
									<div class="card-body"
										style="display: flex; position: relative;">

										<table id="bootstrap-data-table-export"
											class="table table-bordered">

											<tr>
												<th>Salon Name</th>
												<th>Image</th>
												<th>Time Start</th>
												<th>Time End</th>
												<th>Road</th>
												<th>Ward</th>
												<th>City</th>
												<th>Phone</th>
												<th></th>
											</tr>
											<c:forEach var="salon" items="${listSalons}">
												<tr>
													<td>${salon.salonName}</td>
													<td><img
														src="<%
												request.getContextPath();
												%>/${salon.imageSalon}"
														style="width: 150px; : auto;"></td>
													<td>${salon.timeStart}</td>
													<td>${salon.timeEnd}</td>
													<td>${salon.roadAndNumber}</td>
													<td>${salon.ward}</td>
													<td>${salon.city}</td>
													<td>${salon.phone}</td>

													<td><a
														href="<%=request.getContextPath()%>/admin/salon/edit?salon-id=${salon.salonId}"
														style="color: white;">
															<button type="button" class="btn btn-primary btn-sm"
																style="width: 80px">Edit</button> <br>
													</a> <a
														href="<%=request.getContextPath()%>/admin/salon/delete?salon-id=${salon.salonId}"
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
												id="bootstrap-data-table-export_paginate" style="margin-left: 20px;">
												<ul class="pagination a">

													<li class="paginate_button page-item previous"
														id="bootstrap-data-table-export_previous"><c:choose>
															<c:when test="${currentPage > 1}">
																<c:if test="${keyword!=null}">
																	<a
																		href="/admin/salons?page=1&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link">First</a>
																</c:if>
																<c:if test="${keyword==null}">
																	<a href="/admin/salons?page=1"
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
																		href="/admin/salons?page=${currentPage - 1}&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link">Previous</a>
																</c:if>
																<c:if test="${keyword==null}">
																	<a href="/admin/salons?page=${currentPage - 1}"
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
																		href="/admin/salons?page=${currentPage}&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link" id="url-a">${i}</a></li>
																</c:if>
																<c:if test="${keyword==null}">
																	<li class="paginate_button page-item active"><a
																		href="/admin/salons?page=${currentPage}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link" id="url-a">${i}</a></li>
																</c:if>
															</c:when>
															<c:otherwise>
																<c:if test="${keyword!=null}">
																	<li class="paginate_button page-item"><a
																		href="/admin/salons?page=${i}&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link" id="url-a">${i}</a></li>
																</c:if>
																<c:if test="${keyword==null}">
																	<li class="paginate_button page-item"><a
																		href="/admin/salons?page=${i}"
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
																		href="/admin/salons?page=${currentPage + 1}&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link">Next</a>
																</c:if>
																<c:if test="${keyword==null}">
																	<a href="/admin/salons?page=${currentPage + 1}"
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
																		href="/admin/salons?page=${totalPages}&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link">Last</a>
																</c:if>
																<c:if test="${keyword==null}">
																	<a href="/admin/salons?page=${totalPages}"
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

</body>
</html>