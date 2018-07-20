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
            <title>Deutsche Bahn - Sign Up</title>
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
                <div class="container mt-5 mb-5">
                    <!-- Extended material form grid -->
                    <div class="row mt-5"></div>
                    <div class="mt-5">
                        <h1>Sign-up</h1>
                        <h4>Please fill all the fields below</h4>
                    </div>

                    <form action="zugSignup" method="post" onsubmit="return validateRegist()">
                        <!-- Grid row -->
                        <div class="form-row">
                            <!-- Grid column -->
                            <div class="col-md-4">
                                
                                <!-- Material input -->
                                <div class="md-form form-group">
                                    <input type="text" class="form-control" id="inputuname" name="uname"
                                    required pattern="[a-zA-Z][a-zA-Z0-9-_]{6,32}" data-toggle="tooltip"
                                    data-placement="right" data-html="true" data-title="<em>Username must start with an alphabetical character
                                    followed by another alphabetical or numeric or dash and underscores. Username must be 6-32
                                    Character maximum</em>" data-container="body" placeholder="JohnDoe">
                                    <label for="inputuname">Username</label>
                                </div>
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-4">
                                <!-- Material input -->
                                <div class="md-form form-group">
                                    <input type="password" class="form-control" id="inputPassword4MD" name="pwd" required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$"
                                    data-toggle="tooltip" data-placement="right" data-html="true" data-container="body"
                                    data-title="<em>Password must contain atleast 8 Character, 1 uppercase, 1 lowercase, 1 number. password CAN contain
                                    special character</em>" placeholder="••••••••">
                                    <label for="inputPassword4MD">Password</label>
                                </div>
                            </div>
                            <!-- Grid column -->
                        </div>
                        <!-- Grid row -->

                        <!-- Grid row -->
                        <div class="row">
                            <!-- Grid column -->
                            <div class="col-md-4">
                                <!-- Material input -->
                                <div class="md-form form-group">
                                    <input type="email" class="form-control" id="inputmail" name="email" placeholder="JohnDoe@somecompany.com"
                                    data-toggle="tooltip" data-placement="right" data-html="true" data-container="body"
                                    data-title="Please specify your e-mail address" required>
                                    <label for="inputmail">E-Mail Address</label>
                                </div>
                            </div>
                            <!-- Grid column -->

                             <div class="col-md-3">
                                <!-- Material input -->
                                <div class="md-form form-group" style="margin-top: 1em;">
                                    <select class="mdb-select" id="Gender" name="gender">
                                        <option value="" disabled selected>Please Select Gender</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Gay">Better not to say</option>
                                    </select>
                                    <label>Gender</label>
                                </div>
                            </div>
                            <!-- Grid column -->
                        </div>
                        <!-- Grid row -->
                        <div class="row">
                            <div class="col-md-7">
                                <div class="md-form form-group">
                                    <input type="text" name="name" class="form-control" id="inputname" placeholder="Smith John Doe"
                                    data-toggle="tooltip" data-placement="right" data-html="true" data-container="body"
                                    data-title="Please specify your fullname" required pattern="^([A-Z][a-z]+([ ]?[a-z]?['-]?[A-Z][a-z]+)*)$">
                                    <label for="inputname">Full Name</label>
                                </div>
                            </div>
                        </div>
                        <!-- Grid row -->
                        <div class="form-row">
                            <!-- Grid column -->
                            <div class="col-md-3">
                                <!-- Material input -->
                                <div class="md-form form-group">
                                    <input type="text" name="city" class="form-control" id="inputCityMD" placeholder="Wyoming, WY" required
                                    pattern="^[A-Za-z]+(\s[A-Za-z]+)?\s*,*\s*[A-Za-z]+(\s[A-Za-z]+)?\s*$">
                                    <label for="inputCityMD">City / State</label>
                                </div>
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-2">
                                <!-- Material input -->
                                <div class="md-form form-group">
                                    <input type="text" name="zip" class="form-control" id="inputZipMD" required pattern="[0-9]{5}(-[0-9]{4})?" placeholder="11206-1117">
                                    <label for="inputZipMD">Zip</label>
                                </div>
                            </div>
                            <!-- Grid column -->
                        </div>
                        <div class="form-row">
                            <!-- Grid column -->
                            <div class="col-md-6">
                                <!-- Material input -->
                                <div class="md-form form-group">
                                    <input type="text" name="addr" class="form-control" id="inputAddr" placeholder="123 Bushi Road Av." required>
                                    <label for="inputAddr">Address</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <!-- Grid column -->
                            <div class="col-md-2">
                                <!-- Material input -->
                                <div class="md-form form-group" style="margin-top: 1em;">
                                    <select class="mdb-select" id="idtype">
                                        <option value="ktp">ID Card/KTP/Govt. ID</option>
                                        <option value="passport">Passport</option>
                                        <option value="student">Student Card</option>
                                    </select>
                                    <label>ID Type</label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <!-- Material input -->
                                <div class="md-form form-group">
                                    <input name="identify" type="text" class="form-control" id="inputID" placeholder="320101432122" required>
                                    <label for="inputID">ID Number</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <div class="g-recaptcha" data-sitekey="6Lcg_l8UAAAAANk-CQ9lwTWGtVKwJ49vvuP2DZAV"></div>
                            </div>
                            <br />
                        </div>
                        <div class="form-row">
                            <button type="submit" class="btn btn-primary btn-md">Sign up</button>
                        </div>
                        
                    </form>
                    <!-- Extended material form grid -->
                </div>
            <%@include file="includes/footer.jsp" %>
            <%@include file="includes/loginmodal.jsp" %>
            <%@include file="includes/scriptimport.jsp" %>

        </body>

        </html>