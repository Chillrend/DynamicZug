 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../includes/dbimport.jsp" %>
<!DOCTYPE html>
<html class="full-height">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Deutsche Backend</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="../source/css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="../source/css/crudstyle.css" rel="stylesheet">
</head>

<body class="fixed-sn light-blue-skin">
        <%@include file="/includes/dbconnect.jsp" %>
    <!--Main Navigation-->
    <header class="peler">

        <!--Navbar-->
        <nav class="navbar navbar-expand-lg deus double-nav  fixed-top scrolling-navbar">
            <div class="breadcrumb-dn">
                <p>

                    <span class="clearfix d-none d-sm-inline-block">DB-Backend &nbsp;</span>
                </p>
            </div>
            <!-- SideNav slide-out button -->
            <div class="float-left">
                <ul class="nav navbar-nav nav-flex-icons ml-auto">

                    <li class="nav-item">
                        <a class="nav-link">
                               
                                <span class="clearfix d-none d-sm-inline-block" id="gettime"></span>
                            </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">
                               
                                    <span class="clearfix d-none d-sm-inline-block">Admin</span>
                                </a>
                    </li>
                </ul>
            </div>

            <!-- Breadcrumb-->


            <!-- Links -->
            <ul class="nav navbar-nav nav-flex-icons ml-auto">
                <li class="nav-item">
                    <a class="nav-link">
                       
                        <span class="clearfix d-none d-sm-inline-block">Privileges : </span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link">
                        <i class="fa fa-gear"></i>
                        <span class="clearfix d-none d-sm-inline-block">Settings</span>
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-target="a2">
                        <i class="fa fa-user"></i>
                        <span class="clearfix d-none d-sm-inline-block">Account</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" id='a2' aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
            </ul>

        </nav>
        <!--/.Navbar-->



    </header>
    <!--Main Navigation-->
    <main>
        <div class="container-fluid">
 <section class="mb-5">



                <!--Card-->
                <div class="card card-cascade narrower">

                    <!--Card header-->
                    <div class="view py-3 gradient-card-header info-color-dark mx-4 d-flex justify-content-between align-items-center">

                        <div>
                            <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                                <i class="fa fa-th-large mt-0"></i>
                            </button>
                            <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                                <i class="fa fa-columns mt-0"></i>
                            </button>
                        </div>

                        <a href="" class="white-text mx-3">Table name</a>

                        <div>
   <form id="customsearch" class="form-inline md-form form-sm" name="sortid">
    <i class="fa fa-search" aria-hidden="true"></i>
    <input class="form-control form-control-sm ml-3 w-75" type="text" name="t1" placeholder="Search" aria-label="Search" onkeyup="sendInfo()" onclick="disableall()">

   </form>
                        </div>

                    </div>
                    <!--/Card header-->
<!-- Modal -->
<div class="modal fade" id="elegantModalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <!--Content-->
        <div class="modal-content form-elegant">
            <!--Header-->
            <div class="modal-header text-center">
                <h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel"><strong>Edit</strong></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!--Body-->
            <div class="modal-body mx-4">
                <!--Body-->
                <div class="md-form mb-5">
                    <input type="text" id="Form-uname" name="uname" class="form-control validate">
                    <label for="Form-uname">Username</label>
                </div>

                <div class="md-form pb-3">
                    <input type="password" name="pwd" id="Form-pass" class="form-control validate">
                    <label data-error="wrong" data-success="right" for="Form-pass">Password</label>
                    <p class="font-small blue-text d-flex justify-content-end">Forgot <a href="#" class="blue-text ml-1"> Password?</a></p>
                </div>

                <div class="text-center mb-3">
                    <button type="button" id="login" class="btn blue-gradient btn-block btn-rounded z-depth-1a">Sign in</button>
                </div>
                
            </div>
            <!--Footer-->
            <div class="modal-footer mx-5 pt-3 mb-1">
                <p class="font-small grey-text d-flex justify-content-end">Not a member? <a href="register.jsp" class="blue-text ml-1"> Sign Up</a></p>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
<!-- Modal -->
<!-- Card -->

<!-- Button trigger modal -->


<!-- Modal -->
                    <!--Card content-->
                    <div class="card-body">

                        <div class="table-responsive">

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>
                                            
                                            <label for="checkbox" class="label-table"></label>
                                        </th>
                                        
<% 

try
{
Connection dbc = null; //Make connection to the database
ResultSetMetaData md;
Class.forName("com.mysql.jdbc.Driver");
String query="select user_id,username,password,role,name,ident from user LIMIT 1";
dbc = DriverManager.getConnection("jdbc:mysql://localhost:3306/trendb", "root", "root");
Statement stmt=dbc.createStatement();
if (dbc != null) 
{
  
}
ResultSet rs = stmt.executeQuery(query); 
//The above function is mentioned in the end. 
//It is defined in another package- listresult
md = rs.getMetaData();
int count = md.getColumnCount();
for (int i=1; i<=count; i++) {
%>
<th class="th-lg"><%out.print(md.getColumnName(i));%></th>
<% } %>
<th class="th-lg"></th>
<%
    rs.close();
    stmt.close();
    dbc.close();
    }
catch(Exception e){
    e.printStackTrace();
    }%>
                                    </tr>
                                </thead>
                                <tbody id="currenttable">
<% 

try
{
Connection dbc = null; //Make connection to the database
ResultSetMetaData md;
Class.forName("com.mysql.jdbc.Driver");
String query="select user_id,username,password,role,name,ident from user";
dbc = DriverManager.getConnection("jdbc:mysql://localhost:3306/trendb", "root", "root");
Statement stmt=dbc.createStatement();
if (dbc != null) 
{
  
}
ResultSet rs = stmt.executeQuery(query);

//The above function is mentioned in the end. 
//It is defined in another package- listresult
md = rs.getMetaData();
int count = rs.getRow();
while (rs.next()) {
%>
                                    <tr id="id<%out.print(rs.getInt("id")); %>">
                                        <th scope="row">
                                            <input type="checkbox" id="checkbox1">
                                            <label for="checkbox1" class="label-table"></label>
                                        </th>
                                       <%
 out.print("<td>" + rs.getInt("id") + "</td>"); 
 out.print("<td>" + rs.getString("username") + "</td>");
 out.print("<td>" + rs.getString("password") + "</td>");
out.print("<td>" + rs.getString("role") + "</td>");
out.print("<td>" + rs.getString("name") + "</td>");
out.print("<td>" + rs.getInt("ident") + "</td>");

                                       %>
                                       <td><form id="edituser" name="editid">
                                           <input type="hidden" value='<%out.print(rs.getInt("id"));%>' name="userid">
                                               <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2" data-toggle="modal" onclick="filldata()" data-target="#elegantModalForm">
                                <i class="fa fa-pencil mt-0"></i>
                                           </button></form></td>
                                
                                    </tr>
<% } %>

<%
    rs.close();
    stmt.close();
    dbc.close();
    }
catch(Exception e){
    e.printStackTrace();
    }%>
                                    
                                    
                                </tbody>
                            </table>

                        </div>

                        <hr class="my-0">

                        <!--Bottom Table UI-->
                        <div class="d-flex justify-content-between">

                            <!--Name-->
                            <select class="mdb-select colorful-select dropdown-primary mt-2 hidden-md-down">
                                <option value="" disabled>Rows number</option>
                                <option value="1" selected>10 rows</option>
                                <option value="2">25 rows</option>
                                <option value="3">50 rows</option>
                                <option value="4">100 rows</option>
                            </select>

                            <!--Pagination -->
                            <nav class="my-4">
                                <ul class="pagination pagination-circle pg-blue mb-0">

                                    <!--First-->
                                    <li class="page-item disabled">
                                        <a class="page-link">First</a>
                                    </li>

                                    <!--Arrow left-->
                                    <li class="page-item disabled">
                                        <a class="page-link" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>

                                    <!--Numbers-->
                                    <li class="page-item active">
                                        <a class="page-link">1</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link">2</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link">3</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link">4</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link">5</a>
                                    </li>

                                    <!--Arrow right-->
                                    <li class="page-item">
                                        <a class="page-link" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>

                                    <!--First-->
                                    <li class="page-item">
                                        <a class="page-link">Last</a>
                                    </li>

                                </ul>
                            </nav>
                            <!--/Pagination -->

                        </div>
                        <!--Bottom Table UI-->

                    </div>
                    <!--/.Card content-->

                </div>
                <!--/.Card-->

            </section>
        </div>
    </main>
    <!--Main layout-->

    <!--/.Footer-->

    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="../source/js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="../source/js/mdb.min.js"></script>

    <!-- Initializations -->
    <script>
        // SideNav Initialization
        $(".button-collapse").sideNav();

        // Material Select Initialization
        $(document).ready(function() {
            $('.mdb-select').material_select();
        });

        // Data Picker Initialization
        $('.datepicker').pickadate();

        // Tooltip Initialization
        $(function() {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>

    <!-- Charts -->
    <script>
        // Minimalist chart
        $(function() {
            $('.min-chart#chart-sales').easyPieChart({
                barColor: "#4caf50",
                onStep: function(from, to, percent) {
                    $(this.el).find('.percent').text(Math.round(percent));
                }
            });
        });

        // Main chart
        var ctxL = document.getElementById("lineChart").getContext('2d');
        var myLineChart = new Chart(ctxL, {
            type: 'line',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July"],
                datasets: [{
                    label: "Deutsche Bahn Sales over Month",
                    fillColor: "#fff",
                    backgroundColor: 'rgba(255, 255, 255, .3)',
                    borderColor: 'rgba(255, 99, 132)',
                    data: [13000000, 8000000, 16000000, 24000000, 7000000, 50000000, 40000000],
                }]
            },
            options: {
                legend: {
                    labels: {
                        fontColor: "#fff",
                    }
                },
                scales: {
                    xAxes: [{
                        gridLines: {
                            display: true,
                            color: "rgba(255,255,255,.25)"
                        },
                        ticks: {
                            fontColor: "#fff",
                        },
                    }],
                    yAxes: [{
                        display: true,
                        gridLines: {
                            display: true,
                            color: "rgba(255,255,255,.25)"
                        },
                        ticks: {
                            fontColor: "#fff",
                        },
                    }],
                }
            }
        });
    </script>


    <script>
        var dater = new Date();
        $(document).ready(function() {
            
            $('#gettime').append(dater);
        });
        
    </script>

</body>

</html>