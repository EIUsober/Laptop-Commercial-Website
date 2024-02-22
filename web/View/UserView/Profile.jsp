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
            body {
                position: relative;
            }

            #edit-hiden{
                display: none;
                position: absolute;
                top: 0;
                right: 0;
                left: 0;
                bottom: 0;
            }
        </style>
    </head>

    <body class="sub_page">
        <header class="header_section">
            <jsp:include page="UserIncludes/HeadInclude.jsp"></jsp:include>
            </header>
        <c:set var="account" value="${account}"/>
        <div id="profile">
            <div class="container rounded bg-white mt-5 mb-5">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                            <img class="rounded-circle mt-5" width="150px" src="${account.getImg()}">
                            <span class="font-weight-bold">${account.getName()}</span>
                            <span class="text-black-50">${account.getEmail()}</span>
                        </div>
                    </div>
                    <div class="col-md-7 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Your Profile</h4>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-12"><label class="labels">Full Name</label><input type="text" class="form-control" value="${account.getName()}" readonly=""></div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-12"><label class="labels">Gender</label><input type="text" class="form-control" value="${account.getGender()}" readonly=""></div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label class="labels">Phone Number</label><input type="text" class="form-control" value="${account.getPhone()}" readonly=""></div>
                                <div class="col-md-12"><label class="labels">Address</label><input type="text" class="form-control" value="${account.getAddress()}" readonly=""></div>
                                <div class="col-md-12"><label class="labels">Email Address</label><input type="text" class="form-control" value="${account.getEmail()}" readonly=""></div>
                            </div>
                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" type="button" id="editBtn">Edit Profile</button>
                                <a href="StartServlet"><button class="btn btn-primar profile-button" style="margin-left: 20px; background-color: red" type="button" onclick="editFunction()">Exit</button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="edit-hiden">
            <div class="container rounded bg-white mt-5 mb-5">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                            <img class="rounded-circle mt-5" width="150px" src="${account.getImg()}">
                            <span class="font-weight-bold">${account.getName()}</span>
                            <span class="text-black-50">${account.getEmail()}</span>
                            <form action="AccountServlet" method="post" enctype="multipart/form-data">
                                <input style="display: none" type="text" name="mode" value="editAvatar">
                                <input style="display: none" type="text" name="customer_id" value="${account.getId()}" readonly>
                                <input type="file" class="form-control" name="customer_img">
                                <button type="submit" class="btn btn-primary profile-button">Change Avatar</button>
                            </form>

                        </div>
                    </div>
                    <div class="col-md-7 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Edit Profile</h4>
                            </div>
                            <form action="AccountServlet?mode=editCusProfile" method="post" enctype="multipart/form-data" >
                                <input style="display: none" type="text" name="mode" value="editProfile">
                                <input style="display: none" type="text" name="customer_id" value="${account.getId()}" readonly>
                                <div class="row mt-2">
                                    <div class="col-md-12"><label class="labels">Full Name</label><input type="text" class="form-control" value="${account.getName()}" name="customer_name"></div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-12"><label class="labels">Gender</label>
                                        <c:set var="gender" value="Male"/>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="Male" ${account.getGender().equalsIgnoreCase(gender)?"checked":""}>
                                            <label class="form-check-label" for="flexRadioDefault1">
                                                Male
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="Female" ${account.getGender().equalsIgnoreCase(gender)?"":"checked"}>
                                            <label class="form-check-label" for="flexRadioDefault2">
                                                Female
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12"><label class="labels">Phone Number</label><input type="text" class="form-control" value="${account.getPhone()}" name="customer_phone"></div>
                                    <div class="col-md-12"><label class="labels">Address</label><input type="text" class="form-control" value="${account.getAddress()}" name="customer_address"></div>
                                    <div class="col-md-12"><label class="labels">Email Address</label><input type="text" class="form-control" value="${account.getEmail()}" name="customer_email"></div>
                                </div>
                                <div class="mt-5 text-center">
                                    <button class="btn btn-primary profile-button" type="submit">Save</button>
                                    <button style="margin-left: 20px; background-color: red" class="btn btn-primary profile-button" type="button" id="cancelBtn">Cancel</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="card-header my-3">All Orders</div>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">Total Price</th>
                        <th scope="col">Order Date</th>
                        <th scope="col">Payment Method</th>
                        <th scope="col">Order Status</th>
                        <th scope="col">Seller ID</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listO}" var ="o">
                        <tr>
                            <td>${o.getOrderId()}</td>
                            <td>${o.getStringOrderPrice()}</td>
                            <td>${o.getOrderDate()}</td>
                            <td>${o.getOrderMethod()}</td>
                            <td>${o.getOrderStatus()}</td>
                            <td>${o.getSellerId()}</td>
                            <td><a href="NavigateServlet?mode=orderDetail&oID=${o.getOrderId()}&cID=${account.getId()}"><button class="btn btn-primary profile-button" type="button" id="detailBtn">Detail</button></a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <!-- end product section -->
        <jsp:include page="UserIncludes/FootInclude.jsp"></jsp:include>


        <script>
            document.getElementById("editBtn").onclick = function () {
                edit();
            };
            document.getElementById("cancelBtn").onclick = function () {
                cancel();
            };
            function edit() {
                document.getElementById("edit-hiden").style.display = "block";
            }
            function cancel() {
                document.getElementById("edit-hiden").style.display = "none";
            }
        </script>
        <!-- jQery -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>


    </body>

</html>
