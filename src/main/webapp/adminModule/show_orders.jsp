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
  <% 
  System.out.println(request.getParameter("a"));
    if(request.getParameter("a")==null){
  	System.out.println("查找全部");
  	 session.setAttribute("ord", JDBCUtils.selectAllOrders());
  
  }
   %>
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


	<link rel="stylesheet" href="/OnlineBookStore/bootstrap-4.1.3-dist/css/bootstrap.css">
	  <script src="/OnlineBookStore/bootstrap-4.1.3-dist/js/jquery-3.3.1.js"></script>
	 <script src="/OnlineBookStore/bootstrap-4.1.3-dist/js/bootstrap.js"></script>

	
  </head>
  
  <body>
  	<div class="container-fluid">


<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">商品列表</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modal_body_result">
      </div>
    </div>
  </div>
</div>
	  
	  
	  
	  	
		  <table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">编号</th>
      <th scope="col">订单号</th>
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
      <td>${a.orderInfo.id}</td>
      <td>${a.orderInfo.receiverName}</td>
      <td>${a.orderInfo.receiverAddress}</td>
      <td>${a.orderInfo.receiverPhone}</td>
      <td>${a.orderInfo.money}</td>
      <td>${a.orderInfo.user_id}</td>
      <td>${a.orderInfo.paystate}</td>
      <td><button class="btn" id="${a.orderInfo.id}" name="seedetail">查看</button></td>
      <td>
      	<c:if test="${a.orderInfo.orderstate=='0' }"><button class="btn btn-danger" disabled id="${a.orderInfo.id}" name="delOrder">已取消</button></c:if>
      	<c:if test="${a.orderInfo.orderstate!='0' }"><button class="btn btn-danger"  id="${a.orderInfo.id}" name="delOrder">取消</button></c:if>
      	</td>
      
    </tr>
	 </c:forEach> 
  </tbody>
</table>

	 
	  </div>
	  
  </body>
  <script>
  $("button[name=seedetail]").click(function(){
  	var oid=$(this).val("id");
  	$.ajax({
    				type:"post",
    				url:"OrderDedail",
    				dataType:"text",
    				success:function(xhr){
    					$("#modal_body_result").html(xhr);
    					$("#exampleModal").modal('show');
    				}
    			});
  });
		    $("button[name=delOrder]").click(function(){
    	var e=$(this);
    	var oid=$(this).attr('id');
    	if(window.confirm("你确定要取消ID号为"+oid+"的订单吗")){
    		  $.ajax({
    				type:"GET",
    				url:"DelRecord?model=order&oid="+oid,
    				dataType:"text",
    				success:function(xhr){
    					alert("取消成功");
    					e.html("已取消");
    					e.attr("disabled",true);
    				}
    			});
    	}

  })
		</script>
</html>
<% 
session.removeAttribute("ord"); %>