
<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="<%request.getContextPath();%>/lib/easing/easing.min.js"></script>
<script
	src="<%request.getContextPath();%>/lib/owlcarousel/owl.carousel.min.js"></script>
<script
	src="<%request.getContextPath();%>/lib/isotope/isotope.pkgd.min.js"></script>
<script
	src="<%request.getContextPath();%>/lib/lightbox/js/lightbox.min.js"></script>

<!-- Contact Javascript File -->
<script
	src="<%request.getContextPath();%>/mail/jqBootstrapValidation.min.js"></script>
<script src="<%request.getContextPath();%>/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="<%request.getContextPath();%>/js/main.js"></script>


<!-- Login -->
<script
	src="<%request.getContextPath();%>/vendors/jquery/dist/jquery.min.js"></script>
<script
	src="<%request.getContextPath();%>/vendors/popper.js/dist/umd/popper.min.js"></script>
<script
	src="<%request.getContextPath();%>/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<%request.getContextPath();%>/assets/js/main.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="/sweet-alert/sweetalert2.all.min.js"></script>


<script>

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '{your-app-id}',
      cookie     : true,
      xfbml      : true,
      version    : '{api-version}'
    });
      
    FB.AppEvents.logPageView();   
      
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>