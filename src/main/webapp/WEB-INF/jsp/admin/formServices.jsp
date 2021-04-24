<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
		<%@ include file="/WEB-INF/jsp/common-admin/breadcrumbs.jsp"%>
		<div class="col-lg-12">

			<form:form action="/admin/new/servicedetail" method="POST"
				enctype="multipart/form-data" class="form-horizontal"
				id="serviceDetailForm">
				<div class="content mt-3">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#home">Overview</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#menu1">Image</a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div id="home" class="container tab-pane active">
							<div class="animated fadeIn">
								<div class="row">
									<div class="col-md-12">
										<div class="card">
											<div class="card-header">
												<c:choose>
													<c:when test="${serviceDetail.serviceDetailId==null}">
														<strong>New Service Detail</strong>
													</c:when>
													<c:otherwise>
														<strong>Edit Service Detail</strong>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="card-body card-block">
												<div class="row form-group">
													<c:if test="${serviceDetail.serviceDetailId!=null}">
														<div class="col-12 col-md-4">
															<label for="text-input" class=" form-control-label">Service
																Detail ID </label>
														</div>
													</c:if>
													<div class="col-12 col-md-8">
														<c:choose>
															<c:when test="${serviceDetail.serviceDetailId!=null}">
																<input type="text" class="form-control serviceDetailId"
																	name="serviceDetailId"
																	value="${serviceDetail.serviceDetailId}"
																	readonly="readonly">
															</c:when>
														</c:choose>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-12 col-md-4">
														<label for="text-input" class=" form-control-label">Service
															Name</label>
													</div>
													<div class="col-12 col-md-8">
														<c:choose>
															<c:when test="${serviceDetail.serviceDetailId!=null}">
																<select name="service" id="service-id"
																	class="form-control service-id">
																	<c:forEach var="service" items="${listServices}">
																		<c:choose>
																			<c:when
																				test="${service.serviceName==serviceDetail.services.serviceName}">
																				<option value="${service.serviceId}"
																					selected="selected">${service.serviceName}</option>
																			</c:when>
																			<c:otherwise>
																				<option value="${service.serviceId}">${service.serviceName}</option>
																			</c:otherwise>
																		</c:choose>
																	</c:forEach>
																</select>
															</c:when>
															<c:otherwise>
																<select name="service" id="service-id"
																	class="form-control service-id">
																	<c:forEach var="service" items="${listServices}">
																		<option value="${service.serviceId}">${service.serviceName}</option>
																	</c:forEach>
																</select>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-12 col-md-4">
														<label for="text-input" class=" form-control-label">Title
														</label>
													</div>
													<div class="col-12 col-md-8">
														<c:choose>
															<c:when test="${serviceDetail.serviceDetailId!=null}">
																<input type="text" class="form-control title"
																	name="title" value="${serviceDetail.title}">
															</c:when>

															<c:otherwise>
																<input type="text" class="form-control title"
																	name="title">
																<label id="title-error" class="error" for="title"></label>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-12 col-md-4">
														<label for="text-input" class=" form-control-label">Description
														</label>
													</div>
													<div class="col-12 col-md-8">
														<c:choose>
															<c:when test="${serviceDetail.serviceDetailId!=null}">
																<input type="text" class="form-control description"
																	name="description"
																	value="${serviceDetail.descripttion}">
															</c:when>

															<c:otherwise>
																<input type="text" class="form-control description"
																	name="description">
																<label id="description-error" class="error"
																	for="description"></label>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-12 col-md-4">
														<label for="text-input" class=" form-control-label">Content
														</label>
													</div>
													<div class="col-12 col-md-8">
														<c:choose>
															<c:when test="${serviceDetail.serviceDetailId!=null}">
																<input type="text" class="form-control content"
																	name="content" value="${serviceDetail.content}">
															</c:when>

															<c:otherwise>
																<input type="text" class="form-control content"
																	name="content">
																<label id="content-error" class="error" for="content"></label>
															</c:otherwise>
														</c:choose>

													</div>
												</div>
												<div class="row form-group">
													<div class="col-12 col-md-4">
														<label for="text-input" class=" form-control-label">Time
															to complete </label>
													</div>
													<div class="col-12 col-md-8">
														<c:choose>
															<c:when test="${serviceDetail.serviceDetailId!=null}">
																<input type="text" class="form-control timeToComplete"
																	name="timeToComplete"
																	value="${serviceDetail.timeToComplete}">
															</c:when>

															<c:otherwise>
																<input type="text" class="form-control timeToComplete"
																	name="timeToComplete">
																<label id="timeToComplete-error" class="error"
																	for="timeToComplete"></label>

															</c:otherwise>
														</c:choose>

													</div>
												</div>
												<div class="row form-group">
													<div class="col-12 col-md-4">

														<label for="text-input" class=" form-control-label">Price
														</label>
													</div>
													<div class="col-12 col-md-8">
														<c:choose>
															<c:when test="${serviceDetail.serviceDetailId!=null}">
																<input type="text" class="form-control price"
																	name="price" value="${Math.round(serviceDetail.price)}">
															</c:when>

															<c:otherwise>
																<input type="text" class="form-control price"
																	name="price">
																<label id="price-error" class="error" for="price"></label>
															</c:otherwise>
														</c:choose>
													</div>
												</div>

												<div class="row form-group">
													<div class="col-12 col-md-4">
														<label for="text-input" class=" form-control-label">Sale
														</label>
													</div>
													<div class="col-12 col-md-8">
														<c:choose>
															<c:when test="${serviceDetail.serviceDetailId!=null}">
																<input type="text" class="form-control sale" name="sale"
																	value="${Math.round(serviceDetail.sale)}">
															</c:when>

															<c:otherwise>
																<input type="text" class="form-control sale" name="sale">
																<label id="sale-error" class="error" for="sale"></label>

															</c:otherwise>
														</c:choose>

													</div>
												</div>
												<div>
													<p class="text-center">
														<button type="submit" class="btn btn-danger">Save</button>
														<a href="#">
															<button type="submit" class="btn btn-secondary"
																id="buttonCancel">Cancel</button>
														</a>
													<p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- .animated -->
						</div>
						<div id="menu1" class="container tab-pane fade">
							<div class="row">
								<div class="col border col-md-6 col-sm-6 col-xs-6">
									<p>
										<img id="thumbnail" alt="Main image preview"
											src="/${serviceDetail.mainImage}">
									</p>
									<p>
										<label>Main Image</label>
									<p>
									<p>
										<c:choose>
											<c:when test="${serviceDetail.serviceDetailId!=null}">
												<input type="file" name="primaryImage" id="primaryImage"
													accept="image/png, image/jpeg, image/jpg,"
													value="/${serviceDetail.mainImage}">
											</c:when>

											<c:otherwise>
												<input type="file" name="primaryImage" id="primaryImage"
													accept="image/png, image/jpeg, image/jpg">
												<label id="primaryImage-error" class="error"
													for="primaryImage"></label>
											</c:otherwise>
										</c:choose>
									<p>
								</div>
								<c:choose>
									<c:when test="${serviceDetail.serviceDetailId!=null}">
										<c:forEach var="list" items="${listImageServiceDetail}">
											<div class="col border col-md-6 col-sm-6 col-xs-6">
												<p>
													<img id="thumbnail0" alt="Main Image"
														src="/${list.linkImage}">
												</p>
												<p>
													<label>Image 1:</label>
												<p>
												<p>
													<input type="file" name="extraImage"
														accept="image/png, image.jpeg" value="/${list.linkImage}">
												<p>
											</div>
										</c:forEach>
									</c:when>

									<c:otherwise>
										<div class="col border col-md-6 col-sm-6 col-xs-6">
											<p>
												<img id="thumbnail0" alt="Main Image" src="">
											</p>
											<p>
												<label>Image 1:</label>
											<p>
											<p>
												<input type="file" name="extraImage"
													accept="image/png, image/jpeg, image/jpg"">
											<p>
										</div>
										<div class="col border col-md-6 col-sm-6 col-xs-6">

											<p>
												<img id="thumbnail1" alt="Main image preview" src="">
											</p>
											<p>
												<label>Image 2:</label>
											<p>
											<p>
												<input type="file" name="extraImage"
													accept="image/png, image/jpeg, image/jpg"> <label
													id="extraImage-error" class="error" for="extraImage"></label>
											<p>
										</div>
										<div class="col border col-md-6 col-sm-6 col-xs-6">
											<p>
												<img id="thumbnail2" alt="Main image preview" src="">
											</p>
											<p>
												<label>Image 3:</label>
											<p>
											<p>
												<input type="file" name="extraImage"
													accept="image/png, image/jpeg, image/jpg"> <label
													id="extraImage-error" class="error" for="extraImage"></label>
											<p>
										</div>
										<div class="col border col-md-6 col-sm-6 col-xs-6">
											<p>
												<img id="thumbnail3" alt="Main image preview" src="">
											</p>
											<p>
												<label>Image 4:</label>
											<p>
											<p>
												<input type="file" name="extraImage"
													accept="image/png, image/jpeg, image/jpg"> <label
													id="extraImage-error" class="error" for="extraImage"></label>
											<p>
										</div>
									</c:otherwise>
								</c:choose>

							</div>
							<div>
								<p class="text-center">
									<button type="submit" class="btn btn-danger">Save</button>
									<a href="#">
										<button type="submit" class="btn btn-secondary"
											id="buttonCancel">Cancel</button>
									</a>
								<p>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>

	<!-- /#right-panel -->

	<!-- Right Panel -->
	<%@ include file="/WEB-INF/jsp/common-admin/script.jsp"%>
	<script
		src="<%=request.getContextPath()%>/ValidateForm/jquery.validate.js"></script>
	<script
		src="<%=request.getContextPath()%>/ValidateForm/serviceDetailForm.js"></script>
	<script type="text/javascript">
		$(document).ready(
				function() {
					var GoogleCalenderAppointments = null;

					const checkGoogleCalendarConflict = function(date) {
						var hasConflict = false;
						if (!GoogleCalenderAppointments) {
							//logic to get scheduled appointments
						}
						//iterate through relevant scheduled appointments
						//if argument `date` has conflict, return true
						//else, return false
						return hasConflict;
					}
					const getTimeSlotsForDay = function(date) {
						const timeSlots = [];
						const dayStart = new Date(date);
						const dayEnd = new Date(date);
						dayStart.setHours(0, 0, 0, 0);
						dayEnd.setHours(24, 0, 0, 0);

						do {
							if (!checkGoogleCalendarConflict(dayStart)) {
								const todayFormat = moment(dayStart).format(
										'HH:mm');
								timeSlots.push(todayFormat);
							}
							dayStart.setHours(dayStart.getHours(), dayStart
									.getMinutes() + 15);
						} while (dayStart < dayEnd);
						console.log(timeSlots)
						timeSlots.map(function(value, index) {
							console.log(value);
							$('.time-start').append(
									$('<option></option>').val(value).html(
											value));
						})
						timeSlots.map(function(value, index) {
							$('.time-end').append(
									$('<option></option>').val(value).html(
											value));

						})
					}
					const today = new Date();
					getTimeSlotsForDay(today);
				})
	</script>
	<script type="text/javascript">
		$('.list-fullNames')
				.change(
						function() {
							var employeeID = $('.list-fullNames').val();
							var urlString = '/listTimeOfEmp?employeeid='
									+ employeeID;
							$
									.ajax({
										method : "GET",
										url : urlString,
										dataType : "html",
									})
									.done(
											function(timeOfEmp) {
												const timeOfEmpToArr = timeOfEmp
														.split(',');
												const date = new Date();
												const localTime = new Date(date);
												const disableTime = timeOfEmpToArr
														.filter(function(value,
																i) {
															const stringToDate = moment(
																	value,
																	'HH:mm')
																	.toDate(
																			date);
															return stringToDate
																	.getTime() > localTime
																	.getTime();
														});
												//console.log(disableTime)
												$('.list-time').html('');
												disableTime
														.map(function(value,
																index) {
															$('#timeEmp')
																	.append(
																			$(
																					'<option></option>')
																					.val(
																							value)
																					.html(
																							value));
														})
											})
						})
	</script>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#primaryImage").change(function() {
				showImageThumbnail(this);
			});

			$("input[name='extraImage']").each(function(index) {
				$(this).change(function() {
					showExtraImageThumbnail(this, index);
				});
			});
		});

		function showImageThumbnail(fileInput) {
			file = fileInput.files[0];
			reader = new FileReader();

			reader.onload = function(e) {
				$("#thumbnail").attr('src', e.target.result);
			};
			reader.readAsDataURL(file);
		}

		function showExtraImageThumbnail(fileInput, index) {
			file = fileInput.files[0];
			reader = new FileReader();

			reader.onload = function(e) {
				$("#thumbnail" + index).attr('src', e.target.result);
			};
			reader.readAsDataURL(file);
		}

		function checkDuplId() {
			var x = $('#productId').val();
			var y = $('.id-product');
			var check = false;
			$.each($('.id-product'), function(i, val) {

				if ($(val).val() == x) {
					check = true;
				}
			})
			if (check) {
				$('#label').html("<small>Product ID is exit</small>").css({
					"color" : "red",
					"font-size" : "115%"
				})
			} else {
				$('#label').html("");
			}
		}
	</script>
	<script>
		$('.title').change(() => {
			$.ajax({
				 url: "/checkExitTitle",
				 dataType: "json",
			}).done((data) => {
				console.log(data);
				var textTitle = $('.title').val();
				data.map((value) => {
					if(value.title === textTitle){
						$('#title-error').html("Title is exit. Please enter other title").css('color', 'red');
					}
				})
			})
		})
	</script>
</body>
</html>