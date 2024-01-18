package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CategoryDao;
import com.pojo.Category;


@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {

	Category category = new Category();
	CategoryDao categoryDao = new CategoryDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.err.println("Do Get");

		HttpSession session = request.getSession();

		String action = request.getParameter("action");

		if(action!=null && action.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			boolean b = categoryDao.deleteCategory(id);

			if(b) {
				response.sendRedirect("CategoryServlet");
			}
			else {
				response.sendRedirect("error.jsp");
			}
		}
		else if(action!=null && action.equals("edit")){

			int id = Integer.parseInt(request.getParameter("id"));
			Category category = categoryDao.getCategoryById(id);
			session.setAttribute("category", category);
			response.sendRedirect("updateCategory.jsp");

		}
		else {
			List<Category> categorylist = categoryDao.getAllCategories();
			session.setAttribute("categorylist", categorylist);
			response.sendRedirect("categorylist.jsp");			
		}


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.err.println("Do Post");

		String action = request.getParameter("action");
		String category_name = request.getParameter("category_name");
		String description = request.getParameter("description");

		category.setCategory_name(category_name);
		category.setDescription(description);

		if(action!=null && action.equals("addCategory")) {
			
			boolean b = categoryDao.addCategory(category);
			if(b) {
				response.sendRedirect("index.jsp");
			}
			else {
				response.sendRedirect("error.jsp");
			}
		}
		else if(action!=null && action.equals("updateCategory")) {
			
			int id = Integer.parseInt(request.getParameter("id"));
			category.setId(id);
			boolean b = categoryDao.updateCategory(category);
			
			if(b) {
				response.sendRedirect("CategoryServlet");
			}
			else {
				response.sendRedirect("error.jsp");				
			}
			
		}


	}

}
