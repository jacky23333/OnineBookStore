package com.sise.OnlineBookStore;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import jdk.nashorn.internal.parser.JSONParser;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		System.out.print(request.getParameter("username"));
		out.print(request.getParameter("username")+request.getParameter("password"));
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		String a=request.getParameter("username");
		//out.print(request.getParameter("username")+request.getParameter("password"));
		QueryRunner runner=new QueryRunner(JDBCUtils.getDataSource());
		System.out.println(request.getParameter("username")+"ss"+request.getParameter("password"));
		Object[] info= {request.getParameter("username"),request.getParameter("password")};
		try {
			UserBean user=runner.query("select * from user where username=? and password=?",new BeanHandler<UserBean>(UserBean.class),info);
			
			if (user==null) {
				
				out.print("0");
				
			}
			
			else if(user.getRole().equals("超级用户")) {
				HttpSession session=request.getSession(true);
				session.setAttribute("admin",user);
				session.setAttribute("currentUser",user);
				out.print("admin");
				System.out.println(user.getRole());
				System.out.println(user.getRole().equals("超级用户"));
				System.out.println("管理员登陆");
			}
			else {
				
				HttpSession session=request.getSession(true);
				session.setAttribute("currentUser",user);
				out.print("1");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
