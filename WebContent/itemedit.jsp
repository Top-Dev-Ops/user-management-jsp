<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="dao.DAOFactory"%>
<%@page import="bean.Brand"%>
<%@page import="bean.Category"%>
<%@page import="bean.Items"%>
<%!Items itemRecord;
List<Brand> brandRecords;
List<Category> categoryRecords;
Brand brand;
Category category;
Iterator<Brand> iterateBrand;
Iterator<Category> iterateCategory;
%>
<%
	int item_id = Integer.parseInt(request.getParameter("items_id"));
	int index = 1;
	DAOFactory dao = DAOFactory.getDao();
	itemRecord = dao.getItem(item_id);
	brandRecords = dao.getAllBrand();
	categoryRecords = dao.getAllCategory();
	iterateBrand = brandRecords.iterator();
	iterateCategory = categoryRecords.iterator();
	String[] all_temp_urls = itemRecord.getAllPic().split(",");
	String[] all_urls = new String[6];
	if(all_temp_urls.length == 6) {
		for(int i = 0; i < 6; i++) {
			all_urls[i] = all_temp_urls[i];
		}
	} else {
		for(int i = 0; i < all_temp_urls.length; i++) {
			all_urls[i] = all_temp_urls[i];
		}
		for(int i = all_temp_urls.length; i < 6; i++) {
			all_urls[i] = "";
		}
	}
	
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

<title>用户编辑</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.css" rel="stylesheet">
<link href="css/avatar.css" rel="stylesheet">

</head><body id="page-top">

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
						<div class="col col-sm-0 col-md-11"></div>
						<div class="col col-sm-12 col-md-1">
							<a href="itemlist.jsp"
								class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
								style="margin-right: auto;"> <span
								class="icon text-white-50"><i class="fa fa-chevron-left"></i></span>
							</a>
						</div>
					</div>
					<form role="form"
						action="EditItemAction?id=<%=itemRecord.getId()%>" method="post" enctype="multipart/form-data">
						<input type="hidden" id="item_id" name="item_id" value=<%= itemRecord.getId() %>>
						<div class="row">
							<div class="col-lg-5">
								<div class="p-5">
									<h1 class="h4 text-gray-900 mb-4" style="text-align: center">商品照片</h1>
									<div class="avatar-wrapper">
										<img id="avatar_image" class="profile-pic"
											src="resources/images/products/<%= itemRecord.getPic()%>" />
										<div class="upload-button">
											<i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
										</div>
										<input class="file-upload" type="file" name="file_upload" accept="image/*" />
									</div>
								</div>
							</div>
							<div class="col-lg-7">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">商品编辑</h1>
									</div>
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<label for="uname">商品编号</label> <input type="text"
												class="form-control bg-dark text-white border-0 small"
												id="product_num" name="product_num"
												value="<%= itemRecord.getProductNum() %>">
										</div>
										<div class="col-sm-6">
											<label>商品名称</label> <input id="name" name="name" type="text"
												placeholder="商品名称" class="form-control" value="<%= itemRecord.getName() %>">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-6">
											<label>状态</label> <select id="status" name="status"
													class="form-control border=0 small">
													<option value=0 <%= itemRecord.getStatus() == 0 ? "selected" : "" %>>未审核</option>
													<option value=1 <%= itemRecord.getStatus() == 1 ? "selected" : "" %>>已通过</option>
													<option value=2 <%= itemRecord.getStatus() == 2 ? "selected" : "" %>>未通过</option>
													<option value=3 <%= itemRecord.getStatus() == 3 ? "selected" : "" %>>已下架</option>
													<option value=4 <%= itemRecord.getStatus() == 4 ? "selected" : "" %>>已售出</option>
													<option value=6 <%= itemRecord.getStatus() == 6 ? "selected" : "" %>>已删除</option>
											</select>
										</div>
										<div class="col-sm-6 mb-3 mb-sm-0">
											<label>价格</label> <input id="price" type="text" name="price"
											placeholder="价格" class="form-control" value=<%= itemRecord.getPrice() %>>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-6">
											<label>商品介绍</label> <input id="intro" type="text" name="intro"
											placeholder="商品介绍" class="form-control"  value="<%= itemRecord.getIntro() %>">
										</div>
										<div class="col-sm-6 mb-3 mb-sm-0">
											<label>剩余数量</label> <input id="count" type="text"
											placeholder="剩余数量" name="count" class="form-control" value=<%= itemRecord.getCount() %>>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<label>品牌</label>
											<select class="form-control mb-3" id="brand" name="brand">
												<%
													while (iterateBrand.hasNext()) {
													brand = iterateBrand.next();
												%>
												<option <%= itemRecord.getBrand().equals(brand.getName())? "selected" : "" %>><%=brand.getName()%></option>
												<%
													}
												%>
											</select>
										</div>
										<div class="col-sm-6 mb-3 mb-sm-0">
											<label>分类</label> <select id="category" name="category"
												class="form-control mb-3">
												<%
													while (iterateCategory.hasNext()) {
													category = iterateCategory.next();
												%>
												<option value=<%=category.getId()%> <%= itemRecord.getCategory() == category.getId()? "selected" : "" %>><%=category.getName()%></option>
												<%
													}
												%>
											</select>
										</div>
										<hr class="col-sm-12">
										
										<div class="col-sm-2 avatar-wrapper-small">
											<img id="avatar_image_small_1" class="profile-pic-small"
													src="<%= !all_urls[0].equals("") ? "resources/images/products/" + all_urls[0] : "" %>" width="40" height="40"/>
											<div>
												<input class="file-upload-small" type="file" id="file_upload_small_1" name="file_upload_small_1" accept="image/*" />
											</div>
											<input id="all_pic_url_1" name="all_pic_url_1" type="hidden" value="<%= all_urls[0] %>" />
										</div>
										<div class="col-sm-2 avatar-wrapper-small">
											<img id="avatar_image_small_2" class="profile-pic-small"
													src="<%= !all_urls[1].equals("") ? "resources/images/products/" + all_urls[1] : "" %>" width="40" height="40" />
											<div>
												<input class="file-upload-small" type="file" id="file_upload_small_2" name="file_upload_small_2" accept="image/*" />
											</div>
											<input id="all_pic_url_2" name="all_pic_url_2" type="hidden" value="<%= all_urls[1] %>" />
										</div>
										<div class="col-sm-2 avatar-wrapper-small">
											<img id="avatar_image_small_3" class="profile-pic-small"
													src="<%= !all_urls[2].equals("") ? "resources/images/products/" + all_urls[2] : "" %>" width="40" height="40"/>
											<div>
												<input class="file-upload-small" type="file" id="file_upload_small_3" name="file_upload_small_3" accept="image/*" />
											</div>
											<input id="all_pic_url_3" name="all_pic_url_3" type="hidden" value="<%= all_urls[2] %>" />
										</div>
										<div class="col-sm-2 avatar-wrapper-small">
											<img id="avatar_image_small_4" class="profile-pic-small"
													src="<%= !all_urls[3].equals("") ? "resources/images/products/" + all_urls[3] : "" %>" width="40" height="40"/>
											<div>
												<input class="file-upload-small" type="file" id="file_upload_small_4" name="file_upload_small_4" accept="image/*" />
											</div>
											<input id="all_pic_url_4" name="all_pic_url_4" type="hidden" value="<%= all_urls[3] %>" />
										</div>
										<div class="col-sm-2 avatar-wrapper-small">
											<img id="avatar_image_small_5" class="profile-pic-small"
													src="<%= !all_urls[4].equals("") ? "resources/images/products/" + all_urls[4] : "" %>" width="40" height="40"/>
											<div>
												<input class="file-upload-small" type="file" id="file_upload_small_5" name="file_upload_small_5" accept="image/*" />
											</div>
											<input id="all_pic_url_5" name="all_pic_url_5" type="hidden" value="<%= all_urls[4] %>" />
										</div>
										<div class="col-sm-2 avatar-wrapper-small">
											<img id="avatar_image_small_6" class="profile-pic-small"
													src="<%= !all_urls[5].equals("") ? "resources/images/products/" + all_urls[5] : "" %>" width="40" height="40"/>
											<div>
												<input class="file-upload-small" type="file" id="file_upload_small_6" name="file_upload_small_6" accept="image/*" />
											</div>
											<input id="all_pic_url_6" name="all_pic_url_6" type="hidden" value="<%= all_urls[5] %>" />
										</div>
										
										
									</div>
									<hr>
									<button type="submit"
										class="d-none d-sm-inline-block btn btn-block btn-primary shadow-sm">
										提交</button>

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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">�</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
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
	
					reader.onload = function(e) {
						$('.profile-pic').attr('src', e.target.result);
					}
	
					reader.readAsDataURL(input.files[0]);
				}
			}
			
			var readSmallURL = function(input, el_index) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#avatar_image_small_' + el_index).attr('src', e.target.result);
					}
	
					reader.readAsDataURL(input.files[0]);
				}
			}			
	
			$(".file-upload").on('change', function() {
				readURL(this);
			});
			
			$("#file_upload_small_1").on('change', function(e) {
				$('#all_pic_url_1').val(e.target.files[0].name);
				readSmallURL(this, 1);
			});
			$("#file_upload_small_2").on('change', function(e) {
				$('#all_pic_url_2').val(e.target.files[0].name);
				readSmallURL(this, 2);
			});
			$("#file_upload_small_3").on('change', function(e) {
				$('#all_pic_url_3').val(e.target.files[0].name);
				readSmallURL(this, 3);
			});
			$("#file_upload_small_4").on('change', function(e) {
				$('#all_pic_url_4').val(e.target.files[0].name);
				readSmallURL(this, 4);
			});
			$("#file_upload_small_5").on('change', function(e) {
				$('#all_pic_url_5').val(e.target.files[0].name);
				readSmallURL(this, 5);
			});
			$("#file_upload_small_6").on('change', function(e) {
				$('#all_pic_url_6').val(e.target.files[0].name);
				readSmallURL(this, 6);
			});
	
			$(".upload-button").on('click', function() {
				$(".file-upload").click();
			});
	
			
			$('#avatar_image_small_1').click(function() {
				$('#file_upload_small_1').click();
			});
			$('#avatar_image_small_2').click(function() {
				$('#file_upload_small_2').click();
			});
			$('#avatar_image_small_3').click(function() {
				$('#file_upload_small_3').click();
			});
			$('#avatar_image_small_4').click(function() {
				$('#file_upload_small_4').click();
			});
			$('#avatar_image_small_5').click(function() {
				$('#file_upload_small_5').click();
			});
			$('#avatar_image_small_6').click(function() {
				$('#file_upload_small_6').click();
			});
		});
	</script>
	
</body>

</html>
