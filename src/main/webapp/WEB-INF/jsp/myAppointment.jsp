<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Barber X - Barber Shop Template</title>
<%@ include file="/WEB-INF/jsp/common-user/css.jsp"%>
<link rel="stylesheet" href="/css/flickity.css" media="screen">
</head>
<body style="background: rgb(128, 128, 128, 0.1)">
	<%@ include file="/WEB-INF/jsp/common-user/topBar.jsp"%>
	<%@ include file="/WEB-INF/jsp/common-user/navBar.jsp"%>
	<!-- MY APPOINTMENT START -->
	<div class="my-appointment">
		<div class="container">
			<div class="carousel"
				data-flickity='{ "freeScroll": true, "contain": true, "prevNextButtons": false, "pageDots": false }'>
				<div class="carousel-cell">
					<div class="row">
						<div class="col content">
							<div class="content">
								<div class="time-to">
									Only <span style="color: rgb(231, 65, 65);">2 days 10
										hours 22 minutes </span> is to schedule an appointment Telephone *
									9684
								</div>
								<div class="item" style="margin-top: 15px;">
									<i class="fa fa-calendar" aria-hidden="true"></i> <span>Today,
										Thursday, April 22, 8:40</span>
								</div>
								<div class="item">
									<i class="fa fa-home" aria-hidden="true"></i> <span>236
										Duong Ba Trac, Ward 1, District 8, Ho Chi Minh City</span>
								</div>
								<div class="item">
									<i class="fa fa-user" aria-hidden="true"></i> <span>The
										salon will choose the right stylist</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col cell">
							<a href="/"><button style="margin-right: 18px">Cancel</button></a>
							<a href="/"><button>Address</button></a>
						</div>
					</div>
				</div>
				<div class="carousel-cell">
					<div class="row">
						<div class="col content">
							<div class="content">
								<div class="time-to">
									Only <span style="color: rgb(231, 65, 65);">2 days 10
										hours 22 minutes </span> is to schedule an appointment Telephone *
									9684
								</div>
								<div class="item" style="margin-top: 15px;">
									<i class="fa fa-calendar" aria-hidden="true"></i> <span>Today,
										Thursday, April 22, 8:40</span>
								</div>
								<div class="item">
									<i class="fa fa-home" aria-hidden="true"></i> <span>236
										Duong Ba Trac, Ward 1, District 8, Ho Chi Minh City</span>
								</div>
								<div class="item">
									<i class="fa fa-user" aria-hidden="true"></i> <span>The
										salon will choose the right stylist</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col cell">
							<a href="/"><button style="margin-right: 18px">Cancel</button></a>
							<a href="/"><button>Address</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- MY APPOINTMENT END -->
	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>


	<%@ include file="/WEB-INF/jsp/common-user/script.jsp"%>
	<script src="/js/flickity.pkgd.min.js"></script>
</body>
</html>