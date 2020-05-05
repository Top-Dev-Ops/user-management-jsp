<!-- Sidebar -->
<%@ page pageEncoding="UTF-8"%>
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <li>
      	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
	        <span class="sidebar-brand-icon rotate-n-15">
	          <i class="fas fa-laugh-wink"></i>
	        </span>
        <span class="sidebar-brand-text mx-3">Fengmao</span>
      </a>
      </li>
      

      <!-- Divider -->
      <li><hr class="sidebar-divider my-0"></li>

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#HomePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fa fa-home"></i>
          <span>&nbsp;&nbsp;首页</span>
        </a>
        <div id="HomePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar" style="z-index:1000;">
          <div class="page-nav-bg py-2 collapse-inner rounded">
          	<a class="collapse-item" href="index.jsp">
          		<i class="fas fa-folder"></i>&nbsp;&nbsp;
          		<span>仪表板</span>
          	</a>
            <a class="collapse-item" href="#">
            	<i class="fas fa-folder"></i>&nbsp;&nbsp;
            	<span>系统首页</span>
            </a>
            <a class="collapse-item" href="#">
          		<i class="fas fa-folder"></i>&nbsp;&nbsp;
          		<span>账户设置</span>
          	</a>
          	<a class="collapse-item" href="#">
          		<i class="fas fa-folder"></i>&nbsp;&nbsp;
          		<span>系统信息</span>
          	</a>
          	<a class="collapse-item" href="#">
          		<i class="fas fa-folder"></i>&nbsp;&nbsp;
          		<span>登录日志</span>
          	</a>
          </div>
        </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#UserPages" aria-expanded="true" aria-controls="UserPages">
          <i class="fas fa-user-tie"></i>
          <span>&nbsp;&nbsp;用户管理</span>
        </a>
        <div id="UserPages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar" style="z-index:1000;">
          <div class="page-nav-bg py-2 collapse-inner rounded">
            <a class="collapse-item" href="userlist.jsp">用户列表</a>
          </div>
        </div>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#ItemPages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-truck-moving"></i>
          <span>&nbsp;&nbsp;商品管理</span>
        </a>
        <div id="ItemPages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar" style="z-index:1000;">
          <div class="page-nav-bg py-2 collapse-inner rounded">
            <a class="collapse-item" href="itemlist.jsp">商品列表</a>
            <a class="collapse-item" href="brandlist.jsp">品牌列表</a>
            <a class="collapse-item" href="itemtype.jsp">商品类型</a>
          </div>
        </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#OrderPages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-shopping-cart"></i>
          <span>&nbsp;&nbsp;订单管理</span>
        </a>
        <div id="OrderPages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar" style="z-index:1000;">
          <div class="page-nav-bg py-2 collapse-inner rounded">
            <a class="collapse-item" href="orderrecord.jsp">订单列表</a>
            <a class="collapse-item" href="#">确认收货</a>
            <a class="collapse-item" href="#">到货提醒</a>
          </div>
        </div>
      </li>
      
      <li class="nav-item">
      	<a class="nav-link" href="#">
      		<i class="fas fa-business-time"></i>
      		<span>&nbsp;&nbsp;商业管理</span>
      	</a>
      </li>
      
      <li class="nav-item">
      	<a class="nav-link" href="collectionlist.jsp">
      		<i class="fas fa-images"></i>
      		<span>&nbsp;&nbsp;采集管理</span>
      	</a>
      </li>
            
      <!-- Divider -->
      <li><hr class="sidebar-divider"></li>

      <!-- Heading -->
      <li>
	      <div class="sidebar-heading">
	        User Account
	      </div>
      </li>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>&nbsp;&nbsp;Pages</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar" style="z-index:1000;">
          <div class="page-nav-bg py-2 collapse-inner rounded">
            <h6 class="collapse-header">Login Screens:</h6>
            <a class="collapse-item" href="login.jsp">Login</a>
            <a class="collapse-item" href="register.jsp">Register</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">Other Pages:</h6>
            <a class="collapse-item" href="404.jsp">404 Page</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <li><hr class="sidebar-divider d-none d-md-block"></li>

      
      <!-- Sidebar Toggler (Sidebar) -->
      <li class="text-center">
	      <div class="text-center d-none d-md-inline">
	        <button class="rounded-circle border-0" id="sidebarToggle"></button>
	      </div>
      </li>

    </ul>
    <!-- End of Sidebar -->