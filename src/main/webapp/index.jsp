<%@page import="com.sise.OnlineBookStore.JDBCUtils"%>
<%@page import="com.sise.OnlineBookStore.UserBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% session.setAttribute("hotsale", JDBCUtils.selectHotSale(5));
session.setAttribute("notices", JDBCUtils.selectAllnotices());
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="bootstrap-4.1.3-dist/css/jquery.marquee.css">
	<link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.css">
	
	<script src="bootstrap-4.1.3-dist/js/jquery-3.3.1.js"></script>
	<script src="bootstrap-4.1.3-dist/js/bootstrap.js"></script>
	<script src="bootstrap-4.1.3-dist/js/jquery.marquee.js"></script>
	<script type="text/javascript" src="bootstrap-4.1.3-dist/js/my.js" defer="defer"></script>
  </head>
  
  <body> 
  <div class="container">
	  	<!--顶部导航栏A-->
		<jsp:include page="navA.jsp"></jsp:include>
							
		<!--顶部导航栏B-->
		<jsp:include page="navB.jsp"></jsp:include>
		
		<!-- 公告 -->
		<ul id="marquee" class="marquee">     
			<c:forEach items="${ notices}" var="n">
				<li>${n.title } : ${n.details }</li>
			</c:forEach>   
			
		</ul> 
		
		<!--主页轮播图-->
		<br>
		<div class="row mb-4">
				<div class="col-sm-12">
						<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
								<ol class="carousel-indicators">
										<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
								</ol>
								<div class="carousel-inner">
										<div class="carousel-item active">
												<img class="d-block w-100" src="/img/carousel/6813.jpg" alt="First slide">
										</div>
										<div class="carousel-item">
												<img class="d-block w-100" src="/img/carousel/6815.jpg" alt="Second slide">
										</div>
										<div class="carousel-item">
												<img class="d-block w-100" src="/img/carousel/6816.jpg" alt="Third slide">
										</div>
										<div class="carousel-item">
												<img class="d-block w-100" src="/img/carousel/6819.jpg" alt="Third slide">
										</div>
										<div class="carousel-item">
												<img class="d-block w-100" src="/img/carousel/6820.jpg" alt="Third slide">
										</div>
										<div class="carousel-item">
												<img class="d-block w-100" src="/img/carousel/6824.jpg" alt="Third slide">
										</div>
								</div>
								<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"> <span class="carousel-co;lllntrol-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span> </a>
						</div>
				</div>
		</div>
		
		<div class="card border-secondary">
			<div class="card-header">
				<h5>热销榜单</h5>
			</div>
			<div class="card-body">
				<div class='card-deck mb-2'>
				<c:forEach items="${sessionScope.hotsale }" var="b" varStatus="state">
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
		</c:forEach>
			</div>
			</div>
			</div>



</div>
	  
	  
  </body>
  <script>
  $("#marquee").marquee({yScroll: "bottom"});
  </script>
</html>
