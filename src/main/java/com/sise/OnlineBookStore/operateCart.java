package com.sise.OnlineBookStore;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

import com.sise.bean.CartProduct;

/**
 * Servlet implementation class AddCart
 */
@WebServlet("/operateCart")
public class operateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public operateCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json;charset=utf-8");
		HttpSession session=request.getSession();
		String productid=request.getParameter("productid");
		String type=request.getParameter("type");
		System.out.println("post被调用:"+productid+"    "+type+"   "+type.equals("add"));
		//当session没有购物车
		if (session.getAttribute("cart")==null) 
			session.setAttribute("cart",new HashMap<String, CartProduct>());
		
		
		@SuppressWarnings("unchecked")
		HashMap<String, CartProduct> cartMap=(HashMap<String, CartProduct>)session.getAttribute("cart");
		
		
		
		//添加商品
		if (type.equals("add")) {
			System.out.println("add");
			if (cartMap.containsKey(productid)) {
				cartMap.get(productid).addcount(1);
			}
			else {
				products pro=JDBCUtils.selectById(Integer.parseInt(productid));
				System.out.println(pro+"dddd");
				CartProduct cpt=new CartProduct(pro,1);
				cartMap.put(productid, cpt);
				System.out.println("o");
				
			}
			JSONObject obj = new JSONObject();
			obj.put("result", "true");
			response.getWriter().print(obj);
		}
		//删除商品
		else if (type.equals("del")) {
			cartMap.remove(productid);
		}
		//修改商品数量
		else if (type.equals("opsrcount")) {
			//创建一个json对象返回给客户端
			JSONObject obj = new JSONObject();
			
			int count=Integer.parseInt(request.getParameter("count").trim());
			System.out.println(count);
			if (count<=JDBCUtils.getPnum(Integer.parseInt(productid))) {
				cartMap.get(productid).setCount(count);
				obj.put("result", true);
				obj.put("message", "ok");
				obj.put("productid", productid);
			}
			else {
				obj.put("result", false);
				obj.put("message", "数量不能大于商品库存");
			}
			response.getWriter().print(obj);
			
			
			
			
		} 
		
		System.out.println(cartMap);
		System.out.println("-----------------------------------");
		
		for(CartProduct value:cartMap.values()) {
			System.out.println(value.getCount()+","+value.getProduct());
		}
		
		
	}

}
