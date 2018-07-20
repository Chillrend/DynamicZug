<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>DeutscheBahn - Passenger Right</title>
    <link rel="stylesheet" href="source/css/main.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link rel="stylesheet" href="source/css/mdb.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
</head>

<body>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/dbimport.jsp" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html class="full-height">  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%String serverIP = request.getServerName(); out.print(serverIP);%></title>
        <link rel="stylesheet" href="source/css/index.css">
        <%@include file="includes/cssimport.jsp"%>
    </head>
    <body>
        <%@include file="includes/dbconnect.jsp" %>
        <header>
        <%@include file="includes/headerindex.jsp" %>
          <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/trendb"
         user = "root"  password = "root"/>

         <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from invoicepass where inv_id=${param.suuid};
         </sql:query>
    <div class="container mt-5">
        <div class="row mt-5"></div>
        <!-- Section: Contact v.1 -->
        <section class="my-5 mt-5">
            <!-- Section heading -->
               <c:forEach var = "row" items = "${result.rows}">
           <h2 class="h1-responsive font-weight-bold text-center mt-5">${row.inv_id}</h2>
         </c:forEach>
          <c:choose>
  <c:when test="${row.inv_id != null}">
   <h2 class="h1-responsive font-weight-bold text-center mt-5">Valid Pass</h2>
  </c:when>
  <c:otherwise>
 <h2 class="h1-responsive font-weight-bold text-center mt-5">Invalid Pass</h2>
  </c:otherwise>
</c:choose> 

        </section>
    </div>
    
            
        <%@include file="includes/loginmodal.jsp" %>
        <%@include file="includes/scriptimport.jsp" %>
    <!--/.Footer-->
    <!--MODAL-->
    <div class="modal fade" id="darkModalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog form-dark" role="document">
            <!--Content-->
            <div class="modal-content card card-image">
                <div class="text-white rgba-stylish-strong py-5 px-5 z-depth-4">
                    <!--Header-->
                    <div class="modal-header text-center pb-4">
                        <h3 class="modal-title w-100 white-text font-weight-bold" id="myModalLabel"><strong>SIGN</strong> <a class="red-text font-weight-bold"><strong> IN</strong></a></h3> <button type="button" class="close white-text" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> </div>
                    <!--Body-->
                    <div class="modal-body">
                        <!--Body-->
                        <div class="md-form mb-5"> <input type="email" id="Form-email5" class="form-control validate white-text"> <label data-error="Incorrect" data-success="Sounds Good!" for="Form-email5">Your email</label> </div>
                        <div class="md-form pb-3"> <input type="password" id="Form-pass5" class="form-control validate white-text"> <label data-error="" data-success="" for="Form-pass5">Your password</label>
                            <div class="form-group mt-4"> <input type="checkbox" id="checkbox624"> <label for="checkbox624" class="white-text">Remember me</label> </div>
                        </div>
                        <!--Grid row-->
                        <div class="row d-flex align-items-center mb-4">
                            <!--Grid column-->
                            <div class="text-center mb-3 col-md-12"> <button type="button" class="btn btn-danger btn-block btn-rounded z-depth-1">Sign in</button> </div>
                            <!--Grid column-->
                        </div>
                        <!--Grid row-->
                        <!--Grid row-->
                        <div class="row">
                            <!--Grid column-->
                            <div class="col-md-12">
                                <p class="font-small white-text d-flex justify-content-end"> Don't Have an account? <a href="sign-up.html" class="red-text ml-1 font-weight-bold"> Sign Up</a></p>
                            </div>
                            <!--Grid column-->
                        </div>
                        <!--Grid row-->
                    </div>
                </div>
            </div>
            <!--/.Content-->
        </div>
    </div>
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="source/js/mdb.min.js" type="text/javascript"></script>
    <!-- Bootstrap core JavaScript -->
    <script src="source/js/main.js"></script>
</body>

</html>
