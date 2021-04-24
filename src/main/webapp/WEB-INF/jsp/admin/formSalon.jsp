<%@ page language="java" contentType="text/html; charset=UTF-8"
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

		<form:form action="/admin/new/salon" method="POST"
			enctype="multipart/form-data" class="form-horizontal">
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
												<c:when test="${salon.salonId !=null}">
													<strong>Edit Salon</strong>
												</c:when>
												<c:otherwise>
													<strong>New Salon</strong>
												</c:otherwise>
											</c:choose>

										</div>
										<div class="card-body card-block">
											<c:choose>
												<c:when test="${salon.salonId !=null}">
													<div class="row form-group">
														<div class="col-12 col-md-4">
															<label for="text-input" class=" form-control-label">Salon
																ID</label>
														</div>
														<div class="col-12 col-md-8">
															<input type="text" class="form-control salon-name"
																name="salonID" value="${salon.salonId}"
																readonly="readonly">
														</div>
													</div>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
											<div class="row form-group">
												<div class="col-12 col-md-4">
													<label for="text-input" class=" form-control-label">Salon
														Name</label>
												</div>
												<div class="col-12 col-md-8">
													<c:choose>
														<c:when test="${salon.salonId !=null}">
															<input type="text" class="form-control salon-name"
																name="salonName" value="${salon.salonName}">
														</c:when>
														<c:otherwise>
															<input type="text" class="form-control salon-name"
																name="salonName" value="">
														</c:otherwise>
													</c:choose>

												</div>
											</div>
											<div class="row form-group">
												<div class="col-12 col-md-4">
													<label for="text-input" class=" form-control-label">Road
														And Number House </label>
												</div>
												<div class="col-12 col-md-8">
													<c:choose>
														<c:when test="${salon.salonId !=null}">
															<input type="text" class="form-control roadAndNumber"
																name="roadAndNumber" value="${salon.roadAndNumber}">
														</c:when>
														<c:otherwise>
															<input type="text" class="form-control roadAndNumber"
																name="roadAndNumber" value="">
														</c:otherwise>
													</c:choose>

												</div>
											</div>

											<div class="row form-group">
												<div class="col-12 col-md-4">
													<label for="text-input" class=" form-control-label">City
													</label>
												</div>

												<div class="col-12 col-md-4">
													<c:choose>
														<c:when test="${salon.salonId !=null}">
															<select class="form-control city" name="city" id="city">
																<option value="${salon.city}" selected="selected">${salon.city}</option>
															</select>
														</c:when>
														<c:otherwise>
															<select class="form-control city" name="city">
															</select>
														</c:otherwise>
													</c:choose>
												</div>
												<div class="col-12 col-md-4">
													<c:choose>
														<c:when test="${salon.salonId !=null}">
															<select class="form-control ward" name="ward">
																<option value="">${salon.ward}</option>
															</select>
														</c:when>
														<c:otherwise>
															<select class="form-control ward" name="ward">
															</select>
														</c:otherwise>
													</c:choose>


												</div>
											</div>
											<div class="row form-group">
												<div class="col-12 col-md-4">
													<label for="text-input" class=" form-control-label">Phone
													</label>
												</div>
												<div class="col-12 col-md-8">
													<c:choose>
														<c:when test="${salon.salonId !=null}">
															<input type="text" class="form-control phone-salon"
																name="phone" value="${salon.phone}">
														</c:when>
														<c:otherwise>
															<input type="text" class="form-control phone-salon"
																name="phone" value="">
														</c:otherwise>
													</c:choose>

												</div>
											</div>
											<div class="row form-group">
												<div class="col-12 col-md-4">
													<label for="select" class=" form-control-label">Time
														work for salon</label>
												</div>

												<div class="col-12 col-md-4">
													<c:choose>
														<c:when test="${salon.salonId !=null}">
															<select name="timeStart" id="time-start"
																class="form-control time-start">
																<option value="">${salon.timeStart}</option>
															</select>
														</c:when>
														<c:otherwise>
															<select name="timeStart" id="time-start"
																class="form-control time-start">
																<option value="">Time Start</option>
															</select>
														</c:otherwise>
													</c:choose>

													<p style="font-size: 85%">15 minutes per employee
														shift.</p>
												</div>
												<div class="col-12 col-md-4">
													<c:choose>
														<c:when test="${salon.salonId !=null}">
															<select name="timeEnd" id="time-end"
																class="form-control time-end">
																<option value="">${salon.timeEnd}</option>
															</select>
														</c:when>
														<c:otherwise>
															<select name="timeEnd" id="time-end"
																class="form-control time-end">
																<option value="">Time End</option>
															</select>
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
										src="/${salon.imageSalon}">
								</p>
								<p>
									<label>Main Image</label>
								<p>
								<p>
									<c:choose>
										<c:when test="${salon.salonId!=null}">
											<input type="file" name="primaryImage" id="primaryImage"
												accept="image/png, image/jpeg, image/jpg,"
												value="/${salon.imageSalon}">
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

	<!-- /#right-panel -->

	<!-- Right Panel -->
	<%@ include file="/WEB-INF/jsp/common-admin/script.jsp"%>
	<c:if test="${salon.salonId == null}">
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
		<script>
		$.ajax({
	      url: "/location/local.json",
	      dataType: "json",
		}).done(function(data){
 			console.log(data)
			data.map((value) => {
				const codeProvince = value.code;
				const province = value.name;				
				$('.city').append($('<option></option>').val(province).html(province));
				return value
			})
			
			$('.city').change(()=>{
				const provinceVal = $('.city option:selected').text().trim();
				const findByCityID = data.filter(x => x.name === provinceVal);
				const districts = findByCityID.map((value) => {
					return value.districts;
				})
				$('.ward').html('');
				//$('.districts').append('<option value="">Quan Huyen</option>');
				districts[0].map((value) => {
					$('.ward').append($('<option></option>').val(value.name).html(value.name));
				})
			});


			$(document).ready(()=>{
				const provinceVal = $('.city option:selected').text().trim();
				const findByCityID = data.filter(x => x.name === provinceVal);
				const districts = findByCityID.map((value) => {
					return value.districts;
				})
 				$('.ward').html('');
				districts[0].map((value) => {
					$('.ward').append($('<option></option>').val(value.name).html(value.name));
				})
			});
			
		});
	</script>
	</c:if>
	<c:if test="${salon.salonId != null}">
		<script>
		$(document).ready(() => {
			var timeS = $('#time-start').text().trim();
			var timeE = $('#time-end').text().trim();
			var timeStart = timeS.substring(0, 5);
			var timeEnd = timeE.substring(0, 5);
			$('#time-start').html('');
			$('#time-end').html('');
			$('#time-start').append($('<option></option>').val(timeStart).html(timeStart));
			$('#time-end').append($('<option></option>').val(timeEnd).html(timeEnd));
			
		})
		
	</script>
		<script>

	$.ajax({
	      url: "/location/local.json",
	      dataType: "json",
		}).done(function(data){

			$('.city').change(()=>{
				const provinceVal = $('.city option:selected').text().trim();
				const findByCityID = data.filter(x => x.name === provinceVal);
				const districts = findByCityID.map((value) => {
					return value.districts;
				})
				$('.ward').html('');
				//$('.districts').append('<option value="">Quan Huyen</option>');
				districts[0].map((value) => {
					$('.ward').append($('<option></option>').val(value.name).html(value.name));
				})
			});

			
			
			$(document).ready(()=>{
				const cityVal = $('.city option:selected').text().trim();
				const cityAll = data.map((value) => {
					return value.name;
				})
				const citySelected = cityAll.map((value, index) => {
					if(value !== cityVal){
						console.log(value);
						$('.city').append($('<option></option>').val(value).html(value));		
					}
				})
				const findByCityID = data.filter(x => x.name === cityVal);
				const districts = findByCityID.map((value) => {
					return value.districts;
				})
				$('.ward').html('');
				districts[0].map((value) => {
					$('.ward').append($('<option></option>').val(value.name).html(value.name));
				})
			});
		});
	</script>
	</c:if>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#primaryImage").change(function() {
				showImageThumbnail(this);
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

	</script>
</body>

</html>