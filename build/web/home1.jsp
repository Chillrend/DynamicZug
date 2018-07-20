<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script language="javascript">


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
	
	
	var v = "<input type='text' value='"+uname+"' id='"+username+"'>";
	console.log(v);
        document.getElementById(username).innerHTML = "<div class='md-form'><input type='text' value='"+uname+"' id='"+username2+"'></div>";
	document.getElementById(pass).innerHTML = "<div class='md-form'><input type='text' value='"+pw+"' id='"+pass2+"'></div>";
	document.getElementById(role).innerHTML = "<div class='md-form'><input type='text' value='"+rolez+"' id='"+role2+"'></div>";
	document.getElementById(newName).innerHTML = "<div class='md-form'><input type='text' value='"+name+"' id='"+newName2+"'></div>";
        document.getElementById(ident).innerHTML = "<div class='md-form'><input type='text' value='"+idfier+"' id='"+ident2+"'></div>";    	   
        document.getElementById(username).focus();
	document.getElementById(button).disabled = true;
}


function saveData(id){
	
	var xmlhttp1;
	
        var username1 = id+"USERNAME";
        var pass1 = id+"PASSWORD";
        var role1 = id+"ROLE";
        var newName1 = id+"NAME";
	var ident1 = id+"IDENT";
	
        var uname1 = document.getElementById(username1).value;
	var pw1 = document.getElementById(pass1).value;
	var rolez1 = document.getElementById(role1).value;
	var name1 = document.getElementById(newName1).value;
        var idfier1 = document.getElementById(ident1).value;
	
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
	
    xmlhttp1.open("GET","UpdateUser?id="+id+"&username="+uname1+"&password="+pw1+"&role="+rolez1+"&name="+name1+"&ident="+idfier1,true);
    xmlhttp1.send(null);
    $('#crudtable').fadeOut('slow');

        var cn = 1;
        setTimeout(
            function() 
                  {
               var n =
               $.post("DisplayUser",function (data){
                  $("#crudtable").html(data);
                  $('#crudtable').fadeIn('slow');

               });
                    }, 2000); 

//        window.location.href = "UpdateUser?id="+id+"&username="+uname1+"&password="+pw1+"&role="+rolez1+"&name="+name1+"&ident="+idfier1;

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
	 $('#crudtable').fadeOut('slow');

        var cn = 1;
        setTimeout(
            function() 
                  {
               var n =
               $.post("DisplayUser",function (data){
                  $("#crudtable").html(data);
                  $('#crudtable').fadeIn('slow');

               });
                    }, 2000); 	
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
	
	xmlhttp2.open("GET","http://localhost:8080/DynamicZug/DisplayUsera",true);
	xmlhttp2.send(null);
	
	xmlhttp2.onreadystatechange = function()
	{
		if(xmlhttp2.readyState==4 && xmlhttp2.status==200){
			document.getElementById("myDiv").innerHTML = xmlhttp2.responseText;
		}
	}
	
	
}



</script>

</head>
<body>
            <!--Section: Modals-->
            <section>

                <!--Modal: modalConfirmDelete-->
                <div class="modal fade" id="modalConfirmDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-sm modal-notify modal-danger" role="document">
                        <!--Content-->
                        <div class="modal-content text-center">
                            <!--Header-->
                            <div class="modal-header d-flex justify-content-center">
                                <p class="heading">Are you sure?</p>
                            </div>

                            <!--Body-->
                            <div class="modal-body">

                                <i class="fa fa-times fa-4x animated rotateIn"></i>

                            </div>

                            <!--Footer-->
                            <div class="modal-footer flex-center">
                                <a class="btn btn-outline-secondary-modal">Yes</a>
                                <a type="button" class="btn  btn-primary-modal waves-effect" data-dismiss="modal">No</a>
                            </div>
                        </div>
                        <!--/.Content-->
                    </div>
                </div>
                <!--Modal: modalConfirmDelete-->

            </section>
            <!--Section: Modals-->

	<div id="myDiv">
            

		<form name="form11">
		<table class="table">
                    
                                                        <thead>
                                    <tr>
				<td colspan="6" align="left"><a class="btn btn-danger btn-sm" data-toggle="modal" data-target="#recordmodal">add new user</a>
</td>
</tr>

                                                            <tr>    
                                        <th class="th-sm">id</th>
                                        <th class="th-sm">username</th>
                                        <th class="th-sm">password</th>
                                        <th class="th-sm">role</th>
                                        <th class="th-md">name</th>
                                        <th class="th-md">identifier</th>
                                        <th class="th-md">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
			<%
                             int counter = 0;
				List Li = new ArrayList();
				Iterator lr;

				if (request.getAttribute("userList") != null && request.getAttribute("userList") != "") {
					List userList = (ArrayList) request.getAttribute("userList");
					Iterator itr = userList.iterator();
                                       
					while (itr.hasNext()) {
						Li = (ArrayList) itr.next();
						lr = Li.iterator();
						Integer id = (Integer) lr.next();
						String username = (String) lr.next();
						String password = (String) lr.next();
						String role = (String) lr.next();
                                                String name = (String) lr.next();
                                                String ident = (String) lr.next();
                                                counter++;
                        %> 
			 
			<tr>
				<td id="<%=id%>"onclick="editData(<%=id%>);"><%=id%>
                                </td>
				<td id="<%=id%>username"><%=username%></td>
				<td id="<%=id%>password"><%=password%></td>
				<td id="<%=id%>role"><%=role%></td>
                                <td id="<%=id%>name"><%=name%></td>
                                <td id="<%=id%>ident"><%=ident%></td>
                                <td>                    <button type="button" class="btn btn-outline-black btn-rounded btn-sm px-2" onclick="saveData(<%=id%>);">
                                <i class="fa fa-save mt-0"></i>
                            </button>
                            <button type="button" class="btn btn-outline-black btn-rounded btn-sm px-2" onclick="deleteData(<%=id%>);">
                                <i class="fa fa-remove mt-0"></i>
                            </button>
                        </tr>


			<%
				}
				}
			%>
                                </tbody>
                </table>
		<div class="modal fade" id="recordmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Add new User</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-3">
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <span>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; user id</span>
                    <input type="text" id="userid" name="userid" class="form-control validate" value="<%out.print(counter+1);%>" readonly>
                </div>
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="username" name="username" class="form-control validate">
                    <label data-error="wrong" data-success="right" for="username">username</label>
                </div>
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="email" id="emaile" name="email" class="form-control validate">
                    <label data-error="wrong" data-success="right" for="emaile">email</label>
                </div>
                <div class="md-form">
                    <i class="fa fa-lock prefix grey-text"></i>
                    <input type="password" id="password" name="password" class="form-control validate">
                    <label data-error="wrong" data-success="right" for="password">Your password</label>
                </div>
                <div class="md-form">
                    
                    <select class="mdb-select" id="role" name="role">
                    <option value="User" selected>User</option>
                    <option value="Admin">Admin</option>
</select>
<label for="role">Role</label>
                    
                </div>
                <div class="md-form">
                    <select class="mdb-select" id="gender" name="gender">
                    <option value="Male" selected>Male</option>
                    <option value="Female">Female</option>
</select>
<label for="gender">gender</label>
                    
                </div>
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="name" name="name" class="form-control validate">
                    <label data-error="wrong" data-success="right" for="name">Name</label>
                </div>
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="identifier" name="identifier" class="form-control validate">
                    <label data-error="wrong" data-success="right" for="identifier">Identifier</label>
                </div>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <a class="btn btn-deep-orange" id="addnewrecord">Add Record</a>
            </div>
        </div>
    </div>
</div>

                                <input type="hidden" name="hdnText">
		</form>
	</div>
                
</body>
            <script>
$(document).ready(function() {
   $('.mdb-select').material_select();
 });
            $("#addnewrecord").click(function(){
                
                    var gethtreq;
	if(window.XMLHttpRequest){
		gethtreq = new XMLHttpRequest();
	}
	else{
		gethtreq = new ActiveXobject("Microsoft.XMLHTTP");
	}

                    var uf = $("#userid").val();
                    var ua = $("#username").val();
                    var ub = $("#password").val();
                    var uc = $("#role").val();
                    var ud = $("#gender").val();
                    var ue = $("#name").val();
                    var ug = $("#identifier").val();
                    var uh = $("#emaile").val();
                    if(ua !== "" && ub !== "" && uh !== "" && ug !== "" && ue !== ""){
                        toastr["info"]("Record : " + uf + " added");
               var n = 
               $.post("operations/addrecord.jsp",{userid:uf,username:ua,password:ub,role:uc,gender:ud,name:ue,identifier:ug,email:uh},function (data){
                $("#crudtable").html(data); 
                $('#crudtable').fadeOut('slow');
                $('#crudtable').fadeIn('slow');
                 setTimeout(
                  function() 
                  {
                     location.reload();
                  }, 0001); 
               });
//	gethtreq.open("GET", "operations/addrecord.asp?userid="+uf+"&username="+ua+"&password="+ub+"&role="+uc+"&gender="+ud+"&name="+ue+"&identifier="+ug+"&email="+uh, true);
//    	gethtreq.send(null);
// 
//               var n = 
//               $.post("DisplayUser",function (data){
//                  $("#crudtable").html(data); 
//               });
        }

else{
   toastr["info"]("please fill out information"); 
}

            });
        $(document).ready(function() {
        $('#awel').fadeout('slow');
        });
        </script>
</html>