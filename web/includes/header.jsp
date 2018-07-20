<%-- 
    Document   : header
    Created on : Jun 21, 2018, 7:08:25 AM
    Author     : X453SA
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top black-text bg-faded scrolling-navbar">
        <div class="container"> <a class="navbar-brand" href="index.jsp"><img src="source/image/30%20dblogo.png" height="30" alt="" class="d-inline-block align-top"> Deutsche Bahn </a> <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-7" aria-controls="navbarSupportedContent-7" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent-7">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active"> <a class="nav-link" href="index.jsp">Home<span class="sr-only">(current)</span> </a> </li>
                    <li class="nav-item"> <a class="nav-link" href="features.jsp">Facilities</a> </li>
                    <li class="nav-item"> <a class="nav-link" href="index.jsp#searchtik">Book Ticket</a> </li>
                    <li class="nav-item"> <a class="nav-link" href="contact-us.jsp">Contact Us</a> </li>
                </ul>
                 <c:choose>
                    <c:when test="${sessionScope.username != null}">
                        <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#loggedmodal"><i class="fa fa-user"></i> ${sessionScope.username}</button>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center">
                            <a href="" class="btn btn-danger btn-rounded" data-toggle="modal" data-target="#elegantModalForm">Sign In</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
</nav>
