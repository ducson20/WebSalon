<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Barber X - Barber Shop Template</title>
<%@ include file="/WEB-INF/jsp/common-user/css.jsp"%>
</head>
<body style="background: rgb(128, 128, 128, 0.1)">
	<%@ include file="/WEB-INF/jsp/common-user/topBar.jsp"%>
	<%@ include file="/WEB-INF/jsp/common-user/navBar.jsp"%>
	<!-- SUCCESS BOOKING START -->
	<div class="card-success-booking">

		<div class="body-content">
			<div class="title-header">
				<div class="row">
					<div class="col-lg-3 col-md-3 ">
						<div class="icon-success">
							<img src="/images/success-green-check-mark.png">
						</div>
					</div>
					<div class="col-lg-9 col-md-9">
						<h1>Booking success</h1>
					</div>
				</div>
			</div>
			<div class="background">
				<div class="salon-address">
					<div class="row">
						<div class="col">
							<h2>
								<i class="fa fa-map-marker" aria-hidden="true"></i> Salon
							</h2>
							<p>${appointment.salons.roadAndNumber}-
								${appointment.salons.ward} - ${appointment.salons.city}</p>
						</div>

					</div>
				</div>


				<div class="info-detail">
					<div class="row">
						<div class="col-lg-4 col-md-6 col-xs-4">
							<h2>
						
								<i class="fa fa-calendar" aria-hidden="true"></i> Ngay
							</h2>
							<p>${dateBooked}</p>
						</div>
						<div class="col-lg-4 col-md-6 col-xs-4">
							<h2>
								<i class="fa fa-clock-o" aria-hidden="true"></i> Gio
							</h2>
							<p>${timeBooked}</p>
						</div>
						<div class="col-lg-4 col-md-6 col-xs-4">
							<h2>
								<i class="fa fa-user" aria-hidden="true"></i> Stylist
							</h2>
							<p>${appointment.employees.fullName}</p>
						</div>
					</div>
				</div>

				<div class="service-choosen">
					<div class="row">
						<div class="col">
							<h2>
								<i class="menu-icon fa fa-glass"></i> Service Choosen
							</h2>
							<div class="list-service"></div>
							<p></p><br>
						</div>
					</div>
				</div>
				<div class="payment">
					<div class="row">
						<div class="col">
							<h2>Payment</h2>
							<p>Payment at the counter.</p>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2 col-md-2">
							<img  alt="" src="/images/vi-sa.png" style="width: 80px;">
						</div>
						<div class="col-lg-2 col-md-2">
							<img alt="" src="/images/pay-pal.png" style="width: 80px;">
						</div>
						<div class="col-lg-2 col-md-2 ">
							<img alt="" src="/images/master-card.png" style="width: 80px;">
						</div>
						<div class="col-lg-2 col-md-2">
							<img alt="" src="/images/american.png" style="width: 80px;">
						</div>
					</div>
				</div>
			</div>
			<div class="note">
				<div class="row">
					<div class="col">
						<h2>Note:</h2>
						<p>- Service hours can be shifted 5-10 minutes, hope you
							sympathize.</p>
						<p>- In case you are late for more than 10 minutes, we would
							like to reschedule after that.</p>
						<p>- If you are satisfied, Stylist will ask for permission to
							keep some of his images for convenience next time.</p>
					</div>
				</div>
			</div>
			<div class="btn">
				<div class="row">
					<div class="col">
						<button class="btn-home">Reschedule / Cancel schedule</button>
					</div>

				</div>
				<div class="row">
					<div class="col">
						<button class="btn-cancel">Reschedule / Cancel schedule</button>
					</div>

				</div>
			</div>

		</div>


	</div>
	<!-- SUCCESS BOOKING END -->
	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>


	<%@ include file="/WEB-INF/jsp/common-user/script.jsp"%>
	<script>
	$(document).ready(()=>{
		console.log(${appointmentID})
		$.ajax({
			url: '/convertListServiceOfAppointment?appointment-id=' + ${appointmentID},
			method: "GET",
			dataType: 'html'
		}).done((strServices) => {
			const listServices = strServices.split(',');
			const list = listServices.map((value) =>{
				return `<p>* \${value}</p>`;
			})
			$('.list-service').html(list.join(''));
		})
	})

</script>
</body>
</html>