package com.sise.OnlineBookStore;

import java.awt.List;
import java.io.IOException;
import java.util.HashMap;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import com.sise.bean.CartProduct;

/**
 * Servlet implementation class GenerateOrder
 */
@WebServlet("/preOrder")
public class preOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public preOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		HashMap<String, CartProduct> cartMap=(HashMap<String, CartProduct>)session.getAttribute("cart");
		String[] prolist=request.getParameterValues("productid");
		Vector<CartProduct> vet=new Vector<CartProduct>();
		double sum=0;
		for(int i=0;i<prolist.length;i++) {
			//累计总价
			double dangjia=cartMap.get(prolist[i]).getProduct().getPrice();
			int count=cartMap.get(prolist[i]).getCount();
			sum+=(dangjia*count);
			//把商品添加进购买列表
			vet.add(cartMap.get(prolist[i]));
			//从购物车里删除对应商品
			//cartMap.remove(prolist[i]);
			
		}
		
		
		HashMap<String, Object> preInfo=new HashMap<String, Object>();
		preInfo.put("products", vet);
		preInfo.put("price", sum);
		session.setAttribute("preInfo", preInfo);
		response.sendRedirect("preOrder.jsp");
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
