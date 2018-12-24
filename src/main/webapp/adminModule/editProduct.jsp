<%@page import="com.sise.OnlineBookStore.products"%>
<%@page import="com.sise.OnlineBookStore.JDBCUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
	String pid=request.getParameter("pid");
	if(pid!=null){
		//编辑模式
		int id=Integer.parseInt(pid);
		pageContext.setAttribute("pinfo", JDBCUtils.selectById(id));
	}
	else
		//添加模式
		pageContext.setAttribute("pinfo", new products());
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editProduct.jsp' starting page</title>
    
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
	  	<form action="InfoUploadServlet" enctype="multipart/form-data" method="post">
		  	<div class="form-group col-sm-6">
					<label >商品名称：</label>
					<input class="form-control" required name="name" value="${ pinfo.getName()}">
				</div>
			<div class="form-group col-sm-6">
					<label >商品价格：</label>
					<c:if test="${ pinfo.getPrice()=='0.0'}"><input class="form-control" required name="price" ></c:if>
					<c:if test="${ pinfo.getPrice()!='0.0'}"><input class="form-control" required name="price" value="${ pinfo.getPrice()}"></c:if>
				</div>
			<div class="form-group col-sm-6">
					<label >商品类型：</label>
					<input class="form-control" required name="category" value="${ pinfo.getCategory()}">
				</div>
			<div class="form-group col-sm-6">
					<label >商品库存：</label>
					<c:if test="${ pinfo.getPnum()=='0'}"><input class="form-control" required name="pnum" ></c:if>
					<c:if test="${ pinfo.getPnum()!='0'}"><input class="form-control" required name="pnum" value="${ pinfo.getPnum()}"></c:if>
					
				</div>
			<div class="form-group col-sm-6">
					<label >商品描述：</label>
					
					<input class="form-control"  name="description" value="${ pinfo.getDescription()}">
				</div>
			<div class="form-group col-sm-6" id="changeimg">
					<label id="clabel">修改商品封面：</label>
					<input class=""form-check-input type="checkbox" id="isChangeImgurl" name="isChangeImgurl">
					<input id="loadfile" type="file" class="form-control-file"  name="imgurl" value="${ pinfo.getImgurl()}">
				</div>
				<input name="operate" value="edit" type="hidden">
				<input name="id" value="${ pinfo.getId()}" type="hidden">
				<button type="submit" class="btn btn-success">添加</button>
		  </form>
	  </div>
  </body>
	<script>
	$("#loadfile").hide();
	if(getUrlParam('pid')==null){
		//插入模式
		$("#isChangeImgurl").hide();
		$("#clabel").html("商品封面");
		$("input[name=operate]").val("insert");
		$("#loadfile").show();
		
	}
	
		$("#isChangeImgurl").click(function(){
		
			if($("input[type='checkbox']").is(':checked')==true){
				$("#loadfile").show();
			}
			else
				$("#loadfile").hide();
		});
		function getUrlParam(name) {
       var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
       var r = window.location.search.substr(1).match(reg);  //匹配目标参数

       if (r != null)
           return unescape(r[2]);
       return null; //返回参数值
   }
	</script>
</html>
