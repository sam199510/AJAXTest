<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax Test</title>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
	window.onload = function(){
		var oBtn = document.getElementById('btn1');
		var oUl = document.getElementById('ul1');
		
		oBtn.onclick = function(){
			ajax('showAllUsers.html',function(str){
				var obj = eval('(' + str + ')');
				var arr = JSON.parse(obj);
				for (var i in arr) {
					var oLi = document.createElement('li');
					oLi.innerHTML = '用户名：<strong>'+ arr[i].userName +'</strong>	所在城市：<span>'+ arr[i].city +'</span>';
					oUl.appendChild(oLi);
				} 
			},function(){
				alert("不好意思，读取失败了");
			});
		};
	};
</script>
</head>
<body>
	<input id="btn1" type="button" value="读取"><br><br>
	<a href="register.html">注册页面测试</a><br><br>
	<a href="login.html">登录页面测试</a><br><br>
	<a href="paging.html">分页页面测试</a><br><br>
	<a href="paging2.html">分页页面测试2</a><br><br>
	<a href="paging3.html">分页页面测试3</a><br><br>
	<ul id="ul1">
		
	</ul>
</body>
</html>