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

  <title>Product Detail Page</title>


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

</head>

<body class="sub_page">
    <header class="header_section">
                <jsp:include page="UserIncludes/HeadInclude.jsp"></jsp:include>
    </header>
<!-- product section -->
<!--main Product-->
    <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${productP.getImage()}"/></div>
                    <div class="col-md-6">
                        <form action="CartServlet?mode=add&id=${productP.getID()}" method="post">
                            <h1 class="display-5 fw-bolder">${productP.getName()}</h1>
                            <div class="fs-5 mb-5">
                                <span class="text-decoration-line-through">$1000</span>
                                <span>$</span><span>${productP.getStringPrice()}</span>
                            </div>
                             <div>                               
                                 <h4 style="color: red"><span>Quantity : </span><span>${productP.getQuantity()}</span></h4>
                            </div>
                            <h4 class="display-8 fw-bolder">Product Description:</h4>
                            <p class="lead">${productP.getDescription()}</p>
                            <div class="d-flex">
                                <input class="form-control text-center me-3" name="quantity" type="number" value="1" min="1" style="max-width: 4rem" />
                                <c:if test="${productP.getQuantity()>0}">
                                    <button class="btn btn-success flex-shrink-0" type="submit" style="margin-right: 20px">
                                    <i class="bi-cart-fill me-1"></i>
                                        ADD TO CART
                                    </button>
                                </c:if>
                                <c:if test="${productP.getQuantity()<=0}">
                                    <button class="btn btn-success flex-shrink-0 disabled" type="" style="margin-right: 20px">
                                    <i class="bi-cart-fill me-1"></i>
                                        SOLD OUT!
                                    </button>
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
<!--end main product-->
<!-- related Product -->
    <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Related products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach items="${relateProduct}" var ="related">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img style="height: 200px" class="card-img-top" src="${related.getImage()}" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${related.getName()}</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $ ${related.getStringPrice()}
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="ProductServlet?mode=detail&pid=${related.getID()}">Detail</a></div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    <!--end related Product -->
<!-- end product section -->

<!--footer section-->
<jsp:include page="UserIncludes/FootInclude.jsp"></jsp:include>
<!--end footer section-->

  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>


</body>

</html>
