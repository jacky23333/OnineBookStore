<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.sise.OnlineBookStore.JDBCUtils"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% session.setAttribute("notices", JDBCUtils.selectAllnotices()); %>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'show_notices.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	  <link rel="stylesheet" href="../bootstrap-4.1.3-dist/css/bootstrap.css">
	  <script src="../bootstrap-4.1.3-dist/js/jquery-3.3.1.js"></script>
	 <script src="../bootstrap-4.1.3-dist/js/bootstrap.js"></script>

  </head>
  
  <body>

<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">公告管理</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
          	<input type="hidden" value="" id="idpoint">
            <label for="recipient-name" class="col-form-label">标题</label>
            <input type="text" class="form-control" id="title-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">内容</label>
            <textarea class="form-control" id="details-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="edited">保存</button>
      </div>
    </div>
  </div>
</div>
   <div class="container">
	  <c:forEach items="${ notices }" var="n">
	  <div class="card mb-3" style="width: 30rem;">
		  <div class="card-body">
			<h5 class="card-title" id="title${ n.n_id}">${n.title }</h5>
			<p class="" id="details${ n.n_id}">${n.details }</p>
			<p id="point${ n.n_id}"></p>
			<a  class="btn btn-success" id="${ n.n_id}" name="editNotice">编辑</a>
			<a  class="btn btn-danger" id="${ n.n_id}" name="delNotice">删除</a>
		  </div>
		</div>
	  </c:forEach>
	  </div>
  </body>
    <script>
    
		    $("a[name=delNotice]").click(function(){
    	var e=$(this);
    	var card=e.parent().parent();
    	var nid=$(this).attr('id');
    	if(window.confirm("你确定要删除公告ID为"+nid+"的公告吗")){
    		  $.ajax({
    				type:"post",
    				url:"DelRecord",
    				dataType:"text",
    				data:{
    					model:"notice",
    					nid:nid
    				},
    				success:function(xhr){
    					alert("删除成功");
    					card.remove();
    				}
    			});
    	}

  })
  
 $("a[name=editNotice]").click(function(){
  		   var details=$(this).prev().prev().html();
	  		var title=$(this).prev().prev().prev().html();
	  		$("#title-name").val(title);
	  	   $("#details-text").val(details);
	  	    $("#idpoint").val($(this).attr("id"));
 		    $('#exampleModal1').modal('show');
 		    

  })
  
     $("#edited").click(function(){
		    	var e=$(this);
		    	
		    	$.ajax({
    				type:"post",
    				url:"EditNotice",
    				dataType:"text",
    				data:{
    					nid:$("#idpoint").val(),
    					title:$("#title-name").val(),
    					details:$("#details-text").val()
    				},
    				success:function(xhr){
    					alert("修改成功");
    					window.location.reload();
    					
    				}
    			});
		    	
		    	
		    	
		    	

  })
  
  
		</script>
  
</html>
