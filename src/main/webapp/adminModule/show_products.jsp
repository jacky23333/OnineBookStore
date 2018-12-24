<%@page import="javax.validation.constraints.Null"%>
<%@page import="com.sise.OnlineBookStore.JDBCUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<html>
	

	
	<head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminPage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  	<body>
	
	<div class="container-fluid">
		
	  	<table class="table table-bordered table-hover">
  <thead>
    <tr>
      <th scope="col">序号</th>
      <th scope="col">编号</th>
      <th scope="col">名称</th>
      <th scope="col">价格</th>
      <th scope="col">类别</th>
      <th scope="col">库存</th>
      <th scope="col">图片URL</th>
      <th scope="col">编辑</th>
      <th scope="col">删除</th>
    </tr>
  </thead>
  <tbody>
  <% 
  System.out.println(request.getParameter("byCondition")+"sss");
  if(request.getParameter("a")==null){
  		System.out.println("查找全部");
  	 session.setAttribute("products",JDBCUtils.selectAllproducts());
  }
  %>
  <c:forEach  items="${sessionScope.products}" var="p">
    <tr>
      <th scope="row"></th>
      <td>${p.getId()}</td>
      <td>${p.getName()}</td>
      <td>${p.getPrice()}</td>
      <td>${p.getCategory()}</td>
      <td>${p.getPnum()}</td>
      <td>${p.getImgurl()}</td>
      <td><a class="btn btn-success mb-1" href="adminModule/editProduct.jsp?pid=${p.getId()}">编辑</> </td>
      <td><button class="btn btn-danger" id="${p.getId()}" name="delProduct">删除</button></td>
    </tr>
  </tbody>
  </c:forEach>
</table>
	  	
	  </div>
		
		</body>	
		<script>
		    $("button[name=delProduct]").click(function(){
    	var e=$(this).parent().parent();
    	var id=$(this).attr('id');
    	if(window.confirm("你确定要删除ID号为"+id+"的商品吗")){
    		  $.ajax({
    				type:"GET",
    				url:"DelRecord?model=product&pid="+id,
    				dataType:"text",
    				success:function(xhr){
    					alert("删除成功");
    					e.remove();
    				}
    			});
    	}

  })
		</script>
		</html>
