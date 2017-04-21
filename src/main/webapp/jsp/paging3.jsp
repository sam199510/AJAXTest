<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分页测试</title>
<style type="text/css">
	body{
		margin: 0px;
		padding: 0px;
	}
	.tabBtn{
		width: 300px;
		height: 40px;
		margin: 5px 35% 5px 35%;
		position: relative;
		float: left;
	}
	ol{
		list-style: none;
		width: 200px;
		height: 40px;
		margin: 0px;
		padding: 0px;
		position: absolute;
		float: left;
		left: 50px;
	}
	ol li{
		margin: 4px;
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
	ol li:HOVER {
		cursor: pointer;
	}
	.active{
		border: 1px solid #398bfb;
		background-color: #f2f8ff;
	}
	.tabBtn a{
		line-height: 40px;
		text-align: center;
		font-family: 微软雅黑;
		font-size: 14px;
		text-decoration: none;
	}
	.tabBtn a:NTH-CHILD(1) {
		position: absolute;
		left: 0px;
	}
	.tabBtn a:NTH-CHILD(3) {
		position: absolute;
		left: 250px;
	}
	.displayNone{
		display: none;
	}
	.displayBlock{
		display: block;
	}
	#ulDiv{
		position: absolute;
		top: 150px;
	}
</style>
</head>
<body>
	<a href="index.html">返回</a><br>
	<div id="tabBtn" class="tabBtn">
		<a href="javascript:;">上一页</a>
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
		<a href="javascript:;">下一页</a>
	</div>
	<div id="ulDiv">
		<ul class="ul1">
		</ul>
	</div>
	<script type="text/javascript" src="ajax.js"></script>
	<script type="text/javascript" src="jquery-2.2.3.min.js"></script>
	<script type="text/javascript">
		var now = 0;
		
		$(document).ready(function(){
			var oTabBtn = document.getElementById('tabBtn');
			var oOl = oTabBtn.getElementsByTagName('ol')[0];
			var oLi = oOl.getElementsByTagName('li');
			var prevBtn = oTabBtn.getElementsByTagName('a')[0];
			var nextBtn = oTabBtn.getElementsByTagName('a')[1];
			
			for (var i = 0; i < oLi.length; i++) {
				oLi[i].index = i;
				oLi[i].onclick = function(){
					now = this.index;
					change(now);
				};
			}
			
			prevBtn.onclick = function(){
				now--;
				change(now);
			};
			
			nextBtn.onclick = function(){
				now++;
				change(now);
			};
			
			function change(now){
				if (oLi.length <= 1) {
					prevBtn.className = 'displayNone';
					nextBtn.className = 'displayNone';
				} else {
					if (now == 0) {
						prevBtn.className = 'displayNone';
						nextBtn.className = 'displayBlock';
					} else if (now>0 && (now < (oLi.length-1))) {
						prevBtn.className = 'displayBlock';
						nextBtn.className = 'displayBlock';
					} else if (now == (oLi.length - 1)) {
						prevBtn.className = 'displayBlock';
						nextBtn.className = 'displayNone';
					}
				}
				
				for (var i = 0; i < oLi.length; i++) {
					oLi[i].className = "";
				}
				oLi[now].className = "active";
				
				getNewPage(now*5);
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
			
			change(now);
		});
	</script>
</body>
</html>