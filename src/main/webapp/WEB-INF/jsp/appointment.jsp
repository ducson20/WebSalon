<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Barber X - Barber Shop Template</title>
<%@ include file="/WEB-INF/jsp/common-user/css.jsp"%>
<link rel="stylesheet" href="/css-form-submit/sub-form.css">
</head>
<body>
	<%@ include file="/WEB-INF/jsp/common-user/topBar.jsp"%>
	<%@ include file="/WEB-INF/jsp/common-user/navBar.jsp"%>
	<!-- 	<div class="blue block"> -->
	<section class="card-booking">
		<h3 class="card-header">Appointment</h3>
		<form id="regForm" action="/booking" method="POST">
			<div id="myModal" class="modal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document" style="margin-top: 40px;">
					<div class="modal-content">
						<div class="modal-header">
							<h3 class="modal-title">Phone</h3>
						</div>
						<div class="modal-body">
							<input type="text" id="phone" name="phone"
								placeholder="0000.000.000"> <label id="phone-error"
								class="error" for="phone"></label>
						</div>
						<div class="modal-body"
							style="text-align: center; color: black; margin-top: -25px;">
							<a href="/" style="color: #151515;"> >> Click to return home
								page</a>
						</div>
						<div class="modal-footer">
							<button type="button" class="" id="save-phone"
								data-dismiss="modal" style="width: 100%">Booking Now</button>
						</div>
					</div>
				</div>
			</div>
			<div class="relative">
				<div class="tab">
					<div class="progress">
						<div class="progress-bar bg-warning" role="progressbar"
							style="width: 25%" aria-valuenow="25" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<div class="card-body">
						<h2>Address</h2>
						<div class="row">
							<div class="form-group col">
								<select class="custom-select address-salon" name="salon"
									id="address-salon">
									<option value="0">Please selected</option>
									<c:forEach var="listAdd" items="${listAddressOfSalon}">
										<option value="${listAdd.salonId}">${listAdd.roadAndNumber}
											- ${listAdd.ward} - ${listAdd.city}</option>
									</c:forEach>
								</select>
								<p class="text-wraming"></p>
							</div>
						</div>
					</div>
				</div>
				<div class="tab">
					<div class="progress">
						<div class="progress-bar bg-warning" role="progressbar"
							style="width: 50%" aria-valuenow="50" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<div class="card-body" style="position: relative;">
						<c:forEach var="listService" items="${listService}">

							<c:if test="${listService.serviceId == 'H'}">
								<div class="row">
									<div class="headerService">
										<h1>${listService.serviceName}</h1>
									</div>
								</div>
								<c:forEach var="serviceDetail" items="${listServiceDetailH}">
									<div class="row">
										<div class="col col-md-3">
											<input type="checkbox" name="listServices"
												value="${serviceDetail.title}">
											</p>
										</div>

										<div class="col col-md-6">
											<h6>${serviceDetail.title}</h6>
											<p>${serviceDetail.descripttion}</p>
										</div>
										<div class="col col-md-3">
											<h6>$${serviceDetail.price}</h6>
											<p>${serviceDetail.timeToComplete}minitue</p>
										</div>
									</div>
								</c:forEach>
								<div class="box"></div>
							</c:if>
							<c:if test="${listService.serviceId == 'HD'}">
								<div class="row">
									<div class="headerService">
										<h1>${listService.serviceName}</h1>
									</div>
								</div>
								<c:forEach var="serviceDetail" items="${listServiceDetailHD}">
									<div class="row">
										<div class="col col-md-3">
											<p style="margin: 16px 0 0 40px;">
												<input type="checkbox" name="listServices"
													value="${serviceDetail.title}">
											</p>
										</div>

										<div class="col col-md-6">
											<h6>${serviceDetail.title}</h6>
											<p>${serviceDetail.descripttion}</p>
										</div>
										<div class="col col-md-3">
											<h6>${serviceDetail.price}K</h6>
											<p>${serviceDetail.timeToComplete}minitue</p>
										</div>
									</div>
								</c:forEach>
								<div class="box"></div>

							</c:if>
							<c:if test="${listService.serviceId == 'HC'}">
								<div class="row">
									<div class="headerService">
										<h1>${listService.serviceName}</h1>
									</div>
								</div>
								<hr style="border: 1px solid #C0C0C0;">
								<c:forEach var="serviceDetail" items="${listServiceDetailCH}">
									<div class="row">
										<div class="col col-md-3">
											<p style="margin: 16px 0 0 40px;">
												<input type="checkbox" name="listServices"
													value="${serviceDetail.title}">
											</p>
										</div>
										<div class="col col-md-6">
											<h6>${serviceDetail.title}</h6>
											<p>${serviceDetail.descripttion}</p>
										</div>
										<div class="col col-md-3">
											<h6>${serviceDetail.price}K</h6>
											<p>${serviceDetail.timeToComplete}minitue</p>
										</div>
									</div>
								</c:forEach>
								<div class="box"></div>

							</c:if>
							<c:if test="${listService.serviceId == 'OT'}">
								<div class="row">
									<div class="headerService">
										<h1>${listService.serviceName}</h1>
									</div>
								</div>
								<div class="box"></div>
								<c:forEach var="serviceDetail" items="${listServiceDetailOT}">
									<div class="row">
										<div class="col col-md-3">
											<p style="margin: 16px 0 0 40px;">
												<input type="checkbox" name="listServices"
													value="${serviceDetail.title}">
											</p>
										</div>

										<div class="col col-md-6">
											<h6>${serviceDetail.title}</h6>
											<p>${serviceDetail.descripttion}</p>
										</div>
										<div class="col col-md-3">
											<h6>${serviceDetail.price}K</h6>
											<p>${serviceDetail.timeToComplete}minitue</p>
										</div>
									</div>
								</c:forEach>
								<div class="box"></div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="tab">
					<div class="note">
						<div class="note-info">
							<div class="row">
								<div class="">
									<h2>EACH PHONE BOOKED FOR 1 PERSON</h2>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-8 col-md-8">
									<p>If you want to schedule a group of people, please press
										the free call button for CSKH for support group scheduling.</p>
								</div>
								<div class="col-lg-4 col-md-4">
									<button>Mien Phi</button>
								</div>

							</div>
						</div>
						<div class="box"></div>
						<div class="note-info">
							<div class="row">
								<div class="">
									<h2>FREE SPECIAL REQUIREMENTS</h2>
								</div>

							</div>
							<div class="row">
								<div class="col-lg-1 col-md-1">
									<input type="checkbox">
								</div>
								<div class="col-lg-11 col-md-11">
									<p>He was in a hurry, to spend less time washing, wanted to
										cut it soon.</p>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-1 col-md-1">
									<input type="checkbox">
								</div>
								<div class="col-lg-11 col-md-11">
									<p>Cover cut (scars, milia, flat head).</p>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-1 col-md-1">
									<input type="checkbox">
								</div>
								<div class="col-lg-11 col-md-11">
									<p>His skin is easily irritated.</p>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-1 col-md-1">
									<input type="checkbox">
								</div>
								<div class="col-lg-11 col-md-11">
									<p>Ask carefully before and during cutting.</p>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-1 col-md-1">
									<input type="checkbox">
								</div>
								<div class="col-lg-11 col-md-11">
									<p>Instructions for self-waxing at home.</p>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-1 col-md-1">
									<input type="checkbox">
								</div>
								<div class="col-lg-11 col-md-11">
									<p>Do not wash vigorously with your nails.</p>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-1 col-md-1">
									<input type="checkbox">
								</div>
								<div class="col-lg-11 col-md-11">
									<p>New hairstyle advice.</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="tab">
					<div class="progress">
						<div class="progress-bar bg-warning" role="progressbar"
							style="width: 75%" aria-valuenow="75" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="form-group col">
								<label for="inputState">Stylist preferred</label> <select
									id="employee" class="form-control list-fullNames"
									name="employee">
								</select>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-6">
								<label for="inputState">Choose Date</label>

								<div class="input-group mb-3">

									<select class="custom-select list-date" name="dateBooked">
										<c:forEach var="listDate" items="${listDate}">
											<option value="${listDate}" label="${listDate}"></option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-md-6">
								<label for="inputState">Choose Time</label>
								<div class="input-group mb-3">
									<select class="custom-select list-time" name="timeBooked"
										id="timeEmp">
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="sticky">
					<div class="info-appointment">

						<div class="salon-address">
							<div class="row">
								<div class="col">
									<h2>
										<i class="fa fa-map-marker" aria-hidden="true"></i> Salon
									</h2>
									<p>65 Thanh Nien Dong Hoi Quang Binh</p>
								</div>

							</div>
						</div>


						<div class="info-detail">
							<div class="row">
								<div class="col-lg-4 col-md-6 col-xs-4">
									<h2>
										<i class="fa fa-calendar" aria-hidden="true"></i> Ngay
									</h2>
									<p>16-04-2021</p>
								</div>
								<div class="col-lg-4 col-md-6 col-xs-4">
									<h2>
										<i class="fa fa-clock-o" aria-hidden="true"></i> Gio
									</h2>
									<p>08:00</p>
								</div>
								<div class="col-lg-4 col-md-6 col-xs-4">
									<h2>
										<i class="fa fa-user" aria-hidden="true"></i> Stylist
									</h2>
									<p>Duc Son</p>
								</div>
							</div>
						</div>

						<div class="service-choosen">
							<div class="row">
								<div class="col">
									<h2>
										<i class="menu-icon fa fa-glass"></i> Service Choosen
									</h2>
									<p>Duc Son</p>
								</div>

							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="footer-appointment">
								<div class="icon-info-appointment">
									<img class="img-bag"
										src="<%request.getContextPath();%>/images/bag-icon.png" alt="">
								</div>
								<div class="change-fixed"
									style="float: right; right: 30px; margin-top: 15px; margin-right: 10px">
									<button type="button" class="" id="prevBtn"
										onclick="nextPrev(-1)">Previous</button>
									<button type="button" class=" btn-fixed" id="nextBtn"
										onclick="nextPrev(1)">Next</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>

	</section>

	<!-- 	</div> -->
	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>


	<%@ include file="/WEB-INF/jsp/common-user/script.jsp"%>

	<!-- 	<script -->
	<%-- 		src="<%=request.getContextPath()%>/ValidateForm/jquery.validate.js"></script> --%>
	<%-- 	<script src="<%=request.getContextPath()%>/ValidateForm/booking.js"></script> --%>


	<script>
		$(document).ready(function() {
		  $('.img-bag').click(function() {
		    $('.info-appointment').slideToggle("slow");
		    // Alternative animation for example
		    // slideToggle("fast");
		  });
		});
	</script>
	<script>
		$('#save-phone').click(function(event){
			
			var phoneVal = $('#phone').val();
			if(phoneVal == ""){
				$('#phone-error').append('<span>Please enter phone number!!</span>')
			}
			event.preventDefault();
		})
	</script>



	<script>
		//Show modal enter phone
		$(document).ready(function(){
			$('#myModal').modal({backdrop: 'static', keyboard: false})  
		})
	</script>



	<script type="text/javascript">
	//Load page request URL salon nd phone
	$(document).ready(function(){
		const salonID = $('.address-salon').val();
		var urlSalon = 'salonid';
		var urlPhone = 'phone';
	    requestURL(urlSalon, salonID);
	    requestURL(urlPhone, '');
	})
	
	//When use not yet choose address. If not choose disable button NEXT
	$('.address-salon').change(function(){
		const salonAdd = $('.address-salon').val();
			if(salonAdd == 0){
	    		$("#nextBtn").attr("onClick","alertForAddress();this.disabled=true");
	   		}
	})
	
	validationAddress();
	function validationAddress(){
		const salonAdd = $('.address-salon').val();
		if(salonAdd == 0){
	    	$("#nextBtn").attr('onClick','alertForAddress(); this.disabled=true');
	    }
		$('.address-salon').change(function(){
			if(salonAdd == 0){
	    		$("#nextBtn").attr("onClick","this.disabled=true");
	   		}
	    	$('#nextBtn').removeAttr('disabled');
	    	$('#nextBtn').attr("onClick","nextPrev(1)");
	 	})	
	}
	
	//Request URL phone = 0000.000.000
	$('#save-phone').click(function(){
		const phoneVal= $('#phone').val();
		var urlStr = 'phone';
		requestURL(urlStr, phoneVal);
		$('#phone').attr('value', phoneVal);
		
	})
	
	
	
	var currentTab = 0; // Current tab is set to be the first tab (0)
	showTab(currentTab); // Display the current tab
	function showTab(n) {
	
	    // This function will display the specified tab of the form ...
	    var x = document.getElementsByClassName("tab");
	    x[n].style.display = "block";
	    
	    // Request step URL  ... and fix the Previous/Next buttons:
	    var strUrl = 'step'
	    requestURL(strUrl, n); 
	    
	    if (n == 0) {
	        document.getElementById("prevBtn").style.display = "none";
	    } else {
	        document.getElementById("prevBtn").style.display = "inline";
	    }
	    
	    //Step = 3 for submit form
	    if(n==3){
	    
	    	// Time null alert message
	    	$(document).ready(function(){
	    		const timeVal = $('.list-time').val();
	    		if(timeVal == null){
	    			//alertForTimeSalon();
	    		}
	    	})
	    	
	    	// Load page and list time salon
	    	$(document).ready(function(){
	    		const salonID = $('.address-salon').val();
				const date = $('.list-date').val();
				const strToDateBooked = moment(date, 'MM/DD/YYYY').toDate();
				const dateBooked = moment(strToDateBooked).format('YYYY-MM-DD');
				//alert(salonID);
				//alert(dateBooked);
	    		var urlString = 'listTimeOfEmployeeSalonApp1?salonid=' + salonID + '&datebooked=' + dateBooked;
					 $.ajax({
				        method: "GET",
				        url: urlString,
				        dataType: "json",
				    }).done(function (timeOfEmpSalon) {
				    
					// Time of employee list by salonID					
					const timeEmpBySalonID = timeOfEmpSalon[0];
					const strTotimeAllEmpBySalonID = timeEmpBySalonID.toString();
					const timeAllEmBySalonIDToArr = strTotimeAllEmpBySalonID.split(',');
					
					// Time of appointment list by that date
					const timeBookedApp = timeOfEmpSalon[1];
					
					// Time of salon by salonID
					const timeOfSalonBySalonID = timeOfEmpSalon[2];
				    const strToTimeOfSalonBySalonID = timeOfSalonBySalonID.split(',');
					
					// Case user not choosen stylist
					if($('.list-fullNames').val() === ''){
							//alert('User not choosen stylist');
							var countsApp = {};
							var countEmp = {};
							
							const promise1 = new Promise((resolve, reject) => {
							  	timeBookedApp.map(function(value1) { 
									const x = moment(value1, 'HH:mm:ss').format('HH:mm');
									countsApp[x] = (countsApp[x] || 0)+1; 		
								})
								resolve(countsApp);
							});
							
							const promise2 = new Promise((resolve, reject) => {
							  	timeAllEmBySalonIDToArr.map(function(value2){
									const x1 = moment(value2, 'HH:mm:ss').format('HH:mm');
									return countEmp[x1] = (countEmp[x1] || 0)+1; 	
								})
								resolve(countEmp);
							});
							
							Promise.all([promise1, promise2]).then((values) => {
								 const str1 = JSON.stringify(values[0]);
							 	 const str2 = JSON.stringify(values[1]);
							 	 
							 	 const result1 = str1.substring(1, str1.length-1);
							 	 const result2 = str2.substring(1, str2.length-1);
							 	 
							 	 const arr1 = result1.split(',');
							 	 const arr2 = result2.split(',');
							 	 
							 	 console.log(values[0]);
							 	 console.log(values[1]);
							 	 const a = [];
							 	 arr1.map(function(value1){
							 	 	  arr2.map(function(value2){
							 	 		 if(value1 == value2){
							 	 		 	const s = value1.replace('"','');
							 	 		 	const ss = s.slice(0, -3);
							 	 		 	a.push(ss);
							 	 		 }
							 		  })
							 	 })
							 	 
							 	 const arrSalon =  strToTimeOfSalonBySalonID.filter(function(val){
							 	 		return timeAllEmBySalonIDToArr.includes(val);
							 	 })
							 	 //console.log(arrSalon);
							 	 
							 	 const timeDup = arrSalon.filter(function(value){
							 	 		return !a.includes(value);
							 	 })
								 
								 
							 	
							 	 console.log(arrSalon);
							 	 console.log(a);
							 	 console.log('Time Dup: '+timeDup);
							 	 
							 	 const localTime = new Date();
				        		 const disableTime = timeDup.filter(function (value, i) {
					            	 const stringToDate = moment(value, 'HH:mm').toDate();
					            	 return stringToDate.getTime() >= localTime.getTime();
					       		 });
					       		 if(disableTime.length > 0){
									    disableTime.map(function(value){
							 	 			$('.list-time').append($('<option></option>').val(value).html(value));
							 	 		})	 
								 }else{
								    	 alertForTimeSalon();
							      		 $('.list-time').html('');
								  }
							 	 	 
							});		
					}
					})
					
				// Change date and list time salon
	    		$('.list-date').change(function(){
	    		const salonID = $('.address-salon').val();
	    		const employeeID =  $('.list-fullNames').val();
				const date = $('.list-date').val();
				const strToDateBooked = moment(date, 'MM/DD/YYYY').toDate();
				const dateBooked = moment(strToDateBooked).format('YYYY-MM-DD');
				//alert(salonID);
				//alert(dateBooked);
				var urlStr = '';
				if(employeeID === ''){
							urlStr = 'listTimeOfEmployeeSalonApp1?salonid=' + salonID + '&datebooked=' + dateBooked;
							$.ajax({
						        method: "GET",
						        url: urlStr,
						        dataType: "json",
						    }).done(function (timeOfEmpSalon) {
							// Time of employee list by salonID					
							const timeEmpBySalonID = timeOfEmpSalon[0];
							const strTotimeAllEmpBySalonID = timeEmpBySalonID.toString();
							const timeAllEmBySalonIDToArr = strTotimeAllEmpBySalonID.split(',');
							
							// Time of appointment list by that date
							// Van de o day
							const timeBookedApp = timeOfEmpSalon[1];
							console.log('test: '+timeBookedApp);
							
							// Time of salon by salonID
							const timeOfSalonBySalonID = timeOfEmpSalon[2];
						    const strToTimeOfSalonBySalonID = timeOfSalonBySalonID.split(',');
							
							// Case user not choosen stylist
					
							//alert('User not choosen stylist');
							var countsApp = {};
							var countEmp = {};
							
							const promise1 = new Promise((resolve, reject) => {
							  	timeBookedApp.map(function(value1) { 
									const x = moment(value1, 'HH:mm:ss').format('HH:mm');
									countsApp[x] = (countsApp[x] || 0)+1; 		
								})
								resolve(countsApp);
							});
							
							const promise2 = new Promise((resolve, reject) => {
							  	timeAllEmBySalonIDToArr.map(function(value2){
									const x1 = moment(value2, 'HH:mm:ss').format('HH:mm');
									return countEmp[x1] = (countEmp[x1] || 0)+1; 	
								})
								resolve(countEmp);
							});
							
							Promise.all([promise1, promise2]).then((values) => {
								 const str1 = JSON.stringify(values[0]);
							 	 const str2 = JSON.stringify(values[1]);
							 	 
							 	 const result1 = str1.substring(1, str1.length-1);
							 	 const result2 = str2.substring(1, str2.length-1);
							 	 
							 	 const arr1 = result1.split(',');
							 	 const arr2 = result2.split(',');
							 	 
							 	 console.log(values[0]);
							 	 console.log(values[1]);
							 	 const a = [];
							 	 arr1.map(function(value1){
							 	 	  arr2.map(function(value2){
							 	 		 if(value1 == value2){
							 	 		 	const s = value1.replace('"','');
							 	 		 	const ss = s.slice(0, -3);
							 	 		 	a.push(ss);
							 	 		 }
							 		  })
							 	 })
							 	 const arrSalon =  strToTimeOfSalonBySalonID.filter(function(val){
							 	 		return timeAllEmBySalonIDToArr.includes(val);
							 	 })
							 	 const timeDup = arrSalon.filter(function(value){
							 	 		return !a.includes(value);
							 	 })
							 	 
							 	 console.log(arrSalon)
							 	 console.log(a);
							 	 //console.log(timeDup);
							 	 const localTime = new Date();
				        		 const disableTime = timeDup.filter(function (value, i) {
					            	 const stringToDate = moment(value, 'HH:mm').toDate();
					            	 return stringToDate.getTime() >= localTime.getTime();
					       		 });
					       		 
						          const dateVal = $('.list-date').val();
						    	  const dateValToDate = moment(dateVal, 'MM/DD/YYYY').toDate();
						    	 
							    	  	if (dateValToDate.getDate() === localTime.getDate()) {
							    	  		//alert('Today')
							    	  		 if(disableTime.length > 0){
						    	  				//alert('Other Null')
							            		$('.list-time').html('');
								           		 disableTime.map(function (value, index) {
								              		  $('.list-time').append($('<option></option>').val(value).html(value));
								           		 })
							    	  		 }else{
											    alertForTimeSalon();
										      	$('.list-time').html('');
											  } 
							          	}else{
							          		//alert('Tomorror')
							          		//$('.list-fullNames').prop('selectedIndex',0);
								            $('.list-time').html('');
								            console.log(timeDup);
								            timeDup.map(function (value, i) {
								                $('.list-time').append($('<option></option>').val(value).html(value));
								            })
							       	  	}	
						    	 	 
							});		
					
					})
				}else{
							//alert('User choosen stylist');	
								urlStr = 'listTimeOfEmployeeSalonApp?salonid=' + salonID +'&employeeid=' + employeeID + '&datebooked=' + dateBooked;
								$.ajax({
						        method: "GET",
						        url: urlStr,
						        dataType: "json",
						    }).done(function (timeOfEmpSalon) {
				    		//console.log('Array time of employee: ' + timeOfEmpSalon[0]);
							//console.log('Array time of appointment by empID and datebooked: ' + timeOfEmpSalon[1]);
							
							// Time of employee by employeeID
							const timeOfEmp = timeOfEmpSalon[0];
							const strToTimeOfEmp = timeOfEmp.split(',');
							console.log(strToTimeOfEmp);
							// Time of employee by employeeID and date booked in table appointment
							const timeAppByEmpIDDate = timeOfEmpSalon[1];
							const timeAppByEmpIDDateToStr = timeAppByEmpIDDate.map(function(value, index){
								return moment(value, 'HH:mm:ss').format('HH:mm');
							})
							console.log(timeAppByEmpIDDateToStr);
							// Check time employee booked in table appointment with time of that employee
							const checkTimeOfEmp = strToTimeOfEmp.filter(function(value, index){
								return !timeAppByEmpIDDateToStr.includes(value);
							});
							console.log(checkTimeOfEmp);
							// Disable time
				        	const localTime = new Date();
				        	const disableTime = checkTimeOfEmp.filter(function (value, i) {
					            const stringToDate = moment(value, 'HH:mm').toDate();
					            return stringToDate.getTime() >= localTime.getTime();
					        });
					        //$('.list-date').prop('selectedIndex',0);
					        $('.list-time').html('');
				        	checkTimeOfEmp.map(function(value, index){
				        		$('.list-time').append($('<option></option>').val(value).html(value));
				        	})
				        	
				        	const dateVal = $('.list-date').val();
						    const dateValToDate = moment(dateVal, 'MM/DD/YYYY').toDate();
				        	
						    
						 
			
							   	if (dateValToDate.getDate() === localTime.getDate()) {
							   	  		if(disableTime.length > 0){
								    	 	 alert('Today')
								         	 $('.list-time').html('');
									     	 disableTime.map(function (value, index) {
									             $('.list-time').append($('<option></option>').val(value).html(value));
									     	 })
							   	 		}else{
										 	 alertForTimeSalon();
									     	 $('.list-time').html('');
								 		} 
							    }else{
							         alert('Tomorror')
							         //$('.list-fullNames').prop('selectedIndex',0);
								     $('.list-time').html('');
								     checkTimeOfEmp.map(function (value, i) {
								          $('.list-time').append($('<option></option>').val(value).html(value));
								      })
							    }	
						   						
					});
				}
				
				});
					
					
				// Change name of stylist to list time of employee by salonID
				$('.list-fullNames').change(function(){
					const salonID = $('.address-salon').val();
					const employeeID =  $('.list-fullNames').val();
					const date = $('.list-date').val();
					const strToDateBooked = moment(date, 'MM/DD/YYYY').toDate();
					const dateBooked = moment(strToDateBooked).format('YYYY-MM-DD');
					//alert(salonID);
					//alert(employeeID);
					//alert(dateBooked);
					var urlStr = '';
					
					// User not yet choosen stylist. Append time of salon	
					if(employeeID === ''){	
						//alert('User not yet choosen stylist');				
						urlStr = 'listTimeOfEmployeeSalonApp1?salonid=' + salonID + '&datebooked=' + dateBooked;
						$.ajax({
				        method: "GET",
				        url: urlStr,
				        dataType: "json",
				    }).done(function (timeOfEmpSalon) {
				    	
				    	// Time of employee list by salonID	
				    	const timeEmpBySalonID = timeOfEmpSalon[0];
						const strTotimeAllEmpBySalonID = timeEmpBySalonID.toString();
						const timeAllEmBySalonIDToArr = strTotimeAllEmpBySalonID.split(',');
						
						// Time of appointment list by that date
						const timeBookedApp = timeOfEmpSalon[1];
						
						// Case user not choosen stylist
						const timeOfSalonBySalonID = timeOfEmpSalon[2];
					    const strToTimeOfSalonBySalonID = timeOfSalonBySalonID.split(',');
								var countsApp = {};
								var countEmp = {};
								
								const promise1 = new Promise((resolve, reject) => {
								  	timeBookedApp.map(function(value1) { 
										const x = moment(value1, 'HH:mm:ss').format('HH:mm');
										countsApp[x] = (countsApp[x] || 0)+1; 		
									})
									resolve(countsApp);
								});
								
								const promise2 = new Promise((resolve, reject) => {
								  	timeAllEmBySalonIDToArr.map(function(value2){
										const x1 = moment(value2, 'HH:mm:ss').format('HH:mm');
										return countEmp[x1] = (countEmp[x1] || 0)+1; 	
									})
									resolve(countEmp);
								});
								
								Promise.all([promise1, promise2]).then((values) => {
									 const str1 = JSON.stringify(values[0]);
								 	 const str2 = JSON.stringify(values[1]);
								 	 
								 	 const result1 = str1.substring(1, str1.length-1);
								 	 const result2 = str2.substring(1, str2.length-1);
								 	 
								 	 const arr1 = result1.split(',');
								 	 const arr2 = result2.split(',');
								 	 
								 	 //console.log(values[0]);
								 	 //console.log(values[1]);
								 	 const a = [];
								 	 arr1.map(function(value1){
								 	 	  arr2.map(function(value2){
								 	 		 if(value1 == value2){
								 	 		 	const s = value1.replace('"','')
								 	 		 	const ss = s.slice(0, -3)
								 	 		 	a.push(ss)
								 	 		 }
								 		  })
								 	 })
								 	 
								 	 const arrSalon =  strToTimeOfSalonBySalonID.filter(function(val){
							 	 		return timeAllEmBySalonIDToArr.includes(val);
							 		 })
							 		 
								 	 const timeDup = arrSalon.filter(function(value){
								 	 		return !a.includes(value);
								 	 })
								 	 //console.log(arrSalon)
								 	 //console.log(a);
								 	 //console.log(timeDup);
								 	 const localTime = new Date();
					        		 const disableTime = timeDup.filter(function (value, i) {
						            	 const stringToDate = moment(value, 'HH:mm').toDate();
						            	 return stringToDate.getTime() >= localTime.getTime();
						       		 });
						       		 $('.list-date').prop('selectedIndex',0);
						       		 $('.list-time').html('');
								 	 disableTime.map(function(value){
								 	 	$('.list-time').append($('<option></option>').val(value).html(value));
								 	 })
								 	 if(disableTime.length > 0){
								 	 	$('.list-time').html('');
									    disableTime.map(function(value){
								 	 		$('.list-time').append($('<option></option>').val(value).html(value));
								 	 	}) 
									 }else{
									    	alertForTimeSalon();
								      		$('.list-time').html('');
									 	  }	 	 
								});		
						});
					}else{
						//alert('User choosen stylist');	
						urlStr = 'listTimeOfEmployeeSalonApp?salonid=' + salonID +'&employeeid=' + employeeID + '&datebooked=' + dateBooked;
						$.ajax({
				        method: "GET",
				        url: urlStr,
				        dataType: "json",
				    }).done(function (timeOfEmpSalon) {
				    		//console.log('Array time of employee: ' + timeOfEmpSalon[0]);
							//console.log('Array time of appointment by empID and datebooked: ' + timeOfEmpSalon[1]);
							
							// Time of employee by employeeID
							const timeOfEmp = timeOfEmpSalon[0];
							const strToTimeOfEmp = timeOfEmp.split(',');
							
							// Time of employee by employeeID and date booked in table appointment
							const timeAppByEmpIDDate = timeOfEmpSalon[1];
							const timeAppByEmpIDDateToStr = timeAppByEmpIDDate.map(function(value, index){
								return moment(value, 'HH:mm:ss').format('HH:mm');
							})
							
							// Check time employee booked in table appointment with time of that employee
							const checkTimeOfEmp = strToTimeOfEmp.filter(function(value, index){
								return !timeAppByEmpIDDateToStr.includes(value);
							});
							
							// Disable time
				        	const localTime = new Date();
				        	const disableTime = checkTimeOfEmp.filter(function (value, i) {
					            const stringToDate = moment(value, 'HH:mm').toDate();
					            return stringToDate.getTime() >= localTime.getTime();
					        });
					        $('.list-date').prop('selectedIndex',0);
					        $('.list-time').html('');
				        	disableTime.map(function(value, index){
				        		$('.list-time').append($('<option></option>').val(value).html(value));
				        	})
				        	
				        	if(disableTime.length > 0){
								$('.list-time').html('');
								disableTime.map(function(value){
								 	 $('.list-time').append($('<option></option>').val(value).html(value));
								}) 
							}else{
									alertForTimeStylist();         
									$('.list-time').html('');
								}		        						
					});
					}
				});
	    	});
	    }
	    if (n == (x.length - 1)) {
	        document.getElementById("nextBtn").innerHTML = "Submit";
	    } else {
	        document.getElementById("nextBtn").innerHTML = "Next";
	    }
	}
	function nextPrev(n) {
	    // This function will figure out which tab to display
	    var x = document.getElementsByClassName("tab");
	    
	    // Hide the current tab:
	    x[currentTab].style.display = "none";
	    
	    // Increase or decrease the current tab by 1:
	    currentTab = currentTab + n;
	    
	    // if you have reached the end of the form... :
	    if (currentTab >= x.length) {
	        //...the form gets submitted:
	        document.getElementById("regForm").submit();
	        return false;
	    }
	    
	    // Otherwise, display the correct tab:
	    showTab(currentTab);
	}
	function requestURL(urlStr, value){
		const urlDefault = window.location.href;
		const url = new URL(urlDefault);
	    url.searchParams.set(urlStr, value);
		window.history.pushState("object or string", "Title", url);
	}
	function alertForAddress(){
		Swal.fire({
                    title: 'Please choose the address.',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    }
                })
	}
	
	function alertForTimeSalon(){
		Swal.fire({
                    title: 'Now the shop is heaped!!',
                    text: 'You can make a schedule for tomorrow.',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    }
                })
	}
	function alertForTimeStylist(){
		Swal.fire({
                    title: 'The stylist is busy today!!',
                    text: 'Please choose another stylist.',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    }
                })
	}
</script>
	<script type="text/javascript">
	$('.address-salon').change(function(){
		const salonID = $('.address-salon').val();
    	const urlDefault = window.location.href;
	    const url = new URL(urlDefault);
	    url.searchParams.set('salonid', salonID);
	    window.history.pushState("object or string", "Title", url);
	    var urlString = '/listfullNameEmpBySalon?salonid=' + salonID;
	    $.ajax({
	        method: "GET",
	        url: urlString,
	        dataType: "json",
	    }).done(function (employee) {
	            $('.list-fullNames').html('');
	            const defaults = 'Store choose for you';
	            $('.list-fullNames').append($('<option></option>').val('').text(defaults).html(defaults));
	            employee.map(function (value, index) {
	            	const employeeID = value.employeeId;
	            	const fullNameEmp = value.fullName; 
	            	$('.list-fullNames').append($('<option></option>').val(employeeID).text(fullNameEmp).html(fullNameEmp));
	            })
	    })
	})
</script>
</body>
</html>