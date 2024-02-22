<%-- 
    Document   : HeadInclude
    Created on : Aug 6, 2023, 9:12:07Ã¢â‚¬Â¯PM
    Author     : tanle
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- search section menu -->
      <div class="header_top">
        <div class="container-fluid">
          <div class="top_nav_container">
            <div class="contact_nav">
              <a href="https://chat.zalo.me/">
                <i class="fa fa-phone" aria-hidden="true"></i>
                <span>
                  Call : +84 589677777
              </a>
              <a href="https://mail.google.com/">
                <i class="fa fa-envelope" aria-hidden="true"></i>
                <span>
                  Email : tgdlaptopoffice@gmai.com
                </span>
              </a>
            </div>
            <form class="search_form" action="ProductServlet" method="get">
                <input style="display: none" name="mode" type="text" value="search">
                <input name="text" type="text" class="form-control" placeholder="Search here..." value="${value}">
              <button class="" type="submit">
                <i class="fa fa-search" aria-hidden="true"></i>
              </button>
            </form>
            <div class="user_option_box">
              <c:if test="${sessionScope.account == null}">
               <a href="NavigateServlet?mode=login" class="account-link">
                <i class="fa fa-user" aria-hidden="true"></i>
                <span>
                  Login to Customer account
                </span>
              </a>
                  <a href="NavigateServlet?mode=signup" class="account-link">
                <span>
                  Sign Up
                </span>
              </a>
               <a href="CartServlet?mode=view" class="cart-link">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                <span>
                  Cart
                </span>
              </a>
              </c:if>
                <c:if test="${sessionScope.account != null}">
                    <a href="NavigateServlet?mode=profile"><span style="color: white; margin-left: 20px">Hi, ${sessionScope.account.name}</span></a>
                  <a href="AccountServlet?mode=logout" class="account-link">
                <span>
                  Log out
                </span>
              </a>
              <a href="CartServlet?mode=view" class="cart-link">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                <span>
                  Cart
                </span>
              </a>
              </c:if>
                
            </div>
          </div>

        </div>
      </div>
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="StartServlet"><img
                  src="images/logo.png"
                /></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="d-flex flex-row-reverse bd-highlight">
          <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
              <ul class="navbar-nav">
              <li class="nav-item" style="width: 120px; font-size: 20px">
                  <a class="nav-link" href="StartServlet">Home</a>
              </li>
               <li class="nav-item" style="width: 120px; font-size: 20px">
                  <a class="nav-link" href="NavigateServlet?mode=about">About Us</a>
              </li>
              <li class="nav-item dropdown" style="width: 120px; font-size: 20px">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Brands
                </a>
                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                    <li style="font-size: 20px"><a class="dropdown-item" href="ProductServlet?mode=view&cid=">All Brands</a></li>
                  <c:forEach items="${listC}" var="o">
                  <li style="font-size: 20px"><a class="dropdown-item" href="ProductServlet?mode=view&cid=${o.getId()}&cname=${o.getName()}">${o.getName()}</a></li>
                  </c:forEach>
                </ul>
              </li>
              <li class="nav-item" style="width: 120px; font-size: 20px">
                  <a class="nav-link" href="NavigateServlet?mode=why">Why Us</a>
              </li>
              <li class="nav-item" style="width: 120px; font-size: 20px">
                  <a class="nav-link" href="NavigateServlet?mode=testimoninal">Testimoninal</a>
              </li>
            </ul>
          </div>
          </div>
        </div>
      </nav>
    <!-- end header menu -->
