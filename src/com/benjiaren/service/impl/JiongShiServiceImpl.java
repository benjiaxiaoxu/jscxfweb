package com.benjiaren.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.benjiaren.bean.Geo;
import com.benjiaren.bean.JiongShi;
import com.benjiaren.bean.JiongShiList;
import com.benjiaren.bean.User;
import com.benjiaren.dao.CommentsDAO;
import com.benjiaren.dao.JiongShiDAO;
import com.benjiaren.service.JiongShiService;

public class JiongShiServiceImpl implements JiongShiService{

	
	public JiongShiList findUserByName(String username) {
		// TODO Auto-generated method stub
		JiongShiList jsll = new JiongShiList();
		List<JiongShi> list = new JiongShiDAO().getJiongshiByUserName(username);
		List<JiongShi> listj = new ArrayList<JiongShi>();
		System.out.println(list.size());
		for(JiongShi js : list){
			js.setComments(new CommentsDAO().getCommentsByUsernameANDJiongshiId(js.getUser().getName(), js.getId()));
			listj.add(js);
		}
		jsll.setJiongshi(listj);
		return jsll;
	}


	
	public JiongShiList findALLJiongShi() {
		// TODO Auto-generated method stub
		JiongShiList jsll = new JiongShiList();
		List<JiongShi> list = new JiongShiDAO().getAllJiongshi();
		List<JiongShi> listj = new ArrayList<JiongShi>();
		System.out.println(list.size());
		for(JiongShi js : list){
			js.setComments(new CommentsDAO().getCommentsByUsernameANDJiongshiId(js.getUser().getName(), js.getId()));
			listj.add(js);
		}
		jsll.setJiongshi(listj);
		return jsll;
	}

	
	public void addJiongShiget(String text, String source, String username,
			String longitude, String latitude) {
		// TODO Auto-generated method stub
		JiongShi js = new JiongShi();
		js.setCreated_at(new Date());
		js.setText(text);
		User user = new User();
		user.setName(username);
		js.setUser(user);
		Geo geo = new Geo();
		geo.setLongitude(longitude);
		geo.setLatitude(latitude);
		js.setGeo(geo);
		
		new JiongShiDAO().insertJiongShi(js);
	}

	
	public void addJiongShipost(String text, String source, String username,
			String longitude, String latitude) {
		// TODO Auto-generated method stub
		JiongShi js = new JiongShi();
		js.setCreated_at(new Date());
		js.setText(text);
		User user = new User();
		user.setName(username);
		js.setUser(user);
		Geo geo = new Geo();
		geo.setLongitude(longitude);
		geo.setLatitude(latitude);
		js.setGeo(geo);
		
		new JiongShiDAO().insertJiongShi(js);
	}


	
	public void addAttitudesCountGet(int id, String username) {
		// TODO Auto-generated method stub
		new JiongShiDAO().AddAttitudes(id);
	}


	
	public void addAttitudesCountPost(int id, String username) {
		// TODO Auto-generated method stub
		new JiongShiDAO().AddAttitudes(id);

	}

	
	public void addRepostsCountGet(int id, String username) {
		// TODO Auto-generated method stub
		
	}


	
	public void addRepostsCountPost(int id, String username) {
		// TODO Auto-generated method stub
		
	}


	
	public JiongShiList findALLJiongShiByCount(int count) {
		// TODO Auto-generated method stub
		JiongShiList jsll = new JiongShiList();
		List<JiongShi> list = new JiongShiDAO().getJiongshiByCount(count);
		List<JiongShi> listj = new ArrayList<JiongShi>();
		System.out.println(list.size());
		for(JiongShi js : list){
			js.setComments(new CommentsDAO().getCommentsByUsernameANDJiongshiId(js.getUser().getName(), js.getId()));
			listj.add(js);
		}
		jsll.setJiongshi(listj);
		return jsll;	
		}


	
	public JiongShiList findALLJiongShiByStartStop(int start, int stop) {
		// TODO Auto-generated method stub
		JiongShiList jsll = new JiongShiList();
		List<JiongShi> list = new JiongShiDAO().getJiongshiByStartStop(start, stop);
		List<JiongShi> listj = new ArrayList<JiongShi>();
		System.out.println(list.size());
		for(JiongShi js : list){
			js.setComments(new CommentsDAO().getCommentsByUsernameANDJiongshiId(js.getUser().getName(), js.getId()));
			listj.add(js);
		}
		jsll.setJiongshi(listj);
		return jsll;	
		}


}
