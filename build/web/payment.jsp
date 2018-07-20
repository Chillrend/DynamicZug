<%-- 
    Document   : sign-up
    Created on : Jun 21, 2018, 7:04:46 AM
    Author     : X453SA
--%>

    <%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <!DOCTYPE html>
        <html>

        <head>
            
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>${sessionScope.htm} </title>
            <link rel="stylesheet" href="source/css/main.css">
            <%@include file="includes/cssimport.jsp" %>
        </head>

        <body>
            <%@include file="includes/header.jsp" %>
            <script>
                $(function () {
                    $('[data-toggle="tooltip"]').tooltip()
                })
            </script>
                <div class="container mt-5 mb-5" >
                    <!-- Extended material form grid -->
                    <div class="row mt-5"></div>
                    <div class="mt-5">
                        <h1>Payment</h1>
                        <h3>Your Total : EUR € ${requestScope.price}</h3>
                    </div>  
                 <c:choose>
                    <c:when test="${sessionScope.htm > 1}">
                        <form action="railPassInvoiceM" method="post" class="md-form ml-3" id="payment" onsubmit="return validateDate()">
                        </c:when>
                    <c:otherwise>
 <form action="railPassInvoice" method="post" class="md-form ml-3" id="payment" onsubmit="return validateDate()">
    
                    </c:otherwise>
                </c:choose>
            
                                           <div class="row">
                            <div class="col-md-4">
                                <select class="mdb-select">
                                    <option value="1" selected>Germany</option>
                                    <option value="2">International</option>
                                </select>
                                <label>Country</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="md-form form-group">
                                    <input type="text" class="form-control" id="inputcc" pattern="[0-9].{7,7}" required title="Enter Your 8 Digit Card Number">
                                    <label for="inputcc" pattern="[0-9].{7,7}" required title="Enter Your 8 Digit Card Number">Card Number</label>
                                    <div class="pt-2">
                                        <img src="source/image/200px-Mastercard-logo.svg.png" width="37px" alt="" class="img-fluid">&nbsp;
                                        <img src="source/image/deutsche-bank-logo.png" width="37px" alt="" class="img-fluid">&nbsp;
                                        <img src="source/image/discover200.png" width="37px" alt="" class="img-fluid">&nbsp;
                                        <img src="source/image/amex200.png" width="37px" alt="" class="img-fluid">&nbsp;
                                        <img src="source/image/Former_Visa_(company)_logo.svg.png" width="37px" alt="" class="img-fluid">&nbsp;
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="md-form form-group">
                                    <input type="text" id="expdate" class="form-control datepicker" required title="Pick any date in the month your card expires">
                                    <label for="expdate">Expiration Date</label>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="md-form form-group">
                                    <input type="text" class="form-control" id="inputcvv" pattern="[0-9].{3,3}" required title="Check your CVV Number on the back of your card">
                                    <label for="inputcvv">CVV/CSC</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="md-form form-group">
                                    <input type="text" class="form-control" id="inputfname" pattern="[a-zA-Z' ]+" required>
                                    <label for="inputfname">First Name</label>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="md-form form-group">
                                    <input type="text" class="form-control" id="inputlname" pattern="[a-zA-Z' ]+" required>
                                    <label for="inputlname">Last Name</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="md-form form-group">
                                    <input type="text" class="form-control" id="inputaddr" required>
                                    <label for="inputaddr">Billing Address</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="md-form form-group">
                                    <input type="text" class="form-control" id="inputzip" pattern="[0-9].{4,4}" required title="Type your zip code ex: 16914">
                                    <label for="inputzip">Zip Code</label>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="md-form form-group">
                                    <input type="text" class="form-control" id="inputstate" required pattern="[A-Z][A-Za-z' -]+">
                                    <label for="inputstate">State</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="md-form form-group">
                                    <input type="text" class="form-control" id="inputphone" title="Phone number must match this pattern: 000-000-0000" required pattern="[0-9]{3}[ -][0-9]{3}[ -][0-9]{4}">
                                    <label for="inputphone">Phone</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="md-form form-group">
                                    <input type="email" class="form-control" id="inputemail" required>
                                    <label for="inputemail">E-mail</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <img src="source/image/comodo-secure-logo-new.png" alt="" width="75px" class="img-fluid">
                                <img src="source/image/mcafee-secure-ic_0.jpg" alt="" width="75px" class="img-fluid">
                                <img src="source/image/norton_secured_seal-big.png" alt="" width="75px" class="img-fluid">
                                <img src="source/image/geotrust_secure.svg" alt="" width="75px" class="img-fluid">
                            </div>
                        </div>
                        <div class="row mb-5">
                            <a class="btn btn-danger" href="reservation-1.html">Go Back</a>
                            <button type="submit" class="btn btn-danger">Checkout</button>
                        </div>
                    </form>
                </div>
                    
            <%@include file="includes/footer.jsp" %>
            <%@include file="includes/loginmodal.jsp" %>
            <%@include file="includes/scriptimport.jsp" %>

        </body>

        </html>