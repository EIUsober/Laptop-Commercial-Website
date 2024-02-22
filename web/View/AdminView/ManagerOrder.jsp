<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Order Page</title>
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
    <div class="container mt-5">
        <h2 class="tm-block-title">MANAGE ORDER</h2>
        <div class="tm-bg-primary-dark tm-block tm-block-products">
            <ul class="nav nav-tabs nav-fill">
                <li class="nav-item">
                  <a ${nav==1?"class='nav-link active'":"class='nav-link'"}  href="AdminServlet?mode=orderAll">All</a>
                </li>
                <li class="nav-item">
                  <a ${nav==2?"class='nav-link active'":"class='nav-link'"} href="AdminServlet?mode=orderUnconfirmed">Unconfirmed</a>
                </li>
                <li class="nav-item">
                  <a ${nav==3?"class='nav-link active'":"class='nav-link'"} href="AdminServlet?mode=orderConfirmed">Confirmed</a>
                </li>
                <li class="nav-item">
                  <a ${nav==4?"class='nav-link active'":"class='nav-link'"} href="AdminServlet?mode=orderDelivering">Delivering</a>
                </li>
                <li class="nav-item">
                  <a ${nav==5?"class='nav-link active'":"class='nav-link'"} href="AdminServlet?mode=orderComplete">Complete</a>
                </li>
            </ul>
        <div class="tm-product-table-container">
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
                    <th scope="col" style="width: 5%; ${nav==1||nav==5?"display:none":""};">Update</th>
                    <th scope="col" style="width: 5%">Delete</th>
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
                    <td style="${nav==1||nav==5?"display:none":""}">
                        <a href="AdminServlet?mode=confirmOrder&id=${o.getOrderId()}&status=${o.getOrderStatus()}" class="tm-product-delete-link">
                        <i class="${nav==2?'far fa-check-circle':nav==3?'fas fa-truck':nav==4?'fas fa-check-double':''} fa-lg" style="color: #eeeff2;"></i>
                      </a>
                    </td>
                    <td>
                      <a href="#" class="tm-product-delete-link">
                        <i class="far fa-trash-alt tm-product-delete-icon"></i>
                      </a>
                    </td>
                  </tr>
                  <c:set var="i" value="${i+1}"/>
                  </c:forEach>
                </tbody>
              </table>
            </div>
            <!-- table container -->
<!--            <a
              href="AdminServlet?mode=ceateAccount"
              class="btn btn-primary btn-block text-uppercase mb-3">CREATE A NEW ${title} ACCOUNT</a>-->
        </div>
    </div>
        <jsp:include page="AdminInclude/AdminFootInclude.jsp"></jsp:include>
    <script src="View/AdminView/js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="View/AdminView/js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
  </body>
</html>