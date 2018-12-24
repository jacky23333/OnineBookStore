<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.sise.OnlineBookStore.UserBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-light bg-primary text-white"> 
				<a href="index.jsp" class="navbar-brand text-white">OnlineBookStore</a>
			
				<form class="form-inline ">
					<!--镶嵌JSP-->
					<c:if test="${!empty sessionScope.admin}">
						<a class="btn btn-primary border-white mb-2 mr-2" href="adminPage.jsp" >商城后台管理</a>
					</c:if>
					<c:if test="${(empty sessionScope.currentUser) && (empty sessionScope.admin) }">
						<button type="button" class="btn btn-primary border-white mb-2 mr-2" data-toggle="modal" data-target="#login">登陆</button>
							<button type="button" class="btn btn-primary border-white mb-2 mr-2" data-toggle="modal" data-target="#exampleModalCenter">注册</button>
					</c:if>
					<c:if test="${!empty sessionScope.currentUser}">
						<a  class="btn btn-primary border-white mb-2 mr-2" href="userinfo.jsp" >${currentUser.username }</a>
						<a  class="btn btn-primary border-white mb-2" href="Signout" >注销</a>
					</c:if>
					
				</form>
		</nav>
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				  <span aria-hidden="true">&times;</span>
				</button>
			  </div>
			  <div class="modal-body">
			   <form id="login_modal">
				   <div class="form-row">
						<div class="form-group col-sm-12 col-md-6">
							<label >用户名：</label>
							<input class="form-control" placeholder="Username" required name="username" id="login_usn">
						</div>
				   </div>
				   <div class="form-row">
						<div class="form-group col-sm-12 ">
							<label >密码：</label>
							<input type="password" class="form-control" required placeholder="Password" name="password" id="login_psd">
						</div>
					</div>
					<div class="form-row" id="alert-div">

					</div>
				  </form>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
				<button type="button" class="btn btn-primary" id="login_btn_m">登陆</button>
			  </div>
			</div>
		  </div>
		</div>					
			
							
		<!-- 注册Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				  <span aria-hidden="true">&times;</span>
				</button>
			  </div>
			  <div class="modal-body">
			   <div class="container-fluid">
				<div class="card border-primary">
					<h5 class="card-header">用户注册<small> User regist</small></h5>
					<div class="card-body">
				<form method="POST" action="UserRegist">
					<div class="form-row">
						<div class="form-group col-sm-12 col-md-6">
							<label >用户名：</label>
							<input class="form-control"  required name="username" id="signup_usn" placeholder="Username">
						</div>
						<div class="form-group col-sm-12 col-md-6">
							<label >邮箱：</label>
							<input type="email" required autofocus class="form-control" name="email" placeholder="Email">
						</div>


					</div>
					<div class="form-row">
						<div class="form-group col-sm-12 col-md-6">
							<label >密码：</label>
							<input class="form-control" required placeholder="Password" name="password" type="password">
						</div>
						<div class="form-group col-sm-12 col-md-6">
							<label >确定密码：</label>
							<input class="form-control" required placeholder="ConfirmPassword" name="currentpassword" type="password">
						</div>


					</div>
					<div class="form-row">
						<div class="form-group col-sm-12 col-md-6">
							<label >电话：</label>
							<input type="tel" class="form-control" required placeholder="telegram" name="telephone">
						</div>
						<div class="form-group col-sm-12 col-md-6">
							<label >自我介绍：</label>
							<input type="text" class="form-control" required placeholder="introduce" name="introduce">
						</div>
						<div class="form-group col-sm-12 col-md-6">
							<label >性别：</label>
							<div class="form-check">
								<label><input type="radio" required name="gender" value="男"> 男</label>
								<label><input type="radio"  name="gender" value="女"> 女</label>
							</div>
						</div>

					</div>
					<div class="form-row">
						<div class="col-sm-12 col-md-12 btn-group">
							<button class="btn btn-primary" id="signup_rigt">注册</button>
						</div>
					</div>
				</form></div>
					</div>
			</div>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
			  </div>
			</div>
		  </div>
		</div>					
	<script type="text/javascript">
	$("#signup_usn").keyup(function(){
	$("#signup_usn").removeClass("is-invalid");
	$("#signup_usn").removeClass("is-valid");
	$("#tips").remove();
		  $.ajax({
		type:"post",
		url:"CheckUsername",
		dataType:"text",
		data:{
			username:$("#signup_usn").val()
		},
		success:function(xhr){
			if(xhr==1){
			
			$("#signup_usn").addClass("is-valid");
			$("#signup_usn").after("<div class='valid-feedback' id='tips'>Looks! good! 用户名可用 </div>");
			$("#signup_rigt").removeAttr("disabled")
		}
		else{
			
			$("#signup_usn").addClass("is-invalid");
			$("#signup_usn").after("<div class='invalid-feedback' id='tips'>oh!I am sorry 用户名已被使用，请再换一个 </div>");
			
			$("#signup_rigt").attr("disabled",true);
		}
	}
	});
	});
</script>
</script>					
							
		
