<%@page import="com.sise.OnlineBookStore.products"%>
<%@page import="com.sise.OnlineBookStore.UserBean"%>
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
    <title>My JSP 'booklist.jsp' starting page</title> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.css">
	<script src="bootstrap-4.1.3-dist/js/jquery-3.3.1.js"></script>
	<script src="bootstrap-4.1.3-dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="bootstrap-4.1.3-dist/js/my.js" defer="defer"></script>
  </head>
  
  <body>
	<!--网页开始 -->
  <div class="container">
	 	<!--顶部导航栏A-->
		<jsp:include page="navA.jsp"></jsp:include>
							
		<!--顶部导航栏B-->
		<jsp:include page="navB.jsp"></jsp:include>
		
							
							
		<!--主页轮播图-->
		<br>
	
		
		<br>		
		<c:forEach items="${sessionScope.books }" var="b" varStatus="state">
			<c:if test="${(state.index+1)%5==1}"><div class='card-deck mb-2'></c:if>
			<div class="card " style="max-width: 12rem;">
					<img class="card-img-top" src="/img/bookimg/${b.imgurl }" alt="Card image cap">
					<div class="card-body">
						<h6>￥ ${b.price }</h6>
			  			<h6 class="card-title">${b.name}</h6>
			  			<p class="card-text"><font size="-2">${b.description }</font></p>
						
					</div>
					<div class="card-footer">
					      <button id="${b.id }" class="btn btn-success btn-sm "  <c:if test="${b.pnum<=0 }">disabled</c:if> name="addCart">加入购物车 </button><small> 库存:<t>${b.pnum }</t></small>
					 </div>

				</div>
			<c:if test="${(state.index+1)%5==0}"></div></c:if>
		</c:forEach>

		  </div>
  </body>
</html>