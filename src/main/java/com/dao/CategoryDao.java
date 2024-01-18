package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pojo.Category;
import com.util.DBConnection;

public class CategoryDao {

	Connection con = DBConnection.getConnect();

	public boolean addCategory(Category category) {
		String sql = "insert into category(name, description) values(?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, category.getCategory_name());
			ps.setString(2, category.getDescription());
			int i = ps.executeUpdate();

			if(i>0) {
				return true;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 

		return false;
	}


	public boolean updateCategory(Category category) {
		String sql = "update category set name=?, description=? where id=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, category.getCategory_name());
			ps.setString(2, category.getDescription());
			ps.setInt(3, category.getId());
			int i = ps.executeUpdate();

			if(i>0) {
				return true;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 

		return false;
	}


	public boolean deleteCategory(int id) {
		String sql = "delete from category where id=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();

			if(i>0) {
				return true;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 

		return false;
	}


	public List<Category> getAllCategories() {
		String sql = "select * from category";
		List<Category> cl = new ArrayList<Category>();

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				Category category = new Category();
				category.setId(rs.getInt(1));
				category.setCategory_name(rs.getString(2));
				category.setDescription(rs.getString(3)); 
				
				cl.add(category);
			}
			return cl;

		} 
		catch (Exception e) {
			e.printStackTrace();
		} 

		return null;
	}
	
	
	public Category getCategoryById(int id) {
		
		String sql = "select * from category where id=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			Category c = new Category();
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				c.setId(rs.getInt(1)); 
				c.setCategory_name(rs.getString(2));
				c.setDescription(rs.getString(3));
			}
			return c;
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 

		return null;
	}
}





