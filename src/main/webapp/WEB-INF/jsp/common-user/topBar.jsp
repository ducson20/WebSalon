<%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%> <%@taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>
<div th:fragment="html_topBar">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Top Bar Start -->
	<div class="top-bar d-none d-md-block">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4">
					<div class="top-bar-left">
						<div class="text">
							<h2>8:00 - 9:00</h2>
							<p>Opening Hour Mon - Sun</p>
						</div>
						<div class="text">
							<h2>+84912190936</h2>
							<p>Call Us For Appointment</p>
						</div>
					</div>
				</div>

				<div class="col-md-8">
					<div class="top-bar-right">

						<sec:authorize access="isAuthenticated()">
							<sec:authorize access="hasRole('ROLE_USER')">
								<div class="text">
									<a class="btn btn-warning" href="/booking"><h2>Make
											Appointment</h2></a>
								</div>
								<div class="text">
									<a id="my-appointment" href="/my-appointment"><h2>
											<i class="fab fa-black-tie"></i> My Appointment
										</h2></a>
								</div>
								<div class="text">
									<a href="#dsadsaaa"><h2 id="LoginName">
											<i class="fa fa-user"></i>
											${pageContext.request.userPrincipal.name}
										</h2></a>
								</div>
								<div class="text">
									<c:url var="logout" value="/logout" />
									<form:form action="${logout}" method="post" id="logout-form"
										name="logoutForm">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
									</form:form>

									<a href="" id="logout">
										<h2>
											<i class="fas fa-sign-out-alt"></i> Logout
										</h2>
									</a>
								</div>
							</sec:authorize>

							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<div class="text">
									<a class="btn btn-warning" href="/booking"><h2>Make
											Appointment</h2></a>
								</div>
								<div class="text">
									<a id="my-appointment" href="/my-appointment"><h2>
											<i class="fab fa-black-tie"></i> My Appointment
										</h2></a>
								</div>
								<div class="text">
									<a href="/admin/servicedetails"><h2>
											<i class="fab fa-black-tie"></i> Admin
										</h2></a>
								</div>
								<div class="text">
									<a href="#"><h2 id="LoginName">
											<i class="fa fa-user"></i>
											${pageContext.request.userPrincipal.name}
										</h2></a>
								</div>
								<div class="text">
									<c:url var="logout" value="/logout" />
									<form:form action="${logout}" method="post" id="logout-form"
										name="logoutForm">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
									</form:form>

									<a href="" id="logout">
										<h2>
											<i class="fas fa-sign-out-alt"></i> Logout
										</h2>
									</a>
								</div>
							</sec:authorize>
						</sec:authorize>

						<sec:authorize access="!isAuthenticated()">
							<div class="text">
								<a href="/login"><h2>
										<i class="fas fa-user-lock"></i> Login
									</h2></a>
							</div>
							<div class="text">
								<a href="/register"><h2>
										<i class="fas fa-user-plus"></i> Register
									</h2></a>
							</div>
						</sec:authorize>

					</div>
				</div>

				<!-- 			<div class="col-md-2"> -->
				<!-- 				<div class="top-bar-left"> -->
				<!-- 					<div class="dropdown"> -->
				<!-- 						<div class="dropdown-select"> -->
				<!-- 							<img alt="" src="images/son.jpg"> <i -->
				<!-- 								class="fa fa-caret-down"></i> -->
				<!-- 						</div> -->
				<!-- 						<div class="dropdown-list"> -->
				<!-- 							<div class="dropdown-list_item"><a href="#">my appointment</a></div> -->
				<!-- 							<div class="dropdown-list_item"> <a href="#">my appointment</a> </div> -->
				<!-- 							<div class="dropdown-list_item"> <a href="/logout">Logout</a></div> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 			</div> -->
			</div>
		</div>
	</div>
	<!-- Top Bar End -->



	<c:if test="${fullName == null }">
		<script type="text/javascript">
		$(document).ready(function() {
			var urlString = "/loaduserfullname";
			$.ajax({
				method : "GET",
				url : urlString
			}).done(function(data) {
				console.log(data)
				console.log(data[0])
				console.log(data[1])
				var urlMyAppointment = '/my-appointment/' + data[0];
				// 				$('#my-appointment').attr('href', urlMyAppointment);
				// 				$("#LoginName").append(data[1]);
			})
		})
	</script>

	</c:if>
	<script>
	$(document).ready(function() {
		$('#logout').click(function(event) {
			event.preventDefault();
			$('#logout-form').submit();
		})
	})
</script>
</div>