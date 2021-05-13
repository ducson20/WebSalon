<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Colorlib Templates">
<meta name="author" content="Colorlib">
<meta name="keywords" content="Colorlib Templates">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link rel="icon" type="image/png" href="">
<link rel="stylesheet" href="/font/css/fontawesome.min.css">
<!-- Title Page-->
<title>Error 403 - Just For Fun</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	background: #233142;
}

.whistle {
	width: 20%;
	fill: #f95959;
	margin: 100px 40%;
	text-align: left;
	transform: translate(-50%, -50%);
	transform: rotate(0);
	transform-origin: 80% 30%;
	animation: wiggle .2s infinite;
}

@
keyframes wiggle { 0%{
	transform: rotate(3deg);
}

50




%
{
transform




:




rotate


(




0deg




)


;
}
100




%
{
transform




:




rotate


(




3deg




)


;
}
}
h1 {
	margin-top: -100px;
	margin-bottom: 20px;
	color: #facf5a;
	text-align: center;
	font-family: 'Raleway';
	font-size: 90px;
	font-weight: 800;
}

h2 {
	color: #455d7a;
	text-align: center;
	font-family: 'Raleway';
	font-size: 30px;
	text-transform: uppercase;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/jsp/common-user/topBar.jsp"%>
	<%@ include file="/WEB-INF/jsp/common-user/navBar.jsp"%>
	<use> <svg version="1.1" xmlns="http://www.w3.org/2000/svg"
		xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
		viewBox="0 0 1000 1000" enable-background="new 0 0 1000 1000"
		xml:space="preserve" class="whistle">
<metadata> Svg Vector Icons : http://www.onlinewebfonts.com/icon </metadata>
<g>
		<g
			transform="translate(0.000000,511.000000) scale(0.100000,-0.100000)">
<path
			d="M4295.8,3963.2c-113-57.4-122.5-107.2-116.8-622.3l5.7-461.4l63.2-55.5c72.8-65.1,178.1-74.7,250.8-24.9c86.2,61.3,97.6,128.3,97.6,584c0,474.8-11.5,526.5-124.5,580.1C4393.4,4001.5,4372.4,4001.5,4295.8,3963.2z" />
		<path
			d="M3053.1,3134.2c-68.9-42.1-111-143.6-93.8-216.4c7.7-26.8,216.4-250.8,476.8-509.3c417.4-417.4,469.1-463.4,526.5-463.4c128.3,0,212.5,88.1,212.5,224c0,67-26.8,97.6-434.6,509.3c-241.2,241.2-459.5,449.9-488.2,465.3C3181.4,3180.1,3124,3178.2,3053.1,3134.2z" />
		<path
			d="M2653,1529.7C1644,1445.4,765.1,850,345.8-32.7C62.4-628.2,22.2-1317.4,234.8-1960.8C451.1-2621.3,947-3186.2,1584.6-3500.2c1018.6-501.6,2228.7-296.8,3040.5,515.1c317.8,317.8,561,723.7,670.1,1120.1c101.5,369.5,158.9,455.7,360,553.3c114.9,57.4,170.4,65.1,1487.7,229.8c752.5,93.8,1392,181.9,1420.7,193.4C8628.7-857.9,9900,1250.1,9900,1328.6c0,84.3-67,172.3-147.4,195.3c-51.7,15.3-790.8,19.1-2558,15.3l-2487.2-5.7l-55.5-63.2l-55.5-61.3v-344.6V719.8h-411.7h-411.7v325.5c0,509.3,11.5,499.7-616.5,494C2921,1537.3,2695.1,1533.5,2653,1529.7z" /></g></g>
</svg> </use>
	<h1>403</h1>
	<h2>Not this time, access forbidden!</h2>

	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript">
	// target the elements in the DOM used in the project

	/**
	 * svg for the key and keyhole
	 * div nesting the ghost
	 * heading and paragraph
	 */
	const key = document.querySelector(".key");
	const keyhole = document.querySelector(".keyhole");
	const ghost = document.querySelector(".ghost");

	const heading = document.querySelector("h1");
	const paragraph = document.querySelector("p");


	// for the length of the timout, consider the --animation-duration custom property and add a small delay
	// retrieve properties on the root element
	const root = document.querySelector(":root");
	const rootStyles = getComputedStyle(root);
	// retrieve the animation-duration custom property
	// ! this is specified as "40s", in seconds, so parse the number and includ it in milliseconds
	const animationDuration = parseInt(rootStyles.getPropertyValue("--animation-duration"))*1000;
	let keyTimer = animationDuration*9/8;


	// retrieve the dimensions of the key (to have the key exactly where the cursor would lie)
	const keyBox = key.getBoundingClientRect();
	// console.log(keyBox);


	// KEY & KEYHOLE ANIMATION
	// include a timeout with the specified time frame
	const timeoutID = setTimeout(() => {
	  // after the specified time, change the cursor as to seemingly grab the key
	  key.parentElement.parentElement.style.cursor = "grab";

	  // introduce the key and keyhole svg elements by triggering the paused-by-default animation
	  key.style.animationPlayState = "running";
	  keyhole.style.animationPlayState = "running";

	  // ! pointer-events set to none on the key to allow for a mouseover event on the keyhole
	  // the key is indeed used in stead of the normal cursor and would overlap on top of everything
	  key.style.pointerEvents = "none";

	  // when the cursor hovers anywhere in the window, call a function to update the position of the key and have it match the cursor
	  window.addEventListener("mousemove", updateKeyPosition);

	  // when the cursor hovers on the keyhole, call a function to grant access and remove present listeners
	  keyhole.addEventListener("mouseover", grantAccess);

	  clearTimeout(timeoutID);
	}, keyTimer);


	// define the function which updates the position of the absolute-positioned key according to the mouse coordinates (and the keys own dimensions)
	const updateKeyPosition = (e) => {
	  let x = e.clientX;
	  let y = e.clientY;
	  key.style.left = x - keyBox.width/1.5;
	  key.style.top = y - keyBox.height/2;
	};

	// define the function which notifies the user of the grant access
	const grantAccess = () => {
	  // restore the cursor
	  key.parentElement.parentElement.style.cursor = "default";

	  // change the text of the heading and paragraph elements
	  heading.textContent = '🎉 yay 🎉';
	  paragraph.textContent = 'access granted';

	  // remove the svg elements for the key and keywhole from the flow of the document
	  keyhole.style.display = "none";
	  key.style.display = "none";

	  // remove the event listeners, most notably the one on the window
	  window.removeEventListener("mousemove", updateKeyPosition);
	  keyhole.removeEventListener("mouseover", grantAccess);
	};
	</script>
</body>
</html>