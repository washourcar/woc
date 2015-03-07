<!DOCTYPE html>
<%@ include file="/common/taglibs.jsp"%>
<html lang="en">
<head>
    <title> <fmt:message key="webapp.name"/> | <fmt:message key="webapp.tagline"/></title>
    <jsp:include page="/common/meta.jsp"/>
    <jsp:include page="/common/tracking/ga.jsp"/>
    <jsp:include page="/common/tracking/gtm.jsp"/>
    <link rel="icon" href="<c:url value="/images/favicon.ico"/>"/>
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
            <li><a href="http://washourcar.com/mobile">MOBILE APP</a></li>
            <li><a href="javscript:void(0)">BLOG</a></li>
            <li><a class="modal-title" id="contactButton" style="cursor:pointer">CONTACT</a></li>
            <li class="menu-text"><a id="cd-menu-text-trigger" href="http://washourcar.com/#0"><span class="cd-menu-text">MENU</span></a></li>
        </ul>
    </nav>
    <a id="cd-menu-trigger" href="javascript:void(0);"><span class="cd-menu-icon"></span></a>
</header>

<main class="cd-main-content">
	<decorator:body/>
</main>
<nav id="cd-lateral-nav">
    <ul class="cd-navigation links">
        <li class="top-link"><a href="/aboutus">ABOUT US</a></li>
        <li class="hidden-md"><a href="/mobile">MOBILE APP</a></li>
        <li class="hidden-md"><a target="_blank" href="/careers" class="hiring-bold">WE'RE HIRING</a></li>
        <li class="hidden-md"><a href="/blog">BLOG</a></li>
        <li class="hidden-md"><a class="modal-title" id="contactButton" style="cursor:pointer">CONTACT</a></li>
        <li><a href="/api">DEVELOPERS</a></li>
    </ul>
    <ul class="cd-navigation links">
        <!-- <li><a href="#0">Media Kit</a></li> -->
        <li><a href="/terms">TERMS &amp; CONDITIONS</a></li>
        <li><a href="/privacy">PRIVACY POLICY</a></li>
        <li><a href="/login">LOGIN</a></li>
    </ul>

    <ul class="cd-navigation social-media">
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
    </ul>
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
                    <form id="cPass" class="form-horizontal" data-async="" data-target="#contact-modal" action="booking" method="POST">
                    	<div id="success-message" class="alert alert-success collapse">
						    <a href="#" class="close" data-dismiss="alert">&times;</a>
						    <strong>Success!</strong> booked successfully, We will contact you ASAP.
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
                            <button class="btn btn-primary" id="book-button" type="button" style="background-color:#E0471D;
                    												     border-color:#E0471D">Book</button>
                        </div>
                    </form>
                </div>
            </div>
        </div> <!-- modal content closes-->
    </div> <!-- modal -->
</div> <!-- modal-->


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
