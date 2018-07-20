<%-- 
    Document   : loginmodal
    Created on : Jun 6, 2018, 7:03:15 PM
    Author     : X453SA
--%>
<!-- Modal -->
<div class="modal fade" id="elegantModalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <!--Content-->
        <div class="modal-content form-elegant">
            <!--Header-->
            <div class="modal-header text-center">
                <h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel"><strong>Sign in</strong></h3>
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
                                    <form action="imagedisplay" method="get">
                                        <img src="imagedisplay?username=${sessionScope.username}" class="rounded-circle">
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">${sessionScope.username}</h4>
                                    <hr>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, adipisci
                                        <div class="text-center">
                                            <button class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-window-close"></i> Close</button>
                                            <button class="btn btn-danger btn-sm" id="logout"><i class="fa fa-sign-out"></i> Logout</button>
                                            <a href="profile.jsp"><button class="btn btn-danger btn-sm" id="profile"><i class="fa fa-user"></i> Profile</button></a>
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
<!-- Card -->