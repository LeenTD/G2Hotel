<%-- 
    Document   : form_payment
    Created on : Jun 8, 2023, 9:20:49 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="image/favicon.png" type="image/png">
        <title>G2 Hotel</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="vendors/linericon/style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" type="text/css" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" type="text/css" href="vendors/owl-carousel/owl.carousel.min.css">
        <!-- main css -->
        <link rel="stylesheet" href="css/room_bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">

    </head>
    <body>
        <%@include file="/includes/header.jsp" %>
        <!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Payment</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">About</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->
        <br>

        <h1 style="text-align: center;">Payment Room</h1>

        <form action="#" class="col-md-9 m-auto" method="get" role="form">
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Name: </label>   
                    <label for="inputname" >${userA.getFullName()}</label>  
                    <input type="hidden" class="form-control mt-1" id="IDRoomType" name="IDRoomType" value="${sessionScope.booking.getIDRoomType()}">
                    <input type="hidden" class="form-control mt-1" id="IDAccount" name="IDAccount" value="${userA.getIDAccount()}">
                    <!--<input type="hidden" class="form-control mt-1" id="" name="FullName" placeholder="FullName" required value="${userA.getFullName()}">-->

                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Gender: </label>
                    <label for="inputname" >${userA.getGender()}</label>

                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Phone: </label>
                    <label for="inputname" >0${userA.getPhone()}</label>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Email: </label>                   
                    <label for="inputname" >${userA.getEmail()}</label>

                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="inputname">Name Room Type :</label> 
                    <label for="inputname" > ${sessionScope.booking.getNote()}</label>
                </div>   
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Total Price: </label>
                    <label for="inputname" > ${sessionScope.booking.totalPrice}</label>
                    <input type="hidden" class="form-control mt-1" id="Price" name="Price" value="${sessionScope.booking.totalPrice}">

                </div>
            </div>


            <div class="row">
                <div class="form-group col-md-6">
                    <label for="inputname">Adult: </label>  
                    <label for="inputname" >${sessionScope.booking.getAdult()}</label>
                    <input type="hidden" class="form-control mt-1" id="Adult" name="Adult"  value="${sessionScope.booking.getAdult()}">

                </div>                    
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Child: </label>
                    <label for="inputname">${sessionScope.booking.getChild()}</label>
                    <input type="hidden" class="form-control mt-1" id="Child" name="Child"  value="${sessionScope.booking.getChild()}">

                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-6">
                    <label for="inputname">Check In: </label>  
                    <label for="inputname">${sessionScope.booking.getCheckIn()}</label>  

                    <input type="hidden" class="form-control mt-1" id="CheckIn" name="CheckIn" value="${booking.getCheckIn()}">
                </div>                    
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Check Out: </label>
                    <label for="inputname">${sessionScope.booking.getCheckOut()}</label>
                    <input type="hidden" class="form-control mt-1" id="CheckOut" name="CheckOut"  value="${sessionScope.booking.getCheckOut()}">

                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Number Of Room Booking: </label> 
                    <label for="inputname" >${booking.getNumberOfRooms()}</label>
                    <input type="hidden" class="form-control mt-1" id="NumberOfRooms" name="NumberOfRooms"  value="${booking.getNumberOfRooms()}">
                    <input type="hidden" class="form-control mt-1" id="bookingTime" name="bookingTime"  value="${booking.getBookingTime()}">

                </div>
                <div class="col text-end mt-2">
                    <button type="submit" class="btn btn-success btn-lg px-3">Payment</button>
                </div>
            </div>
        </form>
        <br>



        <%@include file="/includes/footer.jsp" %>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/mail-script.js"></script>
        <script src="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js"></script>
        <script src="vendors/nice-select/js/jquery.nice-select.js"></script>
        <script src="js/mail-script.js"></script>
        <script src="js/stellar.js"></script>
        <script src="vendors/lightbox/simpleLightbox.min.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
