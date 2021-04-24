<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<!-- 		<div class="card-header">Register</div> -->
	<!-- 		<br> -->
	<!-- 		<div class="card-body"> -->
	<%-- 			<p style="color: #ebdddd">Welcome ${userFullName}</p> --%>
	<%-- 			<p style="color: #ebdddd">Your email : ${userEmail}</p> --%>
	<!-- 			<form action="forgetpasswordprocess" method="POST"> -->
	<!-- 				<div class="mb-3"> -->
	<%-- 					<input type="hidden" placeholder="text" value="${userEmail}" --%>
	<!-- 						name="txtUserEmail" /> <input type="hidden" placeholder="text" -->
	<%-- 						value="${hashCode}" name="txtHashCode" /> --%>
	<!-- 				</div> -->
	<!-- 				<div class="mb-3"> -->
	<!-- 					<label for="password" class="form-label">New Password</label> <input -->
	<!-- 						type="password" class="form-control" id="new-password" -->
	<!-- 						name="userPassword" minlength="6" required="required"> -->
	<!-- 				</div> -->
	<!-- 				<div class="mb-3"> -->
	<!-- 					<label for="confirmPassword" class="form-label">Confirm -->
	<!-- 						Password</label> <input type="password" class="form-control" -->
	<!-- 						id="confirm-password" name="txtConfirmPassword" minlength="6" -->
	<!-- 						required="required"> -->
	<!-- 				</div> -->
	<!-- 				<div class="mb-3"> -->
	<%-- 					<c:if test="${not empty message}"> --%>
	<%-- 						<c:if test="${message == 'CHANGE_PASSWORD_SUCCESS'}"> --%>
	<!-- 							<div class="alert alert-success" role="alert">Change -->
	<!-- 								password successful</div> -->
	<%-- 						</c:if> --%>
	<%-- 					</c:if> --%>
	<!-- 				</div> -->
	<!-- 				<div> -->
	<!-- 					<button type="submit" class="btn btn-warning button">Change -->
	<!-- 						Password</button> -->
	<!-- 				</div> -->
	<!-- 				<br> -->

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
					<p style="color: #ebdddd">Welcome ${userFullName}</p>
					<p style="color: #ebdddd">Your email : ${userEmail}</p>
					<form:form action="forgetpasswordprocess" method="POST">
						<div class="form-group">
							<input type="hidden" placeholder="text" value="${userEmail}"
								name="txtUserEmail" /> <input type="hidden" placeholder="text"
								value="${hashCode}" name="txtHashCode" />
						</div>
						<div class="form-group">
							<label for="password" class="form-label">New Password</label> <input
								type="password" class="form-control" id="new-password"
								name="userPassword" minlength="6" required="required">
						</div>
						<div class="form-group">
							<label for="confirmPassword" class="form-label">Confirm
								Password</label> <input type="password" class="form-control"
								id="confirm-password" name="txtConfirmPassword" minlength="6"
								required="required">
						</div>
						<div class="form-group">
							<c:if test="${not empty message}">
								<c:if test="${message == 'CHANGE_PASSWORD_SUCCESS'}">
									<div class="alert alert-success" role="alert">Change
										password successful</div>
								</c:if>
							</c:if>
						</div>
						<button type="submit" class="btn btn-primary btn-flat m-b-15">Change
							Password</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<%@ include file="/WEB-INF/jsp/common-user/script.jsp"%></body>
</html>