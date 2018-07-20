<%-- 
    Document   : sign-up
    Created on : Jun 21, 2018, 7:04:46 AM
    Author     : X453SA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Deutsche Bahn - Contact-us</title>
    <link rel="stylesheet" href="source/css/main.css">
    <%@include file="includes/cssimport.jsp" %>
</head>

<body>
<%@include file="includes/header.jsp" %>
<div class="container mt-5">
    <div class="row mt-5"></div>
    <!-- Section: Contact v.1 -->
    <section class="my-5 mt-5">

        <!-- Section heading -->
        <h2 class="h1-responsive font-weight-bold text-center my-5">Contact us</h2>
        <!-- Section description -->
        <p class="text-center w-responsive mx-auto pb-5">If you have inquiries about our services please dont hesitate
            to fill this form, or visit us at below address.</p>

        <!-- Grid row -->
        <div class="row">

            <!-- Grid column -->
            <div class="col-lg-5 mb-lg-0 mb-4">
                <form action="">
                    <div class="md-form">
                        <input type="text" class="form-control" id="inputfname" required>
                        <label for="inputfname">Name</label>
                    </div>
                    <div class="md-form">
                        <input type="email" class="form-control" id="inputemail" required>
                        <label for="inputemail">E-Mail</label>
                    </div>
                    <div class="md-form">
                        <textarea type="text" id="textareaBasic" class="form-control md-textarea" rows="3"
                                  required></textarea>
                        <label for="textareaBasic">Your Messages</label>
                    </div>
                    <button class="btn btn-danger" type="submit">Submit</button>
                </form>
            </div>
            <!-- Grid column -->

            <!-- Grid column -->
            <div class="col-lg-7">

                <!-- Google map-->
                <div id="map-container" class="rounded z-depth-1-half map-container" style="height: 400px">
                    <div class="mapouter">
                        <div class="gmap_canvas">
                            <iframe width="635" height="400" id="gmap_canvas"
                                    src="https://maps.google.com/maps?q=Europa Platz 1, Berlin&t=&z=13&ie=UTF8&iwloc=&output=embed"
                                    frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                        </div>
                    </div>
                </div>
                <br>
                <!-- Buttons-->
                <div class="row text-center">
                    <div class="col-md-4">
                        <a class="btn-floating red accent-1">
                            <i class="fa fa-map-marker"></i></a>
                        <p>Europa Platz 1, Berlin</p>
                        <p class="mb-md-0">Germany</p>
                    </div>
                    <div class="col-md-4">
                        <a class="btn-floating red accent-1">
                            <i class="fa fa-phone"></i>
                        </a>
                        <p>+ 01 234 567 89</p>
                        <p class="mb-md-0">Mon - Fri, 8:00-22:00</p>
                    </div>
                    <div class="col-md-4">
                        <a class="btn-floating red accent-1">
                            <i class="fa fa-envelope"></i>
                        </a>
                        <p class="mb-0">reiseportal@bahn.de</p>

                    </div>
                </div>

            </div>
            <!-- Grid column -->

        </div>
        <!-- Grid row -->

    </section>
    <!-- Section: Contact v.1 -->

</div>div
<%@include file="includes/footer.jsp" %>
<%@include file="includes/loginmodal.jsp" %>
<%@include file="includes/scriptimport.jsp" %>

</body>

</html>