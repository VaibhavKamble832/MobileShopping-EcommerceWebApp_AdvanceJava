package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDao;
import com.pojo.Cart;
import com.pojo.Customer;


@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

	CartDao cartDao = new CartDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Customer customer = (Customer)session.getAttribute("customer");
		
		String action = request.getParameter("action");
		
		if(action!=null && action.equals("add")) {
			int pid = Integer.parseInt(request.getParameter("pid"));
			int cid = Integer.parseInt(request.getParameter("cid"));
			
			boolean b = cartDao.addCart(pid, cid);
			if(b){
				response.sendRedirect("index.jsp");
			}
			else {
				response.sendRedirect("index.jsp");
				
			}
		}
		else {
			List<Cart> cartList = cartDao.getAllCartByCustomer(customer.getId());
			session.setAttribute("cartList", cartList);
			response.sendRedirect("cartList.jsp");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
	}

}
