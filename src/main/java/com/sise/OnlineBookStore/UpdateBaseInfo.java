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

/**
 * Servlet implementation class UpdataBaseInfo
 */
@WebServlet("/UpdateBaseInfo")
public class UpdateBaseInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBaseInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(true);
		int userid=((UserBean)session.getAttribute("currentUser")).getId();
		Object[] baseInfo= {request.getParameter("gender"),request.getParameter("email"),request.getParameter("telephone"),request.getParameter("introduce"),userid};
		QueryRunner runner=new QueryRunner(JDBCUtils.getDataSource());
		try {
			int row=runner.update("update user set gender=?,email=?,telephone=?,introduce=? where id=?",baseInfo);
			if (row>0) {
				UserBean userBean=runner.query("select * from user where id=?",new BeanHandler<UserBean>(UserBean.class),new Object[] {userid});
				if (userBean==null) {
					System.out.println(userBean);
				}
				session.setAttribute("currentUser",userBean);
				out.print("1");
			}else {
				out.print("0");
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
