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
					<h2>Contact</h2>
				</div>
				<div class="col-12">
					<a href="">Home</a> <a href="">Contact</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Header End -->


	<!-- Contact Start -->
	<div class="section-header text-center" style="margin-top: 90px;">
		<p>Get In Touch</p>
		<h2>If You Have Any Query, Please Contact Us</h2>
	</div>
	<div class="contact" style="margin-bottom: 90px;">
		<div class="container-fluid">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-4"></div>
					<div class="col-md-8">
						<div class="contact-form">
							<div id="success"></div>
							<form name="sentMessage" id="contactForm" novalidate="novalidate">
								<div class="control-group">
									<input type="text" class="form-control" id="name"
										placeholder="Your Name" required="required"
										data-validation-required-message="Please enter your name" />
									<p class="help-block text-danger"></p>
								</div>
								<div class="control-group">
									<input type="email" class="form-control" id="email"
										placeholder="Your Email" required="required"
										data-validation-required-message="Please enter your email" />
									<p class="help-block text-danger"></p>
								</div>
								<div class="control-group">
									<input type="text" class="form-control" id="subject"
										placeholder="Subject" required="required"
										data-validation-required-message="Please enter a subject" />
									<p class="help-block text-danger"></p>
								</div>
								<div class="control-group">
									<textarea class="form-control" id="message"
										placeholder="Message" required="required"
										data-validation-required-message="Please enter your message"></textarea>
									<p class="help-block text-danger"></p>
								</div>
								<div>
									<button class="btn" type="submit" id="sendMessageButton">Send
										Message</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact End -->
	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<%@ include file="/WEB-INF/jsp/common-user/script.jsp"%>

</body>
</html>