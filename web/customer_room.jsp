<%-- 
    Document   : accomodation
    Created on : May 30, 2023, 12:28:44 AM
    Author     : TuaSan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="image/favicon.png" type="image/png">
        <title>G2 Hotel</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <!-- main css -->
        <link rel="stylesheet" href="css/room_bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>
    <body>
        <%@include file="/includes/header.jsp" %>

        <!--================Breadcrumb Area =================-->
        <section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Room</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Accomodation</li>
                    </ol>
                </div>
            </div>
        </section>
        <!--================Breadcrumb Area =================-->

        <h2 style="color: green; text-align: center;" >${booksuccess} </h2>
        
        <!--</div>-->        <!--================ Accomodation Area  =================-->
        <section class="accomodation_area section_gap">
            <div class="container">
                <div class="section_title text-center">
                    <h2 class="title_color">Normal ROOMS</h2>
                    <p>Celebrate in stylish ease in our guest accommodations, which offer generous indoor-outdoor areas to enjoy time with loved ones, calmed by fresh breezes and secluded in nature.</p>
                </div>
                <div class="row g-4">
                    <!--================Database (Khi nao co database thi dung)=================-->  
                    <c:forEach items="${sessionScope.listRoom}" var="r">

                        <div class="col-lg-4 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="room-item shadow rounded overflow-hidden">
                                <div class="position-relative">
                                    <img class="img-fluid" src="image/room-1.jpg" alt="">
                                    <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">${r.getPrice()}$/Night</small>
                                </div>
                                <div class="p-4 mt-2">
                                    <div class="d-flex justify-content-between mb-3">
                                        <h5 class="mb-0">${r.getNameRoomType()}</h5>
                                        <div class="ps-2">
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                            <small class="fa fa-star text-primary"></small>
                                        </div>
                                    </div>
                                    <div class="d-flex mb-3">
                                        <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>${r.getNumberOfBed()} Bed</small>
                                        <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>${r.getNumberOfBath()} Bath</small>
                                        <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                                    </div>
                                    <p class="text-body mb-3">${r.getContent()}</p>
                                    <div class="d-flex justify-content-between">
                                        <a class="btn btn-sm btn-primary rounded py-2 px-4" href="customer_services.jsp">View Details</a>
                                        <a class="btn btn-sm btn-dark rounded py-2 px-4" href="loadRoomToBook?IDRoomType=${r.getIDRoomType()}">Book Now</a>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </c:forEach>
                    <!--================Database =================-->
                </div>
            </div>
        </section>
        <!--================ Accomodation Area  =================-->

        <!--================Booking Tabel Area =================-->
        <section class="hotel_booking_area">
            <div class="container">
                <div class="row hotel_booking_table">
                    <div class="col-md-3">
                        <h2>Book<br> Your Room</h2>
                    </div>
                    <div class="col-md-9">
                        <div class="boking_table">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="book_tabel_item">
                                        <div class="form-group">
                                            <div class='input-group date' id='datetimepicker11'>
                                                <input type='text' class="form-control" placeholder="Arrival Date"/>
                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class='input-group date' id='datetimepicker1'>
                                                <input type='text' class="form-control" placeholder="Departure Date"/>
                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="book_tabel_item">
                                        <div class="input-group">
                                            <select class="wide">
                                                <option data-display="Adult">Adult</option>
                                                <option value="1">Old</option>
                                                <option value="2">Younger</option>
                                                <option value="3">Potato</option>
                                            </select>
                                        </div>
                                        <div class="input-group">
                                            <select class="wide">
                                                <option data-display="Child">Child</option>
                                                <option value="1">Child</option>
                                                <option value="2">Baby</option>
                                                <option value="3">Child</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="book_tabel_item">
                                        <div class="input-group">
                                            <select class="wide">
                                                <option data-display="Child">Number of Rooms</option>
                                                <option value="1">Room 01</option>
                                                <option value="2">Room 02</option>
                                                <option value="3">Room 03</option>
                                            </select>
                                        </div>
                                        <a class="book_now_btn button_hover" href="#">Book Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================Booking Tabel Area  =================-->
        <!--================ Accomodation Area  =================-->
        <section class="accomodation_area section_gap">
            <div class="container">
                <div class="section_title text-center">
                    <h2 class="title_color">Normal ROOMS</h2>
                    <p>Celebrate in stylish ease in our guest accommodations, which offer generous indoor-outdoor areas to enjoy time with loved ones, calmed by fresh breezes and secluded in nature.</p>
                </div>
                <div class="row g-4">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="room-item shadow rounded overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="image/room-1.jpg" alt="">
                                <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">$100/Night</small>
                            </div>
                            <div class="p-4 mt-2">
                                <div class="d-flex justify-content-between mb-3">
                                    <h5 class="mb-0">Double Deluxe Room</h5>
                                    <div class="ps-2">
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                    </div>
                                </div>
                                <div class="d-flex mb-3">
                                    <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>2 Bed King</small>
                                    <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>2 Bath</small>
                                    <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                                </div>
                                <p class="text-body mb-3">Relax at our luxury resort in Vietnam where contemporary design meets Vietnamese-inspired décor amidst a spacious 70 sqm Classic Room.</p>
                                <div class="d-flex justify-content-between">
                                    <a class="btn btn-sm btn-primary rounded py-2 px-4" href="">View Detail</a>
                                    <a class="btn btn-sm btn-dark rounded py-2 px-4" href="">Book Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="room-item shadow rounded overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="image/room-2.jpg" alt="">
                                <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">$100/Night</small>
                            </div>
                            <div class="p-4 mt-2">
                                <div class="d-flex justify-content-between mb-3">
                                    <h5 class="mb-0">Single Deluxe Room</h5>
                                    <div class="ps-2">
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                    </div>
                                </div>
                                <div class="d-flex mb-3">
                                    <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>1 Bed King</small>
                                    <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>1 Bath</small>
                                    <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                                </div>
                                <p class="text-body mb-3">Inspired by traditional Vietnamese architecture, this room greets you with panoramic vistas of the mountains, gardens and sea. </p>
                                <div class="d-flex justify-content-between">
                                    <a class="btn btn-sm btn-primary rounded py-2 px-4" href="">View Detail</a>
                                    <a class="btn btn-sm btn-dark rounded py-2 px-4" href="">Book Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.6s">
                        <div class="room-item shadow rounded overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="image/room-3.jpg" alt="">
                                <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">$100/Night</small>
                            </div>
                            <div class="p-4 mt-2">
                                <div class="d-flex justify-content-between mb-3">
                                    <h5 class="mb-0">Standard Single Room</h5>
                                    <div class="ps-2">
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                    </div>
                                </div>
                                <div class="d-flex mb-3">
                                    <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>1 Bed Queen</small>
                                    <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>1 Bath</small>
                                    <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                                </div>
                                <p class="text-body mb-3">You’ll feel cool and comfortable in this sleek corner suite, an expansive, well-designed room with sunlight streaming in from two sides.</p>
                                <div class="d-flex justify-content-between">
                                    <a class="btn btn-sm btn-primary rounded py-2 px-4" href="">View Detail</a>
                                    <a class="btn btn-sm btn-dark rounded py-2 px-4" href="">Book Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.6s">
                        <div class="room-item shadow rounded overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="image/room-3.jpg" alt="">
                                <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">$100/Night</small>
                            </div>
                            <div class="p-4 mt-2">
                                <div class="d-flex justify-content-between mb-3">
                                    <h5 class="mb-0">Standard Double Room</h5>
                                    <div class="ps-2">
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                    </div>
                                </div>
                                <div class="d-flex mb-3">
                                    <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>2 Bed Queen</small>
                                    <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>2 Bath</small>
                                    <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                                </div>
                                <p class="text-body mb-3">Revel in the ease and grace of indoor-outdoor living in your Terrace Suite, as well as the exclusive privileges of Club InterContinental benefits.</p>
                                <div class="d-flex justify-content-between">
                                    <a class="btn btn-sm btn-primary rounded py-2 px-4" href="">View Detail</a>
                                    <a class="btn btn-sm btn-dark rounded py-2 px-4" href="">Book Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                            <div class="room-item shadow rounded overflow-hidden">
                                                <div class="position-relative">
                                                    <img class="img-fluid" src="image/room-1.jpg" alt="">
                                                    <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">$100/Night</small>
                                                </div>
                                                <div class="p-4 mt-2">
                                                    <div class="d-flex justify-content-between mb-3">
                                                        <h5 class="mb-0">Junior Suite</h5>
                                                        <div class="ps-2">
                                                            <small class="fa fa-star text-primary"></small>
                                                            <small class="fa fa-star text-primary"></small>
                                                            <small class="fa fa-star text-primary"></small>
                                                            <small class="fa fa-star text-primary"></small>
                                                            <small class="fa fa-star text-primary"></small>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex mb-3">
                                                        <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>3 Bed</small>
                                                        <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>2 Bath</small>
                                                        <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                                                    </div>
                                                    <p class="text-body mb-3">Erat ipsum justo amet duo et elitr dolor, est duo duo eos lorem sed diam stet diam sed stet lorem.</p>
                                                    <div class="d-flex justify-content-between">
                                                        <a class="btn btn-sm btn-primary rounded py-2 px-4" href="">View Detail</a>
                                                        <a class="btn btn-sm btn-dark rounded py-2 px-4" href="">Book Now</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>-->
                    <!--                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                                            <div class="room-item shadow rounded overflow-hidden">
                                                <div class="position-relative">
                                                    <img class="img-fluid" src="image/room-2.jpg" alt="">
                                                    <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">$100/Night</small>
                                                </div>
                                                <div class="p-4 mt-2">
                                                    <div class="d-flex justify-content-between mb-3">
                                                        <h5 class="mb-0">Executive Suite</h5>
                                                        <div class="ps-2">
                                                            <small class="fa fa-star text-primary"></small>
                                                            <small class="fa fa-star text-primary"></small>
                                                            <small class="fa fa-star text-primary"></small>
                                                            <small class="fa fa-star text-primary"></small>
                                                            <small class="fa fa-star text-primary"></small>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex mb-3">
                                                        <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>3 Bed</small>
                                                        <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>2 Bath</small>
                                                        <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                                                    </div>
                                                    <p class="text-body mb-3">Erat ipsum justo amet duo et elitr dolor, est duo duo eos lorem sed diam stet diam sed stet lorem.</p>
                                                    <div class="d-flex justify-content-between">
                                                        <a class="btn btn-sm btn-primary rounded py-2 px-4" href="">View Detail</a>
                                                        <a class="btn btn-sm btn-dark rounded py-2 px-4" href="">Book Now</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>-->
                </div>
            </div>
        </section>
        <!--================ Accomodation Area  =================-->
        <%@include file="/includes/footer.jsp" %>


        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js"></script>
        <script src="vendors/nice-select/js/jquery.nice-select.js"></script>
        <script src="js/mail-script.js"></script>
        <script src="js/stellar.js"></script>
        <script src="vendors/lightbox/simpleLightbox.min.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
