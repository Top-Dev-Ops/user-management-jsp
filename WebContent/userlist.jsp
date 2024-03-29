<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="dao.DAOFactory" %>
<%@page import="bean.User" %>

<%!
    ArrayList<User> alluser;
    List<User> userList;
    User user;
	Iterator<User> iterateUser;
%>

<% 
    DAOFactory dao = DAOFactory.getDao();
    userList = dao.getAllUser();
    iterateUser = userList.iterator();
    int user_count = userList.size();
%>    

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>用户</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">
  <style>
  	#userDataTable th { text-align: center; }
	#userDataTable td { text-align: center; }
  </style>
  
  <script type="text/javascript">
  	function deleteUser(user_id)
	{
 		if(window.confirm('您确定要删除吗？?')) {
 			document.location.href = "userdelete.jsp?user_id=" + user_id;	
 		}
 	}

  </script>

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
          <h1 class="h3 mb-4 text-gray-800"></h1>

		  <div class="row mb-4">
            <div class="col col-sm-12 col-md-2">
              <a class="btn btn-primary" href="useradd.jsp"><i class="fa fa-plus"></i> 添新</a>
            </div>
          </div>
		  

          <!-- DataTales -->
          <div class="card shadow bg-border-dark-with-same-bg mb-4">
            <div class="card-header bg-header-dark py-3">
            	<h6 class="m-0 font-weight-bold">用户</h6>
            </div>
            <div class="card-body">
              <!-- <a class="btn btn-primary" href="useradd.jsp"><i class="fa fa-plus"></i> 添新</a><hr> -->
              <div class="table-responsive">
                <table class="table table-bordered" id="userDataTable">
                  <thead>
                    <tr>
                      <th>用户名</th>
                      <th>性别</th>
                      <th>电话</th>
                      <th>邮箱</th>
                      <th>真实姓名</th>
                      <th>身份证号</th>
                      <th>等级</th>
                      <th>操作</th>
                    </tr>
                  </thead>
                 
                  <tbody>
                      <% while(iterateUser.hasNext()){      
                            user = iterateUser.next();
                       %>
		                    <tr>
		                      <td><%= user.getUserName() %></td>
		                      <td><%= user.getSex() == 0? '女' : user.getSex() == 1? '男' : "保密" %></td>
		                      <td><%= user.getTel() %></td>
		                      <td><%= user.getEmail() %></td>
		                      <td><%= user.getRealName() %></td>
		                      <td><%= user.getIdCard() %></td>
		                      <td><%= user.getSellLevel() %></td>
		                      <td>
		                      	<a href="userinfo.jsp?id=<%= user.getId() %>" style="padding-right: 5px;">查看</a>&nbsp;
		                      	<a href="useredit.jsp?id=<%= user.getId() %>" style="padding-right: 5px;">编辑</a>&nbsp;
		                      	<a href="javascript:void(0);" onclick="deleteUser(<%= user.getId() %>);">删除</a>
		                      </td>
		                    </tr>		                    
                    <% } %>
                  
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
          <h5 class="modal-title" id="exampleModalLabel">准备离开?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">�</span>
          </button>
        </div>
        <div class="modal-body">如果您准备结束当前会话，请在下面选择 "退出"</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
          <a class="btn btn-primary" href="login.jsp">退出</a>
        </div>
      </div>
    </div>
  </div>

<%@include file="scripts.jsp"%>
	<script>
		$(function() {
			console.log("User count = <%= user_count %>");
		})
		/* $(function() {
			$('#userDataTable').DataTable({
				"language" : { "url" : "//cdn.datatables.net/plug-ins/1.10.20/i18n/Chinese.json" }
			});		
		}); */
	</script>
</body>

</html>
