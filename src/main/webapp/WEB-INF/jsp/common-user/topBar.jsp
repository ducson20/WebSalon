<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Top Bar Start -->
<div class="top-bar d-none d-md-block">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6">
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

			<div class="col-md-6">
				<div class="top-bar-right">

					<sec:authorize access="isAuthenticated()">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<div class="text">
								<a class="btn btn-warning" href="/booking"><h2>Make
										Appointment</h2></a>
							</div>
							<div class="text">
								<a href="/admin/servicedetails"><h2>Admin</h2></a>
							</div>
							<div class="text">
								<a href="#"><h2 id="LoginName">${fullName}</h2></a>
							</div>
							<div class="text">
								<a href="/logout"><h2>Logout</h2></a>
							</div>

						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_USER')">
							<c:if test="${pageContext.request.userPrincipal.name != null}">
								<div class="text">
									<a class="btn btn-warning" href="/booking"><h2>Make
											Appointment</h2></a>
								</div>
								<div class="text">
									<a href="#"><h2 id="">
											${name}
											<%--<sec:authentication property="name" /> --%>
										</h2></a>
								</div>
								<div class="text">
									<a href="/logout"><h2>Logout</h2></a>
								</div>
							</c:if>
							<c:if test="${fullname != null}">
								<div class="text">
									<a class="btn btn-warning" href="/booking"><h2>Make
											Appointment</h2></a>
								</div>
								<div class="text">
									<a href="#dsadsaaa"><h2 id="LoginName">${fullname}</h2></a>
								</div>
								<div class="text">
									<a href="/logout"><h2>Logout</h2></a>
								</div>
							</c:if>
						</sec:authorize>

					</sec:authorize>

					<sec:authorize access="!isAuthenticated()">
						<div class="text">
							<a href="/login"><h2>Login</h2></a>
						</div>
						<div class="text">
							<a href="/register"><h2>Register</h2></a>
						</div>
					</sec:authorize>

				</div>
			</div>
		</div>
	</div>
</div>
<!-- Top Bar End -->


<c:if test="${sessionScope.fullName == null }">
	<script type="text/javascript">
	$(document).ready(function() {
		var urlString = "/loaduserfullname";
		$.ajax({
			method : "GET",
			url : urlString
		}).done(function(data) {
			$("#LoginName").text(data);
		})
	})
 </script>
</c:if>