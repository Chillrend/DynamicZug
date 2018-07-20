<%-- 
    Document   : header
    Created on : Jun 6, 2018, 6:45:46 PM
    Author     : X453SA
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top scrolling-navbar black-text">
        <div class="container">
            <a class="navbar-brand" href="index.html"><img src="source/image/30%20dblogo.png" height="30" alt="" class="d-inline-block align-top"> Deutsche Bahn </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-7" aria-controls="navbarSupportedContent-7" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent-7">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.html">Home<span class="sr-only">(current)</span> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="features.html">Facilities</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#searchtik">Book Ticket</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact-us.html">Contact-us</a>
                    </li>
                    <c:choose>
                    <c:when test="${sessionScope.role == 'admin'}">
                       <li class="nav-item">
                        <a class="nav-link" href="crud.jsp">Backend Crud</a>
                    </li>                    
                    </c:when>
                    <c:otherwise>
                        
                    </c:otherwise>
                </c:choose>
            
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
 </nav>
