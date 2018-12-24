package com.sise.OnlineBookStore;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.enterprise.inject.New;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

/**
 * Servlet implementation class UserRegist
 */
@WebServlet("UserRegist")
public class UserRegist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.getWriter().print("dddd");
		response.getWriter().print("ddddd");
		UserBean currentUser=new UserBean();
		currentUser.setUsername(request.getParameter("username"));
		currentUser.setPassword(request.getParameter("password"));
		currentUser.setTelephone(request.getParameter("telephone"));
		currentUser.setIntroduce(request.getParameter("introduce"));
		currentUser.setGender(request.getParameter("gender"));
		currentUser.setEmail(request.getParameter("email"));
		currentUser.setRole("超级用户");
		currentUser.setState(0);
		
		PrintWriter out=response.getWriter();
		QueryRunner runner=new QueryRunner(JDBCUtils.getDataSource());
		 Object[] A={currentUser.getUsername(),currentUser.getPassword()};
		 Object[] C={currentUser.getUsername(),currentUser.getPassword(),currentUser.getGender(),currentUser.getEmail(),currentUser.getTelephone(),currentUser.getIntroduce(),0,"超级用户"};
		 try {
			UserBean aObjects=runner.query("select * from user where username= ? and password= ?",new BeanHandler<UserBean>(UserBean.class),A);
			if (aObjects==null) {
				//该用户名未被使用，允许注册
				int row=runner.update("insert into user (username,password,gender,email,telephone,introduce,state, role) values(?,?,?,?,?,?,?,?)",C);
				if (row==1) {
					out.println("<div align='center'><h4>注册成功</h4><a href='index.jsp'>点击回到主页登陆</a></div>");
					HttpSession session=request.getSession(true);
					session.setAttribute("currentUser", runner.query("select * from user where username=? and password=?",new BeanHandler<UserBean>(UserBean.class), A));
				}
				else {
					out.println("<div align='center'><h4>注册失败</h4><a href='index.jsp'>点击回到主页</a></div>");
				}
			}
			else {
				out.print("<div align='center'><h4>注册失败，用户名已存在</h4><a href='index.jsp'>点击回到主页</a></div>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     	
		 
}
	
	
}