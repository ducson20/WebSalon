<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@taglib
	uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="/WEB-INF/jsp/common-user/css.jsp"%>
<title>Register</title>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/common-user/topBar.jsp"%>
	<%@ include file="/WEB-INF/jsp/common-user/navBar.jsp"%>
	<!-- 	<div class="card card-login"> -->
	<!-- 		<div class="card-header">Forget Password</div> -->
	<!-- 		<br> -->
	<!-- 		<div class="card-body"> -->
	<!-- 			<form action="/forgetpassword" method="POST"> -->

	<!-- 				<div class="mb-3"> -->
	<!-- 					<label for="email" class="form-label">Email</label> <input -->
	<!-- 						type="email" class="form-control" id="email" name="email"> -->
	<!-- 				</div> -->
	<!-- 				<div class="mb-3"> -->
	<%-- 					<c:choose> --%>
	<%-- 						<c:when test="${message != ''}"> --%>
	<%-- 							<c:if test="${message=='WRONG' }"> --%>
	<!-- 								<div class="alert alert-danger" role="alert">Wrong email, -->
	<!-- 									please try again!</div> -->
	<%-- 							</c:if> --%>
	<%-- 						</c:when> --%>
	<%-- 					</c:choose> --%>
	<!-- 				</div> -->
	<%-- 				<c:choose> --%>
	<%-- 					<c:when test="${not empty message}"> --%>
	<%-- 						<c:if test="${message == 'FORGET_SUCCESS'}"> --%>
	<!-- 							<div class="mb-3"> -->
	<!-- 								<div class="alert alert-success" role="alert">Please check -->
	<!-- 									your email for the completion</div> -->
	<!-- 							</div> -->
	<!-- 							<div> -->
	<!-- 								<a href="/login" class="btn btn-warning button">Click To -->
	<!-- 									Login</a> -->
	<!-- 							</div> -->
	<%-- 						</c:if> --%>
	<%-- 					</c:when> --%>
	<%-- 					<c:otherwise> --%>
	<!-- 						<button type="submit" class="btn btn-warning button">Send</button> -->
	<%-- 					</c:otherwise> --%>
	<%-- 				</c:choose> --%>
	<!-- 			</form> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<div class="sufee-login d-flex align-content-center flex-wrap">
		<div class="container">
			<div class="login-content">
				<div class="login-logo">
					<a href="index.html"> <img class="align-content"
						src="images/logo.png" alt="">
					</a>
				</div>
				<div class="login-form">
					<form:form action="/forgetpassword" method="POST">
						<div class="form-group">
							<label for="email" class="form-label">Email Address</label> <input
								type="email" class="form-control" id="email" name="email">
						</div>
						<div class="form-group">
							<c:choose>
								<c:when test="${message != ''}">
									<c:if test="${message=='WRONG' }">
										<div class="alert alert-danger" role="alert">Wrong
											email, please try again!</div>
									</c:if>
								</c:when>
							</c:choose>
						</div>
						<!-- 						<button type="submit" class="btn btn-primary btn-flat m-b-15">Send</button> -->
						<c:choose>
							<c:when test="${not empty message}">
								<c:if test="${message == 'FORGET_SUCCESS'}">
									<div class="mb-3">
										<div class="alert alert-success" role="alert">Please
											check your email for the completion</div>
									</div>
									<div>
										<a href="/login" class="btn btn-warning button">Click To
											Login</a>
									</div>
								</c:if>
							</c:when>
							<c:otherwise>
								<button type="submit" class="btn btn-warning btn-flat m-b-15">Send</button>
							</c:otherwise>
						</c:choose>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<%@ include file="/WEB-INF/jsp/common-user/script.jsp"%></body>
</html>