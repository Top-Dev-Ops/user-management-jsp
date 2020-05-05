<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.DAOFactory"%>
<%@ page import="bean.Category"%>
<%@ page import="bean.SubCategory"%>
<%@ page import="bean.Style"%>
<%!List<Category> categoryRecords;
	List<SubCategory> subCategoryRecords;
	List<Style> styleRecords;
	Category category;
	SubCategory subCategory;
	Style style;
	Iterator<Category> iterateCategory;
	Iterator<SubCategory> iterateSubCategory;
	Iterator<Style> iterateStyle;%>
<%
	DAOFactory dao = DAOFactory.getDao();
categoryRecords = dao.getAllCategory();
subCategoryRecords = dao.getAllSubCategory();
styleRecords = dao.getAllStyle();
iterateCategory = categoryRecords.iterator();
iterateSubCategory = subCategoryRecords.iterator();
iterateStyle = styleRecords.iterator();
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

<title>添新</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css"
	rel="stylesheet" />

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.css" rel="stylesheet">
<link href="css/avatar.css" rel="stylesheet">
<style>
.select2 {
	background-color: #5a5c69
}

.select2-search--dropdown {
	background-color: #5a5c69
}

.select2-search__field {
	background-color: #5a5c69
}

.select2-container--default .select2-selection--multiple {
	background-color: #5a5c69
}

.select2-results {
	background-color: #5a5c69;
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
					<div class="row mt-4 mb-4">
						<div class="col col-sm-0 col-md-11"></div>
						<div class="col col-sm-12 col-md-1">
							<a href="userlist.jsp"
								class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
								style="margin-right: auto;"> <span
								class="icon text-white-50"><i class="fa fa-chevron-left"></i></span>
							</a>
						</div>
					</div>
					<form role="form" action="AddItemAction" method="post"
						enctype="multipart/form-data">

						<div class="row">
							<div class="col-lg-5">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">产品图片</h1>
									</div>
									<div class="avatar-wrapper">
										<img id="avatar_image" class="profile-pic" src="" />
										<div class="upload-button">
											<i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
										</div>
										<input class="file-upload" name="file_upload" type="file" accept="image/*" />
									</div>
								</div>
							</div>
							<div class="col-lg-7">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">添加新商品</h1>
									</div>
									<div class="form-group row">
										<div class="col-sm-6">
											<label for="product_num">商品编号</label> <input type="text"
												class="form-control bg-dark text-white border-0 small"
												id="product_num" name="product_num">
										</div>
										<div class="col-sm-6 mb-3 mb-sm-0">
											<label for="name">商品名</label> <input type="text"
												class="form-control bg-dark text-white border-0 small"
												id="name" name="name">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<label for="status">状态</label> <select id="status"
												name="status" class="form-control bg-dark small text-white">
												<option value=0>未审核</option>
												<option value=1>已通过</option>
												<option value=2>未通过</option>
												<option value=3>已下架</option>
												<option value=4>已售出</option>
												<option value=6>已删除</option>
											</select>
										</div>
										<div class="col-sm-6">
											<label for="style">风格</label> <select id="style"
												name="styles"
												class="form-control bg-dark border=0 small text-white"
												multiple>
												<%
													while (iterateStyle.hasNext()) {
													style = iterateStyle.next();
												%>
												<option value=<%=style.getId()%>>
													<%=style.getName()%></option>
												<%
													}
												%>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<label for="category">分类</label> <select id="category"
												name="category"
												class="form-control bg-dark border=0 small text-white">
												<%
													while (iterateCategory.hasNext()) {
													category = iterateCategory.next();
												%>
												<option value=<%=category.getId()%>>
													<%=category.getName()%></option>
												<%
													}
												%>
											</select>
										</div>
										<div class="col-sm-6 mb-3 mb-sm-0">
											<label for="sub_category">子分类</label> <select
												id="sub_category" name="sub_category"
												class="form-control bg-dark border=0 small text-white">
												<%
													while (iterateSubCategory.hasNext()) {
													subCategory = iterateSubCategory.next();
												%>
												<option value=<%=subCategory.getId()%>>
													<%=subCategory.getName()%></option>
												<%
													}
												%>
											</select>
										</div>
									</div>
									<hr>
									<div class="form-group row">
										<label for="all_pic" class="col-sm-12">所有产品图片</label>
										<div class="col-sm-2 avatar-wrapper-small">
											<img id="avatar_image_small_1" class="profile-pic-small"
													src="" width="40" height="40"/>
											<div>
												<input class="file-upload-small" type="file" id="file_upload_small_1" name="file_upload_small_1" accept="image/*" />
											</div>
										</div>
										<div class="col-sm-2 avatar-wrapper-small">
											<img id="avatar_image_small_2" class="profile-pic-small"
													src="" width="40" height="40"/>
											<div>
												<input class="file-upload-small" type="file" id="file_upload_small_2" name="file_upload_small_2" accept="image/*" />
											</div>
										</div>
										<div class="col-sm-2 avatar-wrapper-small">
											<img id="avatar_image_small_3" class="profile-pic-small"
													src="" width="40" height="40"/>
											<div>
												<input class="file-upload-small" type="file" id="file_upload_small_3" name="file_upload_small_3" accept="image/*" />
											</div>
										</div>
										<div class="col-sm-2 avatar-wrapper-small">
											<img id="avatar_image_small_4" class="profile-pic-small"
													src="" width="40" height="40"/>
											<div>
												<input class="file-upload-small" type="file" id="file_upload_small_4" name="file_upload_small_4" accept="image/*" />
											</div>
										</div>
										<div class="col-sm-2 avatar-wrapper-small">
											<img id="avatar_image_small_5" class="profile-pic-small"
													src="" width="40" height="40"/>
											<div>
												<input class="file-upload-small" type="file" id="file_upload_small_5" name="file_upload_small_5" accept="image/*" />
											</div>
										</div>
										<div class="col-sm-2 avatar-wrapper-small">
											<img id="avatar_image_small_6" class="profile-pic-small"
													src="" width="40" height="40"/>
											<div>
												<input class="file-upload-small" type="file" id="file_upload_small_6" name="file_upload_small_6" accept="image/*" />
											</div>
										</div>
									</div>
									<hr>
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
	<script
		src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>

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

			$(".upload-button").on('click', function() {
				$(".file-upload").click();
			});

			$('#style').select2();
			
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
