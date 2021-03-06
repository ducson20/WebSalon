<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Barber X - Barber Shop Template</title>
<%@ include file="/WEB-INF/jsp/common-admin/css.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/common-admin/assets.jsp"%>
	<!-- Right Panel -->
	<div id="right-panel" class="right-panel">
		<%@ include file="/WEB-INF/jsp/common-admin/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/common-admin/breadcrumbs.jsp"%>

		<div class="content mt-3">

			<div class="col-sm-6 col-lg-3">
				<div class="card text-white bg-flat-color-1">
					<div class="card-body pb-0">
						<div class="dropdown float-right">
							<button
								class="btn bg-transparent dropdown-toggle theme-toggle text-light"
								type="button" id="dropdownMenuButton1" data-toggle="dropdown">
								<i class="fa fa-cog"></i>
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
								<div class="dropdown-menu-content">
									<a class="dropdown-item" href="#">Action</a> <a
										class="dropdown-item" href="#">Another action</a> <a
										class="dropdown-item" href="#">Something else here</a>
								</div>
							</div>
						</div>
						<h4 class="mb-0">
							<span class="count">10468</span>
						</h4>
						<p class="text-light">Members online</p>

						<div class="chart-wrapper px-0" style="height: 70px;" height="70">
							<canvas id="widgetChart1"></canvas>
						</div>

					</div>

				</div>
			</div>
			<!--/.col-->

			<div class="col-sm-6 col-lg-3">
				<div class="card text-white bg-flat-color-2">
					<div class="card-body pb-0">
						<div class="dropdown float-right">
							<button
								class="btn bg-transparent dropdown-toggle theme-toggle text-light"
								type="button" id="dropdownMenuButton2" data-toggle="dropdown">
								<i class="fa fa-cog"></i>
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
								<div class="dropdown-menu-content">
									<a class="dropdown-item" href="#">Action</a> <a
										class="dropdown-item" href="#">Another action</a> <a
										class="dropdown-item" href="#">Something else here</a>
								</div>
							</div>
						</div>
						<h4 class="mb-0">
							<span class="count">10468</span>
						</h4>
						<p class="text-light">Members online</p>

						<div class="chart-wrapper px-0" style="height: 70px;" height="70">
							<canvas id="widgetChart2"></canvas>
						</div>

					</div>
				</div>
			</div>
			<!--/.col-->

			<div class="col-sm-6 col-lg-3">
				<div class="card text-white bg-flat-color-3">
					<div class="card-body pb-0">
						<div class="dropdown float-right">
							<button
								class="btn bg-transparent dropdown-toggle theme-toggle text-light"
								type="button" id="dropdownMenuButton3" data-toggle="dropdown">
								<i class="fa fa-cog"></i>
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton3">
								<div class="dropdown-menu-content">
									<a class="dropdown-item" href="#">Action</a> <a
										class="dropdown-item" href="#">Another action</a> <a
										class="dropdown-item" href="#">Something else here</a>
								</div>
							</div>
						</div>
						<h4 class="mb-0">
							<span class="count">10468</span>
						</h4>
						<p class="text-light">Members online</p>

					</div>

					<div class="chart-wrapper px-0" style="height: 70px;" height="70">
						<canvas id="widgetChart3"></canvas>
					</div>
				</div>
			</div>
			<!--/.col-->

			<div class="col-sm-6 col-lg-3">
				<div class="card text-white bg-flat-color-4">
					<div class="card-body pb-0">
						<div class="dropdown float-right">
							<button
								class="btn bg-transparent dropdown-toggle theme-toggle text-light"
								type="button" id="dropdownMenuButton4" data-toggle="dropdown">
								<i class="fa fa-cog"></i>
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton4">
								<div class="dropdown-menu-content">
									<a class="dropdown-item" href="#">Action</a> <a
										class="dropdown-item" href="#">Another action</a> <a
										class="dropdown-item" href="#">Something else here</a>
								</div>
							</div>
						</div>
						<h4 class="mb-0">
							<span class="count">10468</span>
						</h4>
						<p class="text-light">Members online</p>

						<div class="chart-wrapper px-3" style="height: 70px;" height="70">
							<canvas id="widgetChart4"></canvas>
						</div>

					</div>
				</div>
			</div>
			<!--/.col-->

			<div class="col-xl-3 col-lg-6">
				<div class="card">
					<div class="card-body">
						<div class="stat-widget-one">
							<div class="stat-icon dib">
								<i class="ti-money text-success border-success"></i>
							</div>
							<div class="stat-content dib">
								<div class="stat-text">Total Profit</div>
								<div class="stat-digit">1,012</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="col-xl-3 col-lg-6">
				<div class="card">
					<div class="card-body">
						<div class="stat-widget-one">
							<div class="stat-icon dib">
								<i class="ti-user text-primary border-primary"></i>
							</div>
							<div class="stat-content dib">
								<div class="stat-text">New Customer</div>
								<div class="stat-digit">961</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xl-3 col-lg-6">
				<div class="card">
					<div class="card-body">
						<div class="stat-widget-one">
							<div class="stat-icon dib">
								<i class="ti-layout-grid2 text-warning border-warning"></i>
							</div>
							<div class="stat-content dib">
								<div class="stat-text">Active Projects</div>
								<div class="stat-digit">770</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- .content -->
	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->
	<%@ include file="/WEB-INF/jsp/common-admin/script.jsp"%>

</body>
</html>