<%@page import="org.apache.commons.dbutils.handlers.ColumnListHandler"%>
<%@page import="org.apache.commons.dbutils.handlers.BeanHandler"%>
<%@page import="org.apache.commons.dbutils.handlers.ArrayListHandler"%>
<%@page import="org.apache.commons.dbutils.handlers.BeanListHandler"%>
<%@page import="com.sise.OnlineBookStore.JDBCUtils"%>
<%@page import="com.sise.OnlineBookStore.UserBean"%>
<%@page import="javax.sql.DataSource"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.util.*" import="org.apache.commons.dbutils.QueryRunner" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.css">
	<script src="bootstrap-4.1.3-dist/js/jquery-3.3.1.js"></script>
	<script src="bootstrap-4.1.3-dist/js/bootstrap.js"></script>
  <% session.setAttribute("ord", JDBCUtils.selectOrdersByUsername(((UserBean)session.getAttribute("currentUser")).getUsername())); %>
 <!-- 遍历出所有订单-->
  <c:forEach items="${ord}" var="a">
  		<!-- 对每一个订单进行操作-->
  		 <div class="card border-primary mb-5" style="width: 40rem;">
  			<div class="card-header">
    			订单号:${a.orderInfo.id}
  			</div>
	  		<ul class="list-group list-group-flush">
	    		
	    		<!-- 遍历出该订单的每个商品 -->
	    		<c:forEach items="${ a.orderitem}" var="i">
	    			<li class="list-group-item"><div class='row'><div class='text-left'>${i.product.name}</div><div class='text-right'>${i.count}</div></div></li>
	    		
	    		</c:forEach>
	    		
	  		</ul>
			 <div class="card-footer">
    			${a.orderInfo.paystate }:${a.orderInfo.money} <c:if test="${a.orderInfo.orderstate==0}">(该订单已被管理员取消)</c:if>
  			</div>
		</div>
  </c:forEach>
