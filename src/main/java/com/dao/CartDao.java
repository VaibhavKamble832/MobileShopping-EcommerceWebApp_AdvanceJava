package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pojo.Cart;
import com.pojo.Customer;
import com.util.DBConnection;

public class CartDao {

	Connection con = DBConnection.getConnect();
	
	
	public boolean addCart(int product_id, int customer_id) {
		String sql = "insert into cart(product_id, customer_id) values(?,?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, product_id);
			ps.setInt(2, customer_id);
			
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
	
	
	public List<Cart> getAllCartByCustomer(int id){
		String sql = "select cr.id, p.name, p.price, p.description from product p inner join cart cr on p.id=cr.product_id where cr.customer_id=?";
		List<Cart> cartList = new ArrayList<Cart>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Cart cr = new Cart();
				cr.setId(rs.getInt(1));
				cr.setName(rs.getString(2));
				cr.setPrice(rs.getDouble(3));
				cr.setDescription(rs.getString(4));
				
				cartList.add(cr);
			}
			return cartList;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	} 
	
}
