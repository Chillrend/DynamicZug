<!DOCTYPE html>
<html lang="en" class="full-height">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/dbimport.jsp" %>
<head>
    <%
String _tktid=request.getParameter("tktid");
String _htm=request.getParameter("htm");
    %>
    <meta charset="UTF-8">
    <title><%out.print(_tktid + _htm);%></title>
    <link rel="stylesheet" href="source/css/index.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link rel="stylesheet" href="source/css/mdb.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>

     <%@include file="includes/dbconnect.jsp" %>
    <!-- Main navigation -->
    <header>
        <!--Navbar-->
     <%@include file="includes/headerindex.jsp" %>
        <div class="row mt-5"></div>
        <div class="row mt-5"></div>
   <c:choose>
                    <c:when test="${sessionScope.username != null}">
                          <%@include file="includes/bookuname.jsp" %> 
                    </c:when>
                    <c:otherwise>
     <%@include file="includes/booknotuname.jsp" %>
                    </c:otherwise>
                </c:choose>
        <!-- Content -->
        </div>
        <!-- </div> -->
        <!-- </div> -->
    </header>
         <%@include file="includes/loginmodal.jsp" %>
    <!-- Main navigation -->
    <!--Main Navigation-->
    <!--Main Layout-->
    <!-- Modal: modalCart -->
      <div class="modal fade" id="modalCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <!--Header-->
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Your Due</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">Ã</span>
                </button>
                </div>
                <!--Body-->
                <div class="modal-body">

                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Ticket ID</th>
                                <th>Passenger</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody class="yo" id="cekotlist">
         <c:forEach var = "row" items = "${result.rows}">
             <tr>
                 <td>${param.tktid}</td>
                 <td>${param.htm}</td>
                 <td>${param.htm * row.price}</td>
             </tr>
         </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--Footer-->
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal" onclick='removecekot()'>Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal: modalCart -->
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
                                <p class="font-small white-text d-flex justify-content-end"> Don't Have an account? <a href="#" class="red-text ml-1 font-weight-bold"> Sign Up</a></p>
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


    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="source/js/mdb.min.js" type="text/javascript"></script>
    <!-- Bootstrap core JavaScript -->
    <script src="source/js/main.js"></script>
    <script>
        var konterseleksien;
        $('#titel').addClass('animated fadeInUp');
        $('#titel').one('webkitAnimationEnd animationend', $('#shit').addClass('animated fadeInUp'));
        $('#shit').one('webkitAnimationEnd animationend', $('#step-1').addClass('animated fadeInUp'));
        $('#step-1').one('webkitAnimationEnd animationend', $('#step-2').addClass('animated fadeInRight'));
        $('#step-2').one('webkitAnimationEnd animationend', $('#step-3').addClass('animated fadeInRight'));
        $('#step-3').one('webkitAnimationEnd animationend', $('#step-4').addClass('animated fadeInRight'));
        // Tooltips Initialization
        $(function() {
            $('[data-toggle="tooltip"]').tooltip()
        })
        // Steppers                
        $(document).ready(function() {
            var navListItems = $('div.reserve div a'),
                allWells = $('.shitbrix'),
                allNextBtn = $('.lanjut'),
                allPrevBtn = $('.balik');

            allWells.hide();

            navListItems.click(function(e) {
                e.preventDefault();
                var $target = $($(this).attr('href')),
                    $item = $(this);

                if (!$item.hasClass('disabled')) {
                    navListItems.removeClass('btn-amber').addClass('btn-blue-grey');
                    $item.addClass('btn-amber');
                    allWells.hide();
                    $target.show();
                    $target.find('input:eq(0)').focus();
                }

            });



            allPrevBtn.click(function() {
                var curStep = $(this).closest(".shitbrix"),
                    curStepBtn = curStep.attr("id"),
                    yombreng = $('div.reserve div a[href="#' + curStepBtn + '"]'),
                    shitext = $('#shit'),
                    prevStepSteps = $('div.reserve div a[href="#' + curStepBtn + '"]').parent().prev().children("a");
                switch (curStepBtn) {
                    case 'step-2':
                        shitext.fadeToggle();
                        shitext.fadeIn();
                        shitext.text("Do you have an Account?");
                        yombreng.removeClass("active");
                        break;
                    case 'step-3':
                        shitext.fadeToggle();
                        shitext.fadeIn();
                        shitext.text("Ticket Selection");
                        yombreng.removeClass("active");
                        break;
                    case 'step-4':
                        shitext.text("Personal Information");
                        yombreng.removeClass("active");
                        break;

                }
                prevStepSteps.removeAttr('disabled').trigger('click');
            });

            allNextBtn.click(function() {
                var curStep = $(this).closest(".shitbrix"),
                    curStepBtn = curStep.attr("id"),
                    shitext = $('#shit'),
                    regex = /^[a-zA-Z]*$/,
                    numgex = /^\d+$/,
                    checkboxs=document.getElementsByName("ckboxtrain"),
                    texsht=document.getElementsByName("nama1"),
                    yombreng = $('div.reserve div a[href="#' + curStepBtn + '"]'),
                    nextStepSteps = $('div.reserve div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
                    curInputs = curStep.find("input[type='text'],input[type='url']"),
                    isValid = true;
                
                switch (curStepBtn) {
                    case 'step-1':
                        konterseleksien = 'noticket';
                        shitext.fadeToggle();
                        shitext.fadeIn();
                        shitext.text("Ticket Selection");
                        break;
                    case 'step-2':
                        konterseleksien = 'ticket';
                        break;
                    case 'step-3':
                        shitext.text("Checkout");
                        yombreng.addClass("active");
                        break;


                }

                $(".form-group").removeClass("has-error");
                for (var i = 0; i < curInputs.length; i++) {
                    if (!curInputs[i].validity.valid) {
                        isValid = false;
                        $(curInputs[i]).closest(".form-group").addClass("has-error");
                    }
                }
if(konterseleksien == 'ticket'){ 
        var we=1;
    for(var i=0,l=checkboxs.length;i<l;i++)
        {
        if(!texsht === "")
            {
            isValid=true;
                shitext.fadeToggle();
                shitext.fadeIn();
                shitext.text("Personal Information");
                yombreng.addClass("active");
            break;
            }
        else    {
            isValid=false;

        }
        }
    if(isValid){}
    else alert("Please check a checkbox");
    }



                
                if (isValid)
                    nextStepSteps.removeAttr('disabled').trigger('click');
            });
            $('div.reserve div a.btn-amber').trigger('click');
        });
        
        
    </script>
    <script>
//    function submitForm() { // submits form
//        document.getElementById("payment").submit();
//    }
//    function letsgo()
//    {
//        if (document.getElementById("payment")) {
//            setTimeout("submitForm()", 30000); // set timout 
//       }
//    }

        </script>
</body>

</html>