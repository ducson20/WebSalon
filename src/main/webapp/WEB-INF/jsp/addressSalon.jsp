<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Barber X - Barber Shop Template</title>
<%@ include file="/WEB-INF/jsp/common-user/css.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/common-user/topBar.jsp"%>
	<%@ include file="/WEB-INF/jsp/common-user/navBar.jsp"%>

	<!-- Page Header Start -->
	<!-- 	<div class="" style="background-color: #D5B981;"> -->
	<!-- 	<div class="container"> -->
	<div class="row">
		<div class="col-12">
			<img src="/main-img/Haircut/COMBO 2/detail-img-service/7110(1).png"
				alt="Image"
				style="margin-top: 80px; margin-bottom: 30px; width: 100%; height: 400px;">
		</div>
	</div>
	<!-- 	</div> -->
	<!-- 	</div> -->
	<!-- Page Header End -->

	<div class="address-left">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-5">
					<div class="btn-header">
						<button type="button" class="btn-search-salon-near">Tim
							salon gan day</button>

					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="address-detail">
						<div class="row">
							<div class="col col-lg-6">
								<c:if test="${address == 'Province-City'}">
									<input type="hidden" value="${address}" class="address">
								</c:if>
								<select class="salon-select city">
									<option value="${address}">${address}</option>
								</select>

							</div>
							<div class="col col-lg-6">
								<select class="salon-select ward">

								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Address Salon Start -->
	<div class="address-right">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-5">
					<div class="scroll-bar">
						<div class="address-info">
							<div class="address-info-left"></div>

						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="address-map">
						<!-- 						<div id="map"> -->
						<!-- 						</div> -->
						<div class="map-responsive">
							<iframe
								src="https://www.google.com/maps/d/u/0/embed?mid=1eeRmi8vJzSJUjIw8p7ku30BuqmBPhAha"
								width="640" height="480"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Address Salon End -->

	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<%@ include file="/WEB-INF/jsp/common-user/script.jsp"%>
	<script>
		$('body').scrollspy({ target: '#navbar-example' })
	</script>
	<script>
					
			$(document).ready(()=>{
				
				const promise1 = new Promise((resolve, reject) => {
				fetch('/countCity')
				    .then(function(response){
				        return response.json();
				        //JSON.parse: JSON -> Javascript typees
				    })
				    .then(function(data){
				    	resolve(data);
				    })
				    .catch(function(err){
				        console.log('Co Loi');
				    })
				});
				
				const promise2 = new Promise((resolve, reject) => {
					fetch('/location/local.json')
				    .then(function(response){
				        return response.json();
				        //JSON.parse: JSON -> Javascript typees
				    })
				    .then(function(data){
				    	const cityAll = data.map((value) => {
							return value.name;
						})
				    	resolve(cityAll);
				    })
				    .catch(function(err){
				        console.log('Co Loi');
				    })
					
				});
				
				Promise.all([promise1, promise2]).then((values) => {
					const arrCityCount = values[0].map((value)=>{
						return value[0];
					})
					const arrCityApi = values[1]
					const arrDup =  arrCityApi.filter(function(value){
				 		return !arrCityCount.includes(value);
				 	})
// 				 	console.log(arrDup);
					const strCityCount = values[0].map((value)=> {
						const city = value[0];
						const countCity = value[1];
						return `\${city} (\${countCity})`
					})
// 					console.log(strCityCount);
					const cityValText = $('.city option:selected').text();
					const cityAll = strCityCount.concat(arrDup);
					if($('.address').val() === "Province-City"){
						$('.ward').append($('<option></option>').val('Ward').html('Ward'));
							const otherCity = cityAll.map((value) => {
							console.log(value)
							const nonTones = value.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
							if(value !== cityValText){
								$('.city').append($('<option></option>').val(nonTones).html(value));
							}
							return `<div  class="address-info-left">
										<div class="row">
											<div class="col-lg-3 col-md-3 col-sm-6">
												<img alt="" src="/main-img/service/7120/Lovely/Lovely_main.png">
											</div>
											<div class="col-lg-9 col-md-9 col-sm-6">
												<h2>\${value}</h2>
											</div>
										</div>
									</div>`
							})
							$('.address-info-left').html(otherCity.join(""));
						return;
						
					}else{
						cityAll.filter((value) => {
							const nonTones = value.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
							if(value !== cityValText){
								$('.city').append($('<option></option>').val(nonTones).html(value));
							}
						})
						$.ajax({
					 	      url: "/location/local.json",
					 	      dataType: "json",
					 		}).done(function(data){
								const cityValText = $('.city').val();
								const str = cityValText.replace(/[0-9]/g, '');	
								const nonTones = str.normalize("NFD").replace(/[\u0300-\u036f]/g, "").slice(0, -3);
								const findByCityID = data.filter((value) => {
								const nonAccent = value.name.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
									if(nonAccent === nonTones){
										return nonAccent;
									}
								});	
								const districts = findByCityID.map((value) => {
										return value.districts;
								})				
								
								$('.ward').append('<option value="">Ward</option>');
								districts[0].map((value) => {
									$('.ward').append($('<option></option>').val(value.name).html(value.name));
								})
								$(document).ready(() => {
									const cityVal = $('.city option:selected').text();
									var str = cityVal.replace(/[0-9]/g, '').slice(0, -3);
									console.log(str)
									
									$.ajax({
										url: '/loadAddressByCity?city=' + str,
										dataType: "json",
									})
									.done((address) => {
										var add = '';
										if(address.length > 0){
											add = address.map((value) => {
												let {roadAndNumber, ward, city} = value;
													return	`<div  class="address-info-left">
															<div class="row">
																<div class="col-lg-3 col-md-3 col-sm-6">
																	<img alt="" src="/main-img/service/7120/Lovely/Lovely_main.png">
																</div>
																<div class="col-lg-9 col-md-9 col-sm-6">
																	<h2>\${roadAndNumber} - \${ward} - \${city}</h2>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-3 col-md-3 col-sm-4">
																	<a href="">
																		<button type="button" class="btn-hotline" style="width: 100%">HOTLINE</button>
																	</a>
																</div>
																<div class="col-lg-4 col-md-4  col-sm-4"">
																	<button type="button" class="btn-address" style="width: 100%">Chi
																		Duong</button>
																</div>
																<div class="col-lg-5 col-md-5  col-sm-4"">
																	<button type="button" class="btn-booking" style="width: 100%">Dat
																		Lich Cat</button>
																</div>
															</div>
														</div>`;
													
											});
											$('.address-info-left').html(add.join(""));
										}else{
											$('.address-info-left').html('');
											$('.address-info-left').append('<h2 style="color: red; text-transform: uppercase; text-align: center;">Khong co co so nao</h2>');
										}
			
									})
								})
					 	 })	
					}
					
				});	
			});


			$('.city').change(()=>{
				$.ajax({
			 	      url: "/location/local.json",
			 	      dataType: "json",
			 	}).done(function(data){
					const cityValText = $('.city').val();
					var str = cityValText.replace(/[0-9]/g, '');
					var nonTones = str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
					if(nonTones.includes("()")){
						nonTones = str.normalize("NFD").replace(/[\u0300-\u036f]/g, "").slice(0, -3);
					}else{
						nonTones = str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
					}
					const findByCityID = data.filter((value) => {
						const nonAccent = value.name.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
						if(nonAccent === nonTones){
							return nonAccent;
						}
					
					});		
					const districts = findByCityID.map((value) => {
						return value.districts;
					})				
					$('.ward').html('');
					$('.ward').append('<option value="">Ward</option>');
					districts[0].map((value) => {
						$('.ward').append($('<option></option>').val(value.name).html(value.name));
					})
			 	})
			});
			

	</script>
	<script>

	
		$('.city').change(() => {
			const cityVal = $('.city option:selected').text();
			var str = cityVal.replace(/[0-9]/g, '').slice(0, -3);
			console.log(str)
			$.ajax({
				url: '/loadAddressByCity?city=' + str,
				dataType: "json",
			})
			.done((address) => {
				console.log(address);
				var add = '';
				if(address.length > 0){
					console.log(address)
					add = address.map((value) => {
				
						let {roadAndNumber, ward, city} = value;
							return	`<div  class="address-info-left">
									<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-6">
											<img alt="" src="/main-img/service/7120/Lovely/Lovely_main.png">
										</div>
										<div class="col-lg-9 col-md-9 col-sm-6">
											<h2>\${roadAndNumber} - \${ward} - \${city}</h2>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-3 col-md-3 col-sm-4">
											<a href="">
												<button type="button" class="btn-hotline" style="width: 100%">HOTLINE</button>
											</a>
										</div>
										<div class="col-lg-4 col-md-4  col-sm-4"">
											<button type="button" class="btn-address" style="width: 100%">Chi
												Duong</button>
										</div>
										<div class="col-lg-5 col-md-5  col-sm-4"">
											<button type="button" class="btn-booking" style="width: 90%">Dat
												Lich Cat</button>
										</div>
									</div>
								</div>`;
							
					});
					$('.address-info-left').html(add.join(""));
				}else{
					$('.address-info-left').html('');
					$('.address-info-left').append('<h2 style="color: red; text-transform: uppercase; text-align: center;">Khong co co so nao</h2>');
				}
			
			
			})
		})
		
	</script>
	<script> 
	$('.ward').change(() => {
		const wardVal = $('.ward option:selected').text();
		$.ajax({
			url: '/loadAddressByWard?ward=' + wardVal,
			dataType: "json",
		})
		.done((address) => {
			var add = '';
			if(address.length > 0){
				add = address.map((value) => {
					let {roadAndNumber, ward, city} = value;
						return	`<div  class="address-info-left">
								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-6">
										<img alt="" src="/main-img/service/7120/Lovely/Lovely_main.png">
									</div>
									<div class="col-lg-9 col-md-9 col-sm-6">
										<h2>\${roadAndNumber} - \${ward} - \${city}</h2>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-4">
										<a href="">
											<button type="button" class="btn-hotline" style="width: 100%">HOTLINE</button>
										</a>
									</div>
									<div class="col-lg-4 col-md-4  col-sm-4"">
										<button type="button" class="btn-address" style="width: 100%">Chi
											Duong</button>
									</div>
									<div class="col-lg-5 col-md-5  col-sm-4"">
										<button type="button" class="btn-booking" style="width: 90%">Dat
											Lich Cat</button>
									</div>
								</div>
							</div>`;
						
				});
				$('.address-info-left').html(add.join(""));
			}else{
				$('.address-info-left').html('');
				$('.address-info-left').append('<h2 style="color: red; text-transform: uppercase; text-align: center;">Khong co co so nao</h2>');
			}
		
		
		})
	})
	</script>
</body>
</html>