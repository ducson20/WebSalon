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
					<h2>Gallery</h2>
				</div>
				<div class="col-12">
					<a href="">Home</a> <a href="">Gallery</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Header End -->


	<!-- Portfolio Start -->
	<div class="portfolio">
		<div class="container">
			<div class="section-header text-center">
				<p>Barber Image Gallery</p>
				<h2>Some Images From Our Barber Gallery</h2>
			</div>
			<div class="row">
				<div class="col-12">
					<ul id="portfolio-flters">
						<li data-filter="*" class="filter-active">All</li>
						<li data-filter=".first">Hair Cut</li>
						<li data-filter=".second">Beard Style</li>
						<li data-filter=".third">Color & Wash</li>
					</ul>
				</div>
			</div>
			<div class="row portfolio-container">
				<div class="col-lg-4 col-md-6 col-sm-12 portfolio-item first">
					<div class="portfolio-wrap">
						<a href="img/portfolio-1.jpg" data-lightbox="portfolio"> <img
							src="img/portfolio-1.jpg" alt="Portfolio Image">
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-12 portfolio-item second">
					<div class="portfolio-wrap">
						<a href="img/portfolio-2.jpg" data-lightbox="portfolio"> <img
							src="img/portfolio-2.jpg" alt="Portfolio Image">
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-12 portfolio-item third">
					<div class="portfolio-wrap">
						<a href="img/portfolio-3.jpg" data-lightbox="portfolio"> <img
							src="img/portfolio-3.jpg" alt="Portfolio Image">
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-12 portfolio-item first">
					<div class="portfolio-wrap">
						<a href="img/portfolio-4.jpg" data-lightbox="portfolio"> <img
							src="img/portfolio-4.jpg" alt="Portfolio Image">
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-12 portfolio-item second">
					<div class="portfolio-wrap">
						<a href="img/portfolio-5.jpg" data-lightbox="portfolio"> <img
							src="img/portfolio-5.jpg" alt="Portfolio Image">
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-12 portfolio-item third">
					<div class="portfolio-wrap">
						<a href="img/portfolio-6.jpg" data-lightbox="portfolio"> <img
							src="img/portfolio-6.jpg" alt="Portfolio Image">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio End -->
	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<%@ include file="/WEB-INF/jsp/common-user/script.jsp"%>

</body>
</html>