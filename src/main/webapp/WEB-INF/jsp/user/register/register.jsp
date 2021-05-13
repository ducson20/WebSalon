<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

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
	<div class="sufee-login d-flex align-content-center flex-wrap">
		<div class="container">
			<div class="login-content">
				<div class="login-logo">
					<a href="index.html"> <img class="align-content"
						src="<%request.getContextPath();%>/images/logo.png" alt="">
					</a>
				</div>
				<div class="login-form">
					<c:url var="register" value="/register" />
					<sf:form action="${register}" method="POST" id="register-form"
						modelAttribute="newAccount">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="form-group">
							<label for="firstName" class="form-label">First Name</label> <input
								type="text" class="form-control" id="firstName" name="firstName">
						</div>
						<div class="form-group">
							<label for="lastName" class="form-label">Last Name</label> <input
								type="text" class="form-control" id="lastName" name="lastName">
						</div>
						<div class="form-group">
							<div class="mb-3">
								<label for="gender" class="form-label">Gender</label> <select
									class="form-control" name="gender"><option
										value="Male">Male</option>
									<option value="Female">Female</option>
									<option value="Other">Other</option></select>
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="form-label">Phone</label> <input
								type="text" class="form-control" id="phone" name="phone">
						</div>
						<div class="form-group">
							<label for="userEmail" class="form-label">Email address</label> <input
								type="email" class="form-control" id="userEmail"
								name="userEmail">
						</div>
						<div class="form-group">
							<label for="password" class="form-label">Password</label> <input
								type="password" class="form-control" id="password"
								name="password">
						</div>
						<div class="form-group">
							<label for="confirmPassword" class="form-label">Confirm
								Password</label> <input type="password" class="form-control"
								id="confirmPassword" name="confirmPassword">
						</div>
						<div class="checkbox">
							<label> <input type="checkbox"> Agree the terms
								and policy
							</label>
						</div>
						<button type="submit"
							class="btn btn-primary btn-flat m-b-30 m-t-30">Register</button>
						<div class="social-login-content">
							<div class="social-button">
								<a href="oauth2/authorize-client/facebook">
									<button type="button"
										class="btn social facebook btn-flat btn-addon mb-3">
										<i class="ti-facebook"></i>Register with facebook
									</button>
								</a> <a href="oauth2/authorize-client/google">
									<button type="button"
										class="btn social twitter btn-flat btn-addon mt-2">
										<i class="ti-google"></i>Register with google
									</button>
								</a>
							</div>
						</div>
						<div class="register-link m-t-15 text-center">
							<p>
								Already have account ? <a href="/login"> Sign in</a>
							</p>
						</div>
					</sf:form>
				</div>
			</div>
		</div>
		<div id="modalDialog" class="modal fade text-center" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document" style="margin-top: 40px;">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="modal-title">Warning</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						
					</div>
					<div class="modal-body">
						<span id="modalBody"></span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-dismiss="modal" >Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<%@ include file="/WEB-INF/jsp/common-user/script.jsp"%></body>
<script>
		$( "#register-form" ).submit(function( event ) {
		  event.preventDefault();
		  var url = '/checkUniqueUser';
		  var email = $('#userEmail').val();
		  var csrfValue = $("input[name='_csrf']").val();
		  var params = {email: email, _csrf: csrfValue}

		  $.post(url, params, function(response){
		  console.log(response)
		  	if(response == 'OK'){
		  		console.log('submit')
 				document.getElementById('register-form').submit();
		  		//$('#register-form').submit();
		  	}
		  	else if(response == "DUPLICATE"){
		  		showModalDialog('Warning', 'There is another user having the email: ' + email);
		  	}else{
		  		showModalDialog('Error', 'Unknow response from server');
		  	}
		  }).fail(function(){
		  	showModalDialog('Error', 'Could not connect to server');
		  	
		  })
		  
		  return false;

		  
		});
		function showModalDialog(title, message){
			$('#modalTitle').text(title);
			$('#modalBody').text(message);
			$('#modalDialog').modal()
		
		}
	</script>
</html>