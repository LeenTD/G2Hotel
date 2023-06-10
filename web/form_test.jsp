<%-- 
    Document   : form_book_room
    Created on : Jun 8, 2023, 1:13:09 AM
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
        <style>
            body {
                font-family: Arial, sans-serif;
            }

            form {
                width: 300px;
                margin: 0 auto;
            }

            label {
                display: inline-block;
                width: 100px;
                text-align: right;
            }

            input[type="submit"] {
                margin-left: 100px;
            }

            h1 {
                text-align: center;
            }

        </style>

    </head>
    <body>
        <%@include file="/includes/header.jsp" %>
        <!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Booking Room</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">About</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->
        <br>

        <form action="bookingRoom" id="bookingForm" class="col-md-9 m-auto" method="get" role="form">
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Name:</label>  
                    <input type="hidden" class="form-control mt-1" id="IDRoomType" name="IDRoomType" value="${r.getIDRoomType()}">
                    <input type="hidden" class="form-control mt-1" id="IDAccount" name="IDAccount" value="${userA.getIDAccount()}">
                    <input type="text" class="form-control mt-1" id="FullName" name="FullName" placeholder="Name" required value="${userA.getFullName()}">
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Gender:</label>
                    <input type="text" class="form-control mt-1" id="Gender" name="Gender" placeholder="Gender" required value="${userA.getGender()}">
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Phone:</label>
                    <input type="text" class="form-control mt-1" id="Phone" name="Phone" placeholder="Phone" required value="${userA.getPhone()}">
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Email:</label>
                    <input type="text" class="form-control mt-1" id="Email" name="Email" placeholder="Email" required value="${userA.getEmail()}">
                </div>
            </div>
                <p>-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</p>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="inputname">Room Type:</label> 
                    <label for="inputname"> ${r.getNameRoomType()}</label>
                    <input type="hidden" id="NameRoomType" name="NameRoomType" required value="${r.getNameRoomType()}">
                </div>   
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Price:</label>
                    <label for="inputname"> ${r.getPrice()}$/Night</label>
                    <input type="hidden" id="Price" name="Price" placeholder="Price" required value="${r.getPrice()}">
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-6">
                    <label for="inputname">Adult:</label>
                    <input type="text" class="form-control mt-1" id="Adult" name="Adult" placeholder="Adult" required value="">
                </div>                    
                <div class="form-group col-md-6 mb-3">
                    <label for="inputname">Child:</label>
                    <input type="text" class="form-control mt-1" id="Child" name="Child" placeholder="Child" required value="">
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-6">
                    <label for="checkInDate">Check-In:</label><br>
                    <input type="date" id="checkInDate" name="checkInDate" required><br>
                </div>                    
                <div class="form-group col-md-6 mb-3">
                    <label for="checkOutDate">Check-Out:</label><br>
                    <input type="date" id="checkOutDate" name="checkOutDate" required><br>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-6">
                    <label for="numRooms">Quantity:</label> <br>
                    <input type="number" id="numRooms" name="numRooms" min="1" value="1" required><br><br>
                </div> 
                <div class="col text-end mt-2">
                    <button type="submit" class="btn btn-success btn-lg px-3">Book Now</button>
                </div>
            </div>

        </form>

        <br>



        <%@include file="/includes/footer.jsp" %>        
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <!--<script src="js/booking.js"></script>-->

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
