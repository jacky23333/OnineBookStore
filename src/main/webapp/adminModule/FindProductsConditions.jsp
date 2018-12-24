<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.sise.OnlineBookStore.JDBCUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% session.setAttribute("category",JDBCUtils.selectAllCategory()); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--商品管理-->
							  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
								  
								  <!--条件筛选 按ID查找-->
								  <div class="form-row">
										<div class="col-sm-4 form-group">
											<label>通过ID查询</label>
											<input type="text" class="form-control" id="find_p_byid_inp">
									 	 </div>
									     <div class="col-sm-1 form-group"><label> -</label><button class="btn btn-success form-control" id="find_p_byid_btn">查找</button></div>									  
									</div>
								  
								  <!--条件筛选 按条件查找-->
									<div class="form-row">
										<div class="col-sm-2 form-group">
											<label>类别：</label>
										  <select class="form-control" id="category">
										  	<option>默认</option>
										  	
										  	<c:forEach items="${sessionScope.category}" var="c">
										  		<option>${c[0]}</option>
										  	</c:forEach>
										  </select>
										</div>
										
										<div class="col-sm-4 form-group">
											<label>价格：</label>
											<div class="input-group">
												<div class="input-group-prepend">
													<select class="form-control input-group-text" id="price_op">
														<option>></option>
														<option>>=</option>
														<option>=</option>
														<option><=</option>
														<option><</option>
													</select>
												</div>
												<input class="form-control" id="price_inp">
											</div>
										</div>
										<div class="col-sm-4 form-group">
											<label>库存：</label>
											<div class="input-group">
												<div class="input-group-prepend">
													<select class="form-control input-group-text" id="num_op">
														<option>></option>
														<option>>=</option>
														<option>=</option>
														<option><=</option>
														<option><</option>
													</select>
												</div>
												<input class="form-control" id="num_inp">
											</div>
										</div>
										<div class="col-sm-1 form-group"><label> -</label><button class="btn btn-success" id="find_p_bycond_btn">筛选</button></div>	
									</div>
