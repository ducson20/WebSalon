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
	<div class="container">
		<div class="row">
			<div class="col-12">
				<img
					src="<% request.getContextPath(); %>/${firstImageOfServiceDetail[0].linkImage}"
					alt="Image"
					style="margin-top: 80px; margin-bottom: 30px; width: 100%; height: 400px;">
			</div>
		</div>
	</div>
	<!-- 	</div> -->
	<!-- Page Header End -->

	<!-- Service Start -->
	<div class="service">
		<div class="container">
			<div class="section-header text-center">
				<h2 style="font-weight: bold; font-family: monospace;">$${Math.round(listServiceDetail.price)}</h2>
				<p
					style="margin-top: 30px; margin-bottom: 80px; text-align: justify; font-style: initial; font-weight: bold;">${listServiceDetail.content}</p>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="service-item">
						<div class="service-img">
							<img
								src="<% request.getContextPath(); %>/${firstImageOfServiceDetail[1].linkImage}"
								alt="Image">
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="service-item">
						<div class="service-img">
							<img
								src="<% request.getContextPath(); %>/${firstImageOfServiceDetail[2].linkImage}"
								alt="Image">
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="service-item">
						<div class="service-img">
							<img
								src="<% request.getContextPath(); %>/${firstImageOfServiceDetail[3].linkImage}"
								alt="Image">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Service End -->

	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<%@ include file="/WEB-INF/jsp/common-user/script.jsp"%>

</body>
</html>