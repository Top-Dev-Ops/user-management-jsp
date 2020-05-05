<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/register.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
    <style>
    	body .mask .modal {
    		opacity: 100;
		}
    </style>
    <title>注册</title>
</head>
<body>

<div class="mask">
    <div class="modal">
        <div class="circle" style="background: url(&quot;resources/img/login.png&quot;)"></div>
        <div class="login">
            <h1>后台业务管理系统</h1>
            <form method="post">
                <input type="text" name="n" placeholder="名称" required="required" />
                <input type="password" name="p" placeholder="密码" required="required" />
                <input type="text" name="a" placeholder="年龄" required="required" />
                <input type="text" name="pn" placeholder="电话号码" required="required" />
                <input type="text" name="p" placeholder="国家" required="required" />
                <input type="text" name="u" placeholder="城市" required="required" />
                <input type="text" name="p" placeholder="地址" required="required" />
                <input type="text" name="u" placeholder="邮寄地址" required="required" />
                <button class="btn btn-primary btn-block btn-large" type="submit">注册</button>
                <button class="btn btn-primary btn-block btn-large" type="submit">用微信注册</button>
            </form>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.15.0/TweenMax.min.js"></script>
<script src="js/register.js"></script>
</body>
</html>