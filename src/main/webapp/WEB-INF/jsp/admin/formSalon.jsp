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
		<form action="/admin/new/salon" method="POST"
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
										<div class="card-header"></div>
										<div class="card-body card-block">
											<div class="row form-group">
												<div class="col-12 col-md-4">
													<label for="text-input" class=" form-control-label">Salon
														Name</label>
												</div>
												<div class="col-12 col-md-8">
													<input type="text" class="form-control salon-name"
														name="salonName" value="">
												</div>
											</div>
											<div class="row form-group">
												<div class="col-12 col-md-4">
													<label for="text-input" class=" form-control-label">Address
													</label>
												</div>
												<div class="col-12 col-md-8">
													<input type="text" class="form-control address-salon"
														name="address" value="">
												</div>
											</div>
											<div class="row form-group">
												<div class="col-12 col-md-4">
													<label for="text-input" class=" form-control-label">City
													</label>
												</div>
												<div class="col-12 col-md-8">
													<input type="text" class="form-control city" name="city"
														value="">
												</div>
											</div>
											<div class="row form-group">
												<div class="col-12 col-md-4">
													<label for="text-input" class=" form-control-label">Phone
													</label>
												</div>
												<div class="col-12 col-md-8">
													<input type="text" class="form-control phone-salon"
														name="phone" value="">
												</div>
											</div>
											<div class="row form-group">
												<div class="col-12 col-md-4">
													<label for="select" class=" form-control-label">Time
														work for salon</label>
												</div>
												<div class="col-12 col-md-4">
													<select name="timeStart" id="time-start"
														class="form-control time-start">
														<option value="">Time Start</option>
													</select>
													<p style="font-size: 85%">15 minutes per employee
														shift.</p>
												</div>
												<div class="col-12 col-md-4">
													<select name="timeEnd" id="time-end"
														class="form-control time-end">
														<option value="">Time End</option>
													</select>
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
	$(document).ready(function () {
    var GoogleCalenderAppointments = null;

    const checkGoogleCalendarConflict = function (date) {
        var hasConflict = false;
        if (!GoogleCalenderAppointments) {
            //logic to get scheduled appointments
        }
        //iterate through relevant scheduled appointments
        //if argument `date` has conflict, return true
        //else, return false
        return hasConflict;
    }
    const getTimeSlotsForDay = function (date) {
        const timeSlots = [];
        const dayStart = new Date(date);
        const dayEnd = new Date(date);
        dayStart.setHours(0, 0, 0, 0);
        dayEnd.setHours(24, 0, 0, 0);

        do {
            if (!checkGoogleCalendarConflict(dayStart)) {
                const todayFormat = moment(dayStart).format('HH:mm');
                timeSlots.push(todayFormat);
            }
            dayStart.setHours(dayStart.getHours(), dayStart.getMinutes() + 15);
        } while (dayStart < dayEnd);
        console.log(timeSlots)
        timeSlots.map(function (value, index) {
            console.log(value);
            $('.time-start').append($('<option></option>').val(value).html(value));
        })
        timeSlots.map(function (value, index) {
            $('.time-end').append($('<option></option>').val(value).html(value));

        })
    }
    const today = new Date();
    getTimeSlotsForDay(today);
})
</script>
	<script type="text/javascript">
	$('.list-fullNames').change(function() {
		var employeeID = $('.list-fullNames').val();
		var urlString = '/listTimeOfEmp?employeeid=' + employeeID;
		$.ajax({
			method : "GET",
			url : urlString,
			dataType: "html",
		}).done(function(timeOfEmp) {
				const timeOfEmpToArr = timeOfEmp.split(',');
				const date = new Date();
				const localTime = new Date(date);
				const disableTime = timeOfEmpToArr.filter(function(value, i){
							const stringToDate = moment(value, 'HH:mm').toDate(date);
							return stringToDate.getTime() > localTime.getTime();
						});
				console.log(disableTime)
				$('.list-time').html('');
				disableTime.map(function(value, index){
					$('#timeEmp').append($('<option></option>').val(value).html(value));
				})
		})
	})
 </script>
</body>

</html>