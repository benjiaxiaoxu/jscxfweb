package com.benjiaren.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.benjiaren.bean.User;
import com.benjiaren.util.DBConn;
/**
 * table = 'ofuser'
 * @author xuzhiguang
 *
 */
public class UserDAO {
	private Connection conn;
	private PreparedStatement ptst;
	private ResultSet rs;
	
	public User getUserName(String name) {
		conn = DBConn.getConnect();
		User user = new User();
		try{
			ptst = conn.prepareStatement("select username,email from ofuser where username = ?");
			ptst.setString(1, name);
			rs = ptst.executeQuery();
			while(rs.next()){
				user.setName(rs.getString("username"));
				user.setEmail(rs.getString("email"));
			}
		}catch (SQLException e) {
			// TODO: handle exception
			this.getLog(e.getMessage());

		}finally{
			this.close();
		}
		
		return user;
	}
	
	public List<User> getAllUser(){
		conn = DBConn.getConnect();
		List<User> list = new ArrayList<User>();
		try{
			ptst = conn.prepareStatement("select username,email from ofuser");
			rs = ptst.executeQuery();
			while(rs.next()){
				User user = new User();
				user.setName(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				list.add(user);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			this.getLog(e.getMessage());

		}finally{
			this.close();
		}
		
		return list;
		
	}
	
	public void close(){
		try{
			if(rs != null){
				rs.close();
			}
			if(ptst != null){
				ptst.close();
			}
			if(conn != null){
				conn.close();
			}
		}catch(final SQLException e){
			this.getLog(e.getMessage());
		}
		
	}
	
	private void getLog(String log){
		org.apache.log4j.BasicConfigurator.configure();
		org.apache.log4j.Logger logger=Logger.getLogger(this.getClass());
		logger.error(log);
	}
	
}
