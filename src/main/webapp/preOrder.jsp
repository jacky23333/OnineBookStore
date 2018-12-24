<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'preOrder.jsp' starting page</title>
    
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
  	<!-- navA -->
  	<jsp:include page="/navA.jsp"></jsp:include>
  	<br>
  	<table class="table table-hover table-bordered">
			  <thead>
				<tr>
				  <th scope="col">商品编号</th>
				  <th scope="col">商品名称</th>
				  <th scope="col">商品数量</th>
				  <th scope="col">商品总价</th>
				</tr>
			  </thead>
			  <tbody>
	<% int a; %>
	<c:forEach items="${sessionScope.preInfo.products}" var="item">
				<tr>
				  <th scope="row">${item.product.id}</th>
				  <td>${item.product.name}</td>
				  <td>${item.count} X ${item.product.price}</td>
				  <td>${item.product.price*item.count}</td>
				</tr>
			  
	</c:forEach>
				</tbody>
		</table>
	  <div class="align-content-end">总共需支付：${sessionScope.preInfo.price } 元</div>
		
	  <hr>
	  <form action="GenerateOrder" method="post">
 	  	<h5>请完善收货信息</h5>
		  <div class="form-row">
				<div class="form-group col-sm-12 col-md-3">
					<label >收货人：</label>
					<input  class="form-control" required name="receiverName">
				</div>
			</div>
		  <div class="form-row">
				<div class="form-group col-sm-12 col-md-3">
					<label >收货手机：</label>
					<input  class="form-control" required name="receiverPhone">
				</div>
			</div>
		  <div class="form-row">
				<div class="form-group col-sm-12 col-md-6">
					<label >收货地址：</label>
					<input  class="form-control" required name="receiverAddress">
				</div>
			</div>
		  <div class="form-row">
				<div class="form-group col-sm-12 col-md-6">
					<button class="btn btn-success" type="submit">确定购买</button>
				</div>
			</div>
	  
	  </form>
  </div>
  </body>
</html>
