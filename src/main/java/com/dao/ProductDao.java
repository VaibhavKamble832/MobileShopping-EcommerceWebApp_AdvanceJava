package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pojo.Product;
import com.util.DBConnection;

public class ProductDao {

	Connection con = DBConnection.getConnect();

	public boolean addProduct(Product product) {
		String sql = "insert into product(name, image, price, description, category_id, vendor_id) values(?,?,?,?,?,?)";


		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, product.getName());
			ps.setString(2, product.getImage());
			ps.setDouble(3, product.getPrice());
			ps.setString(4, product.getDescription());
			ps.setInt(5, product.getCategory_id());
			ps.setInt(6, product.getVendor_id());

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


	public List<Product> getAllProducts(){
		String sql = "select p.id, p.name, p.image, p.description, p.price, c.name as category, v.name as vendor from product p inner join category c on c.id = p.category_id inner join vendor v on v.id = p.vendor_id";
		List<Product> productList = new ArrayList<Product>(); 
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setImage(rs.getString("image"));
				product.setPrice(rs.getDouble("price"));
				product.setDescription(rs.getString("description"));
				product.setCategoryName(rs.getString("category"));
				product.setVendorName(rs.getString("vendor"));
				
				productList.add(product);
			}
			return productList;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	public Product getProductsById(int id){
		String sql = "select p.id, p.name, p.description, p.price, c.name as category, v.name as vendor from product p inner join category c on c.id = p.category_id inner join vendor v on v.id = p.vendor_id where p.id=?";
		Product p = null;
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getDouble("price"));
				p.setDescription(rs.getString("description"));
				p.setCategoryName(rs.getString("category"));
				p.setVendorName(rs.getString("vendor"));
				
			}
			return p;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	public boolean deleteProduct(int id) {
		String sql = "delete from product where id=?";
		
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
	
	
	
	public boolean updateProduct(Product product) {
		
		String sql = "update product set name=?, price=?, description=?, category_id=?, vendor_id=? where id=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, product.getName());
			ps.setDouble(2, product.getPrice());
			ps.setString(3, product.getDescription());
			ps.setInt(4, product.getCategory_id());
			ps.setInt(5, product.getVendor_id());
			ps.setInt(6, product.getId());
			
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
	
	
	public List<Product> getAllProductsByVendor(int id){
		String sql = "select p.id, p.name, p.description, p.price, c.name as category, v.name as vendor from product p inner join category c on c.id = p.category_id inner join vendor v on v.id = p.vendor_id where vendor_id=?";
		List<Product> productList = new ArrayList<Product>(); 
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getDouble("price"));
				product.setDescription(rs.getString("description"));
				product.setCategoryName(rs.getString("category"));
				product.setVendorName(rs.getString("vendor"));
				
				productList.add(product);
			}
			return productList;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public List<Product> searchProducts(String product_name){
		String sql = "select p.id, p.name, p.description, p.price, c.name as category, v.name as vendor from product p inner join category c on c.id = p.category_id inner join vendor v on v.id = p.vendor_id where p.name like '%"+product_name+"%' " ;
		List<Product> productList = new ArrayList<Product>(); 
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getDouble("price"));
				product.setDescription(rs.getString("description"));
				product.setCategoryName(rs.getString("category"));
				product.setVendorName(rs.getString("vendor"));
				
				productList.add(product);
			}
			return productList;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public List<Product> searchProductsByVendor(String product_name, int vendorid){
		String sql = "select p.id, p.name, p.description, p.price, c.name as category, v.name as vendor from product p inner join category c on c.id = p.category_id inner join vendor v on v.id = p.vendor_id where p.name like '%"+product_name+"%' && v.id="+vendorid+"" ;
		List<Product> productList = new ArrayList<Product>(); 
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getDouble("price"));
				product.setDescription(rs.getString("description"));
				product.setCategoryName(rs.getString("category"));
				product.setVendorName(rs.getString("vendor"));
				
				productList.add(product);
			}
			return productList;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
}
