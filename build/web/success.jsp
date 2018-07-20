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
            <script type="text/javascript">
                $(document).ready(function () {
                     // Handler for .ready() called.
                    window.setTimeout(function () {
                        window.location.href = "index.jsp";
                    }, 3000);
                });
            </script>
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
                        <h1 style="font-size: 4rem;">Success!</h1>
                        <h4>${requestScope.message}</h4>
                        <h4>You will be redirected into home page automatically, if not, please <a href="index.jsp">click here</a></h4>
                    </div>
                </div>
            
            <%@include file="includes/footer.jsp" %>
            <%@include file="includes/loginmodal.jsp" %>
            <%@include file="includes/scriptimport.jsp" %>

        </body>

        </html>