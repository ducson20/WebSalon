<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="/WEB-INF/jsp/common-user/css.jsp"%>
<title>Login</title>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/common-user/topBar.jsp"%>
	<%@ include file="/WEB-INF/jsp/common-user/navBar.jsp"%>
	<div class="sufee-login d-flex align-content-center flex-wrap">
		<div class="container">
			<script
				src="https://www.google.com/recaptcha/api.js?render=reCAPTCHA_site_key"></script>
			<div class="login-content">
				<div class="login-logo">
					<a href="index.html"> <img class="align-content"
						src="images/logo.png" alt="">
					</a>
				</div>

				<div class="login-form">
					<form:form action="/mapActionLogin" method="POST" id="loginForm">
						<%-- 						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION.message}"> --%>
						<!-- 							<p class="text-danger" style="color: red; text-align: center"> -->
						<%-- 								<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" /> --%>
						<!-- 							</p> -->
						<%-- 						</c:if> --%>
						<c:if test="${param.otp == true}">
							<div id="success">
								<p class="text-danger" style="text-align: center">
									For security reason, we've sent an One-Time-Password (OTP) to
									your email ${param.email}<br /> Kindly check your email and
									use the provided OTP to login.<br> Note: The OTP will
									expire after 5 minutes
								</p>
							</div>
						</c:if>
						<c:if test="${param.error == true}">
							<div id="success">
								<p class="text-danger" style="text-align: center">Invalid
									email or password</p>
							</div>
						</c:if>
						<c:if test="${param.lock == true}">
							<div id="success">
								<p class="text-danger" style="text-align: center">Your
									account has been locked due to 3 failed attempts. It will be
									unlocked after 5 minutes</p>
							</div>
						</c:if>
						<c:if test="${param.unLock == true}">
							<div id="success">
								<p class="text-danger" style="text-align: center">You
									account has been unlocked. Please try to login again</p>
							</div>
						</c:if>
						<c:if test="${param.logout == true}">
							<div id="success">
								<p class="text-warning" style="text-align: center">You have
									been logged out</p>
							</div>
						</c:if>


						<div class="form-group">
							<label for="exampleInputEmail1" class="form-label">Email
								address</label> <input type="email" class="form-control"
								id="exampleInputEmail1" name="txtUserEmail"
								value="${param.email}">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1" class="form-label">Password</label>
							<input type="password" class="form-control"
								id="exampleInputPassword1" name="txtPassword"
								placeholder="${param.otp != null ? 'Your one time password' : 'Password' }">
						</div>
						<div class="checkbox">
							<div class="row">
								<div class="col-lg-1 col-md-1">
									<input type="checkbox" name="remember-me">
								</div>
								<div class="col-lg-6 col-md-6">
									<label> Remember Me </label>
								</div>
								<div class="col-lg-5 col-md-5">
									<label class="pull-right"> <a href="/forgetpassword">Forgotten
											Password?</a>
									</label>
								</div>
							</div>
						</div>
						<!-- 	<button type="submit" -->
						<!-- 							class="btn btn-success btn-flat m-b-30 m-t-30 btn-login">Sign in</button> -->
						<button
							class="g-recaptcha btn btn-success btn-flat m-b-30 m-t-30 btn-login"
							data-sitekey="6LfoTbMaAAAAAD4SrgpfLmrQfw_KgUH3jzctAaGL"
							data-callback="onSubmit" data-action="submit">Sign in</button>

						<div class="social-login-content">
							<div class="social-button">
								<!-- 								<a href="/oauth2/authorize-client/facebook">  -->
								<a href="/oauth2/authorize-client/facebook">
									<button type="button"
										class="btn social facebook btn-flat btn-addon mb-3 btn-facebook">
										<i class="ti-facebook"></i>Sign in with facebook
									</button>
								</a> <a href="/oauth2/authorize-client/google"> <!-- 								<a href="/oauth2/authorization/google"> -->

									<button type="button"
										class="btn social twitter btn-flat btn-addon mt-2">
										<i class="ti-google"></i>Sign in with google
									</button>
								</a>
							</div>
						</div>
						<div class="register-link m-t-15 text-center">
							<p>
								Don't have account ? <a href="/register"> Sign Up Here</a>
							</p>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<%@ include file="/WEB-INF/jsp/common-user/script.jsp"%>
	<script>
		function onSubmit(token) {
			document.getElementById('loginForm').submit();
		}
	</script>
</body>
</html>