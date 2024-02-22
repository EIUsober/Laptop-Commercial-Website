<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Homepage</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="View/AdminView/css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="View/AdminView/css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="View/AdminView/css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
  </head>

  <body id="reportsPage">
    <jsp:include page="AdminInclude/AdminHeadInclude.jsp"></jsp:include>
        <div class="" id="home">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="text-white mt-5 mb-5">Welcome back, <b>${sessionScope.account.getName()}</b></p>
                </div>
            </div>
            <!-- row -->
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                <c:set var="account" value="${sessionScope.account}"/>
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-overflow">
                        <h2 class="tm-block-title">Your Profile</h2>
                        <div action=""  class="tm-signup-form row" method="post">
                            <div class="form-group col-lg-6">
                                <div class="tm-avatar-container">
                                <img
                                  src="${account.getImg()}"
                                  alt="Avatar"
                                  class="tm-avatar img-fluid mb-4"
                                />
                                </div>
                            </div>
                            <div class="form-group col-lg-6">
                                <label><b>ID: </b>${account.getId()}</label>
                                <br>
                                <label><b>Role: </b>${account.getIsAdmin()==1?'Admin':'Staff'}</label>
                                <br>
                                <label><b>${account.getName()}</b></label>
                                <br>
                                <label>${account.getEmail()}</label>
                                <a
                                href="AdminServlet?mode=personalProfile"
                                class="btn btn-primary btn-block text-uppercase mb-3">More Detail</a>
                            </div>
                          </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-overflow">
                        <div  class="row">
                            <h2 class="tm-block-title col-md-5">Revenue</h2>
                            <form action="AdminServlet?mode=storeManage" method="post">
                                <input style="max-height: 30px; min-width: 60px" type="month" id="start" name="month" min="2018-03" value="${month}"/>
                                <button style="max-height: 30px; border: none; border-radius: 5px; width: 70px" type="submit" class="btn-success">Load</button>
                            </form>
                        </div>
                        <div class="row tm-block-title">Total: </div>
                        <div class="d-flex justify-content-center">
                            <h1 style="font-size: 80px; color: gold" >$ ${revenue}</h1>
                        </div>
                    </div>
                </div>
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                        <h2 class="tm-block-title">Orders In This Period</h2>
                            <table class="table table-hover tm-product-table">
                            <thead>
                              <tr>
                                <th scope="col">&nbsp;</th>
                                <th scope="col">Customer ID</th>
                                <th scope="col">Total Price</th>
                                <th scope="col">Date</th>
                                <th scope="col">Seller</th>
                                <th scope="col">Status</th>
                                <th scope="col" style="width: 5%">Detail</th>
                              </tr>
                            </thead>
                            <tbody>
                            <c:set var="i" value="1"/>
                            <c:forEach items="${listO}" var="o">
                              <tr>
            <!--                    <th scope="row"><input type="checkbox" /></th>-->
                                <th scope="row">${i}</th>
                                <td>${o.getCustomerId()}</td>
                                <td>${o.getStringOrderPrice()}</td>
                                <td>${o.getOrderDate()}</td>
                                <td>${o.getSellerId()==null?"-----------":o.getSellerId()}</td>
                                <td>${o.getOrderStatus()}</td>
                                <td>
                                  <a href="AdminServlet?mode=orderDetail&oID=${o.getOrderId()}&cID=${o.getCustomerId()}" class="tm-product-delete-link">
                                    <i class="far fa-edit fa-lg" style="color: #eeeff2;"></i>
                                  </a>
                                </td>
                              </tr>
                              <c:set var="i" value="${i+1}"/>
                              </c:forEach>
                            </tbody>
                          </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="AdminInclude/AdminFootInclude.jsp"></jsp:include>
    <script src="View/AdminView/js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="View/AdminView/js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
  </body>
</html>