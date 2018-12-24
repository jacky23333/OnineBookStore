package com.sise.OnlineBookStore;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sise.bean.Orders;

/**
 * Servlet implementation class FindOrders
 */
@WebServlet("/FindOrders")
public class FindOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindOrders() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		if(request.getParameter("model").equals("oid")) {
			//按ID查找
			Orders p=JDBCUtils.selectOrdersByoid(request.getParameter("oval"));
			Vector< Orders> v=new Vector<Orders>();
			if (p!=null) {
				v.add(p);
				request.getSession().setAttribute("ord",v);
				request.getRequestDispatcher("/adminModule/show_orders.jsp?a=er").include(request, response);
			}
			else {
				response.getWriter().println("<center><h4>空空如也...</h4></center>");
			}
			
			
			
		}
		if(request.getParameter("model").equals("username")) {
			//按用户名查找
			Vector<Orders> p=JDBCUtils.selectOrdersByUsername(request.getParameter("oval"));
			if (p!=null) {
				request.getSession().setAttribute("ord",p);
				request.getRequestDispatcher("/adminModule/show_orders.jsp?a=er").include(request, response);
			}
			else {
				response.getWriter().println("<center><h4>空空如也...</h4></center>");
			}	
			
			
			
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
