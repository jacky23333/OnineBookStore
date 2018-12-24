package com.sise.OnlineBookStore;

import java.io.IOException;
import java.util.List;
import java.util.Locale.Category;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.Null;
import javax.websocket.Session;

/**
 * Servlet implementation class FindProducts
 */
@WebServlet("/FindProducts")
public class FindProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindProducts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		//判断是按条件查找还是按ID查找
		System.out.println(request.getParameter("pid"));
		if(request.getParameter("pid")!=null) {
			//按ID查找
			System.out.println(request.getParameter("pid"));
			products p=JDBCUtils.selectById(Integer.parseInt(request.getParameter("pid")));
			if (p!=null) {
				Vector< products> v=new Vector<products>();
				v.add(p);
				request.getSession().setAttribute("products",v);
				request.getRequestDispatcher("/adminModule/show_products.jsp?a=er").include(request, response);
			}
			else {
				response.getWriter().println("<br><br><h4>空空如也</h4>");
			}
			
			
		}
		else {
			//按条件查找
			String category=request.getParameter("category");
			String priceOp=request.getParameter("priceOp");
			String priceInp=request.getParameter("priceInp");
			String numOp=request.getParameter("numOp");
			String numInp=request.getParameter("numInp");
			
			if(category.equals("默认"))
				category="1=1";
			else 
				category="category='"+category+"'";
			
			System.out.println(priceInp.length()==0);
			if(priceInp.length()==0)
				priceInp="1=1";
			else 
				priceInp="price "+priceOp+priceInp;
			
			if(numInp.length()==0)
				numInp="1=1";
			else 
				numInp="pnum "+numOp+numInp;
			
			String sql="select * from products where "+category+" and "+priceInp+" and "+numInp;
			
			System.out.println(sql);
			
			request.getSession().setAttribute("products",JDBCUtils.selectByCondition(sql));
			request.getRequestDispatcher("/adminModule/show_products.jsp?a=er").include(request, response);
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
