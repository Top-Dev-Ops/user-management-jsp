<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>订单信息</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">
  <style>
  	#orderBasicInfoDataTable th { text-align: center }
  	#orderBasicInfoDataTable td { text-align: center }
  	#orderReceiverInfoDataTable th { text-align: center }
  	#orderReceiverInfoDataTable td { text-align: center }
  	#orderItemInfoDataTable th { text-align: center }
  	#orderItemInfoDataTable td { text-align: center }
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

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">订单记录</h1>

          <!-- DataTales Example -->
          <div class="card shadow bg-border-dark-with-same-bg mb-4">
            <div class="card-header bg-header-dark py-3">
              <h6 class="m-0 font-weight-bold text-primary">基础信息</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="orderBasicInfoDataTable">
                  <thead>
                    <tr>
                      <th>Order Num</th>
                      <th>user Name</th>
                      <th>Payment Way</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Order Num</th>
                      <th>user Name</th>
                      <th>Payment Way</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>10/04/2020</td>
                      <td>Edinburgh</td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>10/04/2020</td>
                      <td>Edinburgh</td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>10/04/2020</td>
                      <td>Edinburgh</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

		  <!-- DataTales Example -->
          <div class="card shadow bg-border-dark-with-same-bg mb-4">
            <div class="card-header bg-header-dark py-3">
              <h6 class="m-0 font-weight-bold text-primary">收件人信息</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="orderReceiverInfoDataTable">
                  <thead>
                    <tr>
                      <th>Receiver Name</th>
                      <th>Phone Num</th>
                      <th>Post Code</th>
                      <th>Address</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Receiver Name</th>
                      <th>Phone Num</th>
                      <th>Post Code</th>
                      <th>Address</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>10/04/2020</td>
                      <td>Edinburgh</td>
                      <td>$320,800</td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>10/04/2020</td>
                      <td>Edinburgh</td>
                      <td>$320,800</td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>10/04/2020</td>
                      <td>Edinburgh</td>
                      <td>$320,800</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

		  <!-- DataTales Example -->
          <div class="card shadow bg-border-dark-with-same-bg mb-4">
            <div class="card-header bg-header-dark py-3">
              <h6 class="m-0 font-weight-bold text-primary">项目信息</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="orderItemInfoDataTable">
                  <thead>
                    <tr>
                      <th>Item Pic</th>
                      <th>Item Detail</th>
                      <th>Price</th>
                      <th>Attribute</th>
                      <th>Account</th>
                      <th>Pay Price</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Item Pic</th>
                      <th>Item Detail</th>
                      <th>Price</th>
                      <th>Attribute</th>
                      <th>Account</th>
                      <th>Pay Price</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <tr>
                      <td><img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60"></td>
                      <td>10/04/2020</td>
                      <td>Edinburgh</td>
                      <td>$320,800</td>
                      <td>Credit Card</td>
                      <td>Credit Card</td>
                    </tr>
                    <tr>
                      <td><img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60"></td>
                      <td>10/04/2020</td>
                      <td>Edinburgh</td>
                      <td>$320,800</td>
                      <td>Cash</td>
                      <td>Cash</td>
                    </tr>
                    <tr>
                      <td><img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60"></td>
                      <td>10/04/2020</td>
                      <td>Edinburgh</td>
                      <td>$320,800</td>
                      <td>Cash</td>
                      <td>Cash</td>
                    </tr>
                  </tbody>
                </table>
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
<script>
	$(function() {
		$('#orderBasicInfoDataTable').DataTable({
			"language" : { "url" : "//cdn.datatables.net/plug-ins/1.10.20/i18n/Chinese.json" }
		});	
		$('#orderReceiverInfoDataTable').DataTable({
			"language" : { "url" : "//cdn.datatables.net/plug-ins/1.10.20/i18n/Chinese.json" }
		});
		$('#orderItemInfoDataTable').DataTable({
			"language" : { "url" : "//cdn.datatables.net/plug-ins/1.10.20/i18n/Chinese.json" }
		});
	});
</script>
</body>

</html>
