<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<style type="text/css">
	#userName{
		margin: 5px;
		width: 200px;
		height: 30px;
		line-height: 30px;
		font-family: 微软雅黑;
		font-size: 14px;
	}
	#password{
		margin: 5px;
		width: 200px;
		height: 30px;
		line-height: 30px;
		font-family: 微软雅黑;
		font-size: 14px;
	}
	#btnAndInfo{
		height: 30px;
	}
	#loginBtn{
		margin: 5px;
		width: 200px;
		height: 30px;
		background: darkgray;
		color: white;
		font-family: 微软雅黑;
		font-size: 14px;
		float: left;
	}
	#loginInfo{
		width: 300px;
		height: 30px;
		line-height: 40px;
		color: red;
		font-family: 微软雅黑;
		font-size: 14px;
		display: none;
		float: left;
	}
	#resetBtn{
		margin: 5px;
		width: 200px;
		height: 30px;
		background: darkgray;
		color: white;
		font-family: 微软雅黑;
		font-size: 14px;
		clear: both;
	}
</style>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
	window.onload = function(){
		var oUserName = document.getElementById('userName');
		var oPassword = document.getElementById('password');
		var oLoginBtn = document.getElementById('loginBtn');
		var oLoginForm = document.getElementById('loginForm');
		var oLoginInfo = document.getElementById('loginInfo');
		
		oLoginBtn.onclick = function(){
			ajax("isLoginRight.html?userName="+oUserName.value+"&password="+oPassword.value,function(str){
				var intStr = parseInt(str);
				if (intStr == 1) {
					oLoginInfo.style.display = "none";
					oLoginForm.method="post";
					oLoginForm.action="login.html";
					oLoginForm.submit();
				} else {
					//alert("用户名或密码错误，登录失败");
					oLoginInfo.innerHTML="用户名或密码错误，登录失败";
					oLoginInfo.style.display = "block";
				}
			},function(){
				alert("不好意思，读取失败了");
			});
		};
	};
</script>
</head>
<body>
	<a href="index.html">返回</a>
	<form id="loginForm">
		<input id="userName" name="userName" placeholder="请输入用户名" type="text"/><br>
		<input id="password" name="password" placeholder="请输入密码" type="password"/><br>
		<div id="btnAndInfo"><input id="loginBtn" type="button" value="登录"/><div id="loginInfo"></div></div><br>
		<input id="resetBtn" type="reset" value="重置"/>
	</form>
	<div id="loginUserName">${sessionScope.loginUser.userName }</div>
	<a href="logout.html">退出登录</a>
</body>
</html>