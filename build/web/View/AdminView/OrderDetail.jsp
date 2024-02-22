<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Order Detail</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="View/AdminView/css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="View/AdminView/jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
    <!-- http://api.jqueryui.com/datepicker/ -->
    <link rel="stylesheet" href="View/AdminView/css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="View/AdminView/css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
  </head>

  <body>
    <jsp:include page="AdminInclude/AdminHeadInclude.jsp"></jsp:include>
     <c:set var="o" value="${order}"/>
     <div style="height: 1000px;" class="container mt-5">
            <h2 class="tm-block-title">ORDER DETAIL</h2>
            <div class="col-lg-12 col-lg-12" style="background-color: rgb(67, 92, 112); padding-top: 30px; padding-bottom: 30px; padding-left: 50px; padding-right: 50px;">
                        <div class="row tm-content-row">
                            <div class="tm-block-col tm-col-avatar">
                                <h2 class="tm-block-title">Customer Info</h2>
                                <form action="AdminServlet?mode=createConfirm" class="tm-edit-product-form" method="post" enctype="multipart/form-data">
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
                            <a
                                href="AdminServlet?mode=ceateAccount"
                                class="btn btn-primary btn-block text-uppercase mb-3">Delete Order</a>
                            </div>
                            <div class="tm-block-col tm-col-account-settings">
                                <h2 class="tm-block-title">Order Info</h2>
                                <form action="AdminServlet?mode=updateStatus" class="tm-edit-product-form" method="post" enctype="multipart/form-data">
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
                                        <div class="d-flex justify-content-around">
                                            <div class="form-group col-lg-6">
                                                 <label for="status">Status</label>
                                                <select
                                                    style="color: white;"
                                                    class="custom-select tm-select-accounts"
                                                    id="status"
                                                    name="status"
                                                  >
                                                      <option value="unconfirmed" ${o.getOrderStatus().equals("unconfirmed")?"selected=`selected`":""}>unconfirmed</option>
                                                      <option value="confirmed" ${o.getOrderStatus().equals("confirmed")?"selected=`selected`":""}>confirmed</option>
                                                      <option value="delivering" ${o.getOrderStatus().equals("delivering")?"selected=`selected`":""}>delivering</option>
                                                      <option value="complete" ${o.getOrderStatus().equals("complete")?"selected=`selected`":""}>complete</option>
                                                  </select>
                                              </div>
                                              <div class="form-group col-lg-6">
                                                <label for="name">Update Status</label>
                                                <input class="btn btn-primary btn-block text-uppercase mb-3" type="submit" value="Save Change">
<!--                                                <a
                                                    href="AdminServlet?mode=updateOrder&"
                                                    class="btn btn-primary btn-block text-uppercase mb-3">Save Change</a>-->
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
                                  <tr>
                                      <td colspan="2">Total Quantity:  ${o.getCart().getTotalQuantity()}</td>
                                      <td colspan="3">Total Price: $ ${o.getCart().getStringTotalMoney()}</td>
                                  </tr>
                                </tbody>
                              </table>
                             </form>
                            </div>
                          </div>
                    <!-- table container -->
                </div>
            </div>
    <jsp:include page="AdminInclude/AdminFootInclude.jsp"></jsp:include>
    <script src="View/AdminView/js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="View/AdminView/jquery-ui-datepicker/jquery-ui.min.js"></script>
    <!-- https://jqueryui.com/download/ -->
    <script src="View/AdminView/js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script>
      $(function() {
        $("#expire_date").datepicker();
      });
    </script>
  </body>
</html>
