<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> -->

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head th:replace="css :: html_css">
</head>
<body>
	<div th:replace='navBar :: html_navBar'></div>
	<div th:replace='topBar :: html_topBar'></div>
	<!-- 	<%@ include file="/WEB-INF/jsp/common-user/topBar.jsp"%>
	<%@ include file="/WEB-INF/jsp/common-user/navBar.jsp"%> -->
	<!-- Page Header Start -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>About Us</h2>
				</div>
				<div class="col-12">
					<a href="">Home</a> <a href="">About Us</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Header End -->


	<!-- About Start -->
	<div class="about">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-5 col-md-6">
					<div class="about-img">
						<img src="/img/about.jpg"
							alt="Image">
					</div>
				</div>
				<div class="col-lg-7 col-md-6">
					<div class="section-header text-left">
						<p>Learn About Us</p>
						<h2>25 Years Experience</h2>
					</div>
					<div class="about-text">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Phasellus nec pretium mi. Curabitur facilisis ornare velit non
							vulputate. Aliquam metus tortor, auctor id gravida condimentum,
							viverra quis sem.</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Phasellus nec pretium mi. Curabitur facilisis ornare velit non
							vulputate. Aliquam metus tortor, auctor id gravida condimentum,
							viverra quis sem. Curabitur non nisl nec nisi scelerisque
							maximus. Aenean consectetur convallis porttitor. Aliquam interdum
							at lacus non blandit.</p>
						<a class="btn" href="">Learn More</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- About End -->
	<div th:replace='footer :: html_footer'></div>

	<!-- 	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%> -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<!-- 	<%@ include file="/WEB-INF/jsp/common-user/script.jsp"%> -->
	<div th:replace='script :: html_script'></div>

</body>
</html>