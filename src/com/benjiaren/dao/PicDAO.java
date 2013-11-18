package com.benjiaren.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.benjiaren.bean.Pic;
import com.benjiaren.util.DBConn;

public class PicDAO {
	private Connection conn;
	private PreparedStatement ptst;
	private ResultSet rs;

	public void insertPic(Pic pic){
		conn = DBConn.getConnect();
		try{
			
			String sql = "insert into ofpic(jiongshiid,pic_name,pic_name_new,pic_add,uuid) value(?,?,?,?,?)";
			ptst = conn.prepareStatement(sql);
			ptst.setInt(1, pic.getJiongshiid());
			ptst.setString(2, pic.getPicName());
			ptst.setString(3, pic.getPicNameNew());
			ptst.setString(4, pic.getPicAdd());
			ptst.setString(5, pic.getUuid());

		    ptst.executeUpdate();
		}catch (SQLException e) {
			// TODO: handle exception
			this.getLog(e.getMessage());
		}finally{
			this.close();
		}
	}
	
	public List<Pic> getListPic(int jiongshiid){
		List<Pic> list = new ArrayList<Pic>();
		conn = DBConn.getConnect();
		try{
			
			String sql = "select idofpic,jiongshiid,pic_name,pic_name_new,pic_add,uuid from ofpic where jiongshiid = ?";
			ptst = conn.prepareStatement(sql);
			ptst.setInt(1, jiongshiid);
			rs = ptst.executeQuery();
			while(rs.next()){
				Pic pic = new Pic();
				pic.setPicid(rs.getInt("idofpic"));
				pic.setJiongshiid(rs.getInt("jiongshiid"));
				pic.setPicName(rs.getString("pic_name"));
				pic.setPicNameNew(rs.getString("pic_name_new"));
				pic.setPicAdd(rs.getString("pic_add"));
				pic.setUuid(rs.getString("uuid"));
				list.add(pic);
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
