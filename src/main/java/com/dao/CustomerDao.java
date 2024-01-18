package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pojo.Customer;
import com.util.DBConnection;

public class CustomerDao {

	Connection con = DBConnection.getConnect();

	public boolean addCustomer(Customer customer) {
		String sql = "insert into customer(name, contact, email, password) values(?,?,?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, customer.getName());
			ps.setString(2, customer.getContact());
			ps.setString(3, customer.getEmail());
			ps.setString(4, customer.getPassword());
			
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
	
	
	
	public boolean updateCustomer(Customer customer) {
		String sql = "update customer set name=?, contact=?, email=?, password=? where id=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, customer.getName());
			ps.setString(2, customer.getContact());
			ps.setString(3, customer.getEmail());
			ps.setString(4, customer.getPassword());
			ps.setInt(5, customer.getId());
			
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

	
	
	public boolean deleteCustomer(int id) {
		String sql = "delete from customer where id=?";
		
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
	
	
	public List<Customer> getAllCustomer() {
		String sql = "select * from customer";
		List<Customer> cl = new ArrayList<Customer>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Customer c = new Customer();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setContact(rs.getString(3));
				c.setEmail(rs.getString(4));
				c.setPassword(rs.getString(5));
				
				cl.add(c);
			}
			return cl;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Customer getCustomerById(int id) {
		
		String sql = "select * from customer where id=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			Customer c = new Customer();
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setContact(rs.getString(3));
				c.setEmail(rs.getString(4));
				c.setPassword(rs.getString(5));
			}
			return c;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	public boolean checkCustomerIfExist(String email, String contact) {
		
		String sql = "select * from customer where email=? or contact=?";
		Customer c = null;
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, contact);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				c=new Customer();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setContact(rs.getString(3));
				c.setEmail(rs.getString(4));
				c.setPassword(rs.getString(5));
				System.out.println("----Check Data----");
			}
			
			if(c!=null) {
				if(c.getEmail().equals(email) || c.getContact().equals(contact)) {
					return true;
				}
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	
	

	public Customer customerLogin(String email, String password) {
		
		String sql = "select * from customer where email=? or password=?";
		Customer c = null;
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				c=new Customer();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setContact(rs.getString(3));
				c.setEmail(rs.getString(4));
				c.setPassword(rs.getString(5));
				System.out.println("----Check Data----");
			}
			return c;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
}
