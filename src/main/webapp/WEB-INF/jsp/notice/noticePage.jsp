<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="/WEB-INF/jsp/common-user/css.jsp"%>
<title>Error Page</title>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/common-user/topBar.jsp"%>
	<%@ include file="/WEB-INF/jsp/common-user/navBar.jsp"%>
	<div style="margin-top: 15%; margin-bottom: 10%;">
		<div class="text-center">
			<c:choose>
				<c:when test="${message != null}">
					<c:if test="${message == 'REGISTER ACCOUNT SUCCESSFULLY' }">
						<div class="alert alert-success" role="alert"
							style="width: 1000px; margin: 0 auto; margin-bottom: 30px; font-size: 25px; font-family: monospace;">Registration
							is successful. Please check ${userEmail} to verify your account.</div>
					</c:if>
					<c:if test="${message == 'VERIFY ACCOUNT SUCCESSFULLY'}">
						<div class="alert alert-success" role="alert"
							style="width: 700px; margin: 0 auto; margin-bottom: 30px; font-size: 25px">Account ${userEmail} was active.</div>
					</c:if>
					<c:if
						test="${message == 'SEND MAIL TO FORGET PASSWORD SUCCESSFULLY' }">
						<div class="alert alert-success" role="alert"
							style="width: 700px; margin: 0 auto; margin-bottom: 30px; font-size: 25px">Please
							check your ${userEmail} for the completion.</div>
					</c:if>
					<c:if test="${message == 'CHANGE PASSWORD ACCOUNT SUCCESSFULLY'}">
						<div class="alert alert-success" role="alert"
							style="width: 700px; margin: 0 auto; margin-bottom: 30px; font-size: 25px">Password
							changed now you can login with ${userEmail}.</div>
					</c:if>



					<c:if test="${message == 'SOMETHINH WRONG' }">
						<div class="alert alert-dange" role="alert"
							style="width: 700px; margin: 0 auto; margin-bottom: 30px; font-size: 25px">Something
							was wrong</div>
					</c:if>
				</c:when>
			</c:choose>
		</div>
		<div class="text-center">
			<a href="/">
				<button type="button" class="btn btn-secondary">Click here
					to return to the home page</button>
			</a>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%>

</body>
</html>