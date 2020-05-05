<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="dao.DAOFactory"%>
<%@page import="bean.User"%>

<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>添新</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">
  <link href="css/avatar.css" rel="stylesheet">
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
          <div class="row mt-4 mb-4">
            <div class="col col-sm-0 col-md-11">
            </div>
            <div class="col col-sm-12 col-md-1">
                <a href="userlist.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="margin-right: auto;">
                  <span class="icon text-white-50"><i class="fa fa-chevron-left"></i></span>
              </a>
            </div>
          </div>
          <form role="form" action="AddUserAction" method="post" enctype="multipart/form-data">
            <div class="row">
              <div class="col-lg-5">
	          	<div class="p-5">
	          	  <h1 class="h4 text-gray-900 mb-4" style="text-align: center">用户照片</h1>
	          	  <div class="avatar-wrapper">
	                  <img id="avatar_image" class="profile-pic" src="" />
	                  <div class="upload-button">
	                    <i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
	                  </div>
	                  <input class="file-upload" name="file_upload" type="file" accept="image/*"/>
	              </div>
	          	</div>
              </div>
	          <div class="col-lg-7">
	            <div class="p-5">
	              <div class="text-center">
	                <h1 class="h4 text-gray-900 mb-4">添加新用户</h1>
	              </div>
	              
	                <div class="form-group row">
	                  <div class="col-sm-6 mb-3 mb-sm-0">
	                    <label for="uname">用户名</label>
	                    <input type="text" class="form-control bg-dark text-white border-0 small" id="uname" name="username">
	                  </div>
	                  <div class="col-sm-6">
	                    <label for="uname">性别</label>
	                    <select id="sex" name="sex" class="form-control bg-dark border=0 small text-white">
	                    	<option value=1>男</option>
                        	<option value=0>女</option>
                        	<option value=2>保密</option>
	                    </select>
	                  </div>
	                </div>
					<div class="form-group row">
	                  <div class="col-sm-6 mb-3 mb-sm-0">
	                    <label for="uname">密码</label>
	                    <input type="text" class="form-control bg-dark text-white border-0 small" id="psd" name="pass_word">
	                  </div>
	                  <div class="col-sm-6">
	                    <label for="uname">确认密码</label>
	                    <input type="text" class="form-control bg-dark text-white border-0 small" id="cpsd" name="confirm_password">
	                  </div>
	                </div>
					<div class="form-group row">
	                  <div class="col-sm-6 mb-3 mb-sm-0">
	                    <label for="uname">电话</label>
	                    <input type="text" class="form-control bg-dark text-white border-0 small" id="tel" name="tel">
	                  </div>
					  <div class="col-sm-6 mb-3 mb-sm-0">
	                    <label for="uname">邮箱</label>
	                    <input type="text" class="form-control bg-dark text-white border-0 small" id="email" name="email">
	                  </div>
	                </div>
	                <hr><hr>
	                <button type="submit"  class="d-none d-sm-inline-block btn btn-block btn-primary shadow-sm">
	                  	提交
	                </button>
	            </div>
	          </div>
            </div>
          </form>
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
<script>
	$(function() {
		var readURL = function(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	
	            reader.onload = function (e) {
	                $('.profile-pic').attr('src', e.target.result);
	            }
	    
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	   
	    $(".file-upload").on('change', function(){
	        readURL(this);
	    });
	    
	    $(".upload-button").on('click', function() {
	       $(".file-upload").click();
	    }); 
	});
</script>
</body>

</html>
