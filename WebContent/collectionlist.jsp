<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.DAOFactory"%>
<%@page import="bean.Items"%>
<%@page import="bean.Collection"%>

<%! List<Items> itemList;
	List<Collection> collectionList;
	Items item;
	Collection collection;
	Iterator<Items> iterateItem;
	Iterator<Collection> iterateCollection;
	List<String> product_ids; %>

<%
	DAOFactory dao = DAOFactory.getDao();
	itemList = dao.getAllItems();
	product_ids = new ArrayList<String>();
	collectionList = dao.getAllCollection();
	iterateItem = itemList.iterator();
	iterateCollection = collectionList.iterator();
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>采集</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.css" rel="stylesheet">
<style>
#userDataTable th {
	text-align: center;
}

#userDataTable td {
	text-align: center;
}
</style>

<script type="text/javascript">
	function editCollection(collection_id)
	{
		document.location.href = "collectionedit.jsp?collection_id=" + collection_id; 
	}

  	function deleteCollection(collection_id)
	{
 		if(window.confirm('您确定要删除吗？?')) {
 			document.location.href = "collectiondelete.jsp?collection_id=" + collection_id;	
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
							<a class="btn btn-primary" href="collectionadd.jsp"><i
								class="fa fa-plus"></i> 添新</a>
						</div>
					</div>


					<!-- DataTales -->
					<div class="card shadow bg-border-dark-with-same-bg mb-4">
						<div class="card-header bg-header-dark py-3">
							<h6 class="m-0 font-weight-bold">采集</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="userDataTable">
									<thead>
										<tr>
											<th>标题</th> <!-- title -->
											<th>介绍</th> <!-- introduction -->
											<th>类型</th> <!-- type -->
											<th>使用</th> <!-- on_use -->
											<th>商品</th> <!-- product_id -->
											<th>操作</th>
										</tr>
									</thead>

									<tbody>
										<%
											while (iterateCollection.hasNext()) {
											collection = iterateCollection.next();
											String[] productIDs = collection.getProductId().split(",");
											product_ids.clear();
											for(String productID : productIDs) {
												for(Items item : itemList) {
													if(productID.equals(Integer.toString(item.getId()))) {
														product_ids.add(item.getName());
													}
												}
											}
										%>
										<tr>
											<td><%= collection.getTitle() %></td>
											<td><%= collection.getIntro() %></td>
											<td><%= collection.getType() == 1 ? "独家" : collection.getType() == 2 ? "其他" : "列表外展示" %></td>
											<td><%= collection.getOnUse() == 0 ? '否' : '是' %></td>
											<td>
												<% for(String product : product_ids) { %>
													<button class="btn btn-info"><%= product %></button>
												<% } %>
											</td>
											<td>
												<button class="btn btn-primary"
													onclick="editCollection(<%= collection.getId() %>);">
													<i class="fa fa-edit"></i>
												</button>
												<button class="btn btn-primary"
													onclick="deleteCollection(<%= collection.getId() %>);">
													<i class="fa fa-trash" aria-hidden="true"></i>
												</button>
											</td>
										</tr>
										<%
											}
										%>

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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">准备离开?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">�</span>
					</button>
				</div>
				<div class="modal-body">如果您准备结束当前会话，请在下面选择 "退出"</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">取消</button>
					<a class="btn btn-primary" href="login.jsp">退出</a>
				</div>
			</div>
		</div>
	</div>

	<%@include file="scripts.jsp"%>
	<script>
		/* $(function() {
			$('#userDataTable').DataTable({
				"language" : { "url" : "//cdn.datatables.net/plug-ins/1.10.20/i18n/Chinese.json" }
			});		
		}); */
	</script>
</body>

</html>
