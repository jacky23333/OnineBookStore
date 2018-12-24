package com.sise.OnlineBookStore;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DelRecord
 */
@WebServlet("/DelRecord")
public class DelRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelRecord() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		if (request.getParameter("model").equals("product")) {
			int id=Integer.parseInt(request.getParameter("pid"));
			JDBCUtils.delProductById(id);
			response.getWriter().println("true");
		}
		else if (request.getParameter("model").equals("order")) {
			System.out.println("正在取消订单");
			JDBCUtils.delOrderById(request.getParameter("oid"));
			response.getWriter().println("true");
		}
		else if (request.getParameter("model").equals("notice")) {
			System.out.println("正在删除公告");
			JDBCUtils.delNoticeById(Integer.parseInt(request.getParameter("nid")));
			response.getWriter().println("true");
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
