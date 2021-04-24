<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Barber X - Barber Shop Template</title>
<%@ include file="/WEB-INF/jsp/common-admin/css.jsp"%>
</head>
<body>
	<%@include file="/WEB-INF/jsp/common-admin/assets.jsp"%>
	<div id="right-panel" class="right-panel">
		<%@include file="/WEB-INF/jsp/common-admin/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/common-admin/breadcrumbs.jsp"%>
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
													value="${user.userEmail}" readonly>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">Full
													Name</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" class="form-control"
													value="${user.lastName} ${user.firstName}" readonly>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">
													Gender </label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" class="form-control"
													value="${user.gender}" readonly>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">
													Phone </label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" class="form-control"
													value="${user.phone}" readonly>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">
													Role </label>
											</div>
											<c:choose>
												<c:when test="${user.roles == '[ROLE_ADMIN]' }">
													<form:form action="/admin/removeroleadmin" method="POST">
														<input type="hidden" name="userid" value="${user.userId}" />
														<div class="col-5 col-md-4">
															<input type="text" class="form-control"
																value="Administrator" readonly="readonly">
														</div>
														<div class="col-3 col-md-2">
															<input type="submit" class="btn btn-danger"
																value="Cancel Admin Permissions">
														</div>
													</form:form>
												</c:when>
												<c:otherwise>
													<form:form action="/admin/setroleadmin" method="POST">
														<input type="hidden" name="userid" value="${user.userId}" />
														<div class="col-5 col-md-4">
															<input type="text" class="form-control" value="User"
																readonly="readonly">
														</div>
														<div class="col-3 col-md-2">
															<input type="submit" class="btn btn-primary"
																value="Set Admin Permissions">
														</div>
													</form:form>
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