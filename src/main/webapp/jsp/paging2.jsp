<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分页测试</title>
<style type="text/css">
	.pagingTab{
		height: 40px;
		width: 200px;
		margin: 5px 40% 5px 40%;
		padding: 0px;
		float: left;
	}
	ol{
		width: 200px;
		height: 40px;
		margin: 0px;
		padding: 0px;
		border: 0px;
		list-style: none;
		float: left;
	}
	ol li{
		float: left;
		width: 30px;
		height: 30px;
		border: 1px solid #e1e2e3;
		color: #031ac8;
		line-height: 30px;
		margin: 4px;
		float: left;
		border-radius: 50%;
		text-align: center;
	}
	ol li{
		cursor: pointer;
	}
	.active{
		border: 1px solid #398bfb;
		background-color: #f2f8ff;
	}
	#ulDiv{
		position: absolute;
		top: 150px;
	}
</style>
</head>
<body>
	<a href="index.html">返回</a><br>
	<div id="div1" class="pagingTab">
		<ol>
			<c:forEach	var="tabNum" items="${tabNums }">
				<c:if test="${tabNum.state == 1 }">
					<li class="active">${tabNum.tabPageNum }</li>
				</c:if>
				<c:if test="${tabNum.state == 0 }">
					<li>${tabNum.tabPageNum }</li>
				</c:if>
			</c:forEach>
		</ol>
	</div>
	<div id="ulDiv">
		<ul class="ul1">
		</ul>
	</div>
	<script type="text/javascript" src="ajax.js"></script>
	<script type="text/javascript" src="jquery-2.2.3.min.js"></script>
	<script type="text/javascript">
		var now = 0
	
		$(document).ready(function(){
			getNewPage(now);
			
			var oDiv = document.getElementById('div1');
			var oOl = oDiv.getElementsByTagName('ol')[0];
			var oLi = oOl.getElementsByTagName('li');
			
			for (var i = 0; i < oLi.length; i++) {
				oLi[i].index = i;
				oLi[i].onclick = function(){
					for (var i = 0; i < oLi.length; i++) {
						oLi[i].className = '';
					}
					now = this.index;
					oLi[now].className = 'active';
					//alert(now);
					getNewPage(now*5);
				};
			}
			
			function getNewPage(pageNum){
				$("ul").remove("#ulDiv .ul1");
				ajax("getPagingUsers.html?pageNum="+pageNum,function(str){
					var obj = eval('(' + str + ')');
					var arr = JSON.parse(obj);
					var oUl = $("<ul class='ul1'></ul>");
					
					for ( var i in arr) {
						var selectLastUserId = arr[i].id;
						var oLi = $('<li>用户名：<strong>'+ arr[i].userName +'</strong>&nbsp;&nbsp;&nbsp;&nbsp所在城市：<span>'+ arr[i].city +'</span></li>');
						oUl.append(oLi);
					}
					$("#ulDiv").append(oUl);
				},function(){
					alert("不好意思，读取失败了");
				});
			}
		});
	</script>
</body>
</html>