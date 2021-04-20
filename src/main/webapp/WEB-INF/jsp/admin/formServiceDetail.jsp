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
									<a href="<%=request.getContextPath()%>/admin/new/servicedetail"
										class="btn btn-danger my-2 my-sm-0">New Detail Service</a>
								</div>
								<div class="col-md-1 col-xs-1">
									<input class="btn btn-danger" id="all-item" type="button"
										value="All Item"> &nbsp;
								</div>
								<div class="col-md-3 col-xs-3">
									<select class="custom-select service-id" id="service-id"
										name="keyword">
										<option selected>Services</option>
										<c:forEach var="listServices" items="${listServices}">
											<c:choose>
												<c:when test="${keyword==listServices.serviceId}">
													<option value="${listServices.serviceId}"
														selected="selected">${listServices.serviceName}</option>
												</c:when>
												<c:otherwise>
													<option value="${listServices.serviceId}">${listServices.serviceName}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>
							<c:choose>
								<c:when test="${empty listServiceDetails}">
									<img src="/images/no-data.png"
										style="margin: auto; position: absolute; top: 140%; left: 42%;">
								</c:when>
								<c:otherwise>
									<div class="card-body">
										<table id="bootstrap-data-table-export"
											class="table table-bordered">

											<tr>
												<th>Name</th>
												<th>Title</th>
												<th>Main Image</th>
												<th>Description</th>
												<th>Content</th>
												<th>Time To Complete</th>
												<th>Price</th>
												<th>Sale</th>
												<th></th>
											</tr>
											<c:forEach var="listServiceDetails"
												items="${listServiceDetails}">
												<tr>
													<td>${listServiceDetails.services.serviceName}</td>
													<td>${listServiceDetails.title}</td>
													<td><img
														src="<%=request.getContextPath()%>/${listServiceDetails.mainImage}"
														alt="abc" style="width: 200px"></td>
													<td>${listServiceDetails.descripttion}</td>
													<td>${listServiceDetails.content}</td>
													<td>${listServiceDetails.timeToComplete}</td>
													<td>${listServiceDetails.price}</td>
													<td>${listServiceDetails.sale}</td>
													<!-- servicedetail/delete -->
													<td><a
														href="<%=request.getContextPath()%>/admin/servicedetail/edit?servicedetailid=${listServiceDetails.serviceDetailId}"
														style="color: white;">
															<button type="button" class="btn btn-primary btn-sm"
																style="width: 80px">Edit</button> <br>
													</a> <a
														href="<%=request.getContextPath()%>/admin/servicedetail/delete?servicedetailid=${listServiceDetails.serviceDetailId}"
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
												style="margin-left: 20px;">
												<ul class="pagination a">

													<li class="paginate_button page-item previous"
														id="bootstrap-data-table-export_previous"><c:choose>
															<c:when test="${currentPage > 1}">
																<c:if test="${keyword!=null}">
																	<a
																		href="/admin/servicedetails?page=1&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link">First</a>
																</c:if>
																<c:if test="${keyword==null}">
																	<a href="/admin/servicedetails?page=1"
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
																		href="/admin/servicedetails?page=${currentPage - 1}&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link">Previous</a>
																</c:if>
																<c:if test="${keyword==null}">
																	<a href="/admin/servicedetails?page=${currentPage - 1}"
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
																		href="/admin/servicedetails?page=${currentPage}&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link" id="url-a">${i}</a></li>
																</c:if>
																<c:if test="${keyword==null}">
																	<li class="paginate_button page-item active"><a
																		href="/admin/servicedetails?page=${currentPage}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link" id="url-a">${i}</a></li>
																</c:if>
															</c:when>
															<c:otherwise>
																<c:if test="${keyword!=null}">
																	<li class="paginate_button page-item"><a
																		href="/admin/servicedetails?page=${i}&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link" id="url-a">${i}</a></li>
																</c:if>
																<c:if test="${keyword==null}">
																	<li class="paginate_button page-item"><a
																		href="/admin/servicedetails?page=${i}"
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
																		href="/admin/servicedetails?page=${currentPage + 1}&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link">Next</a>
																</c:if>
																<c:if test="${keyword==null}">
																	<a href="/admin/servicedetails?page=${currentPage + 1}"
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
																		href="/admin/servicedetails?page=${totalPages}&keyword=${keyword}"
																		aria-controls="bootstrap-data-table-export"
																		class="page-link">Last</a>
																</c:if>
																<c:if test="${keyword==null}">
																	<a href="/admin/servicedetails?page=${totalPages}"
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
		$('#all-item').click(function() {
			window.location = "/admin/servicedetails";
		})

		$('.service-id')
				.change(
						function() {
							var serviceID = $('#service-id').val();
							if (serviceID === 'Services') {
								window.location = '/admin/servicedetails';
								$('.page-link')
							} else {
								window.location = '/admin/servicedetails?page=1&keyword='
										+ serviceID;
							}
						})
	</script>
</body>
</html>