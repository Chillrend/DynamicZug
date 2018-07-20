<%-- 
    Document   : sign-up
    Created on : Jun 21, 2018, 7:04:46 AM
    Author     : X453SA
    --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="includes/dbimport.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Deutsche Bahn - Profile</title>
    <link rel="stylesheet" href="source/css/main.css">
    <%@include file="includes/cssimport.jsp" %>
</head>
<body>
<%@include file="includes/dbconnect.jsp" %>
<%@include file="includes/header.jsp" %>
<c:choose>
    <c:when test="${sessionScope.username != null}">

    </c:when>
    <c:otherwise>
        <script type="text/javascript">
            $(document).ready(function () {
                // Handler for .ready() called.
                alert("You haven't Logged in, please login first");
                window.location.href = "index.jsp";
            });
        </script>
    </c:otherwise>
</c:choose>
<sql:query dataSource="${snapshot}" var="result">
    SELECT * FROM user WHERE username="${sessionScope.username}";
</sql:query>
<div class="container-fluid ml-2 mr-2 mt-5 mb-5">
    <!-- Extended material form grid -->
    <div class="row mt-5">

    </div>
    <div class="row mt-5">
        <div class="col-lg-3">
            <div class="card testimonial-card">

                <!--Background color-->
                <div class="card-up red">
                </div>

                <!--Avatar-->
                <div class="avatar mx-auto white">
                    <form action="imagedisplay" method="get">
                        <img src="imagedisplay?username=${sessionScope.username}" alt="your avatar" class="rounded-circle img-fluid">
                    </form>
                </div>
                <c:forEach var="row" items="${result.rows}">
                <div class="card-body">
                    <!--Name-->
                    <h4 class="card-title mt-1">${row.name}</h4>
                    <hr>
                    <!--Quotation-->

                    <div class="text-md-left">
                        <p><i class="fa fa-map-signs"></i>&nbsp;&nbsp; ${row.city}</p>
                        <p><i class="fa fa-transgender"></i>&nbsp;&nbsp; ${row.gender}</p>
                        <p><i class="fa fa-globe"></i>&nbsp;&nbsp; www.johndoe.com</p>
                        <p><i class="fa fa-credit-card"></i>&nbsp;&nbsp; ${row.ident}</p>
                        </c:forEach>
                    </div>
                </div>

            </div>
            <!--Card-->
        </div>
        <div class="col-lg-9">
            <!-- Classic tabs -->
            <div class="classic-tabs">
                <!-- Nav tabs -->
                <div class="tabs-wrapper">
                    <ul class="nav tabs-red" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link waves-light active" data-toggle="tab" href="#panel1011" role="tab">
                                <i class="fa fa-user fa-2x" aria-hidden="true"></i>
                                <br> Profile</a>
                        </li>
                        <li class="nav-item">
                            <a id="bookings" class="nav-link waves-light" data-toggle="tab" href="#panel1012"
                               role="tab">
                                <i class="fa fa-ticket fa-2x" aria-hidden="true"></i>
                                <br> Your Bookings</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link waves-light" data-toggle="tab" href="#panel1013" role="tab">
                                <i class="fa fa-pencil fa-2x" aria-hidden="true"></i>
                                <br> Edit Data</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link waves-light" data-toggle="tab" href="#panel1014" role="tab">
                                <i class="fa fa-picture-o fa-2x" aria-hidden="true"></i>
                                <br> Change Profile Picture</a>
                        </li>
                    </ul>
                </div>
                <!-- Tab panels -->
                <div class="tab-content card">
                    <!--Panel 1-->
                    <c:forEach var="row" items="${result.rows}">
                        <div class="tab-pane fade in show active" id="panel1011" role="tabpanel">
                            <h2>Your Profile</h2>
                            <br/>
                            <p>Userame : ${row.username}</p>
                            <p>Name : ${row.name}</p>
                            <p>E-Mail : ${row.email}</p>
                            <p>Gender : ${row.gender}</p>
                            <p>Identification Number : ${row.ident}</p>
                            <p>Address : ${row.address} , ${row.city}, ${row.zip}</p>
                        </div>
                    </c:forEach>
                    <!--/.Panel 1-->
                    <!--Panel 2-->
                    <div class="tab-pane fade" id="panel1012" role="tabpanel">
                        <h2>Your Bookings</h2>
                        <table id="bookingtable" class="table">
                            <thead class="red lighten-1">
                            <tr>
                                <th>Booking ID</th>
                                <th>Train Number, Name</th>
                                <th>From, To</th>
                                <th>Schedules</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <!--/.Panel 2-->
                    <!--Panel 3-->
                    <div class="tab-pane fade" id="panel1013" role="tabpanel">
                        <h2>Edit Data</h2>
                        <h4>Edit your data that will be used for next book</h4>
                        <form id="hide-this-later">
                            <div class="form-row row">
                                <div class="col-md-6">
                                    <h6>You are entering sudo mode, please re-enter your password</h6>
                                    <div class="md-form form-group">
                                        <input class="form-control" type="password" id="inputpwds" name="inputpwds">
                                        <label for="inputpwds">Password</label>
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-danger" id="verifypwd" type="button">Authorize</button>
                        </form>
                        <form action="updateuserdata" method="post" id="hide-this-first" onsubmit="return validateUpdate()">
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
                                        <input type="password" class="form-control" id="inputPassword" name="pwd"
                                               required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$"
                                               data-toggle="tooltip" data-placement="right" data-html="true"
                                               data-container="body"
                                               data-title="<em>Password must contain atleast 8 Character, 1 uppercase, 1 lowercase, 1 number. password CAN contain
                                    special character</em>" placeholder="••••••••">
                                        <label for="inputPassword">Password</label>
                                    </div>
                                </div>
                                <div class="col-md-4" id="hide-if-password-not-changed">
                                    <!-- Material input -->
                                    <div class="md-form form-group">
                                        <input type="password" class="form-control" id="inputConfirmPassword" name="passwordConfirm"
                                               pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$"
                                               data-toggle="tooltip" data-placement="right" data-html="true"
                                               data-container="body"
                                               data-title="<em>Password must contain atleast 8 Character, 1 uppercase, 1 lowercase, 1 number. password CAN contain
                                    special character</em>" placeholder="••••••••">
                                        <label for="inputConfirmPassword">Confirm Password</label>
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
                                        <input type="email" class="form-control" id="inputmail" name="email"
                                               placeholder="JohnDoe@somecompany.com"
                                               data-toggle="tooltip" data-placement="right" data-html="true"
                                               data-container="body"
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
                                        <input type="text" name="name" class="form-control" id="inputname"
                                               placeholder="Smith John Doe"
                                               data-toggle="tooltip" data-placement="right" data-html="true"
                                               data-container="body"
                                               data-title="Please specify your fullname" required
                                               pattern="^([A-Z][a-z]+([ ]?[a-z]?['-]?[A-Z][a-z]+)*)$">
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
                                        <input type="text" name="city" class="form-control" id="inputCity"
                                               placeholder="Wyoming, WY" required
                                               pattern="^[A-Za-z]+(\s[A-Za-z]+)?\s*,*\s*[A-Za-z]+(\s[A-Za-z]+)?\s*$">
                                        <label for="inputCity">City / State</label>
                                    </div>
                                </div>
                                <!-- Grid column -->

                                <!-- Grid column -->
                                <div class="col-md-2">
                                    <!-- Material input -->
                                    <div class="md-form form-group">
                                        <input type="text" name="zip" class="form-control" id="inputZip" required
                                               pattern="[0-9]{5}(-[0-9]{4})?" placeholder="11206-1117">
                                        <label for="inputZip">Zip</label>
                                    </div>
                                </div>
                                <!-- Grid column -->
                            </div>
                            <div class="form-row">
                                <!-- Grid column -->
                                <div class="col-md-6">
                                    <!-- Material input -->
                                    <div class="md-form form-group">
                                        <input type="text" name="addr" class="form-control" id="inputAddr"
                                               placeholder="123 Bushi Road Av." required>
                                        <label for="inputAddr">Address</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <!-- Grid column -->
                                <div class="col-md-4">
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
                                        <input name="identify" type="text" class="form-control" id="inputID"
                                               placeholder="320101432122" required>
                                        <label for="inputID">ID Number</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="g-recaptcha"
                                         data-sitekey="6Lcg_l8UAAAAANk-CQ9lwTWGtVKwJ49vvuP2DZAV"></div>
                                </div>
                                <br/>
                            </div>
                            <div class="form-row">
                                <button type="submit" id="updateButton" class="btn btn-primary btn-md">Update Data</button>
                            </div>

                        </form>
                    </div>
                    <!--/.Panel 3-->
                    <div class="tab-pane fade" id="panel1014" role="tabpanel">
                        <h2>Change your Profile Picture</h2>
                        <form action="imageupload" method="post" class="md-form" enctype="multipart/form-data">
                            <div class="file-field">
                                <div class="mb-4">
                                    <img src="#" width="400" height="200" id="pre-display" class="rounded-circle z-depth-1-half avatar-pic">
                                </div>
                                <div class="d-flex">
                                    <div class="btn btn-danger btn-rounded float-left">
                                        <span>Add photo (4 MiB Max.)</span>
                                        <input type="file" id="img-input" name="img-input">
                                    </div>
                                </div>
                                <button class="btn btn-danger" type="submit">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Classic tabs -->
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp" %>
<%@include file="includes/loginmodal.jsp" %>
<%@include file="includes/scriptimport.jsp" %>
</body>
</html>