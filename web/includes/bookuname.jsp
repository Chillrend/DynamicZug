<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<div class="container">
            <!--Grid row-->
            <div class="row">
                <!--Grid column-->
                <div class="col-md-12 white-text text-center">

                    <h1 class="display-3 mb-0 pt-md-5 pt-5 black-text font-weight-bold wow" id="titel" data-wow-delay="0.3s">Ticket <a class="red-text font-weight-bold">Reservation</a> </h1>
                    <!-- Stepper -->


                </div>

                <!--Grid column-->
            </div>
            <p>&nbsp;</p>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8 steps-form-2 white-text text-center">

                         <div class="steps-row-2 reserve d-flex justify-content-between disabled">
                 <div class="steps-step-2">
                            <a href="#step-1" type="button" class="btn btn-amber wea btn-circle-2 waves-effect ml-0" data-toggle="tooltip" data-placement="top" title="New/Existing Account"><i class="fa fa-hourglass-start" aria-hidden="true"></i></a>
                        </div>
                        <div class="steps-step-2">
                            <a href="#step-2" type="button" class="btn btn-blue-grey wea btn-circle-2 waves-effect" data-toggle="tooltip" data-placement="top" title="Personal Data"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                        </div>
                        <div class="steps-step-2">
                            <a href="#step-3" type="button" class="btn btn-blue-grey wea btn-circle-2 waves-effect active" data-toggle="tooltip" data-placement="top" title="Ticket Select"><i class="fa fa-credit-card" aria-hidden="true"></i></a>
                        </div>
                        <div class="steps-step-2">
                            <a href="#step-4" type="button" class="btn btn-blue-grey wea btn-circle-2 waves-effect mr-0" data-toggle="tooltip" data-placement="top" title="Checkout"><i class="fa fa-ticket" aria-hidden="true"></i></a>
                        </div>

                    </div>
 
                   
                    <p>&nbsp;</p>
                   <form action="railpassM" method="post">
                      
                    
                        <h3 class="black-text shit" id="shit" data-wow-delay="2s">Booking as : ${sessionScope.username}<br>Entry: <%out.print(_htm);%></h3>
                     <div class="wow shitbrix" id="step-1" data-wow-delay="0.3s"> <a class="btn btn-red btn-lg" id="logout">use Another</a>
                            <button class="btn btn-lg btn-white lanjut" type="button">Continue</button> </div>  
 
                        <div class="wow shitbrix black-text" id="step-2">
                            <div class="col-md-12">
                                <blockquote class="blockquote bq-warning" id="warning">
                                    <p class="bq-title" style="font-size: 1rem;"><i class="fa fa-warning"></i> Heads up!</p>
                                    <p style="font-size: 1rem;" id='focus' >Passenger details must be written as on ID card/passport/driving license.<br> Passenger details cannot be changed after leaving this page, double-check!</p>
                                    <div class="" id='alertz' role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                    </div>
                                </blockquote>
                            </div>
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/trendb"
         user = "root"  password = "root"/>

         <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from ticket where tkt_id=${param.tktid};
         </sql:query>   

    <c:set var = "entry" value = "${_htm}"/>
    <input type="hidden" name="htm" value="${param.htm}" />
         <c:forEach var = "row" items = "${result.rows}">
    <input type="hidden" name="price" value="${param.htm * row.price}" />
         </c:forEach>

<c:forEach var="counter" begin="1" end="${param.htm}">

                                <div id="passenjer">
                                <h5 class="mb-5">Passenger ${counter}</h5>
                                <div class="row">
                                    <div class="col-md-4 pt-3">
                                        <select class="mdb-select" id="name${counter}">
                                                        <option value="1" selected>Mr.</option>
                                                        <option value="2">Mrs.</option>
                                                        <option value="3">Miss</option>
                                                    </select>
                                        <label>Title</label>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="md-form form-group">
                                            <input type="text" required class="form-control" id="inputname${counter}" name="nama${counter}" placeholder="Full Name">
                                            <label for="inputname${counter}">Name</label>
                                        </div>
                                    </div>
                                </div>

                                 <div class="row">
                                    <div class="col-md-4 pt-3">
                                        <select class="mdb-select" id="id1">
                                                            <option value="1" selected>KTP/Govt. ID</option>
                                                            <option value="2">SIM/Driving License</option>
                                                            <option value="3">Passport</option>
                                                            <option value="3">Other</option>
                                                        </select>
                                        <label>ID Type</label>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="md-form form-group">
                                            <input type="text" required class="form-control" name="ident${counter}" id="ident${counter}" placeholder="Type your ID Number">
                                            <label for="ident${counter}">ID Number</label>
                                        </div>
                                    </div>
                                </div>    

                            </div>
</c:forEach>
                            <!--IDENTITY-->
<input type="hidden" name="inputpassname" value="${param.route}" />
<input type="hidden" name="selectDays" value="One Time" />
<input type="hidden" name="selectCountry" value="Germany" />
<input type="hidden" name="dateStart" value="${param.tanggal_berangkat}" />
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <button class="btn btn-red balik float-left" type="button">Previous</button>
<!--                            <button class="btn btn-red center" type="button" onclick="addpass()" id="addanother">Add Another</button>
                                                    <button class="btn btn-red center" type="button" onclick="dick()">Validate</button>-->
                            <button class="btn btn-red lanjut float-right" type="submit">Checkout</button>
                        </div>
             <div class="wow shitbrix" id="step-3">
                 <h1 style="color:black !important;">THANKS FOR ORDER, NOW REDIRECTING IN 3</h1>
                    </div>
                   </form>



                </div>


                <div class="container mt-5 mb-5">
                    <!-- Extended material form grid -->

                    <!-- Horizontal Steppers -->

                    <!-- /.Horizontal Steppers -->

                    <div class="fixed-action-btn" style="bottom: 45px; right: 24px;">
                        <button id="fixed-action-btn" type="button" class="btn btn-floating btn-large red" data-toggle="modal" data-target="#modalCart" onclick="cekot()"><i class="fa fa-shopping-cart"></i></button>
                    </div>
                </div>
            </div>

            <div class="col-md-2"></div>
            <!--Grid row-->

        </div>