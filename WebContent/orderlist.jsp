<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Order List</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">

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
          <h1 class="h3 mb-4 text-gray-800">Order Record</h1>

          <!-- DataTales Example -->
          <div class="card shadow bg-border-dark-with-same-bg mb-4">
            <div class="card-header bg-header-dark py-3">
              <h6 class="m-0 font-weight-bold text-primary">Order Record</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Order Num</th>
                      <th>Submit Date</th>
                      <th>User Name</th>
                      <th>Sum of Order</th>
                      <th>Payment Way</th>
                      <th>Order Record</th>
                      <th>Operation</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Order Num</th>
                      <th>Submit Date</th>
                      <th>User Name</th>
                      <th>Sum of Order</th>
                      <th>Payment Way</th>
                      <th>Order Record</th>
                      <th>Operation</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>10/04/2020</td>
                      <td>Edinburgh</td>
                      <td>$320,800</td>
                      <td>Credit Card</td>
                      <td>
                      	<select class="bg-header-dark text-light">
                        <option>Pending</option>
                        <option>Cancel</option>
                        <option>Finish</option>
                        </select>
                      </td>
                      <td style="text-align: center;">
                      	<a href="orderinfo.jsp" style="padding-right: 5px;"><i class="fa fa-eye"></i></a>
                      </td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>10/04/2020</td>
                      <td>Edinburgh</td>
                      <td>$320,800</td>
                      <td>Cash</td>
                      <td>
                      	<select class="bg-header-dark text-light">
                        <option>Pending</option>
                        <option>Cancel</option>
                        <option>Finish</option>
                        </select>
                      </td>
                      <td style="text-align: center;">
                      	<a href="orderinfo.jsp" style="padding-right: 5px;"><i class="fa fa-eye"></i></a>
                      </td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>10/04/2020</td>
                      <td>Edinburgh</td>
                      <td>$320,800</td>
                      <td>Cash</td>
                      <td>
                      	<select class="bg-header-dark text-light">
                        <option>Pending</option>
                        <option>Cancel</option>
                        <option>Finish</option>
                        </select>
                      </td>
                      <td style="text-align: center;">
                      	<a href="orderinfo.jsp" style="padding-right: 5px;"><i class="fa fa-eye"></i></a>
                      </td>
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
            <span aria-hidden="true">×</span>
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
