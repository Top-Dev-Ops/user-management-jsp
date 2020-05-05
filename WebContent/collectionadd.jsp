<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.DAOFactory"%>
<%@ page import="bean.Collection"%>
<%@ page import="bean.Items"%>
<%! List<Items> itemRecords;
	List<Collection> collectionRecords;
	Items item;
	Collection collection;
	Iterator<Items> iterateItem;
	Iterator<Collection> iterateCollection; %>
<%
	DAOFactory dao = DAOFactory.getDao();
	itemRecords = dao.getAllItems();
	collectionRecords = dao.getAllCollection();
	iterateItem = itemRecords.iterator();
	iterateCollection = collectionRecords.iterator();
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
<style>
	.avatar-wrapper {
	   position: relative;
	   height: 323px;
	   width: 323px;
	   margin: 50px auto;
	   overflow: hidden;
	   box-shadow: 1px 1px 15px -5px black;
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
	
	.avatar-wrapper:hover .profile-video {
	   opacity: 0.5;
	}
	.avatar-wrapper .profile-video {
	   height: 100%;
	   width: 100%;
	   transition: all 0.3s ease;
	}
	
	.avatar-wrapper .profile-video:after {
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
	
	.select2 {
		background-color: #5a5c69
	}
	.select2-search--dropdown{
    	background-color: #5a5c69
	}
	.select2-search__field{
    	background-color: #5a5c69
	}
	.select2-container--default .select2-selection--multiple{
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
					<form role="form" action="AddCollectionAction" method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="col-lg-5">
								<div class="p-5" id="image_shower">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">上传图片或视频</h1>
									</div>
									<div class="avatar-wrapper">
										<img id="avatar_image" class="profile-pic" src="" />
										<video id="avatar_video" class="profile-video">
											<source src="" type="video/mp4">
										</video>
										<div class="upload-button">
										</div>
										<input class="file-upload" name="file-upload" type="file" accept="image/*,video/*" />
									</div>
								</div>
							</div>
							<div class="col-lg-7">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">添加新采集</h1>
									</div>
									<div class="form-group row">
											<div class="col-sm-6">
												<label for="title">标题</label> <input type="text"
													class="form-control bg-dark text-white border-0 small"
													id="title" name="title">
											</div>
											<div class="col-sm-6 mb-3 mb-sm-0">
												<label for="type">类型</label> <select id="type"
													name="type" class="form-control bg-dark small text-white">
													<option value=1>独家</option>
													<option value=2>其他</option>
													<option value=3>列表外展示</option>
												</select>
											</div>
										</div>
									<div class="form-group row">
											<div class="col-sm-6 mb-3 mb-sm-0">
												<label for="intro">介绍</label> <input type="text"
													class="form-control bg-dark text-white border-0 small"
													id="intro" name="intro">
											</div>
											
											<div class="col-sm-6 mb-3 mb-sm-0">
												<label for="product_id">商品</label> <select id="product_id" name="product_id"
													class="form-control bg-dark border=0 small text-white" multiple>
													<%
														while (iterateItem.hasNext()) {
														item = iterateItem.next();
													%>
													<option value=<%=item.getId()%>>
														<%= item.getName() %></option>
													<%
														}
													%>
												</select>
											</div>
										</div>
									<div class="form-group row">
											<div class="col-sm-6 mb-3 mb-sm-0">
												<label for="author">作者</label> <input type="text"
													class="form-control bg-dark text-white border-0 small"
													id="author" name="author">
											</div>
											<div class="col-sm-6 mb-3 mb-sm-0">
												<label for="on_use">使用</label> <select id="on_use"
													name="on_use" class="form-control bg-dark small text-white">
													<option value=0>否</option>
													<option value=1>是</option>
												</select>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

	<script>
		var fileName;
		$(function() {
			var readURL = function(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					
					reader.onload = function(e) {
						if(fileName.substring(fileName.length -3, fileName.length) == "jpg") {
							$('#avatar_image').show();
							$('#avatar_video').hide();
							$('.profile-pic').attr('src', e.target.result);
						} else {
							$('#avatar_video source').attr('src', e.target.result);
							$('#avatar_video')[0].load();
							$('#avatar_video')[0].play();
							$('#avatar_image').hide();
							$('#avatar_video').show();
						}
					}
					reader.readAsDataURL(input.files[0]);
				}
			}

			$(".file-upload").on('change', function(e) {
				fileName = e.target.files[0].name;
				readURL(this);
			});

			$(".upload-button").on('click', function() {
				$(".file-upload").click();
			});
			
			$('#product_id').select2();
		});
	</script>
</body>

</html>
