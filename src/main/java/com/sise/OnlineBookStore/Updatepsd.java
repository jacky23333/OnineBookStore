package com.sise.OnlineBookStore;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.persistence.Id;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

/**
 * Servlet implementation class Updatepsd
 */
@WebServlet("/Updatepsd")
public class Updatepsd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Updatepsd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		request.setCharacterEncoding("utf-8");
		String oldpassword=request.getParameter("oldpassword");
		String newpassword=request.getParameter("newpassword");
		String username=((UserBean)request.getSession(true).getAttribute("currentUser")).getUsername();
		QueryRunner runner=new QueryRunner(JDBCUtils.getDataSource());
		try {
			UserBean user=runner.query("select * from user where username=? and password=?",new BeanHandler<UserBean>(UserBean.class),new Object[]{username,oldpassword});
			if (user==null) {
				
				out.print("2");
			}
			else {
				int row=runner.update("update user set password=? where username=?",new Object[] {newpassword,username});
				if (row==1) {
					request.getSession(true).removeAttribute("currentUser");
					request.getSession(true).removeAttribute("admin");
					out.print("1");
					
				}else {
					out.print("0");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			out.print("0");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
