package com.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.dao.VendorDao;
import com.mysql.cj.Session;
import com.pojo.Category;
import com.pojo.Product;
import com.pojo.Vendor;

@MultipartConfig
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

	CategoryDao categoryDao = new CategoryDao();
	VendorDao vendorDao = new VendorDao(); 
	Product product = new Product();
	ProductDao productDao = new ProductDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(); 
		String action = request.getParameter("action");

		if(action!=null && action.equals("addProduct")) {
			List<Category> categoryList = categoryDao.getAllCategories();
			List<Vendor> vendorsList = vendorDao.getAllVendors();
			session.setAttribute("categoryList", categoryList);
			session.setAttribute("vendorList", vendorsList);
			response.sendRedirect("addproduct.jsp");
		}
		else if(action!=null && action.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			boolean b = productDao.deleteProduct(id);
			if(b) {
				response.sendRedirect("ProductServlet");
			}
			else {
				response.sendRedirect("error.jsp");				
			}
		}
		else if(action!=null && action.equals("edit")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Product product = productDao.getProductsById(id);
			session.setAttribute("product", product);
			List<Category> clist = categoryDao.getAllCategories();
			session.setAttribute("clist", clist);
			List<Vendor> vlist = vendorDao.getAllVendors();
			session.setAttribute("vlist", vlist);
			response.sendRedirect("updateProduct.jsp");

		}

		else {
			List<Product> productList = productDao.getAllProducts();
			session.setAttribute("productList", productList);
			response.sendRedirect("productlist.jsp");
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String name = request.getParameter("name");



		if(action!=null && action.equals("addProduct")) {

			Part file = request.getPart("image");
			String imageFileName = file.getSubmittedFileName();

			String uploadPath = "C:\\Vaibhav New\\JAVA New\\ECommerce_WebApp\\src\\main\\webapp\\Resources\\assets\\"+imageFileName;
			
			
			try {
				FileOutputStream fos = new FileOutputStream(uploadPath);
				InputStream is = file.getInputStream();

				byte[] data = new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();

				Double price = Double.parseDouble(request.getParameter("price"));
				String description = request.getParameter("description");
				int category_id = Integer.parseInt(request.getParameter("category_id"));
				int vendor_id = Integer.parseInt(request.getParameter("vendor_id"));

				product.setName(name); product.setImage(imageFileName);;product.setPrice(price);
				product.setDescription(description); product.setCategory_id(category_id); 
				product.setVendor_id(vendor_id);

				boolean b = productDao.addProduct(product);
				if(b) {
					response.sendRedirect("index.jsp");
				}
				else {
					response.sendRedirect("error.jsp");
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}

		}
		else if(action!=null && action.equals("updateProduct")) {

			Double price = Double.parseDouble(request.getParameter("price"));
			String description = request.getParameter("description");
			int category_id = Integer.parseInt(request.getParameter("category_id"));
			int vendor_id = Integer.parseInt(request.getParameter("vendor_id"));

			product.setName(name); product.setPrice(price);
			product.setDescription(description); product.setCategory_id(category_id); 
			product.setVendor_id(vendor_id);

			int id = Integer.parseInt(request.getParameter("id"));
			product.setId(id);
			boolean b = productDao.updateProduct(product);
			if(b) {
				response.sendRedirect("index.jsp");
			}
			else {
				response.sendRedirect("index.jsp");

			}


		}
		else if(action!=null && action.equals("searchProduct")) {
			String searchName = request.getParameter("searchName");
			List<Product> productList = productDao.searchProducts(searchName);
			session.setAttribute("productList", productList);
			response.sendRedirect("productlist.jsp");

		}

		else if(action!=null && action.equals("searchProductByVendor")) {
			String searchName = request.getParameter("searchName");
			int id = Integer.parseInt(request.getParameter("vendorid"));
			List<Product> productList = productDao.searchProductsByVendor(searchName,id);
			session.setAttribute("productList", productList);
			System.out.println(productList);
			response.sendRedirect("productlist.jsp");

		}
	}


}






