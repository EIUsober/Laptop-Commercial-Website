<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>New Account</title>
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
      <p class="${mess==null ? " ": "alert-danger alert" }">${mess}</p>
    <div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
                <h2 class="tm-block-title d-inline-block">Create New Account</h2>
              </div>
            </div>
           <form action="AdminServlet?mode=createConfirm" class="tm-edit-product-form" method="post" enctype="multipart/form-data">
            <div class="row tm-edit-product-row">
              <div class="col-xl-6 col-lg-6 col-md-12">
                
                  <div class="form-group mb-3">
                    <label
                      for="email"
                      >Email
                    </label>
                    <input
                      id="email"
                      name="email"
                      type="email"
                      class="form-control validate"
                      placeholder="Enter Email"
                      required
                    />
                  </div>
                  <div class="form-group mb-3">
                    <label
                      for="pass"
                      >Password
                    </label>
                    <input
                      id="pass"
                      name="pass"
                      type="password"
                      class="form-control validate"
                      placeholder="Enter password"
                      required
                    />
                  </div>
                  <div class="form-group mb-3">
                    <label
                      for="confirmPass"
                      >Confirm Password
                    </label>
                    <input
                      id="confirmPass"
                      name="confirmPass"
                      type="password"
                      class="form-control validate"
                      placeholder="Pleas enter password again to confirm"
                      required
                    />
                  </div>
                  <div class="form-group mb-3">
                    <label
                      for="name"
                      >Full Name
                    </label>
                    <input
                      id="name"
                      name="name"
                      type="text"
                      class="form-control validate"
                      placeholder="Enter full name"
                      required
                    />
                  </div>
                  <div class="form-group mb-3">
                    <label
                      for="gender"
                      >Gender</label
                    >
                    <select
                      class="custom-select tm-select-accounts"
                      id="gender"
                      name="gender"
                    >
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                  </div>
                  <div class="form-group mb-3">
                    <label
                      for="phone"
                      >Phone Number
                    </label>
                    <input
                      id="phone"
                      name="phone"
                      type="number"
                      class="form-control validate"
                      placeholder="Enter phone number"
                      require
                    />
                  </div>
                  <div class="form-group mb-3">
                    <label
                      for="address"
                      >Address</label
                    >
                    <textarea
                      class="form-control validate"
                      id="address"
                      rows="3"
                      name="address"
                      placeholder="Enter address"
                      required
                    ></textarea>
                  </div>
                  <div class="form-group mb-3">
                    <label
                      for="role"
                      >Role</label
                    >
                    <select
                      class="custom-select tm-select-accounts"
                      id="role"
                      name="role"
                      require
                    >
                        <option ${sessionScope.account.getIsAdmin()==1?"":"disabled"}  value="Admin">Admin</option>
                        <option ${sessionScope.account.getIsAdmin()==1?"":"disabled"} value="Staff">Staff</option>
                        <option value="Customer">Customer</option>
                    </select>
                  </div>
                   
<!--                      <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="expire_date"
                            >Expire Date
                          </label>
                          <input
                            id="expire_date"
                            name="expire_date"
                            type="text"
                            class="form-control validate"
                            data-large-mode="true"
                          />
                        </div>-->
<!--                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="stock"
                            >Units In Stock
                          </label>
                          <input
                            id="stock"
                            name="stock"
                            type="text"
                            class="form-control validate"
                            required
                          />
                        </div>-->

                  
              </div>
              <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                <div class="tm-product-img-dummy mx-auto">
                  <i
                    class="fas fa-cloud-upload-alt tm-upload-icon"
                    onclick="document.getElementById('fileInput').click();"
                  ></i>
                </div>
                <div class="custom-file mt-3 mb-3">
                  <input hidden name="image" id="fileInput" type="file" require />
                  <input
                    type="button"
                    class="btn btn-primary btn-block mx-auto"
                    value="UPLOAD IMAGE"
                    onclick="document.getElementById('fileInput').click();"
                  />
                </div>
              </div>
              <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block text-uppercase">CREATE</button>
              </div>
           </div>
        </form>
          </div>
        </div>
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
