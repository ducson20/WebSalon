
<!-- Nav Bar Start -->
<div class="navbar navbar-expand-lg bg-dark navbar-dark">
	<div class="container-fluid">
		<a href="<%request.getContextPath();%>/" class="navbar-brand">Barber <span>X</span></a>
		<button type="button" class="navbar-toggler" data-toggle="collapse"
			data-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse justify-content-between"
			id="navbarCollapse">
			<div class="navbar-nav ml-auto">
				<a href="<%request.getContextPath();%>/" class="nav-item nav-link">Home</a>
				<a href="<%request.getContextPath();%>/about-us"
					class="nav-item nav-link active">About US</a> <a
					href="<%request.getContextPath();%>/services"
					class="nav-item nav-link">Service</a> <a
					href="<%request.getContextPath();%>/gallery"
					class="nav-item nav-link">Gallery</a> <a
					href="<%request.getContextPath();%>/contact"
					class="nav-item nav-link">Contact</a>
<!-- 					 <a -->
<%-- 					href="<%request.getContextPath();%>/booking" --%>
<!-- 					class="nav-item nav-link">Appointment</a> -->
			</div>
		</div>
	</div>
</div>
<!-- Nav Bar End -->