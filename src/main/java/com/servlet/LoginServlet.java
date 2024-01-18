package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CustomerDao;
import com.pojo.Customer;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	CustomerDao customerDao = new CustomerDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		
		String action = request.getParameter("action");
		if(action!=null && action.equals("logout")) {
			session.invalidate();
			response.sendRedirect("index.jsp");
		}
	
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String email = request.getParameter("uname");
		String password = request.getParameter("passw");
		
	
		if(email!=null && password!=null && email.equals("admin123@gmail.com") && password.equals("admin123")) {
			session.setAttribute("admin", "admin");
			response.sendRedirect("index.jsp");
			
		}
		else {
			Customer customer = customerDao.customerLogin(email, password);
			if(customer!=null) {
				session.setAttribute("customer", customer);
				response.sendRedirect("index.jsp");
			}
			else {
				response.sendRedirect("error.jsp");
			}
			
		}
		
		
	}

}
