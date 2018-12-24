<%@page import="java.io.File"%>
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'jsp1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<%=basePath %>
<%=request.getContextPath() %>
<%
	File f=new File(request.getContextPath()+"/asdf");
	if(!f.exists()){
	f.mkdir();
	System.out.println("ddd");
	}
		

 %>
  </body>
</html>
