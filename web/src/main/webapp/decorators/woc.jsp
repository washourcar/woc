<!DOCTYPE html>
<%@ include file="/common/taglibs.jsp"%>
<html lang="en">
<head>
    <title> <fmt:message key="webapp.name"/> | <fmt:message key="webapp.tagline"/></title>
    <jsp:include page="/common/meta.jsp"/>
    <jsp:include page="/common/tracking/ga.jsp"/>
    <jsp:include page="/common/tracking/gtm.jsp"/>
    <title><decorator:title/> | <fmt:message key="webapp.name"/></title>
    <t:assets type="js"/>
    <%--<script src="/scripts/intlTelInput.min.js"></script>--%>
    <%--<script src="/scripts/main.js"></script>--%>
    <%--<script src="/scripts/spin.min.js"></script>--%>
    <%--<script src="/scripts/contactForm.js"></script>--%>
    <link rel="shortcut icon" type="image/png" href="http://washourcar.com/ico/favicon.ico">

    <t:assets type="css"/>
    <decorator:head/>
</head>
<body<decorator:getProperty property="body.id" writeEntireProperty="true"/><decorator:getProperty property="body.class" writeEntireProperty="true"/>>
<c:set var="currentMenu" scope="request"><decorator:getProperty property="meta.menu"/></c:set>

<header>
    <div id="one"></div>
    <a class="navbar-brand" href="./woc - Your instant delivery app_files/woc - Your instant delivery app.html">
        <img src=""></a>
    <nav id="cd-top-nav">
        <ul>
            <%--<li><a href="http://washourcar.com/mobile">MOBILE APP</a></li>--%>
            <%--<li><a href="javscript:void(0)">BLOG</a></li>--%>
            <li><a class="modal-title" id="contactButton" style="cursor:pointer">CONTACT</a></li>
            <li class="menu-text"><a id="cd-menu-text-trigger" href="http://washourcar.com/#0"><span class="cd-menu-text">MENU</span></a></li>
        </ul>
    </nav>
    <a id="cd-menu-trigger" href="javascript:void(0);"><span class="cd-menu-icon"></span></a>
</header>

<main class="cd-main-content">
	<decorator:body/>
</main>
<nav id="cd-lateral-nav" class="navbar navbar-default">
    <ul class="cd-navigation links">
        <li class="top-link"><a data-toggle="modal" data-target="#aboutus" href="javascript:void(0)">ABOUT US</a></li>
        <%--<li class="hidden-md"><a href="/mobile">MOBILE APP</a></li>--%>
        <%--<li class="hidden-md"><a target="_blank" href="/careers" class="hiring-bold">WE'RE HIRING</a></li>--%>
        <%--<li class="hidden-md"><a href="/blog">BLOG</a></li>--%>
        <%--<li class="hidden-md"><a class="modal-title" id="contactButton" style="cursor:pointer">CONTACT</a></li>--%>
        <%--<li><a href="/api">DEVELOPERS</a></li>--%>
    </ul>
    <ul class="cd-navigation links">
        <!-- <li><a href="#0">Media Kit</a></li> -->
        <li><a data-toggle="modal" data-target="#terms" href="javascript:void(0)">TERMS &amp; CONDITIONS</a></li>
        <li><a data-toggle="modal" data-target="#privacy" href="javascript:void(0)">PRIVACY POLICY</a></li>
        <li><a href="/login">LOGIN</a></li>
    </ul>

    <%--ul class="cd-navigation social-media">
        <li class="social">
            <a class="first-icon twitter" href="https://twitter.com/woc" target="_blank">
                <i title="Follow us on Twitter" class="woc-social-icon fa fa-twitter fa-lg"></i>
            </a>
            <a class="facebook" href="https://www.facebook.com/woc" target="_blank">
                <i title="Like us ? Share on Facebook!" class="woc-social-icon fa fa-facebook fa-lg"></i>
            </a>
            <a class="google" target="_blank" href="https://plus.google.com/b/107649970555039572894/dashboard/overview/getstarted?hl=en&service=plus">
                <i title="Google plus" class="woc-social-icon fa fa-google-plus fa-lg
                    "></i>
            </a>
            <a class="linkedin" target="_blank" href="https://www.linkedin.com/company/3561164?trk=tyah&trkInfo=tarId%3A1411112717095%2Ctas%3Awoc%2Cidx%3A1-1-1">
                <i title="Linkedin" class="woc-social-icon fa fa-linkedin fa-lg"></i>
            </a>
            <a class="github" target="_blank" href="http://github.com/woc">
                <i title="We code" class="woc-social-icon fa fa-github fa-lg"></i>
            </a>
        </li>
    </ul>--%>
    <footer class="footer mobile-footer">
        <ul class="cd-navigation footer-border">
            <li><i class="fa fa-copyright copyright fa-lg"></i>
                </li>
        </ul>
    </footer>
</nav>

<div id="contactModalContainer">
    <div class="modal fade" id="contactModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel" style="color:#E96125">Booking</h4>
                </div>
                <div id="contactResponse" class="modal-body row">
                    <form id="cPass" onsubmit="return false;" class="form-horizontal" data-async="" data-target="#contact-modal" action="" method="POST">
                    	<div id="success-message" class="alert alert-success collapse">
						    <a href="#" class="close" data-dismiss="alert">&times;</a>
						    <strong>Success!</strong> booked successfully, We will contact you ASAP.
						</div>
						<div id="error-message" class="alert alert-danger collapse">
						    <a href="#" class="close" data-dismiss="alert">&times;</a>
						    <div id="errorMessage"></div>
						</div>
                        <div class="col-xs-12 col-md-12 col-sm-12 col-lg-12 form-group">
                            <input id="userName" name="userName" placeholder="Name" class="form-control" type="text" required="" autofocus="">
                        </div>
                        <div class="col-xs-12 col-md-12 col-sm-12 col-lg-12 form-group">
                            <input id="userEmail" name="userEmail" placeholder="Email Address" class="form-control" type="email" required="">
                        </div>
                        <div class="col-xs-12 col-md-12 col-sm-12 col-lg-12 form-group">
                            <input id="userMobileNo" name="userMobileNo" placeholder="Phone Number" maxlength="10" class="form-control" type="phone" required="">
                        </div>
                        <div class="col-xs-12 col-md-6 col-sm-12 col-lg-6 form-group">
                            <select id="city" name="city" placeholder="City" class="col-md-6 form-control" type="text">
                                <option value="Chennai">Chennai</option>
                            </select>
                        </div>
                        <div class="col-xs-12 col-md-6 col-sm-12 col-lg-6 form-group">
                            <select id="area" name="area" placeholder="Location" class="col-md-6 form-control" type="text">
                                <option value="Ambattur">Ambattur</option>
                            </select>
                            <%--<input id="location" name="location" placeholder="Type your Location" class="form-control" type="text" required="">--%>
                        </div>
                        <div class="col-xs-12 col-md-12 col-sm-12 col-lg-12 form-group">
                            <input id="bookingDate" name="bookingDate" placeholder="Date" class="form-control" type="text" required="">
                        </div>
                        <div class="col-xs-12 col-md-12 col-sm-12 col-lg-12 form-group">
                            <label></label>
                            <textarea rows="5" name="address" class="form-control" placeholder="Address" id="message" required="" data-validation-required-message="Please enter a address."></textarea>
                        </div>
                        <div class="col-xs-12 col-md-12 col-sm-12 col-lg-12">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button class="btn btn-primary" id="book-button" type="submit" style="background-color:#E0471D;
                    												     border-color:#E0471D">Book</button>
                        </div>
                    </form>
                </div>
            </div>
        </div> <!-- modal content closes-->
    </div> <!-- modal -->
</div> <!-- modal-->
<div id="aboutus-container">
    <div class="modal fade" id="aboutus" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close fui-cross" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" style="color:#E96125">About Us</h4>
                </div>

                <div class="modal-body">
                    <p><h5>Washourcar Enterprises,</h5></p>
                    <p> <h5>No 9/18, 14th Avenue</h5></p>
                    <p> <h5>Palaniyappa Nagar, Pudur</h5></p>
                    <p> <h5>Ambattur, Chennai - 53</h5></p>

                    <p><h5>Main Line: 044-26862302</h5></p>
                    <p> <h5>Fax: 044 - 26862303</h5></p>
                    <p> <h5>Mobile: 9884663623</h5></p>
                    <p> <h5>Email: contact@washourcar.com</h5></p>

                    <p> <h5>Corporate office hours: Monday - Friday, 9 AM - 6 PM</h5></p>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="terms-container">
    <div class="modal fade" id="terms" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close fui-cross" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" style="color:#E96125">TERMS &amp; CONDITIONS</h4>
                </div>

                <div class="modal-body">
                    <b>Read This Terms of Use Agreement Before Accessing Website:</b>

                    <p><h5>
                    Effective Date: This Terms of Use Agreement was last updated on 15/03/2015.
                    This Terms of Use Agreement sets forth the standards of use of the washourcar.com Online Service. By using the washourcar.com website you (the "Member") agree to these terms and conditions. If you do not agree to the terms and conditions of this agreement, you should immediately cease all usage of this website. We reserve the right, at any time, to modify, alter, or update the terms and conditions of this agreement without prior notice. Modifications shall become effective immediately upon being posted at washourcar.com website. Your continued use of the Service after amendments are posted constitutes an acknowledgement and acceptance of the Agreement and its modifications. Except as provided in this paragraph, this Agreement may not be amended.

                    </h5></p>

                    <b>Description of Service:</b>

                    <p><h5>washourcar.com is providing customers with the ability to order/ book a car wash service at their doorstep. Customer must provide all equipment necessary (water, electricity and others ) for us to wash their car in their door step
                    </h5></p>

                    <b>Terms of use:</b>
                    <p><h5>
                    <ul>
                        <li>Washourcar.com request customers to make previous appointments
                        <li>Customers are requested to remove all personal belongings from the vehicle before we start our service at your doorstep. Washourcar.com will not be responsible for any loss of belongings damages</li>
                        <li>Services vary based on condition and that may reflect in time taken to carry out work on vehicle</li>
                        <li>Packages are suggested to customers after an inspection is done on vehicle.</li>
                        <li>Negotiations and Bargaining are non-permitted and All Rights are reserved by Management.</li>
                        <li>Customers are requested to book our service only through www.washourcar.com or by calling our offices directly.</li>
                        <li>washourcar.com do not entertain customers booking services directly through our service men who are at their doorsteps.</li>
                    </ul></h5></p>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="privacy-policy">
    <div class="modal fade" id="privacy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close fui-cross" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" style="color:#E96125">Privacy policy</h4>
                </div>

                <div class="modal-body">
                    <p>This privacy policy sets out how washourcar.com uses and protects any information that you give when you use this website.

                    <p>Washourcar.com is committed to ensuring that your privacy is protected. Should we ask you to provide certain information by which you can be identified when using this website or SMS services, then you can be assured that it will only be used in accordance with this privacy statement.</p>

                    <p>Washourcar.com may change this policy from time to time by updating this page. You should check this page from time to time to ensure that you are happy with any changes. This policy is effective from March 1, 2015</p>

                    <b>What we collect</b>
                    <p>We may collect the following information<h5>
                    <ul>
                        <li>name
                        <li>contact information including email address and phone number
                        <li>demographic information such as zip code or store preference
                        <li>other information relevant to customer surveys and/or offers.</li>
                    </ul></h5></p>

                    <b>What we do with the information we gather</b>
                    <p>We require this information to understand your needs and provide you with a better service, and in particular for the following reasons:<h5>
                    <ul>
                        <li>Internal record keeping.
                        <li>We may use the information to improve our services.
                        <li>Marketing and promotions
                        <li>We will never sell or rent your information to third parties.</li>
                    </ul></h5></p>

                    <b>Links to other websites</b>
                    <p>Our website may contain links to enable you to visit other websites of interest easily. However, once you have used these links to leave our site, you should note that we do not have any control over that other website. Therefore, we cannot be responsible for the protection and privacy of any information which you provide while visiting such sites and such sites are not governed by this privacy statement. You should exercise caution and look at the privacy statement applicable to the website in question.</p>

                    <b>Controlling your personal information</b>
                    <p>We will not sell, distribute or lease your personal information to third parties unless we have your permission or are required by law. We may use your personal information to send you promotional information about third parties which we think you may find interesting if you tell us that you wish this to happen.
                        You may request details of personal information which we hold about you under the Data Protection Act.
                        If you believe that any information we are holding on you is incorrect or incomplete, please write to or email us as soon as possible. We will promptly correct any information found to be incorrect.
                    </p>


                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="footer" class="container navbar-fixed-bottom">
        <span class="col-sm-6 text-left"><fmt:message key="webapp.version"/>
            <c:if test="${pageContext.request.remoteUser != null}">
                | <fmt:message key="user.status"/> ${pageContext.request.remoteUser}
            </c:if>
        </span>
        <span class="col-sm-6 text-right">
            &copy; <fmt:message key="copyright.year"/> <a href="<fmt:message key="company.url"/>"><fmt:message key="company.name"/></a>
        </span>
</div>
<%= (request.getAttribute("scripts") != null) ?  request.getAttribute("scripts") : "" %>
</body>
</html>
