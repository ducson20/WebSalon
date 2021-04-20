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
		<form action="/admin/new/staff" method="POST"
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
												<c:when test="${staff.employeeId !=null}">
													<strong>Edit Employee</strong>
												</c:when>
												<c:otherwise>
													<strong>New Employee</strong>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="card-body card-block">
											<div class="row form-group">
												<div class="col-12 col-md-4">
													<label for="text-input" class=" form-control-label">Employee
														Name</label>
												</div>
												<div class="col-12 col-md-8">
													<c:choose>
														<c:when test="${staff.employeeId !=null}">
															<input type="text" class="form-control employee-name"
																name="fullName" value="${staff.fullName}">
														</c:when>
														<c:otherwise>
															<input type="text" class="form-control employee-name"
																name="fullName" value="">
														</c:otherwise>
													</c:choose>

												</div>
											</div>
											<div class="row form-group">
												<div class="col-12 col-md-4">
													<label for="select" class=" form-control-label">Workplace</label>
												</div>
												<div class="col-12 col-md-8">
													<c:choose>
														<c:when test="${staff.employeeId !=null}">
															<select name=salonid id="address-salon"
																class="form-control address-salon">
																<c:forEach var="salon" items="${listSalons}">
																	<c:choose>
																		<c:when test="${lSalonNameByStaff == salon.salonName}">
																			<option value="${salon.salonId}" selected="selected">${salon.roadAndNumber}
																				- ${salon.ward} - ${salon.city}</option>
																		</c:when>
																	</c:choose>
																</c:forEach>
															</select>
														</c:when>
														<c:otherwise>
															<select name="salonid" id="address-salon"
																class="form-control address-salon">
																<c:forEach var="salon" items="${listSalons}">
																	<option value="${salon.salonId}">${salon.roadAndNumber}
																		- ${salon.ward} - ${salon.city}</option>
																</c:forEach>
															</select>
														</c:otherwise>
													</c:choose>
												</div>
											</div>

											<div class="row form-group">
												<div class="col-12 col-md-4">
													<label for="text-input" class=" form-control-label">To
														work in shifts</label>
												</div>
												<div class="col-12 col-md-4">
													<div class="input-group mb-3">
														<c:choose>
															<c:when test="${staff.employeeId !=null}">
																<select id="shift" name="shift"
																	class="form-control shift">
																	<c:if test="${staff.halfADay eq 'morning'}">
																		<option value="morning" selected="selected">Morning</option>
																		<option value="afternoon">Afternoon</option>
																		<option value="daylong">Daylong</option>
																	</c:if>
																	<c:if test="${staff.halfADay eq 'afternoon'}">
																		<option value="morning">Morning</option>
																		<option value="afternoon" selected="selected">Afternoon</option>
																		<option value="daylong">Daylong</option>
																	</c:if>
																	<c:if test="${staff.halfADay eq 'daylong'}">
																		<option value="morning">Morning</option>
																		<option value="afternoon">Afternoon</option>
																		<option value="daylong" selected="selected">Daylong</option>
																	</c:if>
																</select>
															</c:when>
															<c:otherwise>
																<select id="shift" name="shift"
																	class="form-control shift">
																	<option>Shift</option>
																	<option value="morning">Morning</option>
																	<option value="afternoon">Afternoon</option>
																	<option value="daylong">Daylong</option>
																</select>
															</c:otherwise>
														</c:choose>

													</div>
												</div>
											</div>

											<div class="row form-group">
												<div class="col-12 col-md-4">
													<label for="text-input" class=" form-control-label">Shifts</label>
												</div>
												<div class="col-12 col-md-2">
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<div class="input-group-text">
																<input type="checkbox" class="shiftWork" name="halfADay"
																	id="shift1" value="shift1"
																	aria-label="Checkbox for following text input">
															</div>
														</div>
														<input type="text" class="form-control" value="Shift 1"
															aria-label="Text input with checkbox" readonly="readonly">
													</div>
												</div>
												<div class="col-12 col-md-2">
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<div class="input-group-text">
																<input type="checkbox" class="shiftWork"
																	name="halfADay" id="shift2" value="shift2"
																	aria-label="Checkbox for following text input">
															</div>
														</div>
														<input type="text" class="form-control" value="Shift 2"
															aria-label="Text input with checkbox" readonly="readonly">
													</div>
												</div>
												<c:if test="${staff.shift == 'shift1'}">
													<div class="col-12 col-md-2">
														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<div class="input-group-text">
																	<c:choose>
																		<c:when test="${staff.employeeId !=null}">
																			<input type="checkbox" class="shiftWork"
																				name="halfADay" id="shift1" value="shift1"
																				aria-label="Checkbox for following text input"
																				checked="checked">
																		</c:when>
																		<c:otherwise>
<!-- 																			<input type="checkbox" class="shiftWork" -->
<!-- 																				name="halfADay" id="shift1" value="shift1" -->
<!-- 																				aria-label="Checkbox for following text input"> -->
																		</c:otherwise>
																	</c:choose>
																</div>
															</div>
															<input type="text" class="form-control" value="Shift 1"
																aria-label="Text input with checkbox"
																readonly="readonly">
														</div>
													</div>
													<div class="col-12 col-md-2">
														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<div class="input-group-text">
																	<c:choose>
																		<c:when test="${staff.employeeId !=null}">
																			<input type="checkbox" class="shiftWork"
																				name="shiftWork" id="shift2" value="shift2"
																				aria-label="Checkbox for following text input">
																		</c:when>
																		<c:otherwise>
<!-- 																			<input type="checkbox" class="shiftWork" -->
<!-- 																				name="shiftWork" id="shift2" value="shift2" -->
<!-- 																				aria-label="Checkbox for following text input"> -->
																		</c:otherwise>
																	</c:choose>

																</div>
															</div>
															<input type="text" class="form-control" value="Shift 2"
																aria-label="Text input with checkbox"
																readonly="readonly">
														</div>
													</div>
												</c:if>
												<c:if test="${staff.shift == 'shift2'}">
													<div class="col-12 col-md-2">
														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<div class="input-group-text">
																	<c:choose>
																		<c:when test="${staff.employeeId !=null}">
																			<input type="checkbox" class="shiftWork"
																				name="halfADay" id="shift1" value="shift1"
																				aria-label="Checkbox for following text input">
																		</c:when>
																		<c:otherwise>
<!-- 																			<input type="checkbox" class="shiftWork" -->
<!-- 																				name="halfADay" id="shift1" value="shift1" -->
<!-- 																				aria-label="Checkbox for following text input"> -->
																		</c:otherwise>
																	</c:choose>
																</div>
															</div>
															<input type="text" class="form-control" value="Shift 1"
																aria-label="Text input with checkbox"
																readonly="readonly">
														</div>
													</div>
													<div class="col-12 col-md-2">
														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<div class="input-group-text">
																	<c:choose>
																		<c:when test="${staff.employeeId !=null}">
																			<input type="checkbox" class="shiftWork"
																				name="shiftWork" id="shift2" value="shift2"
																				aria-label="Checkbox for following text input"
																				checked="checked">
																		</c:when>
																		<c:otherwise>
<!-- 																			<input type="checkbox" class="shiftWork" -->
<!-- 																				name="shiftWork" id="shift2" value="shift2" -->
<!-- 																				aria-label="Checkbox for following text input"> -->
																		</c:otherwise>
																	</c:choose>

																</div>
															</div>
															<input type="text" class="form-control" value="Shift 2"
																aria-label="Text input with checkbox"
																readonly="readonly">
														</div>
													</div>
												</c:if>
											</div>
											<div class="row form-group">
												<div class="col-12 col-md-4">
													<label for="select" class=" form-control-label">Employee's
														working time</label>
												</div>
												<div class="col-12 col-md-4">
													<c:choose>
														<c:when test="${staff.employeeId !=null}">
															<select name="timeStart" id="time-start"
																class="form-control time-start">
																<option value="">${timeStart}</option>
															</select>
														</c:when>
														<c:otherwise>
															<select name="timeStart" id="time-start"
																class="form-control time-start">
																<option value="">Time start</option>
															</select>
														</c:otherwise>
													</c:choose>
													<p style="font-size: 85%">30 minutes per employee
														shift.</p>
												</div>
												<div class="col-12 col-md-4">
													<c:choose>
														<c:when test="${staff.employeeId !=null}">
															<select name="timeEnd" id="time-end"
																class="form-control time-end">
																<option value="">${timeEnd}</option>
															</select>
														</c:when>
														<c:otherwise>
															<select name="timeEnd" id="time-end"
																class="form-control time-end">
																<option value="">Time end</option>
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
							<div class="col border m-3"></div>
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
		</form>
	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->
	<%@ include file="/WEB-INF/jsp/common-admin/script.jsp"%>
	<script type="text/javascript">
		$('.shift')
				.on(
						'change',
						function() {
							$('.shiftWork')
									.change(
											function() {
												// 					$('.shiftWork').not(this).prop('checked', false);
												var salonID = $(
														'.address-salon').val();
												var urlString = '/listTimeOfSalonBySalon?salonid='
														+ salonID;
												$
														.ajax({
															method : "GET",
															url : urlString,
															dataType : "html",
														})
														.done(
																function(
																		timeOfSalon) {
																	alert(timeOfSalon)
																	const timeOfSalonToArr = timeOfSalon
																			.split(',');
																	const firstTimeElement = timeOfSalonToArr[0];
																	const stringToDateFTE = moment(
																			firstTimeElement,
																			'HH:mm')
																			.toDate();
																	var timeStartNoon = '';
																	var timeEndNoon = '';
																	switch (stringToDateFTE
																			.getMinutes()) {
																	case 00:
																		timeStartNoon = '11:00';
																		timeEndNoon = '13:00';
																		break;
																	case 15:
																		timeStartNoon = '11:00';
																		timeEndNoon = '13:15';
																		break;
																	case 30:
																		timeStartNoon = '11:15';
																		timeEndNoon = '13:30';
																		break;
																	case 45:
																		timeStartNoon = '11:30';
																		timeEndNoon = '13:45';
																		break;
																	}

																	const stringToDateDMin = moment(
																			timeStartNoon,
																			'HH:mm')
																			.toDate();
																	const stringToDateDMax = moment(
																			timeEndNoon,
																			'HH:mm')
																			.toDate();

																	// Morning - Shift 2

																	if ($(
																			'.shift')
																			.val() === 'morning'
																			&& $(
																					'#shift2')
																					.is(
																							':checked')) {
																		const morningTime = timeOfSalonToArr
																				.filter(function(
																						value,
																						i) {
																					const stringToDate1 = moment(
																							value,
																							'HH:mm')
																							.toDate();
																					return stringToDate1
																							.getTime() <= stringToDateDMin
																							.getTime();
																				});

																		const afternoonTime = timeOfSalonToArr
																				.filter(function(
																						value,
																						i) {
																					const stringToDate2 = moment(
																							value,
																							'HH:mm')
																							.toDate();
																					return stringToDate2
																							.getTime() >= stringToDateDMax
																							.getTime();
																				});
																		const firstTimeMElement = morningTime[0];
																		const lastTimeMElement = morningTime[morningTime.length - 1];
																		const stringToDateFTME = moment(
																				firstTimeMElement,
																				'HH:mm')
																				.toDate();
																		const stringToDateLTME = moment(
																				lastTimeMElement,
																				'HH:mm')
																				.toDate();
																		var f = '';
																		var l = '';
																		switch (stringToDateFTME
																				.getMinutes()) {
																		case 00:
																			var setTime = '15';
																			var strToTime = moment(
																					setTime,
																					'mm')
																					.toDate();
																			var first = stringToDateFTME
																					.getMinutes()
																					+ strToTime
																							.getMinutes();
																			var strToFirst = moment(
																					first,
																					'mm')
																					.toDate();
																			//                                                 alert(first)
																			if (first == 15) {
																				var hour = '';
																				if (stringToDateFTME
																						.getHours() <= 9) {
																					hour = '0'
																							+ stringToDateFTME
																									.getHours()
																							+ ':'
																							+ strToFirst
																									.getMinutes();
																				} else {
																					hour = stringToDateFTME
																							.getHours()
																							+ ':'
																							+ strToFirst
																									.getMinutes();
																				}
																				f = moment(
																						hour,
																						'HH:mm')
																						.toDate();
																			}
																			break;
																		case 15:
																			var setTime = '15';
																			var strToTime = moment(
																					setTime,
																					'mm')
																					.toDate();
																			var first = stringToDateFTME
																					.getMinutes()
																					+ strToTime
																							.getMinutes();
																			var strToFirst = moment(
																					first,
																					'mm')
																					.toDate();
																			if (first == 30) {
																				var hour = '';
																				if (stringToDateFTME
																						.getHours() <= 9) {
																					hour = '0'
																							+ stringToDateFTME
																									.getHours()
																							+ ':'
																							+ strToFirst
																									.getMinutes();
																				} else {
																					hour = stringToDateFTME
																							.getHours()
																							+ ':'
																							+ strToFirst
																									.getMinutes();
																				}
																				f = moment(
																						hour,
																						'HH:mm')
																						.toDate();
																			}
																			break;
																		case 30:
																			var setTime = '15';
																			var strToTime = moment(
																					setTime,
																					'mm')
																					.toDate();
																			var first = stringToDateFTME
																					.getMinutes()
																					+ strToTime
																							.getMinutes();
																			var strToFirst = moment(
																					first,
																					'mm')
																					.toDate();
																			if (first == 45) {
																				var hour = '';
																				if (stringToDateFTME
																						.getHours() <= 9) {
																					hour = '0'
																							+ stringToDateFTME
																									.getHours()
																							+ ':'
																							+ strToFirst
																									.getMinutes();
																				} else {
																					hour = stringToDateFTME
																							.getHours()
																							+ ':'
																							+ strToFirst
																									.getMinutes();
																				}
																				f = moment(
																						hour,
																						'HH:mm')
																						.toDate();
																			}
																			break;
																		case 45:
																			var setTime = '15';
																			var strToTime = moment(
																					setTime,
																					'mm')
																					.toDate();
																			var first = stringToDateFTME
																					.getMinutes()
																					+ strToTime
																							.getMinutes();
																			if (first == 60) {
																				var hour = '';
																				if (stringToDateFTME
																						.getHours() <= 9) {
																					hour = '0'
																							+ (stringToDateFTME
																									.getHours() + 1)
																							+ ':00';
																				} else {
																					hour = (stringToDateFTME
																							.getHours() + 1)
																							+ ':00';
																				}
																				f = moment(
																						hour,
																						'HH:mm')
																						.toDate();
																			}
																			break;
																		}

																		const handleFistTime = moment(
																				f)
																				.format(
																						'HH:mm');
																		$(
																				'.time-start')
																				.html(
																						'');
																		$(
																				'.time-end')
																				.html(
																						'');
																		$(
																				'.time-start')
																				.append(
																						$(
																								'<option></option>')
																								.val(
																										handleFistTime)
																								.html(
																										handleFistTime));
																		$(
																				'.time-end')
																				.append(
																						$(
																								'<option></option>')
																								.val(
																										lastTimeMElement)
																								.html(
																										lastTimeMElement));
																	}

																	// Afternoon - Shift 2

																	if ($(
																			'.shift')
																			.val() === 'afternoon'
																			&& $(
																					'#shift2')
																					.is(
																							':checked')) {
																		const afternoonTime = timeOfSalonToArr
																				.filter(function(
																						value,
																						i) {
																					const stringToDate2 = moment(
																							value,
																							'HH:mm')
																							.toDate();
																					return stringToDate2
																							.getTime() >= stringToDateDMax
																							.getTime();
																				});
																		const firstTimeAElement = afternoonTime[0];
																		const lastTimeAElement = afternoonTime[afternoonTime.length - 1];
																		const stringToDateFTME = moment(
																				firstTimeAElement,
																				'HH:mm')
																				.toDate();
																		const stringToDateLTME = moment(
																				lastTimeAElement,
																				'HH:mm')
																				.toDate();
																		var f = '';
																		var l = '';
																		switch (stringToDateFTME
																				.getMinutes()) {
																		case 00:
																			var setTime = '15';
																			var strToTime = moment(
																					setTime,
																					'mm')
																					.toDate();
																			var first = stringToDateFTME
																					.getMinutes()
																					+ strToTime
																							.getMinutes();
																			var last = stringToDateLTME
																					.getMinutes()
																					- strToTime
																							.getMinutes();
																			var strToFirst = moment(
																					first,
																					'mm')
																					.toDate();
																			var strToLast = moment(
																					last,
																					'mm')
																					.toDate();
																			if (first == 15) {
																				var hour1 = '';
																				var hour2 = '';
																				if (stringToDateFTME
																						.getHours() <= 9) {
																					hour1 = '0'
																							+ stringToDateFTME
																									.getHours()
																							+ strToFirst
																									.getMinutes();
																					hour2 = '0'
																							+ stringToDateLTME
																									.getHours()
																							+ ':'
																							+ strToLast
																									.getMinutes();
																				} else {
																					hour1 = stringToDateFTME
																							.getHours()
																							+ ':'
																							+ strToFirst
																									.getMinutes();
																					hour2 = stringToDateLTME
																							.getHours()
																							+ ':'
																							+ strToLast
																									.getMinutes();
																				}
																				f = moment(
																						hour1,
																						'HH:mm')
																						.toDate();
																				l = moment(
																						hour2,
																						'HH:mm')
																						.toDate();
																			}
																			break;
																		case 15:
																			var setTime = '15';
																			var strToTime = moment(
																					setTime,
																					'mm')
																					.toDate();
																			var first = stringToDateFTME
																					.getMinutes()
																					+ strToTime
																							.getMinutes();
																			var last = stringToDateLTME
																					.getMinutes()
																					- strToTime
																							.getMinutes();
																			var strToFirst = moment(
																					first,
																					'mm')
																					.toDate();
																			var strToLast = moment(
																					last,
																					'mm')
																					.toDate();
																			if (first == 30) {
																				var hour1 = '';
																				var hour2 = '';
																				if (stringToDateFTME
																						.getHours() <= 9) {
																					hour1 = '0'
																							+ stringToDateFTME
																									.getHours()
																							+ strToFirst
																									.getMinutes();
																					hour2 = '0'
																							+ stringToDateLTME
																									.getHours()
																							+ ':'
																							+ strToLast
																									.getMinutes();
																				} else {
																					hour1 = stringToDateFTME
																							.getHours()
																							+ ':'
																							+ strToFirst
																									.getMinutes();
																					hour2 = stringToDateLTME
																							.getHours()
																							+ ':'
																							+ strToLast
																									.getMinutes();
																				}
																				f = moment(
																						hour1,
																						'HH:mm')
																						.toDate();
																				l = moment(
																						hour2,
																						'HH:mm')
																						.toDate();
																			}
																			break;
																		case 30:
																			var setTime = '15';
																			var strToTime = moment(
																					setTime,
																					'mm')
																					.toDate();
																			var first = stringToDateFTME
																					.getMinutes()
																					+ strToTime
																							.getMinutes();
																			var last = stringToDateLTME
																					.getMinutes()
																					- strToTime
																							.getMinutes();
																			var strToFirst = moment(
																					first,
																					'mm')
																					.toDate();
																			var strToLast = moment(
																					last,
																					'mm')
																					.toDate();
																			if (first == 45) {
																				var hour1 = '';
																				var hour2 = '';
																				if (stringToDateFTME
																						.getHours() <= 9) {
																					hour1 = '0'
																							+ stringToDateFTME
																									.getHours()
																							+ ':'
																							+ strToFirst
																									.getMinutes();
																					hour2 = '0'
																							+ stringToDateLTME
																									.getHours()
																							+ ':'
																							+ strToLast
																									.getMinutes();
																				} else {
																					hour1 = stringToDateFTME
																							.getHours()
																							+ ':'
																							+ strToFirst
																									.getMinutes();
																					hour2 = stringToDateLTME
																							.getHours()
																							+ ':'
																							+ strToLast
																									.getMinutes();
																				}
																				f = moment(
																						hour1,
																						'HH:mm')
																						.toDate();
																				l = moment(
																						hour2,
																						'HH:mm')
																						.toDate();
																			}
																			break;
																		case 45:
																			var setTime = '15';
																			var strToTime = moment(
																					setTime,
																					'mm')
																					.toDate();
																			var first = stringToDateFTME
																					.getMinutes()
																					+ strToTime
																							.getMinutes();
																			var last = stringToDateLTME
																					.getMinutes()
																					- strToTime
																							.getMinutes();
																			var strToLast = moment(
																					last,
																					'mm')
																					.toDate();
																			if (first == 60) {
																				var hour1 = '';
																				var hour2 = '';
																				if (stringToDateFTME
																						.getHours() <= 9) {
																					hour1 = '0'
																							+ (stringToDateFTME
																									.getHours() + 1)
																							+ ':00';
																					hour2 = '0'
																							+ stringToDateLTME
																									.getHours()
																							+ ':'
																							+ strToLast
																									.getMinutes();
																				} else {
																					hour1 = (stringToDateFTME
																							.getHours() + 1)
																							+ ':00';
																					hour2 = stringToDateLTME
																							.getHours()
																							+ ':'
																							+ strToLast
																									.getMinutes();
																				}

																				f = moment(
																						hour1,
																						'HH:mm')
																						.toDate();
																				l = moment(
																						hour2,
																						'HH:mm')
																						.toDate();
																			}
																			break;
																		}
																		const handleFistTime = moment(
																				f)
																				.format(
																						'HH:mm');
																		const handleLastTime = moment(
																				l)
																				.format(
																						'HH:mm');
																		$(
																				'.time-start')
																				.html(
																						'');
																		$(
																				'.time-end')
																				.html(
																						'');
																		$(
																				'.time-start')
																				.append(
																						$(
																								'<option></option>')
																								.val(
																										handleFistTime)
																								.html(
																										handleFistTime));
																		$(
																				'.time-end')
																				.append(
																						$(
																								'<option></option>')
																								.val(
																										handleLastTime)
																								.html(
																										handleLastTime));
																	}

																	//daylong - shift 2
																	alert($(
																			'.shift')
																			.val())
																	alert($(
																			'#shift2')
																			.is(
																					':checked'))
																	if ($(
																			'.shift')
																			.val() === 'daylong'
																			&& $(
																					'#shift2')
																					.is(
																							':checked')) {

																		const firstTimeDElement = timeOfSalonToArr[0];
																		const lastTimeDElement = timeOfSalonToArr[timeOfSalonToArr.length - 1];
																		alert(firstTimeDElement)
																		alert(lastTimeDElement)

																		const stringToDateFTME = moment(
																				firstTimeDElement,
																				'HH:mm')
																				.toDate();
																		const stringToDateLTME = moment(
																				lastTimeDElement,
																				'HH:mm')
																				.toDate();
																		var f = '';
																		var l = '';
																		switch (stringToDateFTME
																				.getMinutes()) {
																		case 00:
																			var setTime = '15';
																			var strToTime = moment(
																					setTime,
																					'mm')
																					.toDate();
																			var first = stringToDateFTME
																					.getMinutes()
																					+ strToTime
																							.getMinutes();
																			var last = stringToDateLTME
																					.getMinutes()
																					- strToTime
																							.getMinutes();
																			var strToFirst = moment(
																					first,
																					'mm')
																					.toDate();
																			var strToLast = moment(
																					last,
																					'mm')
																					.toDate();
																			if (first == 15) {
																				var hour1 = '';
																				var hour2 = '';
																				if (stringToDateFTME
																						.getHours() <= 9) {
																					hour1 = '0'
																							+ stringToDateFTME
																									.getHours()
																							+ strToFirst
																									.getMinutes();
																					hour2 = stringToDateLTME
																							.getHours()
																							+ ':'
																							+ strToLast
																									.getMinutes();
																				} else {
																					hour1 = stringToDateFTME
																							.getHours()
																							+ ':'
																							+ strToFirst
																									.getMinutes();
																					hour2 = stringToDateLTME
																							.getHours()
																							+ ':'
																							+ strToLast
																									.getMinutes();
																				}
																				f = moment(
																						hour1,
																						'HH:mm')
																						.toDate();
																				l = moment(
																						hour2,
																						'HH:mm')
																						.toDate();
																			}
																			break;
																		case 30:
																			var setTime = '15';
																			var strToTime = moment(
																					setTime,
																					'mm')
																					.toDate();
																			var first = stringToDateFTME
																					.getMinutes()
																					+ strToTime
																							.getMinutes();
																			var last = stringToDateLTME
																					.getMinutes()
																					- strToTime
																							.getMinutes();
																			var strToFirst = moment(
																					first,
																					'mm')
																					.toDate();
																			var strToLast = moment(
																					last,
																					'mm')
																					.toDate();
																			if (first == 45) {
																				var hour1 = '';
																				var hour2 = '';
																				if (stringToDateFTME
																						.getHours() <= 9) {
																					hour1 = '0'
																							+ stringToDateFTME
																									.getHours()
																							+ ':'
																							+ strToFirst
																									.getMinutes();
																					hour2 = stringToDateLTME
																							.getHours()
																							+ ':'
																							+ strToLast
																									.getMinutes();
																				} else {
																					hour1 = stringToDateFTME
																							.getHours()
																							+ ':'
																							+ strToFirst
																									.getMinutes();
																					hour2 = stringToDateLTME
																							.getHours()
																							+ ':'
																							+ strToLast
																									.getMinutes();
																				}
																				f = moment(
																						hour1,
																						'HH:mm')
																						.toDate();
																				l = moment(
																						hour2,
																						'HH:mm')
																						.toDate();
																			}
																			break;
																		case 45:
																			var setTime = '15';
																			var strToTime = moment(
																					setTime,
																					'mm')
																					.toDate();
																			var first = stringToDateFTME
																					.getMinutes()
																					+ strToTime
																							.getMinutes();
																			var last = stringToDateLTME
																					.getMinutes()
																					- strToTime
																							.getMinutes();
																			var strToLast = moment(
																					last,
																					'mm')
																					.toDate();
																			if (first == 60) {
																				var hour1 = '';
																				var hour2 = '';
																				if (stringToDateFTME
																						.getHours() <= 9) {
																					hour1 = '0'
																							+ (stringToDateFTME
																									.getHours() + 1)
																							+ ':00';
																					hour2 = stringToDateLTME
																							.getHours()
																							+ ':'
																							+ strToLast
																									.getMinutes();
																				} else {
																					hour1 = (stringToDateFTME
																							.getHours() + 1)
																							+ ':00';
																					hour2 = stringToDateLTME
																							.getHours()
																							+ ':'
																							+ strToLast
																									.getMinutes();
																				}

																				f = moment(
																						hour1,
																						'HH:mm')
																						.toDate();
																				l = moment(
																						hour2,
																						'HH:mm')
																						.toDate();
																			}
																			break;
																		}
																		const handleFistTime = moment(
																				f)
																				.format(
																						'HH:mm');
																		const handleLastTime = moment(
																				l)
																				.format(
																						'HH:mm');
																		$(
																				'.time-start')
																				.html(
																						'');
																		$(
																				'.time-end')
																				.html(
																						'');
																		$(
																				'.time-start')
																				.append(
																						$(
																								'<option></option>')
																								.val(
																										handleFistTime)
																								.html(
																										handleFistTime));
																		$(
																				'.time-end')
																				.append(
																						$(
																								'<option></option>')
																								.val(
																										handleLastTime)
																								.html(
																										handleLastTime));
																	}

																	//Morning - shift 1

																	if ($(
																			'.shift')
																			.val() === 'morning'
																			&& $(
																					'#shift1')
																					.is(
																							':checked')) {
																		switch (stringToDateFTE
																				.getMinutes()) {
																		case 15:
																			timeStartNoon = '11:15';
																			timeEndNoon = '13:15';
																			break;
																		case 30:
																			timeStartNoon = '11:30';
																			timeEndNoon = '13:30';
																			break;
																		case 45:
																			timeStartNoon = '11:45';
																			timeEndNoon = '13:45';
																			break;
																		}

																		const stringToDateDMin = moment(
																				timeStartNoon,
																				'HH:mm')
																				.toDate();
																		const stringToDateDMax = moment(
																				timeEndNoon,
																				'HH:mm')
																				.toDate();

																		const morningTime = timeOfSalonToArr
																				.filter(function(
																						value,
																						i) {
																					const stringToDate1 = moment(
																							value,
																							'HH:mm')
																							.toDate();
																					return stringToDate1
																							.getTime() <= stringToDateDMin
																							.getTime();
																				});
																		const firstTimeMElement = morningTime[0];
																		const lastTimeAMlement = morningTime[morningTime.length - 1];
																		$(
																				'.time-start')
																				.html(
																						'');
																		$(
																				'.time-end')
																				.html(
																						'');
																		$(
																				'.time-start')
																				.append(
																						$(
																								'<option></option>')
																								.val(
																										firstTimeMElement)
																								.html(
																										firstTimeMElement));
																		$(
																				'.time-end')
																				.append(
																						$(
																								'<option></option>')
																								.val(
																										lastTimeAMlement)
																								.html(
																										lastTimeAMlement));
																	}

																	//Afternoon - shift 1

																	if ($(
																			'.shift')
																			.val() === 'afternoon'
																			&& $(
																					'#shift1')
																					.is(
																							':checked')) {
																		switch (stringToDateFTE
																				.getMinutes()) {
																		case 15:
																			var timeStartNoon = '11:15';
																			var timeEndNoon = '13:15';
																			break;
																		case 30:
																			var timeStartNoon = '11:30';
																			var timeEndNoon = '13:30';
																			break;
																		case 45:
																			var timeStartNoon = '11:45';
																			var timeEndNoon = '13:45';
																			break;
																		}
																		const stringToDateDMin = moment(
																				timeStartNoon,
																				'HH:mm')
																				.toDate();
																		const stringToDateDMax = moment(
																				timeEndNoon,
																				'HH:mm')
																				.toDate();

																		const afternoonTime = timeOfSalonToArr
																				.filter(function(
																						value,
																						i) {
																					const stringToDate2 = moment(
																							value,
																							'HH:mm')
																							.toDate();
																					return stringToDate2
																							.getTime() >= stringToDateDMax
																							.getTime();
																				});

																		const firstTimeAElement = afternoonTime[0];
																		const lastTimeAElement = afternoonTime[afternoonTime.length - 1];
																		$(
																				'.time-start')
																				.html(
																						'');
																		$(
																				'.time-end')
																				.html(
																						'');
																		$(
																				'.time-start')
																				.append(
																						$(
																								'<option></option>')
																								.val(
																										firstTimeAElement)
																								.html(
																										firstTimeAElement));
																		$(
																				'.time-end')
																				.append(
																						$(
																								'<option></option>')
																								.val(
																										lastTimeAElement)
																								.html(
																										lastTimeAElement));
																	}

																	//Daylong - shift 1
																	if ($(
																			'.shift')
																			.val() === 'daylong'
																			&& $(
																					'#shift1')
																					.is(
																							':checked')) {
																		const firstTimeDElement = timeOfSalonToArr[0];
																		const lastTimeDElement = timeOfSalonToArr[timeOfSalonToArr.length - 1];
																		$(
																				'.time-start')
																				.html(
																						'');
																		$(
																				'.time-end')
																				.html(
																						'');
																		$(
																				'.time-start')
																				.append(
																						$(
																								'<option></option>')
																								.val(
																										firstTimeDElement)
																								.html(
																										firstTimeDElement));
																		$(
																				'.time-end')
																				.append(
																						$(
																								'<option></option>')
																								.val(
																										lastTimeDElement)
																								.html(
																										lastTimeDElement));

																	}
																});
											})

							if ($('input[type="checkbox"]').not(this).prop(
									'checked', false)) {
								$('.time-start').html('');
								$('.time-end').html('')
								$('.time-start').append(
										$('<option></option>')
												.val('Time start').html(
														'Time start'));
								$('.time-end').append(
										$('<option></option>').val('Time end')
												.html('Time end'));
							}

							$('.address-salon').change(
									function() {

										$('input[type=checkbox]').prop(
												'checked', false);
										$('.shift').prop('selectedIndex', 0);
										$('.time-start').html('');
										$('.time-end').html('')
										$('.time-start').append(
												$('<option></option>').val(
														'Time start').html(
														'Time start'));
										$('.time-end').append(
												$('<option></option>').val(
														'Time end').html(
														'Time end'));
									})

						});
	</script>
</body>
</html>