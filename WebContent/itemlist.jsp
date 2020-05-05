<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="dao.DAOFactory"%>
<%@ page import="bean.Items"%>
<%@ page import="bean.Brand"%>
<%@ page import="bean.Category"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%!List<Items> itemsRecords;
	List<Brand> brandRecords;
	List<Category> categoryRecords;
	Items items;
	Brand brand;
	Category category;
	Iterator<Items> iterateItems;
	Iterator<Brand> iterateBrand;
	Iterator<Category> iterateCategory;%>
<%
	DAOFactory dao = DAOFactory.getDao();
itemsRecords = dao.getAllItems();
brandRecords = dao.getAllBrand();
categoryRecords = dao.getAllCategory();
iterateItems = itemsRecords.iterator();
iterateBrand = brandRecords.iterator();
iterateCategory = categoryRecords.iterator();

ObjectMapper mapper = new ObjectMapper();

String itemsJson = "";
String brandJson = "";
String categoryJson = "";
try {
	itemsJson = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(itemsRecords);
	brandJson = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(brandRecords);
	categoryJson = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(categoryRecords);
} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html； charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>商品列表</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.css" rel="stylesheet">

<style>
	.avatar-wrapper {
	   position: relative;
	   height: 200px;
	   width: 200px;
	   margin: 50px auto;
	   border-radius: 50%;
	   overflow: hidden;
	   /* box-shadow: 1px 1px 15px -5px black; */
	   transition: all 0.3s ease;
	}
	.avatar-wrapper:hover {
	   transform: scale(1);
	   cursor: pointer;
	}
	.avatar-wrapper:hover .profile-pic {
	   opacity: 0.5;
	}
	.avatar-wrapper .profile-pic {
	   height: 100%;
	   width: 100%;
	   transition: all 0.3s ease;
	}
	.avatar-wrapper .profile-pic:after {
	   font-family: FontAwesome;
	   content: "\f007";
	   top: 0;
	   left: 0;
	   width: 100%;
	   height: 100%;
	   position: absolute;
	   /* font-size: 190px; */
	   background: #ecf0f1;
	   color: #34495e;
	   text-align: center;
	}
	.avatar-wrapper .upload-button {
	   position: absolute;
	   top: 0;
	   left: 0;
	   height: 100%;
	   width: 100%;
	}
	.avatar-wrapper .upload-button .fa-arrow-circle-up {
	   position: absolute;
	   font-size: 230px;
	   top: -15px;
	   left: -7px;
	   text-align: center;
	   opacity: 0;
	   transition: all 0.3s ease;
	   color: #34495e;
	}
	.avatar-wrapper .upload-button:hover .fa-arrow-circle-up {
	   opacity: 0.9;
	}
	#itemDataTable th {
		text-align: center;
	}
	
	#itemDataTable td {
		text-align: center;
	}
	
	select {
		color: black;
	}
	
	option {
		color: black;
		background-color: white;
	}
</style>

<script type="text/javascript">
	function editItems(item_id) {
		console.log(item_id);
		document.location.href = "itemedit.jsp?items_id=" + item_id; 
	}

 	function deleteItems(items_id)
	{
 		if(window.confirm('您确定要删除吗？?')) {
 			document.location.href = "itemdelete.jsp?items_id=" + items_id;	
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
					<h1 class="h3 mb-4 text-gray-800">所有商品清单</h1>
					<div class="row mb-4">
						<div class="col col-sm-12 col-md-2">
							<a class="btn btn-primary" href="itemadd.jsp"><i
								class="fa fa-plus"></i> 添新</a>
						</div>
					</div>
					<!-- DataTales Example -->
					<div class="card shadow bg-border-dark-with-same-bg mb-4">
						<div class="card-header bg-header-dark py-3">
							<h6 class="m-0 font-weight-bold text-primary">所有商品</h6>
						</div>

						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="itemDataTable">
									<thead>
										<tr>
											<th style="width: 10%">编号</th>
											<th style="width: 10%">照片</th>
											<th style="width: 35%">产品名</th>
											<th>价格</th>
											<th style="width: 10%">发布日期</th>
											<th>审核状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<%
											while (iterateItems.hasNext()) {
											items = iterateItems.next();
										%>
										<tr id="<%=items.getId()%>">
											<td><%=items.getProductNum()%></td>
											<td><img class="img-profile" style="max-height: 40px; max-width: 40px" 
												src="resources/images/products/<%= items.getPic()%>"></td>
											<td><%=items.getName()%></td>
											<td><%=items.getPrice()%></td>
											<td><%=items.getPublishTime()%></td>
											<td><%=items.getStatus() == 0 ? "未审核" : items.getStatus() == 1 ? "已通过" : items.getStatus() == 2? "未通过"
												: items.getStatus() == 3 ? "已下架" : items.getStatus() == 4 ? "已售出" : "已删除"%>
											</td>
											<td>
												<button class="btn btn-primary"
													onclick="editItems(<%= items.getId()%>);">
													<i class="fa fa-edit"></i>
												</button>
												<button class="btn btn-primary"
													onclick="deleteItems(<%=items.getId()%>);">
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
	<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<strong id="exampleModalLabel" class="modal-title">商品编辑</strong>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form role="form" action="EditItemAction" method="post" enctype="multipart/form-data">
						<div class="avatar-wrapper">
							<img id="avatar_image" class="profile-pic"
								src="" />
							<div class="upload-button">
								<i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
							</div>
							<input class="file-upload" name="file_upload" type="file" accept="image/*" />
						</div>
						<input type="hidden" id="item_id" name="item_id">
						<div class="row">
							    <div class="col-lg-6">
									<div class="form-group">
										<label>商品编号</label> <input id="product_num" type="text"
											name="product_num" placeholder="商品编号" class="form-control">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label>商品名称</label> <input id="name" name="name" type="text"
											placeholder="商品名称" class="form-control">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label>状态</label> <select id="status" name="status"
											class="form-control border=0 
										small">
											<option value=0>未审核</option>
											<option value=1>已通过</option>
											<option value=2>未通过</option>
											<option value=3>已下架</option>
											<option value=4>已售出</option>
											<option value=6>已删除</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label>价格</label> <input id="price" type="text" name="price"
											placeholder="价格" class="form-control">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label>商品介绍</label> <input id="intro" type="text" name="intro"
											placeholder="商品介绍" class="form-control">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label>剩余数量</label> <input id="count" type="text"
											placeholder="剩余数量" name="count" class="form-control">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label>品牌</label> <select class="form-control mb-3" id="brand"
											name="brand">
											<%
												while (iterateBrand.hasNext()) {
												brand = iterateBrand.next();
											%>
											<option><%=brand.getName()%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label>分类</label> <select id="category" name="category"
											class="form-control mb-3">
											<%
												while (iterateCategory.hasNext()) {
												category = iterateCategory.next();
											%>
											<option value=<%=category.getId()%>><%=category.getName()%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
								<div class="col-lg-12">
									<br><hr>
								</div>
								<div class="col-lg-6 ml-auto">
									<button type="submit" class="d-none d-sm-inline-block btn
							 			btn-block btn-primary shadow-sm">提交</button>	
								</div>
								<div class="col-lg-6 ml-auto">
									<button id="close" type="button" data-dismiss="modal"
							 		 class="d-none d-sm-inline-block btn
							 			btn-block btn-secondary shadow-sm ml-auto">关闭</button>	
								</div>
							</div>
					</form>
				</div>
			</div>
		</div>
	</div>

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
	$(function() {
		var item;
		var table = $('#itemDataTable').DataTable({
			"language" : { "url" : "//cdn.datatables.net/plug-ins/1.10.20/i18n/Chinese.json" }
		});
		
		var readURL = function(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('.profile-pic').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$(".file-upload").on('change', function() {
			readURL(this);
		});

		$(".upload-button").on('click', function() {
			$(".file-upload").click();
		});
		
		$('.item_edit').click(function() {
			var id = $(this).parent().parent().attr("id");
			var itemsJson = <%=itemsJson%>;
			for(var i = 0 ; i< itemsJson.length; i++){
				item = itemsJson[i];
		        if(id == item.id) break;
			}
			$('#item_id').val(item.id);
			$('#product_num').val(item.productNum);
			$('#name').val(item.name);
			$('#status').val(item.status);
			$('#price').val(item.price);
			$('#intro').val(item.intro);
			$('#count').val(item.count);
			$('#brand').val(item.brand);
			$('#category').val(item.category);
			console.log("resources/images/products/" + item.pic);
			$('#avatar_image').attr('src', "resources/images/products/" + item.pic);
		});
	});
</script>
</body>

</html>