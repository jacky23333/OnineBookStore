package com.sise.OnlineBookStore;

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
import com.sise.bean.ReceiverInfo;

/**
 * Servlet implementation class GenerateOrder
 */
@WebServlet("/GenerateOrder")
public class GenerateOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings({ "unchecked", "unlikely-arg-type" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request. setCharacterEncoding("utf-8");
		
		//初始化相关变量
		HttpSession session=request.getSession();
		//Vector<preOrder> preOrders=(Vector<preOrder>)request.getSession().getAttribute("preOrder");
		UserBean userInfo=(UserBean)request.getSession().getAttribute("currentUser");
		String receiverPhone =request.getParameter("receiverPhone");
		String receiverName =request.getParameter("receiverName");
		String receiverAddress =request.getParameter("receiverAddress");
		ReceiverInfo rInfo=new ReceiverInfo(receiverPhone,receiverName,receiverAddress);
		HashMap<String, Object> preInfo=(HashMap<String, Object>)request.getSession().getAttribute("preInfo");
		
		
		boolean reslut=JDBCUtils.GenerateOrder(userInfo, rInfo,preInfo);
		
		if (reslut==true) {
			//response.sendRedirect("MyHtml.html");
			//删除购物车对应商品
			HashMap<String, CartProduct> cartMap=(HashMap<String, CartProduct>)request.getSession().getAttribute("cart");
			System.out.println("cartmap:"+cartMap);
			System.out.println(cartMap.get("25002"));
			System.out.println(cartMap.get(25002));
			for(CartProduct cpt:(Vector<CartProduct>)preInfo.get("products")) {
				cartMap.remove(""+cpt.getProduct().getId()+"");
			}
			System.out.println("cartmap:"+cartMap);
			session.removeAttribute("preInfo");
			response.sendRedirect("MyHtml.html");
		}
		else {
			response.getWriter().print("出现未知错误");
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
