<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
                 <c:choose>
                    <c:when test="${sessionScope.role == 'admin'}">
                    
                    </c:when>
                    <c:otherwise>
                     <meta http-equiv="refresh" content="0; url=http://192.168.43.7:8080/DynamicZug/index.jsp" />
                    </c:otherwise>
                </c:choose>    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>${sessionScope.role}</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="source/css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="source/css/crudstyle.css" rel="stylesheet">
</head>
<script>


function editData(id)
{      
        var username = id+"username";
        var pass = id+"password";
        var role = id+"role";
        var newName = id+"name";
	var ident = id+"ident";
	var button = id+"button";
	
        var uname = document.getElementById(username).textContent;
	var pw = document.getElementById(pass).textContent;
	var rolez = document.getElementById(role).textContent;
	var name = document.getElementById(newName).textContent;
        var idfier = document.getElementById(ident).textContent;
        
        var username2 = id+"USERNAME";
        var pass2 = id+"PASSWORD";
        var role2 = id+"ROLE";
        var newName2 = id+"NAME";
	var ident2 = id+"IDENT";	
	console.log(name);
	
	
	var v = "<input type='text' value='"+name+"' id='"+newName+"'>";
	console.log(v);
        document.getElementById(uname).innerHTML = "<input type='text' value='"+uname+"' id='"+username2+"'>";
	document.getElementById(pass).innerHTML = "<input type='text' value='"+pw+"' id='"+pass2+"'>";
	document.getElementById(role).innerHTML = "<input type='text' value='"+rolez+"' id='"+role2+"'>";
	document.getElementById(newName).innerHTML = "<input type='text' value='"+name+"' id='"+newName2+"'>";
        document.getElementById(ident).innerHTML = "<input type='text' value='"+idfier+"' id='"+ident2+"'>";    	   

	document.getElementById(button).disabled = true;
}


function saveData(id){
	
	var xmlhttp1;
	
        var username1 = id+"username";
        var pass1 = id+"password";
        var role1 = id+"role";
        var newName1 = id+"name";
	var ident1 = id+"ident";
	
        var uname1 = document.getElementById(username1).textContent;
	var pw1 = document.getElementById(pass1).textContent;
	var rolez1 = document.getElementById(role1).textContent;
	var name1 = document.getElementById(newName1).textContent;
        var idfier1 = document.getElementById(ident1).textContent;
	
	//console.log(name1);
	//console.log(department1);
	//console.log(password1);
	//var url = "http://localhost:8080/First/UpdateData1?id="+id+"&name="+name1+"&department="+department1+"&password="+password1;
	//console.log(url);
	
	if(window.XMLHttpRequest){
		xmlhttp1 = new XMLHttpRequest();
	}
	else{
		xmlhttp1 = new ActiveXobject("Microsoft.XMLHTTP");
	}
	
    xmlhttp1.open("GET","http://localhost:8080/DynamicZug/UpdateUser?id="+id+"&username="+uname1+"&password="+pw1+"&role="+rolez1+"&name="+name1+"&ident="+idfier1,true);
	xmlhttp1.send(null);

}


function deleteData(id){
	var xmlhttp;
	if(window.XMLHttpRequest){
		xmlhttp = new XMLHttpRequest();
	}
	else{
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.open("GET","http://localhost:8080/DynamicZug/deleteUser?id="+id+"&format=fragment",true);
	xmlhttp.send(null);
	
	xmlhttp.onreadystatechange = function()
	{
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
		}
	}
	
	
}


function showData(){
	var xmlhttp2;
	if(window.XMLHttpRequest){
		xmlhttp2 = new XMLHttpRequest();
	}
	else{
		xmlhttp2 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp2.open("GET","http://localhost:8080/First/Display4",true);
	xmlhttp2.send(null);
	
	xmlhttp2.onreadystatechange = function()
	{
		if(xmlhttp2.readyState==4 && xmlhttp2.status==200){
			document.getElementById("myDiv").innerHTML = xmlhttp2.responseText;
		}
	}
	
	
}




    </script>
<body class="fixed-sn light-blue-skin">
<!-- Sidebar navigation -->
<div id="slide-out" class="side-nav fixed">
  <ul class="custom-scrollbar">
      <!-- Logo -->
      <li>
          <br><br>
      <center><h3>/b/ Backend</h3></center>
      </li>
      <!--/. Logo -->
      <!--Social-->
      <!--/Social-->
      <!--Search Form-->
      <li>
          <form class="search-form" role="search">
              <div class="form-group md-form mt-0 pt-1 waves-light">
                  <input type="text" class="form-control" placeholder="Search">
              </div>
          </form>
      </li>
      <!--/.Search Form-->
      <!-- Side navigation links -->
      <li><a class="collapsible-header waves-effect arrow-r" id="usr"><i class="fa fa-chevron-right"></i> User Table</a></li>
       <li><a class="collapsible-header waves-effect arrow-r" id="inv"><i class="fa fa-chevron-right"></i> Invoice Table</a>
   <!--/. Side navigation links -->
  </ul>
  <div class="sidenav-bg rgba-blue-strong"></div>
</div>
<!--/. Sidebar navigation -->
    <!--Main Navigation-->
    <header>

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
                        <a class="nav-link" data-toggle="modal" data-target="#loggedmodal">
                               
                                    <span class="clearfix d-none d-sm-inline-block">${sessionScope.username}</span>
                                </a>
                    </li>
                </ul>
            </div>

            <!-- Breadcrumb-->


            <!-- Links -->
            <ul class="nav navbar-nav nav-flex-icons ml-auto">
                <li class="nav-item">
                    <a class="nav-link">
                       
                        <span class="clearfix d-none d-sm-inline-block">Privileges : ${sessionScope.role} </span>
                    </a>
                </li>
     <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#loggedmodal"><i class="fa fa-user"></i> ${sessionScope.username}</button>


            </ul>

        </nav>
        <!--/.Navbar-->
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
 
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/trendb", "akar", "akarpohon");
	Statement statement = connection.createStatement();
	String xVal, yVal;
	
	ResultSet resultSet = statement.executeQuery("select * from sales");
	
	while(resultSet.next()){
		xVal = resultSet.getString("sales_qty");
		yVal = resultSet.getString("sales_price");
		map = new HashMap<Object,Object>(); map.put("sales_qty", Double.parseDouble(xVal)); map.put("sales_price", Double.parseDouble(yVal)); list.add(map);
		dataPoints = gsonObj.toJson(list);
	}
	connection.close();
}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints = null;
}
%>

<script>
window.onload = function() { 
 
<% if(dataPoints != null) { %>
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "JSP Column Chart from Database"
	},
	data: [{
		type: "column", //change type to bar, line, area, pie, etc
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
<% } %> 
 
}
</script>
    </header>
    <!--Main Navigation-->

    <!--Main layout-->
    <main>
        <div class="container-fluid">


            <!--Section: Main panel-->
            <!--Section: Main panel-->

            <!--Section: Table-->
            <section class="mb-5">

                <!--Top Table UI-->
                <div class="card p-2 mb-5">

                    <!--Grid row-->
                    
                        <!--Grid column-->

                        <!--Grid column-->
                        <!--Grid column-->

                        <!--Grid column-->

                        <!--Grid column-->

                    </div>
                    <!--Grid row-->

                </div>
                <!--Top Table UI-->

                <!--Card-->
                <div class="card card-cascade narrower">

                    <!--Card header-->
                    <div class="view py-3 gradient-card-header info-color-dark mx-4 d-flex justify-content-between align-items-center">

                        <div>
                            <button type="button" data-activates="slide-out" class="btn btn-outline-white btn-rounded btn-sm px-2 button-collapse">
                                <i class="fa fa-th-large mt-0"></i>
                            </button>
                            <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                                <i class="fa fa-columns mt-0"></i>
                            </button>
                        </div>

                        <a href="" class="white-text mx-3">User Table</a>

                        <div>
        
                            <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                                <i class="fa fa-info-circle mt-0"></i>
                            </button>
                        </div>

                    </div>
                    <!--/Card header-->

                    <!--Card content-->
                    <div class="card-body">

                        <div class="table-responsive" id="crudtable">



                        </div>
                            
                        <hr class="my-0">

                        <!--Bottom Table UI-->
                        <div class="d-flex justify-content-between">

                            <!--Name-->
<!--                            <select class="mdb-select colorful-select dropdown-primary mt-2 hidden-md-down">
                                <option value="" disabled>Rows number</option>
                                <option value="1" selected>10 rows</option>
                                <option value="2">25 rows</option>
                                <option value="3">50 rows</option>
                                <option value="4">100 rows</option>
                            </select>-->

           
                        </div>
                        <!--Bottom Table UI-->

                    </div>
                    <!--/.Card content-->

                </div>
                <!--/.Card-->

            </section>
            <!--Section: Table-->

            <!--Section: Accordion-->
          
    </main>
    <!--Main layout-->

    <!--Footer-->

    <!--/.Footer-->

    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="source/js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="source/js/mdb.min.js"></script>

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
        var dater = new Date();
        $(document).ready(function() {
            
            $('#gettime').append(dater);
            // SideNav Button Initialization
$(".button-collapse").sideNav();
// SideNav Scrollbar Initialization
var sideNavScrollbar = document.querySelector('.custom-scrollbar');
Ps.initialize(sideNavScrollbar);
        });
        
    </script>
                <script>

        $(document).ready(function() {
               var n = 
               $.post("DisplayUser",function (data){
                  $("#crudtable").html(data); 
                  $("#crudtable").fadeIn('slow'); 
               });
            });
        </script>
<div class="modal fade" id="loggedmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="container">
                <div>
                    <div class="row">    
                        <div class="">
                            <div class="card testimonial-card">
                                <div class="card-up red lighten-1">
                                </div>
                                <div class="avatar mx-auto white">
                                    <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20%2810%29.jpg" class="rounded-circle">
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">${sessionScope.username}</h4>
                                    <hr>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, adipisci
                                        <div class="text-center">
                                            <button class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-window-close"></i> Close</button>
                                            <button class="btn btn-danger btn-sm" id="logout"><i class="fa fa-sign-out"></i> Logout</button>
                                            <button class="btn btn-danger btn-sm" id="logout"><i class="fa fa-user"></i> Profile</button>
                                        </div>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    
            </div>
        </div>
    </div>
</div>
        <%@include file="includes/scriptimport.jsp" %>
</body>

</html>