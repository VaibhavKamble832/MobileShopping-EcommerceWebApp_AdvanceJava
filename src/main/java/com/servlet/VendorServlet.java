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

import com.dao.ProductDao;
import com.dao.VendorDao;
import com.pojo.Product;
import com.pojo.Vendor;


@WebServlet("/VendorServlet")
public class VendorServlet extends HttpServlet {

	Vendor vendor = new Vendor();
	VendorDao vendorDao = new VendorDao();
	ProductDao productDao = new ProductDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String action = request.getParameter("action");

		if(action!=null && action.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			boolean b = vendorDao.deleteVendor(id);
			if(b) {
				response.sendRedirect("VendorServlet");
			}
			else {
				response.sendRedirect("error.jsp");
			}
		}
		else if (action!=null && action.equals("edit")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Vendor vendor = vendorDao.getVendorById(id);
			session.setAttribute("vendor", vendor);
			response.sendRedirect("updatevendor.jsp");

		}

		else {
			List<Vendor> vendorList  = vendorDao.getAllVendors();
			session.setAttribute("vendorList", vendorList);
			response.sendRedirect("vendorlist.jsp");			
		}


	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String name = request.getParameter("name");
		String contact = request.getParameter("contact");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		vendor.setName(name); vendor.setContact(contact);
		vendor.setEmail(email); vendor.setPassword(password);

		if(action!=null && action.equals("addVendor")) {

			boolean b = vendorDao.addVendor(vendor);
			if(b) {
				request.setAttribute("rmsg", "Vendor Registered Successfuly...");
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}
		}
		else if(action!=null && action.equals("updateVendor")) {

			int id = Integer.parseInt(request.getParameter("id"));
			vendor.setId(id);

			boolean b = vendorDao.editVendor(vendor);
			if(b) {
				response.sendRedirect("VendorServlet"); 
			}
			else {
				response.sendRedirect("error.jsp");
			}
		}
		else if(action!=null && action.equals("vendorLogin")) {
			
			Vendor vendor = vendorDao.vendorLogin(email, password);
			if(vendor!=null) {
				List<Product> productList = productDao.getAllProductsByVendor(vendor.getId());
				session.setAttribute("productList", productList);
				session.setAttribute("vendor", vendor);
				response.sendRedirect("index.jsp");
			}
			else {
				response.sendRedirect("seller.jsp");
				
			}
		}

	}

}
