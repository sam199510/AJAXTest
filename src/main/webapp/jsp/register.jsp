<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
<style type="text/css">
	#username{
		width: 200px;
		height: 30px;
		border: 1px solid black;
		float: left;
	}
	#div1{
		width: 200px;
		height: 30px;
		text-align: left;
		float: left;
		font-family: 微软雅黑;
		font-size: 14px;
		line-height: 30px;
	}
</style>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
	window.onload=function(){
		var oUsername = document.getElementById("username");
		var oDiv = document.getElementById("div1");
		
		oUsername.onblur = function(){
			if (oUsername.value.length==0) {
				oDiv.innerHTML="";
			} else {
				ajax("isFindExistUser.html?username="+oUsername.value,function(str){
					//alert(typeof str);
					var newStr=parseInt(str);
					
					if (newStr==0) {
						oDiv.innerHTML="该用户已存在，请更换用户名";
						oDiv.style.color="red";
					} else {
						oDiv.innerHTML="该账号尚未注册，可以注册";
						oDiv.style.color="green";
					}
				},function(){
					alert("不好意思，读取失败了");
				});
			}
		};
	};
</script>
</head>
<body>
	<a href="index.html">返回</a><br><br>
	<input id="username" name="username" type="text" placeholder="输入用户名"/>
	<div id="div1">
		
	</div>
</body>
</html>