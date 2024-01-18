package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pojo.Vendor;
import com.util.DBConnection;

public class VendorDao {

	Connection con = DBConnection.getConnect();


	public boolean addVendor(Vendor vendor) {

		String sql = "insert into vendor(name, contact, email, password) values(?,?,?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, vendor.getName());
			ps.setString(2, vendor.getContact());
			ps.setString(3, vendor.getEmail());
			ps.setString(4, vendor.getPassword());
			
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
	
	
	public List<Vendor> getAllVendors(){
		String sql = "select * from vendor";
		List<Vendor> vendorlist = new ArrayList<Vendor>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Vendor vendor = new Vendor();
				vendor.setId(rs.getInt(1));
				vendor.setName(rs.getString(2));
				vendor.setContact(rs.getString(3));
				vendor.setEmail(rs.getString(4));
				vendor.setPassword(rs.getString(5));
				
				vendorlist.add(vendor);
			}
			return vendorlist;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	public boolean deleteVendor(int id) {

		String sql = "delete from vendor where id=?";

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
	
	
	
	public boolean editVendor(Vendor vendor) {
		String sql = "update vendor set name=?, contact=?, email=?, password=? where id=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, vendor.getName());
			ps.setString(2, vendor.getContact());
			ps.setString(3, vendor.getEmail());
			ps.setString(4, vendor.getPassword());
			ps.setInt(5, vendor.getId());
			
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
	
	
	public Vendor getVendorById(int id) {
		String sql = "select * from vendor where id=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			Vendor v = new Vendor();
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				v.setId(rs.getInt(1));
				v.setName(rs.getString(2));
				v.setContact(rs.getString(3));
				v.setEmail(rs.getString(4));
				v.setPassword(rs.getString(5));
			}
			return v;
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	} 
	
	
	public Vendor vendorLogin(String email,  String password) {
		String sql = "select * from vendor where email=? and password=?";
		Vendor v = null;
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				v = new Vendor();
				v.setId(rs.getInt("id"));
				v.setName(rs.getString("name"));
				v.setContact(rs.getString("contact"));
				v.setEmail(rs.getString("email"));
				v.setPassword(rs.getString("password"));
			}
			return v;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
}
