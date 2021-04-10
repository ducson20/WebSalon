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
	<%@include file="/WEB-INF/jsp/common-admin/aside.jsp"%>
	<div id="right-panel" class="right-panel">
		<%@include file="/WEB-INF/jsp/common-admin/header.jsp"%>

		<div class="content mt-3">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#home">Overview</a></li>

			</ul>
			<div class="tab-content">
				<div id="home" class="container tab-pane active">
					<div class="animated fadeIn">
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<strong>User Infomation</strong>
									</div>
									<div class="card-body card-block">
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">User
													Email</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" class="form-control"
													value="${user.clients.userEmail}" readonly>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">Full
													Name</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" class="form-control"
													value="${user.clients.lastName} ${user.clients.firstName}"
													readonly>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">
													Gender </label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" class="form-control"
													value="${user.clients.gender}" readonly>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">
													Phone </label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" class="form-control"
													value="${user.clients.phone}" readonly>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">
													Role </label>
											</div>
											<c:choose>
												<c:when test="${user.roles.roleId == 'AD' }">
													<form action="/admin/removeroleadmin" method="POST">
														<input type="hidden" name="userid"
															value="${user.userRoleId}" />
														<div class="col-5 col-md-4">
															<input type="text" class="form-control"
																value="Administrator" readonly="readonly">
														</div>
														<div class="col-3 col-md-2">
															<input type="submit" class="btn btn-danger"
																value="Cancel Admin Permissions">
														</div>
													</form>
												</c:when>
												<c:otherwise>
													<form action="/admin/setroleadmin" method="POST">
														<input type="hidden" name="userid"
															value="${user.userRoleId}" />
														<div class="col-5 col-md-4">
															<input type="text" class="form-control" value="User"
																readonly="readonly">
														</div>
														<div class="col-3 col-md-2">
															<input type="submit" class="btn btn-primary"
																value="Set Admin Permissions">
														</div>
													</form>
												</c:otherwise>
											</c:choose>
										</div>
										<div>
											<p class="text-center">
												<a href="/admin/userdetails"><input type="button"
													value="Cancel" class="btn btn-secondary" id="buttonCancel"></a>
											<p>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/jsp/common-admin/script.jsp"%>
</body>
</html>