<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<div class="login-content">
				<div class="login-logo">
					<a href="index.html"> <img class="align-content"
						src="images/logo.png" alt="">
					</a>
				</div>
				<div class="login-form">
					<c:choose>
						<c:when test="${error != null }">
							<c:if test="${error=='ERROR' }">
								<span style="color: #f26e73">Wrong email or password</span>
							</c:if>
							<c:if test="${error=='ERROR-SESSION'}">
								<span style="color: #f26e73">Session expired, phease
									re-login</span>
							</c:if>
						</c:when>

					</c:choose>
					<form action="/mapActionLogin" method="POST">
						<div class="form-group">
							<label for="exampleInputEmail1" class="form-label">Email
								address</label> <input type="email" class="form-control"
								id="exampleInputEmail1" name="txtUserEmail">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1" class="form-label">Password</label>
							<input type="password" class="form-control"
								id="exampleInputPassword1" name="txtPassword">
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

						<button type="submit"
							class="btn btn-success btn-flat m-b-30 m-t-30 btn-login">Sign
							in</button>
						<!-- 						<fb:login-button scope="public_profile,email" -->
						<!-- 							onlogin="checkLoginState();"> -->
						<!-- 						</fb:login-button> -->
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
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<%@ include file="/WEB-INF/jsp/common-user/script.jsp"%>
</body>
</html>