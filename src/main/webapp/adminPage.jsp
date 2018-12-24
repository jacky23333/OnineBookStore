<%@page import="com.sise.OnlineBookStore.JDBCUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'adminPage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.css">
	<script src="bootstrap-4.1.3-dist/js/jquery-3.3.1.js"></script>
	<script src="bootstrap-4.1.3-dist/js/bootstrap.js"></script>
	<script src="bootstrap-4.1.3-dist/js/my.js" defer="defer"></script>

  </head>
  
  <body>
	  <div class="container">
	  	<!--顶部导航栏A-->
		<div class="mb-3"><jsp:include page="navA.jsp"></jsp:include></div>
	  
	  	<div class="row">
		  <div class="col-3">
			<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
			  <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">商品管理</a>
			  <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">订单管理</a>
			  <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">公告管理</a>
			</div>
		  </div>
  <div class="col-9">
    <div class="tab-content" id="v-pills-tabContent">
		
		<!--商品管理模块-->
      <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
		  
		  
					<div class="container-fluid">
						
							<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
								  <li class="nav-item">
									<a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">商品查询</a>
								  </li>
								  <li class="nav-item">
									<a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">添加商品</a>
								  </li>
							</ul>
							<div class="tab-content" id="pills-tabContent">
								
								<!-- 商品条件筛选 -->
								  <jsp:include page="adminModule/FindProductsConditions.jsp"></jsp:include>
								  
								  <!--商品列表-->
								  <br>
								  <div id="p_result_set" class=" mb-2">
								  	<jsp:include page="adminModule/show_products.jsp"></jsp:include>
								  </div>
								  	
								  
								</div>
								
								
							  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab"><jsp:include page="adminModule/editProduct.jsp"></jsp:include></div>
							  <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">...</div>
							</div>


			  		</div>
		
		
		
		
		</div>
      <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
      		
      
      </div>
      <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
      	<div class="container">
      	<br><br>
		  	<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="model" value="oid">
			  <label class="form-check-label" >按订单编号</label>
			</div>
		  
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio"  name="model" value="username">
			  <label class="form-check-label" >按用户名</label>
			</div>
		  
			  <div class="form-check form-check-inline">
				  <input type="text" class="form-control" id="oinp">
			  </div>
		  <div class="form-check form-check-inline">
				  <button class="btn btn-success" id="find_o_bycond_btn">查询</button>
			  </div>
	  </div>
		  
		  <!--订单查询列表-->
		  <div id="o_result_set" class=" mb-2">
				<jsp:include page="adminModule/show_orders.jsp"></jsp:include>
		  </div>
      
      </div>
      <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab"><br>
      <div class=""><button class="btn btn-success mb-2" id="add_notice_btn">添加公告</button><jsp:include page="adminModule/show_notices.jsp"></jsp:include></div>
      		
      		
      		
      		<div class="modal fade" id="add_notice_modal" tabindex="-1" role="dialog" aria-labelledby="add_notice_modal" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" >公告管理</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <form>
				          <div class="form-group">
				            <label for="recipient-name" class="col-form-label">标题</label>
				            <input type="text" class="form-control" id="add_notice_title">
				          </div>
				          <div class="form-group">
				            <label for="message-text" class="col-form-label">内容</label>
				            <textarea class="form-control" id="add_notice_details"></textarea>
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				        <button type="button" class="btn btn-primary" id="add_notice_do">添加</button>
				      </div>
   			 </div>
  </div>
</div>
      		
    </div>
  </div>
</div>
	  	
	  </div>
	  
	  
	 
  </body>
 <script>
 	$("#add_notice_btn").click(function(){
 		$("#add_notice_modal").modal('show');
 	});
 	$("#add_notice_do").click(function(){
 		$.ajax({
			type:"post",
			url:"addNotice",
			datatype:"text",
			data:{
				title:$("#add_notice_title").val(),
				details:$("#add_notice_details").val()
			},
			success:function(xhr){
			alert("添加成功");
			window.location.reload();
		}
		});
 		
 	});
 </script>
</html>
