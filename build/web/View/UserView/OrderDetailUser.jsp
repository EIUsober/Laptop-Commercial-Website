<%-- 
    Document   : Product
    Created on : Aug 5, 2023, 5:56:15 PM
    Author     : tanle
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Category"%>
<%@page import="entity.Product"%>
<%@page import="java.util.ArrayList"%>
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

        <title>User Profile Page</title>


        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- fonts style -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet"> <!-- range slider -->

        <!-- font awesome style -->
        <link href="css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="profile.css"/>
        <style>

        </style>
    </head>
    <body>
        <header class="header_section">
            <jsp:include page="UserIncludes/HeadInclude.jsp"></jsp:include>
            </header>
        <c:set var="o" value="${order}"/>
        <div class="container">
            <h2 class="tm-block-title">ORDER DETAIL</h2>
            <div style="background-color: white; padding-top: 0px; padding-bottom: 10px; padding-left: 50px; padding-right: 50px;border: solid black 1px; margin-bottom: 20px;">
                <div class="row">
                    <div class="col-md-6">
                        <h2 class="tm-block-title">Customer Info</h2>
                        <form class="tm-edit-product-form" method="post" enctype="multipart/form-data">
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-12 col-lg-12">

                                    <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            >Name:
                                        </label>
                                        <input
                                            style="color: black;"
                                            id="name"
                                            name="name"
                                            type="text"
                                            class="form-control validate"
                                            readonly
                                            value="${o.getPerson().getName()}"
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="phone"
                                            >Phone:
                                        </label>
                                        <input
                                            style="color: black;"
                                            id="phone"
                                            name="phone"
                                            type="text"
                                            class="form-control validate"
                                            readonly
                                            value="${o.getPerson().getPhone()}"
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="email"
                                            >Email:
                                        </label>
                                        <input
                                            style="color: black;"
                                            id="email"
                                            name="email"
                                            type="email"
                                            class="form-control validate"
                                            readonly
                                            value="${o.getPerson().getEmail()}"
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="address"
                                            >Address:</label
                                        >
                                        <textarea
                                            style="color: black;"
                                            class="form-control validate"
                                            id="address"
                                            rows="5"
                                            name="${o.getPerson().getAddress()}"
                                            readonly
                                            >Binh Duong</textarea>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-6">
                        <h2 class="tm-block-title">Order Info</h2>
                        <form action="" class="tm-edit-product-form" method="post" enctype="multipart/form-data">
                            <div class="form-group mb-3">
                                <div class="d-flex justify-content-around">
                                    <div class="form-group col-lg-6">
                                        <label for="order_id">Order ID</label>
                                        <input
                                            style="color: black;"
                                            id="order_id"
                                            name="order_id"
                                            type="text"
                                            value="${o.getOrderId()}"
                                            class="form-control validate"
                                            readonly
                                            />
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label for="date">Order Date</label>
                                        <input
                                            style="color: black;"
                                            id="date"
                                            name="date"
                                            type="text"
                                            readonly
                                            value="${o.getOrderDate()}"
                                            class="form-control validate"
                                            />
                                    </div>                                            
                                </div>
                                <div class="d-flex justify-content-around">
                                    <div class="form-group col-lg-6">
                                        <label for="payment">Payment Method</label>
                                        <input
                                            style="color: black;"
                                            id="payment"
                                            name="payment"
                                            type="text"
                                            value="${o.getOrderMethod()}"
                                            class="form-control validate"
                                            readonly
                                            />
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label for="seller">Seller ID</label>
                                        <input
                                            style="color: black;"
                                            id="seller"
                                            name="seller"
                                            type="text"
                                            readonly
                                            value="${o.getSellerId()}"
                                            class="form-control validate"
                                            />
                                    </div>                                           
                                </div>

                            </div>
                            <table class="table table-hover tm-product-table">
                                <thead>
                                    <tr>
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">Product</th>
                                        <th scope="col">quantity</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="i" value="1"/>
                                    <c:forEach items="${o.getCart().getItems()}" var="item">
                                        <tr>
                                            <th scope="row">${i}</th>
                                            <td>${item.getProduct().getName()}</td>
                                            <td>${item.getQuantity()}</td>
                                            <td><img width="40px" src="${item.getProduct().getImage()}"></td>
                                            <td>
                                                ${item.getStringPrice()}
                                            </td>
                                        </tr>
                                        <c:set var="i" value="${i+1}"/>
                                    </c:forEach>

                                </tbody>
                            </table>
                            <h4>Total Quantity:  ${o.getCart().getTotalQuantity()}</h4>
                            <br>
                            <h4>Total Price: $ ${o.getCart().getStringTotalMoney()}</h4>
                            <a href="NavigateServlet?mode=profile"><button class="btn btn-primary profile-button" type="button" id="cancelDetail" style="background: red">Exit</button></a>
                        </form>
                    </div>
                </div>
            </div>
            <!-- table container -->
        </div>

        <!-- end product section -->
        <jsp:include page="UserIncludes/FootInclude.jsp"></jsp:include>



        <!-- jQery -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>


    </body>

</html>
