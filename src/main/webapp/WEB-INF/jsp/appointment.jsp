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
	<section class="card-booking">
		<h5 class="card-header">Appointment</h5>
		<form id="regForm" action="/booking" method="POST">
			<div id="myModal" class="modal" tabindex="-1" role="dialog"
				style="margin-top: 40px;">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Phone</h5>
							<!-- 							<button type="button" class="close" data-dismiss="modal" -->
							<!-- 								aria-label="Close"> -->
							<!-- 								<span aria-hidden="true">&times;</span> -->
							<!-- 							</button> -->
						</div>
						<div class="modal-body">
							<input type="text" id="phone" name="phone"
								placeholder="0000.000.000"> <label id="phone-error"
								class="error" for="phone"></label>
						</div>
						<div class="modal-body"
							style="text-align: center; color: black; margin-top: -25px;">
							<a href="/" style="color: #151515;"> Click to return home
								page</a>
						</div>
						<div class="modal-footer">
							<!-- 							<button type="button" class="btn btn-secondary" -->
							<!-- 								data-dismiss="modal">Close</button> -->
							<button type="button" class="btn btn-warning" id="save-phone"
								data-dismiss="modal" style="width: 100%">Booking Now</button>
						</div>
					</div>
				</div>
			</div>
			<div class="relative" style="position: relative;">
				<div class="tab">
					<div class="progress">
						<div class="progress-bar bg-warning" role="progressbar"
							style="width: 25%" aria-valuenow="25" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<div class="card-body">
						<label for="formGroupExampleInput">Address</label>
						<div class="row">
							<div class="form-group col">
								<select class="custom-select address-salon" name="salon"
									id="address-salon">
									<option value="0">Please selected</option>
									<c:forEach var="listAdd" items="${listAddressOfSalon}">
										<option value="${listAdd.salonId}">${listAdd.address}</option>
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
					<div class="card-body">
						<c:forEach var="listService" items="${listService}">
							<c:if test="${listService.serviceId == 'H'}">
								<div class="row">
									<div class="headerService">
										<h5 style="margin-left: 35px; margin-bottom: -8px;">${listService.serviceName}</h5>
									</div>
								</div>
								<hr style="border: 1px solid #C0C0C0;">
								<c:forEach var="listServiceDetailH"
									items="${listServiceDetailH}">
									<div class="row">
										<div class="col col-md-3">
											<p style="margin: 16px 0 0 40px;">
												<input type="checkbox" name="listServices"
													value="${listServiceDetailH.title}">
											</p>
										</div>

										<div class="col col-md-6">
											<h6>${listServiceDetailH.title}</h6>
											<p>${listServiceDetailH.descripttion}</p>
										</div>
										<div class="col col-md-3">
											<h6>${listServiceDetailH.price}K</h6>
											<p>${listServiceDetailH.timeToComplete}minitue</p>
										</div>
									</div>
								</c:forEach>
							</c:if>

							<c:if test="${listService.serviceId == 'HD'}">
								<div class="row">
									<div class="headerService">
										<h5 style="margin-left: 35px; margin-bottom: -8px;">${listService.serviceName}</h5>
									</div>
								</div>
								<hr style="border: 1px solid #C0C0C0;">
								<c:forEach var="listServiceDetailHD"
									items="${listServiceDetailHD}">
									<div class="row">
										<div class="col col-md-3">
											<p style="margin: 16px 0 0 40px;">
												<input type="checkbox" name="listServices"
													value="${listServiceDetailHD.title}">
											</p>
										</div>

										<div class="col col-md-6">
											<h6>${listServiceDetailHD.title}</h6>
											<p>${listServiceDetailHD.descripttion}</p>
										</div>
										<div class="col col-md-3">
											<h6>${listServiceDetailHD.price}K</h6>
											<p>${listServiceDetailHD.timeToComplete}minitue</p>
										</div>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${listService.serviceId == 'HC'}">
								<div class="row">
									<div class="headerService">
										<h5 style="margin-left: 35px; margin-bottom: -8px;">${listService.serviceName}</h5>
									</div>
								</div>
								<hr style="border: 1px solid #C0C0C0;">
								<c:forEach var="listServiceDetailHC"
									items="${listServiceDetailHC}">
									<div class="row">
										<div class="col col-md-3">
											<p style="margin: 16px 0 0 40px;">
												<input type="checkbox" name="listServices"
													value="${listServiceDetailHC.title}">
											</p>
										</div>
										<div class="col col-md-6">
											<h6>${listServiceDetailHC.title}</h6>
											<p>${listServiceDetailHC.descripttion}</p>
										</div>
										<div class="col col-md-3">
											<h6>${listServiceDetailHC.price}K</h6>
											<p>${listServiceDetailHC.timeToComplete}minitue</p>
										</div>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${listService.serviceId == 'OT'}">
								<div class="row">
									<div class="headerService">
										<h5 style="margin-left: 35px; margin-bottom: -8px;">${listService.serviceName}</h5>
									</div>
								</div>
								<hr style="border: 1px solid #C0C0C0;">
								<c:forEach var="listServiceDetailOT"
									items="${listServiceDetailOT}">
									<div class="row">
										<div class="col col-md-3">
											<p style="margin: 16px 0 0 40px;">
												<input type="checkbox" name="listServices"
													value="${listServiceDetailOT.title}">
											</p>
										</div>

										<div class="col col-md-6">
											<h6>${listServiceDetailOT.title}</h6>
											<p>${listServiceDetailOT.descripttion}</p>
										</div>
										<div class="col col-md-3">
											<h6>${listServiceDetailOT.price}K</h6>
											<p>${listServiceDetailOT.timeToComplete}minitue</p>
										</div>
									</div>
								</c:forEach>
							</c:if>
						</c:forEach>
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
				<div
					style="overflow: auto; position: sticky; height: 70px; bottom: 0; width: 500px; margin-left: 20px; border-radius: 8px; background-color: #151515">
					<div class="change-fixed"
						style="float: right; right: 30px; margin-top: 15px; margin-right: 10px">
						<button type="button" class="btn btn-warning " id="prevBtn"
							onclick="nextPrev(-1)">Previous</button>
						<button type="button" class="btn btn-warning btn-fixed"
							id="nextBtn" onclick="nextPrev(1)">Next</button>
					</div>
				</div>
			</div>

		</form>
	</section>
	<%@ include file="/WEB-INF/jsp/common-user/footer.jsp"%>
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<%@ include file="/WEB-INF/jsp/common-user/script.jsp"%>
<!-- 	<script -->
<%-- 		src="<%=request.getContextPath()%>/ValidateForm/jquery.validate.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/ValidateForm/booking.js"></script> --%>
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
	    
	    //Step = 2 for submit form
	    if(n==2){
	    
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
						    console.log(timeOfEmpSalon)
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
						    	  if(disableTime.length > 0){
						    	  		//alert('Other Null')
							    	  	if (dateValToDate.getDate() === localTime.getDate()) {
							    	  		//alert('Today')
							            	$('.list-time').html('');
								            disableTime.map(function (value, index) {
								                $('.list-time').append($('<option></option>').val(value).html(value));
								            })
							          	}else{
							          		//alert('Tomorror')
							          		//$('.list-fullNames').prop('selectedIndex',0);
								            $('.list-time').html('');
								            console.log(timeDup);
								            timeDup.map(function (value, i) {
								                $('.list-time').append($('<option></option>').val(value).html(value));
								            })
							       	  	}	
						    	  }
						    	  else{
								    	 alertForTimeSalon();
							      		 $('.list-time').html('');
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
						   	if(disableTime.length > 0){
						    	//alert('Other Null')
							   	if (dateValToDate.getDate() === localTime.getDate()) {
							    	  //alert('Today')
							          $('.list-time').html('');
								      disableTime.map(function (value, index) {
								             $('.list-time').append($('<option></option>').val(value).html(value));
								      })
							          }else{
							          		//alert('Tomorror')
							          		//$('.list-fullNames').prop('selectedIndex',0);
								            $('.list-time').html('');
								            checkTimeOfEmp.map(function (value, i) {
								                $('.list-time').append($('<option></option>').val(value).html(value));
								            })
							       	  }	
						   	}else{
								  alertForTimeSalon();
							      $('.list-time').html('');
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