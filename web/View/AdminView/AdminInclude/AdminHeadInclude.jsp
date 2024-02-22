 

<nav class="navbar navbar-expand-xl">
      <div class="container h-100">
        <a class="navbar-brand" href="AdminStartServlet">
          <h1 class="tm-site-title mb-0">Manager Page</h1>
        </a>
        <button
          class="navbar-toggler ml-auto mr-0"
          type="button"
          data-toggle="collapse"
          data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <i class="fas fa-bars tm-nav-icon"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mx-auto h-100">
            <li ${active==4? "class='nav-item active'":"class='nav-item'"}>
                <a class="nav-link" href="AdminServlet?mode=storeManage">
                    <i class="fas fa-tachometer-alt"></i>
                       Manage Store
                    <span class="sr-only">(current)</span>
                </a>
            </li>
            <li ${active==2? "class='nav-item active'":"class='nav-item'"} >
              <a class="nav-link" href="AdminServlet?mode=productManage">
                <i class="fas fa-shopping-cart"></i>Manage Product
              </a>
            </li>
            <li ${active==1? "class='nav-item active'":"class='nav-item'"}>
              <a class="nav-link" href="AdminServlet?mode=orderAll">
                <i class="far fa-file-alt"></i> Manage Order
              </a>
            </li>
            <li ${active==3? "class='nav-item dropdown active'":"class='nav-item dropdown'"}>
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdown"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false">
                <i class="fas fa-user"></i>
                <span> Manage Account <i class="fas fa-angle-down"></i> </span>
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="AdminServlet?mode=staffAccount">Staff Account</a>
                <a class="dropdown-item" href="AdminServlet?mode=customerAccount">Customer Account</a>
              </div>
            </li>
          </ul>
          <ul class="navbar-nav">
            <li class="nav-item ${active==5?'active':''}">
                <a class="d-block nav-link" href="AdminServlet?mode=personalProfile">Hello ${sessionScope.account.getIsAdmin()==1?"Admin":"Staff"}!!</a>
            </li>
            <li class="nav-item">
                <a class="d-block nav-link" href="AdminServlet?mode=logout"><b>Logout</b></a>
            </li>
          </ul>
        </div>
      </div>
    </nav>