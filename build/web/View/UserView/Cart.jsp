<%-- 
    Document   : Cart
    Created on : Aug 13, 2023, 12:04:15 AM
    Author     : thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

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
    </head>
    <body>
        <header class="header_section">
            <jsp:include page="UserIncludes/HeadInclude.jsp"></jsp:include>
            </header>
            <div class="shopping-cart">
                <div class="px-4 px-lg-0">

                    <div class="pb-5">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                    <!-- Shopping cart table -->
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Đơn Giá</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Số Lượng</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Thành Tiền</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase"></div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase"></div>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            <c:forEach items="${cart.items}" var="item">

                                                <tr>
                                                    <th scope="row">
                                                        <div class="p-2">
                                                            <img src="${item.getProduct().getImage()}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block">${item.getProduct().getName()}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                            </div>

                                                        </div>
                                                    </th>
                                                    <td class="align-middle"><strong>$ ${item.getProduct().getStringPrice()}</strong></td>
                                                    <td class="align-middle">
                                                        <a href="CartServlet?mode=update&quantity=1&id=${item.getProduct().getID()}"><button type="button" class="btn btn-info"> + </button></a>
                                                        <input name="quantity" style="width: 30px" type="text" readonly value="${item.getQuantity()}">
                                                        <a href="CartServlet?mode=update&quantity=-1&id=${item.getProduct().getID()}"><button type="button" class="btn btn-info"> - </button></a>
                                                    </td>
                                                    <td class="align-middle"><strong>$ ${item.getStringTotal()}</strong></td>
                                                    <td class="align-middle"><a href="CartServlet?mode=remove&id=${item.getProduct().getID()}" class="text-dark">
                                                            <button type="button" class="btn btn-danger">Delete</button>
                                                        </a>
                                                    </td>
                                                </tr> 
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>

                        <div class="row py-5 p-4 bg-white rounded shadow-sm">

                            <div class="col-lg-12">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thành tiền</div>
                                <div class="p-4">
                                    <ul class="list-unstyled mb-4">
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng tiền hàng</strong><strong>$ ${cart.getStringTotalMoney()}</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Phí vận chuyển</strong><strong>Free ship</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">VAT</strong><strong>$ 0</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng thanh toán</strong>
                                            <h5 class="font-weight-bold">$ ${cart.getStringTotalMoney()}</h5>
                                        </li>
                                        <!--                                        </ul><a href="NavigateServlet?mode=pay" class="btn btn-dark rounded-pill py-2 btn-block">Đặt Hàng</a>-->
                                    </ul>
                                    <div class="d-flex justify-content-around">
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal1">
                                            CHECK OUT NOW
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>   
        <div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <c:if test="${cart.getTotalQuantity() > 0}">
                <c:if test="${account == null || account.getId() == null}">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">You haven't login to your account</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Please login to your account before make an order
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <a  href="NavigateServlet?mode=login"><button type="button" class="btn btn-primary">Login</button></a>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${account != null || account.getId() != null}">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">CHECK OUT</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item"></li>
                                    <li class="list-group-item">
                                        <p><b>Receiver's name:</b></p>
                                        ${account.getName()}
                                    </li>
                                    <li class="list-group-item">
                                        <p><b>Phone number:</b></p>
                                        ${account.getPhone()}
                                    </li>
                                    <li class="list-group-item">
                                        <p><b>Delivery address:</b></p>
                                        ${account.getAddress()}
                                    </li>
                                    <li class="list-group-item">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>
                                                        <div class="col-md-8">Product</div>
                                                    </th>
                                                    <th>
                                                        <div class="col-md-2">Quantity</div>
                                                    </th>
                                                    <th>
                                                        <div class="col-md-2">Price</div>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${cart.items}" var="item">
                                                    <tr>
                                                        <td class="align-middle col-md-8">- ${item.getProduct().getName()}</td>
                                                        <td class="align-middle col-md-2">${item.getQuantity()}</td>
                                                        <td class="align-middle col-md-2"><fmt:formatNumber pattern="##.##" value="${item.getTotal()}"/></td>
                                                    </tr> 
                                                </c:forEach>
                                                <tr>
                                                    <td class="align-middle col-md-8"><strong>Total:</strong></td>
                                                    <td class="align-middle col-md-2">${cart.getTotalQuantity()}</td>
                                                    <td class="align-middle col-md-2"><fmt:formatNumber pattern="##.##" value="${cart.getTotalMoney()}"/></td>
                                                </tr> 
                                            </tbody>
                                        </table>  
                                    </li>
                                </ul>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <p>Please choose your payment method</p>
                                </div>
                                <div>
                                    <a style="margin-right: 20px"  href="CartServlet?mode=buy&method=COD"><button type="button" class="btn btn-primary">Cash On Delivery(COD)</button></a>
                                    <a  href="NavigateServlet?mode=pay&method=VNPay"><button type="button" class="btn btn-primary">Online Payment(VNPay)</button></a>
                                </div>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            </div>
                        </div>
                    </div>  
                </c:if>
            </c:if>
            <c:if test="${cart.getTotalQuantity() == 0 || cart == null}">
                <div class="modal-dialog">  
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">YOUR CART IS EMPTY!</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Please put some products in your cart before make an order!!
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Got it</button>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
        <jsp:include page="UserIncludes/FootInclude.jsp"></jsp:include>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
