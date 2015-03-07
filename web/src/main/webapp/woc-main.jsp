<%@ include file="/common/taglibs.jsp"%>
<div id="two"></div>
<div class="container">
	<div class="row top-buffer"></div>
	<div class="row top-buffer"></div>
	<div class="row top-buffer"></div>
	<div class="row">
		<!-- <div class="col-lg-12 text-center">
                <div class="center-heading">Your <span style="font-weight:900">Instant Delivery</span> App</div>
                <div class="top-buffer-20"></div>
            </div> -->
		<div class="col-lg-12 use-case-text text-center">
			<!-- <div class="center-subheading lead"> -->

			<!-- <span>Get </span> -->

			<div class="text-changing display-first"
				style="display: none; opacity: 1;">Any Car</div>
			<div class="text-changing" style="display: none; opacity: 1;">Sedan</div>
			<div class="text-changing" style="display: none; opacity: 1;">Hatch</div>
			<div class="text-changing" style="display: none; opacity: 1;">SUV</div>

			<span class="90-min-delivery">get washed in less than 60
				minutes</span>
			<!-- </div> -->
		</div>
		<div class="col-lg-4"></div>


	</div>
	<div class="row top-buffer"></div>
	<div class="row top-buffer"></div>
	<div id="append-data" class="row">
		<div class="center-block text-center" id="phone-number-container">
			<i title="Enter your mobile number"
				class="woc-social-icon fa fa-mobile fa-lg"></i>
			<div class="intl-tel-input">

				<input type="tel" id="user-phone-value" placeholder="+91">

				<div class="flag-dropdown">
					<div class="selected-flag" title="India (भारत): +91">
						<div class="flag in">
							<div class="arrow"></div>
						</div>
					</div>
				</div>
			</div>

			<button title="and chill" id="get-app-button" type="button"
				class="woc-get-app btn" data-toggle="modal"
				data-target="#contactModal">Book Now</button>
		</div>
		<div class="row top-buffer text-center or-class">or</div>
		<div class="row top-buffer-20 text-center call-woc">
			Call us on&nbsp;&nbsp;&nbsp;<a class="woc-phone"
				href="tel:+9198846 63623">98846 63623</a>
		</div>
	</div>

	<!-- /.row -->

</div>
<!-- /.container -->
</main>