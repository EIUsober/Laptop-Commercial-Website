<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Account Page</title>
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
        <h2 class="tm-block-title">MANAGE ${title} ACCOUNT</h2>
        <div class="tm-bg-primary-dark tm-block tm-block-products">
        <div class="tm-product-table-container">
              <table class="table table-hover tm-product-table">
                <thead>
                  <tr>
                    <th scope="col">&nbsp;</th>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Gender</th>
                    <th scope="col">Phone Number</th>
                    <th scope="col">Detail</th>
                    <th ${sessionScope.account.getIsAdmin()==1?"":"hidden"} scope="col">Delete</th>
                  </tr>
                </thead>
                <tbody>
                <c:set var="i" value="1"/>
                <c:forEach items="${listAccount}" var="c">
                  <tr>
<!--                    <th scope="row"><input type="checkbox" /></th>-->
                    <th scope="row">${i}</th>
                    <td class="tm-product-name">${c.getId()}</td>
                    <td>${c.getName()}</td>
                    <td>${c.getGender()}</td>
                    <td>${c.getPhone()}</td>
                    <td>
                      <a href="AdminServlet?mode=profile&id=${c.getId()}" class="tm-product-delete-link">
                        <i class="far fa-edit fa-lg" style="color: #eeeff2;"></i>
                      </a>
                    </td>
                    <td ${sessionScope.account.getIsAdmin()==1?"":"hidden"}>
                        <a href="AdminServlet?mode=deleteAccount&id=${c.getId()}" class="tm-product-delete-link">
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
            <a
              href="AdminServlet?mode=ceateAccount"
              class="btn btn-primary btn-block text-uppercase mb-3">CREATE A NEW ACCOUNT</a>
        </div>
    </div>
        <jsp:include page="AdminInclude/AdminFootInclude.jsp"></jsp:include>
    <script src="View/AdminView/js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="View/AdminView/js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script>
      $(function() {
        $(".tm-product-name").on("click", function() {
          window.location.href = "edit-product.html";
        });
      });
    </script>
  </body>
</html>