<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.DAOFactory"%>
<%@ page import="bean.Items"%>
<%!
	List<Items> itemsRecords;
	Items items;
	Iterator<Items> iterateItems;
%>
<%
	DAOFactory dao = DAOFactory.getDao();
	itemsRecords = dao.getAllItems();
	iterateItems = itemsRecords.iterator();
%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>添加品牌</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">
  <link href="css/avatar.css" rel="stylesheet">
  <style>
 	div.fileinputs {
		position: relative;
	}

	div.fakefile {
		position: absolute;
		top: 0px;
		left: 0px;
		z-index: 1;
		background-color: black !important;
	}
	
	input.file {
		position: relative;
		text-align: right;
		-moz-opacity:0 ;
		filter:alpha(opacity: 0);
		opacity: 0;
		z-index: 2;
		background-color: black !important;
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
	            <div class="col col-sm-12 col-md-11"></div>
	            <div class="col col-sm-12 col-md-1">
	              <a href="brandlist.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="margin-right: auto;">
	                  <span class="icon text-white-50"><i class="fa fa-chevron-left"></i></span>
	              </a>
	            </div>
	        </div>
	        <form role="form" action="AddBrandAction" method="post" enctype="multipart/form-data">
	          	<div class="row">
	          	  <div class="col-lg-5">
		          	  <div class="p-5">
		          	  	<h1 class="h4 text-gray-900 mb-4" style="text-align: center">品牌商标</h1>
		          	  	<div class="avatar-wrapper">
		          	  		<img id="avatar_image" class="profile-pic" src="" />
			                <div class="upload-button">
			                	<i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
			                </div>
			                <input class="file-upload" name="file-upload" type="file" accept="image/*"/>
			            </div>
			          </div>
			      </div>
		          <div class="col-lg-7">
		            <div class="p-5">
		              <div class="text-center">
		                <h1 class="h4 text-gray-900 mb-4">品牌细节</h1>
		              </div>
		              
		                <div class="form-group row">
		                  <label class="col col-sm-12 col-mb-2" for="name">品牌</label>
		                  <div class="col col-sm-12 col-mb-8">
		                    <input type="text" class="form-control bg-dark text-white border-0 small" id="name" name="name" value="">
		                  </div>
		                </div>
						<div class="form-group row">
						  <label class="col col-sm-12 col-mb-2" for="type">类型</label>
						  <div class="col col-sm-12 col-mb-10">
		                    <select id="type" name="type" class="form-control bg-dark border=0 small text-white">
		                    	<option value=1>普通</option>
	                        	<option value=2>首页展示</option>
		                    </select>
		                  </div>
		                </div>
		                <hr><hr><hr>
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

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>
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
