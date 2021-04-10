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

	<!-- Pricing Start -->
	<div class="price" style="margin-top: 70px">
		<div class="container">
			<div class="section-header text-center">
				<p>Our Best Pricing</p>
				<h2>We Provide Best Price in the City</h2>
			</div>
			<div class="row">
				<c:forEach var="list" items="${listServiceDetail}">
					<div class="col-lg-4 col-md-4 col-sm-6">
						<a
							href="<% request.getContextPath(); %>/service-detail/${list.serviceDetailId}">
							<div class="price-item">
								<div class="price-img">
									<img src="<% request.getContextPath(); %>/${list.mainImage}"
										alt="Image">
								</div>
								<div class="price-text">
									<h2>${list.title}</h2>
									<h3>$${Math.round(list.price)}</h3>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
				<!-- 				<div class="col-lg-4 col-md-4 col-sm-6"> -->
				<!-- 					<div class="price-item"> -->
				<!-- 						<div class="price-img"> -->
				<!-- 							<img src="img/price-1.jpg" alt="Image"> -->
				<!-- 						</div> -->
				<!-- 						<div class="price-text"> -->
				<!-- 							<h2>Cut, Dry, Shampoo, Style</h2> -->
				<!-- 							<h3>$9.99</h3> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 				<div class="col-lg-4 col-md-4 col-sm-6"> -->
				<!-- 					<div class="price-item"> -->
				<!-- 						<div class="price-img"> -->
				<!-- 							<img src="img/price-2.jpg" alt="Image"> -->
				<!-- 						</div> -->
				<!-- 						<div class="price-text"> -->
				<!-- 							<h2>Cut, Dry, Style</h2> -->
				<!-- 							<h3>$10.99</h3> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 				<div class="col-lg-4 col-md-4 col-sm-6"> -->
				<!-- 					<div class="price-item"> -->
				<!-- 						<div class="price-img"> -->
				<!-- 							<img src="img/price-3.jpg" alt="Image"> -->
				<!-- 						</div> -->
				<!-- 						<div class="price-text"> -->
				<!-- 							<h2>Cut, Dry</h2> -->
				<!-- 							<h3>$11.99</h3> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 			</div> -->

				<!-- 			<div class="row"> -->

				<!-- 				<div class="col-lg-4 col-md-4 col-sm-6"> -->
				<!-- 					<div class="price-item"> -->
				<!-- 						<div class="price-img"> -->
				<!-- 							<img src="img/price-2.jpg" alt="Image"> -->
				<!-- 						</div> -->
				<!-- 						<div class="price-text"> -->
				<!-- 							<h2>Style</h2> -->
				<!-- 							<h3>$10.99</h3> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 				<div class="col-lg-4 col-md-4 col-sm-6"> -->
				<!-- 					<div class="price-item"> -->
				<!-- 						<div class="price-img"> -->
				<!-- 							<img src="img/price-2.jpg" alt="Image"> -->
				<!-- 						</div> -->
				<!-- 						<div class="price-text"> -->
				<!-- 							<h2>Shave Face</h2> -->
				<!-- 							<h3>$10.99</h3> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 				<div class="col-lg-4 col-md-4 col-sm-6"> -->
				<!-- 					<div class="price-item"> -->
				<!-- 						<div class="price-img"> -->
				<!-- 							<img src="img/price-3.jpg" alt="Image"> -->
				<!-- 						</div> -->
				<!-- 						<div class="price-text"> -->
				<!-- 							<h2>Hair Rinse</h2> -->
				<!-- 							<h3>$11.99</h3> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 			</div> -->
				<!-- 			<div class="row"> -->
				<!-- 				<div class="col-lg-4 col-md-4 col-sm-6"> -->
				<!-- 					<div class="price-item"> -->
				<!-- 						<div class="price-img"> -->
				<!-- 							<img src="img/price-1.jpg" alt="Image"> -->
				<!-- 						</div> -->
				<!-- 						<div class="price-text"> -->
				<!-- 							<h2>Tattoo Hair</h2> -->
				<!-- 							<h3>$9.99</h3> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 				<div class="col-lg-4 col-md-4 col-sm-6"> -->
				<!-- 					<div class="price-item"> -->
				<!-- 						<div class="price-img"> -->
				<!-- 							<img src="img/price-1.jpg" alt="Image"> -->
				<!-- 						</div> -->
				<!-- 						<div class="price-text"> -->
				<!-- 							<h2>Shave(Full)</h2> -->
				<!-- 							<h3>$9.99</h3> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
			</div>
		</div>
	</div>
	<!-- Pricing End -->
	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<%@ include file="/WEB-INF/jsp/common-user/script.jsp"%>

</body>
</html>