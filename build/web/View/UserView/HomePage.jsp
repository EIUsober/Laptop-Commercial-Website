<%-- 
    Document   : HomePage
    Created on : Aug 5, 2023, 1:50:38 AM
    Author     : tanle
--%>

<%@page import="entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>TGDLaptop</title>


        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- fonts style -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet"> <!-- range slider -->
        <!-- font awesome style -->
        <link href="css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
        <style>
            #btn-back-to-top {
                position: fixed;
                bottom: 20px;
                right: 20px;
                display: none;
              }
        </style>
    </head>

    <body>
        <header class="header_section">
            <jsp:include page="UserIncludes/HeadInclude.jsp"></jsp:include>
            </header>
            <div id="Home">
                <!-- slider section -->
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="images/slider2.jpg" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h1>WELCOME AND THANK YOU</h1>
                                <h2>We are very appriciated that you visited our website. We promise to provide our best services as well as ensure your precious experience.</h2>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="images/slider3.jpg" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h1>WELCOME AND THANK YOU</h1>
                                <h2>We are very appriciated that you visited our website. We promise to provide our best services as well as ensure your precious experience.</h2>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="images/slider1.jpg" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h1>WELCOME AND THANK YOU</h1>
                                <h2>We are very appriciated that you visited our website. We promise to provide our best services as well as ensure your precious experience.</h2>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                <!-- end slider section -->

                <!-- product section -->
                <section class="product_section layout_padding">
                    <div class="container">
                        <div class="heading_container heading_center">
                            <h2>
                                NEW PRODUCTS
                            </h2>
                        </div>
                        <div class="row">
                        <c:forEach items="${listP}" var="p">
                            <div class="col-sm-6 col-lg-4">
                                <div class="box">
                                    <div class="img-box img-fluid">
                                        <img src="${p.getImage()}" alt="">
                                        <a href="ProductServlet?mode=detail&pid=${p.getID()}" class="add_cart_btn">
                                            <span>
                                                See more detail
                                            </span>
                                        </a>
                                    </div>
                                    <div class="detail-box">
                                        <h5 class="product_name" style="font-weight: bolder">
                                            ${p.getName()}
                                        </h5>
                                        <div class="product_info">
                                            <h5 style="color: red">
                                                <span>$</span> ${p.getStringPrice()}
                                            </h5>
                                            <div class="star_container">
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="btn_box">
                        <a href="ProductServlet?mode=view" class="view_more-link">
                            View More
                        </a>
                    </div>
                </div>
            </section>

            <!-- end product section -->

            <!-- about section -->

            <section class="about_section">
                <div class="container-fluid  ">
                    <div class="row">
                        <div class="col-md-5 ml-auto">
                            <div class="detail-box pr-md-3">
                                <div class="heading_container">
                                    <h2>
                                        We Provide Best For You
                                    </h2>
                                </div>
                                <p>
                                    Totam architecto rem beatae veniam, cum officiis adipisci soluta perspiciatis ipsa, expedita maiores quae accusantium. Animi veniam aperiam, necessitatibus mollitia ipsum id optio ipsa odio ab facilis sit labore officia!
                                    Repellat expedita, deserunt eum soluta rem culpa. Aut, necessitatibus cumque. Voluptas consequuntur vitae aperiam animi sint earum, ex unde cupiditate, molestias dolore quos quas possimus eveniet facilis magnam? Vero, dicta.
                                </p>
                                <a href="">
                                    Read More
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6 px-0">
                            <div class="img-box">
                                <img src="images/about.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- end about section -->

            <!-- why us section -->

            <section class="why_us_section layout_padding">
                <div class="container">
                    <div class="heading_container heading_center">
                        <h2>
                            Why Choose Us
                        </h2>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="box ">
                                <div class="img-box">
                                    <img src="images/w1.png" alt="">
                                </div>
                                <div class="detail-box">
                                    <h5>
                                        Fast Delivery
                                    </h5>
                                    <p>
                                        variations of passages of Lorem Ipsum available
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="box ">
                                <div class="img-box">
                                    <img src="images/w2.png" alt="">
                                </div>
                                <div class="detail-box">
                                    <h5>
                                        Free Shiping
                                    </h5>
                                    <p>
                                        variations of passages of Lorem Ipsum available
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="box ">
                                <div class="img-box">
                                    <img src="images/w3.png" alt="">
                                </div>
                                <div class="detail-box">
                                    <h5>
                                        Best Quality
                                    </h5>
                                    <p>
                                        variations of passages of Lorem Ipsum available
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- end why us section -->


            <!-- client section -->

            <section class="client_section layout_padding-bottom">
                <div class="container">
                    <div class="heading_container heading_center">
                        <h2>
                            What Says Our Customers
                        </h2>
                    </div>
                </div>
                <div class="client_container ">
                    <div id="carouselExample2Controls" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="container">
                                    <div class="box">
                                        <div class="detail-box">
                                            <p>
                                                <i class="fa fa-quote-left" aria-hidden="true"></i>
                                            </p>
                                            <p>
                                                It is a long established fact that a reader will be distracted by the readable content of a page
                                                when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal
                                                distribution of letters, as opposed to using 'Content here, content here', making it lookIt is a
                                                long established fact that a reader will be distracted by the readable content of a page when
                                                looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal
                                                distribution of letters, as opposed to using 'Content here, content here', making it look
                                            </p>
                                        </div>
                                        <div class="client-id">
                                            <div class="img-box">
                                                <img src="images/client.jpg" alt="">
                                            </div>
                                            <div class="name">
                                                <h5>
                                                    James Dew
                                                </h5>
                                                <h6>
                                                    Photographer
                                                </h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="box">
                                        <div class="detail-box">
                                            <p>
                                                <i class="fa fa-quote-left" aria-hidden="true"></i>
                                            </p>
                                            <p>
                                                It is a long established fact that a reader will be distracted by the readable content of a page
                                                when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal
                                                distribution of letters, as opposed to using 'Content here, content here', making it lookIt is a
                                                long established fact that a reader will be distracted by the readable content of a page when
                                                looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal
                                                distribution of letters, as opposed to using 'Content here, content here', making it look
                                            </p>
                                        </div>
                                        <div class="client-id">
                                            <div class="img-box">
                                                <img src="images/client.jpg" alt="">
                                            </div>
                                            <div class="name">
                                                <h5>
                                                    James Dew
                                                </h5>
                                                <h6>
                                                    Photographer
                                                </h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="box">
                                        <div class="detail-box">
                                            <p>
                                                <i class="fa fa-quote-left" aria-hidden="true"></i>
                                            </p>
                                            <p>
                                                It is a long established fact that a reader will be distracted by the readable content of a page
                                                when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal
                                                distribution of letters, as opposed to using 'Content here, content here', making it lookIt is a
                                                long established fact that a reader will be distracted by the readable content of a page when
                                                looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal
                                                distribution of letters, as opposed to using 'Content here, content here', making it look
                                            </p>
                                        </div>
                                        <div class="client-id">
                                            <div class="img-box">
                                                <img src="images/client.jpg" alt="">
                                            </div>
                                            <div class="name">
                                                <h5>
                                                    James Dew
                                                </h5>
                                                <h6>
                                                    Photographer
                                                </h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel_btn-box">
                            <a class="carousel-control-prev" href="#carouselExample2Controls" role="button" data-slide="prev">
                                <span>
                                    <i class="fa fa-angle-left" aria-hidden="true"></i>
                                </span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExample2Controls" role="button" data-slide="next">
                                <span>
                                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                                </span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
            </section>
            <button
                type="button"
                class="btn btn-danger btn-floating btn-lg"
                id="btn-back-to-top"
                >
                <i class="fas fa-arrow-up"></i>
            </button>
            <jsp:include page="UserIncludes/FootInclude.jsp"></jsp:include>
        </div>
        <!-- end client section -->


        <!-- jQery -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>
        <script>
            let mybutton = document.getElementById("btn-back-to-top");

            // When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction();
            };

            function scrollFunction() {
                if (
                        document.body.scrollTop > 20 ||
                        document.documentElement.scrollTop > 20
                        ) {
                    mybutton.style.display = "block";
                } else {
                    mybutton.style.display = "none";
                }
            }
            // When the user clicks on the button, scroll to the top of the document
            mybutton.addEventListener("click", backToTop);

            function backToTop() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>


    </body>

</html>
