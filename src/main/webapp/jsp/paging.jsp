<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分页测试</title>
<style type="text/css">
	#pagingBtn{
		height: 40px;
		width: 200px;
		margin: 5px 40% 5px 40%;
		padding: 0px auto;
		position: relative;
		float: left;
	}
	#pagingBtn a:NTH-CHILD(1){
		float: left;
		position:absolute;
		left:0px;
		width: 100px;
		text-align: center;
		text-decoration: none;
	}
	#pagingBtn a:NTH-CHILD(2){
		float: left;
		position:absolute;
		left:100px;
		width: 100px;
		text-align: center;
		display: block;
		text-decoration: none;
	}
	#ulDiv{
		position: absolute;
		top: 150px;
	}
</style>

</head>
<body>
	<a href="index.html">返回</a><br>
	<div id="pagingBtn">
		<a href="javascript:;" id="prevBtn">上一页</a>
		<a href="javascript:;" id="nextBtn">下一页</a>
	</div>
	<div id="ulDiv">
		<ul class="ul1">
		</ul>
	</div>
	
	<script type="text/javascript" src="ajax.js"></script>
	<script type="text/javascript" src="jquery-2.2.3.min.js"></script>
	<script type="text/javascript">
		var pageNum = 0;
		var allLastUserId;
		var allUserNumber;
	
		$(document).ready(function(){
			getNewPage(pageNum);
			
			$("#pagingBtn #prevBtn").click(function(){
				pageNum = pageNum - 5;
				getNewPage(pageNum);
		 	});
		  	
		  	$("#pagingBtn #nextBtn").click(function(){
				pageNum = pageNum + 5;
				getNewPage(pageNum);
		 	});
		  	
		  	function getAllUsers() {
		  		ajax("showAllUsers.html",function(str2){
					var obj2 = eval('(' + str2 + ')');
					var arr2 = JSON.parse(obj2);
					for ( var i in arr2) {
						allLastUserId = arr2[i].id;
					}
					allUserNumber = arr2.length;
				},function(){
					alert("不好意思，读取失败");
				});
			}
		
			function getNewPage(pageNum) {
				getAllUsers();
				
				$("ul").remove("#ulDiv .ul1");
				ajax("getPagingUsers.html?pageNum="+pageNum,function(str){
					var obj = eval('(' + str + ')');
					var arr = JSON.parse(obj);
					var oUl = $("<ul class='ul1'></ul>");
					
					for ( var i in arr) {
						var selectLastUserId = arr[i].id;
						var oLi = $('<li>用户名：<strong>'+ arr[i].userName +'</strong>	所在城市：<span>'+ arr[i].city +'</span></li>');
						oUl.append(oLi);
					}
					$("#ulDiv").append(oUl);
					
					if ( pageNum==0 && allUserNumber<=5) {
						document.getElementById('prevBtn').style.display = 'none';
						document.getElementById('nextBtn').style.display = 'none';
					} else {
						if (pageNum == 0) {
							document.getElementById('prevBtn').style.display = 'none';
						} else if (pageNum > 0) {
							document.getElementById('prevBtn').style.display = 'block';
						} 
						
						if (selectLastUserId == allLastUserId) {
							document.getElementById('nextBtn').style.display = 'none';
						} else {
							document.getElementById('nextBtn').style.display = 'block';
						}
					}
					
				},function(){
					alert("不好意思，读取失败了");
				});
			}
		});
	</script>
	
</body>
</html>