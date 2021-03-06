package com.sise.OnlineBookStore;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.Null;

/**
 * Servlet Filter implementation class IdentityConfirm
 */
@WebFilter(filterName="2",urlPatterns = {"adminPage.jsp","adminModule/*",})
public class IdentityConfirm implements Filter {

    /**
     * Default constructor. 
     */
    public IdentityConfirm() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpServletRequest request1=(HttpServletRequest)request;
		HttpServletResponse response1=(HttpServletResponse)response;
		HttpSession session=request1.getSession();
		
		if (session.getAttribute("admin")==null) {
			response1.sendRedirect("invailuser.html");
		}
		chain.doFilter(request1, response1);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}