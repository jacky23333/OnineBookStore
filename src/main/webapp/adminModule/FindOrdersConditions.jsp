<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="org.apache.commons.dbutils.handlers.ColumnListHandler"%>
<%@page import="org.apache.commons.dbutils.handlers.BeanHandler"%>
<%@page import="org.apache.commons.dbutils.handlers.ArrayListHandler"%>
<%@page import="org.apache.commons.dbutils.handlers.BeanListHandler"%>
<%@page import="com.sise.OnlineBookStore.JDBCUtils"%>
<%@page import="com.sise.OnlineBookStore.UserBean"%>
<%@page import="javax.sql.DataSource"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  <% session.setAttribute("ord", JDBCUtils.selectAllOrders()); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'FindOrdersConditions.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	  <link rel="stylesheet" href="../bootstrap-4.1.3-dist/css/bootstrap.css">
	  <script src="../bootstrap-4.1.3-dist/js/jquery-3.3.1.js"></script>
	 <script src="../bootstrap-4.1.3-dist/js/bootstrap.js"></script>

	<link rel="stylesheet" href="/OnlineBookStore/bootstrap-4.1.3-dist/css/bootstrap.css">
	  <script src="/OnlineBookStore/bootstrap-4.1.3-dist/js/jquery-3.3.1.js"></script>
	 <script src="/OnlineBookStore/bootstrap-4.1.3-dist/js/bootstrap.js"></script>

	
  </head>
  
  <body>
  	<div class="container-fluid">
	  
	  	
		  <table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">订单编号</th>
      <th scope="col">收件人</th>
      <th scope="col">地址</th>
      <th scope="col">联系电话</th>
	  <th scope="col">总价</th>
      <th scope="col">所属用户ID</th>
      <th scope="col">订单状态</th>
      <th scope="col">查看</th>
	  <th scope="col">操作</th>
    </tr>
  </thead>
  <tbody>
	<c:forEach items="${ord}" var="a" varstatus="status">
    <tr>
      <th scope="row">${status.index+1 }</th>
      <td>${a.orderInfo.receiverName}</td>
      <td>${a.orderInfo.receiverAddress}</td>
      <td>${a.orderInfo.receiverPhone}</td>
      <td>${a.orderInfo.money}</td>
      <td>${a.orderInfo.user_id}</td>
      <td>${a.orderInfo.paystate}</td>
      <td><button class="btn">查看</button></td>
      <td><button class="btn btn-danger">删除</button></td>
      
    </tr>
    
	 </c:forEach> 
  </tbody>
</table>

	 
	  </div>
	  
  </body>
</html>
