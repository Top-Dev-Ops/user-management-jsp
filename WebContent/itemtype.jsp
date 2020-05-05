<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>商品类型</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">
  <link href="css/submenu.css" rel="stylesheet">
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
          <!-- MultiStep Form -->
			<div class="row">
			    <div class="col-md-12">
			        <form id="msform">
			            <!-- progressbar -->
			            <ul id="vkprogressbar">
			                <li class="active"><font size="+1">选择类型</font></li>
			                <li><font size="+1">编辑信息</font></li>
			                <li><font size="+1">编辑属性</font></li>
			            </ul>
			            <!-- fieldsets -->
			            <fieldset class="bg-header-dark">
			                <div class="row">
			                	<div class="col col-md-6">
				                	<div class="form-group">
				    					<label for="exampleFormControlSelect1">选择一级类型</label>
				    					<select class="form-control" id="exampleFormControlSelect1">
				    						<option>衬衫</option>
										    <option>裤子</option>
										    <option>鞋子</option>
										    <option>袋</option>
										    <option>附件</option>
										</select>
								    </div>
			                	</div>
			                	<div class="col col-md-6">
				                	<div class="form-group">
				    					<label for="exampleFormControlSelect2">选择二级类型</label>
				    						<select class="form-control" id="exampleFormControlSelect2">
										      <option>夹克</option>
										      <option>T 恤衫</option>
										      <option>毛衣</option>
										      <option>涂层</option>
										      <option>背心</option>
										    </select>
								    </div>
			                	</div>
			                </div>
			                <input type="button" name="next" class="next action-button d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" value="下一步"/>
			            </fieldset>
			            <fieldset class="bg-header-dark">
			                 <div class="form-group row">
							    <label for="staticEmail" class="col-sm-2 col-form-label">项目名称</label>
							    <div class="col-sm-10">
							      <input type="text" readonly class="form-control" id="staticEmail">
							    </div>
							  </div>
							  <div class="form-group row">
							  <label for="staticEmail" class="col-sm-2 col-form-label">品牌</label>
							    <div class="col-sm-10">
							      <select class="form-control" id="exampleFormControlSelect3">
								      <option>选择</option>
								      <option>毛衣</option>
								      <option>裤子</option>
								    </select>
							    </div>
						      </div>
						      <div class="row">
						      <label for="staticEmail" class="col-sm-2 col-form-label">推送项目</label>
						      	<div class="col col-md-10">
						      		<div class="form-check form-check-inline">
									  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
									  <label class="form-check-label" for="inlineCheckbox1">新</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
									  <label class="form-check-label" for="inlineCheckbox2">推</label>
									</div>
						      	</div>
						      </div>
							  <div class="form-group row">
							    <label for="inputPassword" class="col-sm-2 col-form-label">项目关键字</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="inputPassword">
							    </div>
							  </div>
			                <input type="button" name="previous" class="previous action-button d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" value="上一步"/>
			                <input type="button" name="next" class="next action-button d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" value="下一步"/>
			            </fieldset>
			            <fieldset class="bg-header-dark">
			                <h2 class="fs-title" style="color: white">创建您的帐户</h2>
			                <h3 class="fs-subtitle"  style="color: white">填写您的凭证</h3>
			                <input type="text" name="email" placeholder="电子邮件"/>
			                <input type="password" name="pass" placeholder="密码"/>
			                <input type="password" name="cpass" placeholder="确认密码"/>
			                <input type="button" name="previous" class="previous action-button d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" value="上一步"/>
			                <input type="submit" name="submit" class="submit action-button d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" value="提交"/>
			            </fieldset>
			        </form>
			    </div>
			</div>
		  <!-- /.MultiStep Form -->
        </div>
        <!-- /.container-fluid -->

      <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
  </div>
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
