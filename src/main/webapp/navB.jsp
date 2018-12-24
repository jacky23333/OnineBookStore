<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.sise.OnlineBookStore.UserBean"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary"> <a class="navbar-brand" href="#">Navbar</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
				<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav">
								<li class="nav-item active"> <a class="nav-link" href="#">主页 <span class="sr-only">(current)</span></a> </li>
								<li class="nav-item"> <a class="nav-link" href="booklist?category=小说">小说</a> </li>
								<li class="nav-item"> <a class="nav-link" href="booklist?category=漫画">漫画</a> </li>
								<li class="nav-item"> <a class="nav-link disabled" href="booklist?category=IT">IT</a> </li>
								<li class="nav-item"> <a class="nav-link disabled" href="booklist?category=金融">金融</a> </li>
						</ul>
				</div>
				<form class="form-inline" action="FindBook" method="post">
						<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="val">
						<button class="btn btn-outline-primary my-2 my-sm-0 border-white text-white" type="submit ">Search</button>
				</form>
		</nav>
