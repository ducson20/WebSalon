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
<body>
	<%@ include file="/WEB-INF/jsp/common-user/topBar.jsp"%>
	<%@ include file="/WEB-INF/jsp/common-user/navBar.jsp"%>

	<!-- Page Header Start -->
	<!-- 	<div class="" style="background-color: #D5B981;"> -->
	<!-- 	<div class="container"> -->
	<div class="row">
		<div class="col-12">
			<img src="/main-img/Haircut/COMBO 2/detail-img-service/7110(1).png"
				alt="Image"
				style="margin-top: 80px; margin-bottom: 30px; width: 100%; height: 400px;">
		</div>
	</div>
	<!-- 	</div> -->
	<!-- 	</div> -->
	<!-- Page Header End -->

	<div class="address-left">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-5">
					<div class="btn-header">
						<button type="button" class="btn btn-warning btn-lg btn-block">Tim
							salon gan day</button>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="address-detail">
						<div class="row">
							<div class="col col-lg-6">
								<select class="custom-select">
									<option value="City">Ho Chi Minh</option>
									<option value="Ha Noi">Ha Noi</option>
									<option value="Da Nang">Da Nang</option>
								</select>
							</div>
							<div class="col col-lg-6">
								<select class="custom-select">
									<option value="Quan 1">Quan 1</option>
									<option value="Quan 1">Quan 1</option>
									<option value="Quan 1">Quan 1</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Address Salon Start -->
	<div class="address-right">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-5">
					<div style="overflow-y: scroll; min-width: 100%; height: 650px;">
						<div class="address-info">
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-6">
									<img alt="" src="/main-img/Haircut/COMBO 2/COMBO 2_main.png">
								</div>
								<div class="col-lg-8 col-md-8 col-sm-6">
									<h5>109 Tran Quoc Han, P. Dich Vong Hau, Q. Cau Giay, Ha
										Noi</h5>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-3 col-md-3 col-sm-4">
									<button type="button" class="btn btn-warning">HOTLINE</button>
								</div>
								<div class="col-lg-4 col-md-4  col-sm-4"">
									<button type="button" class="btn btn-warning">Chi
										Duong</button>
								</div>
								<div class="col-lg-5 col-md-5  col-sm-4"">
									<button type="button" class="btn btn-warning">Dat Lich
										Cat</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="address-map">
						<div class="">
							<img src="/img/about.jpg" alt="Image">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Address Salon End -->

	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<%@ include file="/WEB-INF/jsp/common-user/script.jsp"%>
	<script>
		$('body').scrollspy({ target: '#navbar-example' })
	</script>
</body>
</html>