package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CustomerDao;
import com.pojo.Customer;


@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {

	Customer customer = new Customer();
	CustomerDao customerDao = new CustomerDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Do get");

		HttpSession session = request.getSession();

		String action = request.getParameter("action");

		if(action!=null && action.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			boolean b = customerDao.deleteCustomer(id);
			if(b) {
				response.sendRedirect("CustomerServlet");
			}
			else {
				response.sendRedirect("error.jsp");
			}
		}
		else if(action!=null && action.equals("edit")) {

			int id = Integer.parseInt(request.getParameter("id"));
			Customer customer = customerDao.getCustomerById(id);
			session.setAttribute("customer", customer);
			response.sendRedirect("updateCustomer.jsp");
			
		}
		else {		
			List<Customer> customerlist = customerDao.getAllCustomer();
			session.setAttribute("customerlist", customerlist);
			response.sendRedirect("CustomerList.jsp");
		}
			
	}

	
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("Do Post");

			String action = request.getParameter("action");
			String name = request.getParameter("name");
			String contact = request.getParameter("contact");
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			customer.setName(name);
			customer.setContact(contact);
			customer.setEmail(email);
			customer.setPassword(password);

			if(action!=null && action.equals("addCustomer")) {
				boolean b = customerDao.checkCustomerIfExist(email, contact);
				if(b) {
					request.setAttribute("message", "Email and Contact already exist..");
					RequestDispatcher rs = request.getRequestDispatcher("addCustomer.jsp");
					rs.include(request, response);
				}
				else {
					boolean result = customerDao.addCustomer(customer);
					if(result) {
						response.sendRedirect("index.jsp");
					}
					else {
						response.sendRedirect("error.jsp");					
					}
				}
			}
			else if(action!=null && action.equals("updateCustomer")) {
				
				int id = Integer.parseInt(request.getParameter("id")); 
				customer.setId(id);
				boolean b = customerDao.updateCustomer(customer);
				if(b) {
					response.sendRedirect("index.jsp");
				}
				else {
					response.sendRedirect("error.jsp");					
				}
				
			}
			




		}

	}
