<%-- 
    Document   : sign-up
    Created on : Jun 21, 2018, 7:04:46 AM
    Author     : X453SA
--%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>

        <!DOCTYPE html>
        <html>

        <head>
            
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Deutsche Bahn - Features</title>
            <link rel="stylesheet" href="source/css/index.css">
            <%@include file="includes/cssimport.jsp" %>
        </head>

        <body>
            <header>
            <%@include file="includes/headerindex.jsp" %>
                <div class="view jarallax" data-jarallax='{"speed": 0.2}' style="background-image: url('http://www.finnmoller.dk/rail-de/143/db143569.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
                    <!-- Mask & flexbox options-->
                    <div class="mask rgba-white-light d-flex justify-content-center align-items-center">
                        <!-- Content -->
                        <div class="container">
                            <!--Grid row-->
                            <div class="row">
                                <!--Grid column-->
                                <div class="col-md-12 white-text text-center">
                                    <h1 class="display-3 mb-0 pt-md-5 pt-5 white-text font-weight-bold wow fadeInDown" data-wow-delay="0.3s">Deutsche <a class="red-text font-weight-bold">Bahn</a> </h1>
                                    <h5 class="text-uppercase pt-md-5 pt-sm-2 pt-5 pb-md-5 pb-sm-3 pb-5 white-text font-weight-bold wow fadeInDown" data-wow-delay="0.3s">Ihre Sicherheit ist unser Priorität</h5>
                                    <div class="wow fadeInDown" data-wow-delay="0.3s"> <a class="btn btn-red btn-lg">Reserve a Ticket</a> <a class="btn btn-white btn-lg">About us</a> </div>
                                </div>
                                <!--Grid column-->
                            </div>
                            <!--Grid row-->
                        </div>
                        <!-- Content -->
                    </div>
                    <!-- Mask & flexbox options-->
                </div>
            </header>
            <section class="text-center my-5">
                <div class="container">
                    <!-- Section heading -->
                    <h2 class="h1-responsive font-weight-bold my-5">First Class</h2>
                    <!-- Section description -->
                    <p class="lead grey-text w-responsive mx-auto mb-5">Here's a glance of thing you will have on-board a first-class carriage</p>
                    <!-- Grid row -->
                    <div class="row">
                        <!-- Grid column -->
                        <div class="col-md-4"> <i class="fa fa-thermometer-0 fa-3x blue-text"></i>
                            <h5 class="font-weight-bold my-4">Air Conditioner</h5>
                            <p class="grey-text mb-md-0 mb-5">Doesn't matter what happen outside, your coach will be cold as a winter in german, 18°C. Maximum</p>
                        </div>
                        <!-- Grid column -->
                        <!-- Grid column -->
                        <div class="col-md-4"> <i class="fa fa-wifi fa-3x cyan-text"></i>
                            <h5 class="font-weight-bold my-4">Wi-fi</h5>
                            <p class="grey-text mb-md-0 mb-5">High-speed internet on-board, with no limited data-cap. Don't miss a single update when you're on trip</p>
                        </div>
                        <!-- Grid column -->
                        <!-- Grid column -->
                        <div class="col-md-4"> <i class="fa fa-film fa-3x orange-text"></i>
                            <h5 class="font-weight-bold my-4">AVOD</h5>
                            <p class="grey-text mb-0">On-demand display in-front of your seat, display you unlimited entertainment, realtime position of the train, also it's velocity.</p>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <div class="row mt-5"></div>
                    <div class="row">
                        <!-- Grid column -->
                        <div class="col-md-4"> <i class="fa fa-cutlery fa-3x red-text"></i>
                            <h5 class="font-weight-bold my-4">Free Food*</h5>
                            <p class="grey-text mb-md-0 mb-5">Free Main Course, night-ride will get a dinner. Day-ride will get a Lunch. Welcome drink and snack are also provided</p>
                        </div>
                        <!-- Grid column -->
                        <!-- Grid column -->
                        <div class="col-md-4"> <i class="fa fa-bicycle fa-3x green-text"></i>
                            <h5 class="font-weight-bold my-4">Bicycle Carriage</h5>
                            <p class="grey-text mb-md-0 mb-5">A Space for storing your bicycle is available at an extra pay, please add an extra bicycle baggage when you're booking a ticket</p>
                        </div>
                        <!-- Grid column -->
                        <!-- Grid column -->
                        <div class="col-md-4"> <i class="fa fa-plug fa-3x yellow-text"></i>
                            <h5 class="font-weight-bold my-4">Electronic Socket</h5>
                            <p class="grey-text mb-0">A power source to keep your electronic device alive. perfect for whom'st'd've want to work on a train-ride (max voltage 240v)</p>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <div class="row mt-5"></div>
                    <p class="lead grey-text w-responsive mx-auto mb-5">Please note that all train journey are a no-smoking trip, please store your ciggarete at your baggage or will be disposed by our officer while boarding.</p>
                    <div class="text-center">
                        <img src="source/image/nopet.png" width="70" alt="">
                        <img src="source/image/noflame.png" width="70" alt="">
                        <img src="source/image/noweapon.png" width="70" alt="">
                        <img src="source/image/nosmoking.png" width="70" alt="">
                    </div>
                    <!-- Grid row -->
                </div>
            </section>


            
            <%@include file="includes/footer.jsp" %>
            <%@include file="includes/loginmodal.jsp" %>
            <%@include file="includes/scriptimport.jsp" %>

        </body>

        </html>