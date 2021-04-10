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
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>Service</h2>
				</div>
				<div class="col-12">
					<a href="">Home</a> <a href="">Service</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Header End -->


	<!-- Service Start -->
	<div class="service">
		<div class="container">
			<div class="section-header text-center">
				<p>Our Salon Services</p>
				<h2>Best Salon and Barber Services for You</h2>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="service-item">
						<div class="service-img">
							<img src="img/service-1.jpg" alt="Image">
						</div>
						<h3>Hair Cut</h3>
						<p>Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi.
							Curabitur facilisis ornare velit non</p>
						<a class="btn" href="<%request.getContextPath();%>/services/H">Learn
							More</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="service-item">
						<div class="service-img">
							<img src="img/service-1.jpg" alt="Image">
						</div>
						<h3>Hair Dye</h3>
						<p>Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi.
							Curabitur facilisis ornare velit non</p>
						<a class="btn" href="<%request.getContextPath();%>/services/HD">Learn
							More</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="service-item">
						<div class="service-img">
							<img src="img/service-2.jpg" alt="Image">
						</div>
						<!-- 						<h3>Beard Style</h3> -->
						<h3>Hair Curling</h3>
						<p>Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi.
							Curabitur facilisis ornare velit non</p>
						<a class="btn" href="<%request.getContextPath();%>/services/CH">Learn
							More</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="service-item">
						<div class="service-img">
							<img src="img/service-3.jpg" alt="Image">
						</div>
						<h3>Other Service</h3>
						<p>Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi.
							Curabitur facilisis ornare velit non</p>
						<a class="btn" href="<%request.getContextPath();%>/services/OT">Learn
							More</a>
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