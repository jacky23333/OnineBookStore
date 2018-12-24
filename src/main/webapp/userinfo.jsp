<%@page import="com.sise.OnlineBookStore.UserBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.css">
	<script src="bootstrap-4.1.3-dist/js/jquery-3.3.1.js"></script>
	<script src="bootstrap-4.1.3-dist/js/bootstrap.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <div class="container">
  <!--顶部导航栏A-->
	<jsp:include page="navA.jsp"></jsp:include>
	
	
		<br>
		<div class="row">
  <div class="col-3">
    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
      <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">个人信息</a>
	<a class="nav-link" id="v-pills-cart-tab" data-toggle="pill" href="#v-pills-cart" role="tab" aria-controls="v-pills-cart" aria-selected="true">购物车</a>
      <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">订单查询</a>
      <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">修改资料</a>
      <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Settings</a>
    </div>
  </div>
  <div class="col-9">
    <div class="tab-content" id="v-pills-tabContent">
      <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
			<div class="container-fluid">
		  		<form>
		  			<% UserBean user=((UserBean)session.getAttribute("currentUser")); %>
		  			<div class="form-row mb-2">
						<label>用户ID：</label>
						<label><%=user.getId() %></label>
					</div>
					<div class="form-row mb-2">
						<label>用户名：</label>
						<label><%=user.getUsername() %></label>
					</div>
					<div class="form-row mb-2">
						<label>注册时间：</label>
						<label><%=user.getRegistTime() %></label>
					</div>
					<div class="form-row mb-2">
						<label>角色：</label>
						<label><%=user.getRole() %></label>
					</div>
					<div class="form-row mb-2">
						<label>性别：</label>
						<label><%=user.getGender() %></label>
					</div>
					<div class="form-row mb-2">
						<label>Email：</label>
						<label><%=user.getEmail()%></label>
					</div>
					<div class="form-row mb-2">
						<label>电话号码：</label>
						<label><%=user.getTelephone() %></label>
					</div>
					<div class="form-row mb-2">
						<label>自我介绍：</label>
						<p><%=user.getIntroduce() %></p>
					</div>
				</form>
		    </div>
		  
		  
		</div>
      <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
      		<jsp:include page="OrdersShow.jsp"></jsp:include>
      
		</div>
		
		
      <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
			<div class="container-fluid">
		  		<form >
		  		<div class="form-row">
				<div class="form-group col-sm-12 col-md-6">
					<label >性别：</label>
					<div class="form-check">
						<label><input type="radio"  name="gender" value="男" id="man"> 男</label>
						<label><input type="radio"  name="gender" value="女" id="women"> 女</label>
					</div>
				</div>
				</div>
			<div class="form-row">
				<div class="form-group col-sm-12 col-md-6">
					<label >邮箱：</label>
					<input id="email" type="email" required autofocus class="form-control" name="email" value="<%=user.getEmail()%>">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-sm-12 col-md-6">
					<label >电话：</label>
					<input id="telephone" type="tel" class="form-control" required placeholder="telephone" name="telephone" value="<%=user.getTelephone() %>">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-sm-12 col-md-6">
					<label >自我介绍：</label>
					<input id="introduce" type="text" class="form-control" required placeholder="introduce" name="introduce" value="<%=user.getIntroduce()%>">
				</div>
				
				
			</div>
			<div class="form-row">
				<div class="col-sm-12 col-md-12 btn-group">
					<button class="btn btn-primary" id="updata" type="button">修改</button>
				</div>
			</div>
		</form>
		  </div>
		</div>
      <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
      		<div class="form-row">
				<div class="form-group col-sm-12 col-md-6">
					<label >原密码：</label>
					<input class="form-control" required placeholder="Old Password" name="oldpassword">
				</div>
      		
      		</div>
		  	<div class="form-row">
				<div class="form-group col-sm-12 col-md-6">
					<label >新密码：</label>
					<input class="form-control" required placeholder="New Password" name="newpassword">
				</div>
    		</div>
		  <div class="form-row">
				<div class="col-sm-12 col-md-12 btn-group">
					<button class="btn btn-primary" id="updatepsd" type="button">确认修改</button>
				</div>
			</div>
  </div>
<!-- 购物车-->
<div class="tab-pane fade" id="v-pills-cart" role="tabpanel" aria-labelledby="v-pills-cart-tab">
	<form action="preOrder" method="post">
	<table class="table table-hover table-bordered">
			  <thead>
				<tr>
				  <th scope="col">选择</th>
				  <th scope="col">商品编号</th>
				  <th scope="col">商品名称</th>
				  <th scope="col">商品数量</th>
				  <th scope="col">商品单价</th>
				  <th scope="col">操作</th>
				</tr>
			  </thead>
			  <tbody>
	<c:forEach items="${cart}" var="item">
		
				<tr>
				  <td><input type="checkbox" name="productid" value="${item.key}"></td>
				  <th scope="row">${item.key}</th>
				  <td>${item.value.product.name}</td>
				  <td><button type="button" class="btn btn-sm btn-primary opcount" id="removecount" no="${item.key}">-</button> <font>${item.value.count} </font>  <button type="button" class="btn btn-sm btn-primary opcount" id="addcount" no="${item.key}">+</button></td>
				  <td>${item.value.product.price}</td>
				  <td><button type="button" class="btn btn-danger" id="delCart" pid="${item.key}">删除</button></td>
				</tr>
			  
	</c:forEach>
				</tbody>
		</table>
	<c:if test="${sessionScope.cart!=null}">
		<button type="submit" class="btn btn-primary">立即购买</button>
		
	</c:if>
	</form>
  </div>						
 
</div>
	  </div>
  </body>
<script>
$("#delCart").click(function(){
	var product=$(this).parent().parent();
	var pid=$(this).attr("pid");
	if(window.confirm("你却确定要从购物车删除该商品吗")){
		$.ajax({
				type:"POST",
				url:"operateCart",
				dataType:"text",
				data:{
					type:'del',
					productid:pid
			},
			success:function(xhr){
					product.remove();
				}
				
	});
	}
});
	//$("#v-pills-cart-tab").tab("show");
	$("#updata").click(function(){
		if($("#man").is(':checked') || $("#women").is(':checked')){
			if($("#man").is(':checked')) var gender1='男';
			if($("#women").is(':checked')) var gender1='女';
			alert($("#ss").val());
			$.ajax({
				type:"POST",
				url:"UpdateBaseInfo",
				dataType:"text",
				data:{
					gender:gender1,
					//email:$("[name=email]").val(),
					//telephone:$("[name=telephone]").val(),
					//introduce:$("[name=introduce]").val(),
					email:$("#email").val(),
					telephone:$("#telephone").val(),
					introduce:$("#introduce").val(),
					
				
			},
			success:function(xhr){
					if(xhr=="1"){
						alert("修改成功");
						window.location.reload();
					}
					else if(xhr=='0'){
						alert("信息没有更改");
					}
				}
				
			});
		}
		else{
			alert("请选择性别");
		}
	});
	//修改密码
	$("#updatepsd").click(function(){
		$.ajax({
				type:"POST",
				url:"Updatepsd",
				dataType:"json",
				data:{
					oldpassword:$("[name=oldpassword]").val(),
					newpassword:$("[name=newpassword]").val(),
			},
			success:function(xhr){
					if(xhr=="1"){
						alert("修改密码成功");
						window.location.href = "index.jsp";
					}
					else if(xhr=="2"){
						alert("原密码错误，请重新输入");
				}
				
			}
	});
});
	$(".opcount").click(function(){
		var tis=$(this);
		var ccount=$(this).next().text();
		if($(this).attr("id")=="removecount"){
			if(ccount>1){
			$.ajax({
				type:"post",
				url:"operateCart",
				dateType:"json",
				data:{
					type:"opsrcount",
					productid:$(this).attr("no"),
					count:ccount-1
					},
				success:function(data){
					if(data.result==true){
						tis.next().text(ccount-1);
					}
					else
						alert(data.message);
							
				}
				});
			}
				
			else{
				alert("数量不能小于1");
			}
		}
		else if($(this).attr("id")=="addcount"){
		var ccount=$(this).prev().text().trim();
			$.ajax({
				type:"post",
				url:"operateCart",
				dateType:"json",
				data:{
					type:"opsrcount",
					productid:$(this).attr("no"),
					count:parseInt(ccount)+1
					},
				success:function(data){
					if(data.result==true){
						tis.prev().text(parseInt(ccount)+1);
					}
					else
						alert(data.message);
							
				}
				});
			
		}
	});
	
</script>
</html>
