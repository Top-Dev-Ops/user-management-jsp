<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="css/login.css">
    <style>
    	body .mask .modal {
    		opacity: 100;
		}
    </style>
    <title>登录</title>
</head>
<body>

<div class="mask">
    <div class="modal">
        <div class="circle" style="background: url(&quot;resources/img/login.png&quot;)"></div>
        <div class="login">
            <h1>后台业务管理系统</h1>
            <form method="post" action="index.jsp">
            	<input type="text" name="u" placeholder="请输入用户名称" required="required" />
            	<input type="password" name="p" placeholder="请输入登录密码" required="required" />
            	<button class="btn btn-primary btn-block btn-large" type="submit">登录</button>
            </form>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.15.0/TweenMax.min.js"></script>
<script src="js/login.js"></script>
</body>
</html>