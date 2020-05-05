<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="dao.DAOFactory"%>
<%@page import="bean.User"%>
<%!
	User userRecord;
%>
<%
	int user_id=Integer.parseInt(request.getParameter("id")); 	
	DAOFactory dao = DAOFactory.getDao();
	userRecord = dao.getUser(user_id);
%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>用户信息</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">
  <style>
  	.avatar-wrapper {
         position: relative;
         height: 323px;
         width: 323px;
         margin: 50px auto;
         border-radius: 50%;
         overflow: hidden;
         box-shadow: 1px 1px 15px -5px black;
         transition: all 0.3s ease;
      } 
      .avatar-wrapper .profile-pic {
         height: 100%;
         width: 100%;
      }
  </style>
</head>

<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">

    <%@include file="sidebar.jsp"%>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <%@include file="topbar.jsp"%>

        <!-- Begin Page Content -->
        <div class="container-fluid">
          <div class="row mb-4">
            <div class="col col-sm-12 col-md-11">
              <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                <span class="icon text-white-50"><i class="fas fa-list"></i></span>
                <span class="text">用户信息</span>
              </a>&nbsp;&nbsp;
              <a href="addresslist.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                <span class="icon text-white-50"><i class="fas fa-address-card"></i></span>
                <span class="text">地址清单</span>
              </a>&nbsp;&nbsp;
              <a href="orderrecord.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                 <span class="icon text-white-50"><i class="fas fa-shopping-cart"></i></span>
                 <span class="text">订单记录</span>
              </a>
            </div>
            <div class="col col-sm-12 col-md-1">
              <a href="userlist.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="margin-right: auto;">
                  <span class="icon text-white-50"><i class="fa fa-chevron-left"></i></span>
              </a>
            </div>
          </div>
          <div class="row mt-4 mb-4">
          <div class="col-lg-5">
          	<div class="p-5">
	          	  <h1 class="h4 text-gray-900 mb-4" style="text-align: center">用户照片</h1>
	          	  <div class="avatar-wrapper">
	                  <img id="avatar_image" class="profile-pic" src="resources/images/users/<%= userRecord.getHeadPic() %>" />
	                  <div class="upload-button">
	                    <i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
	                  </div>
	                  <input class="file-upload" type="file" accept="image/*"/>
	              </div>
	        </div>
          </div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">用户信息</h1>
              </div>
              <form class="user">
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <label for="uname">用户名</label>
                    <input type="text" class="form-control bg-dark text-white border-0 small" id="uname" value="<%=userRecord.getUserName() %>" disabled>
                  </div>
                  <div class="col-sm-6">
                    <label for="uname">性别</label>
                    <input type="text" class="form-control bg-dark text-white border-0 small" id="sex" value="<%= userRecord.getSex() == 0? '女' : userRecord.getSex() == 1? '男' : String.format("%s", "保密") %>" disabled>
                  </div>
                </div>
				<div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <label for="uname">邮箱</label>
                    <input type="text" class="form-control bg-dark text-white border-0 small" id="email" value="<%=userRecord.getEmail()%>" disabled>
                  </div>
                  <div class="col-sm-6">
                    <label for="uname">电话</label>
                    <input type="text" class="form-control bg-dark text-white border-0 small" id="pn" value="<%=userRecord.getTel()%>" disabled>
                  </div>
                </div>
				<div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <label for="uname">用户状态</label>
                    <input type="text" class="form-control bg-dark text-white border-0 small" id="status" value="<%=userRecord.getStatus() %>" disabled>
                  </div>
                  <div class="col-sm-6">
                    <label for="uname">个人介绍</label>
                    <input type="text" class="form-control bg-dark text-white border-0 small" id="intro" value="<%=userRecord.getIntro() %>" disabled>
                  </div>
                </div>
				<div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <label for="uname">真实姓名</label>
                    <input type="text" class="form-control bg-dark text-white border-0 small" id="rname" value="<%=userRecord.getRealName() %>" disabled>
                  </div>
                  <div class="col-sm-6">
                    <label for="uname">身份证号</label>
                    <input type="text" class="form-control bg-dark text-white border-0 small" id="idcard" value="<%=userRecord.getIdCard() %>" disabled>
                  </div>
                </div>
               </form>
            </div>
          </div>
        </div>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">�</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.jsp">Logout</a>
        </div>
      </div>
    </div>
  </div>

<%@include file="scripts.jsp"%>

</body>

</html>
