package com.benjiaren.service;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import com.benjiaren.bean.JiongShiList;

/**
 * 
 * @author xuzhiguang
 *
 */

@Path(value = "/jiongshi")   
@Produces("application/json") 
public interface JiongShiService {
	
	/**
	 * �����û�����ѯ
	 * @param username
	 * @return
	 */
	
	@GET  
    @Path(value = "/{username}/search")  
	public JiongShiList findUserByName(@PathParam("username")String username);
	
	/**
	 * ͨ��get��ʽ��������
	 * @param text
	 * @param source
	 * @param username
	 * @param longitude
	 * @param latitude
	 */
	@GET  
    @Path(value = "/add")  
	public void addJiongShiget(@QueryParam("text")String text,@QueryParam("source")String source,
			@QueryParam("username")String username,@QueryParam("longitude")String longitude,@QueryParam("latitude")String latitude);
	
	/**
	 * ͨ��post��ʽ��������
	 * @param text
	 * @param source
	 * @param username
	 * @param longitude
	 * @param latitude
	 */
	@POST 
    @Path(value = "/add")  
	public void addJiongShipost(@QueryParam("text")String text,@QueryParam("source")String source,
			@QueryParam("username")String username,@QueryParam("longitude")String longitude,@QueryParam("latitude")String latitude);
	
	/**
	 * �õ����еć���
	 * @return
	 */
	@GET  
    @Path(value = "/search")  
	public JiongShiList findALLJiongShi();
	
	/**
	 * �õ�����ć���
	 * @return
	 */
	@GET  
    @Path(value = "/searchByCount")  
	public JiongShiList findALLJiongShiByCount(@QueryParam("count")int count);
	
	/**
	 * �õ���start��stop�ć���
	 * @return
	 */
	@GET  
    @Path(value = "/searchByStartStop")  
	public JiongShiList findALLJiongShiByStartStop(@QueryParam("start")int start,@QueryParam("stop")int stop);
	
	/**
	 * 
	 * @param id
	 * @param username
	 */
	@GET  
    @Path(value = "/addRepostsCountG")  
	public void addRepostsCountGet(@QueryParam("id")int id,@QueryParam("username")String username);
	
	/**
	 * 
	 * @param id
	 * @param username
	 */
	@POST 
    @Path(value = "/addRepostsCountP")  
	public void addRepostsCountPost(@QueryParam("id")int id,@QueryParam("username")String username);
	/**
	 * 
	 * @param id
	 * @param username
	 */
	@GET  
    @Path(value = "/addAttitudesCounG")  
	public void addAttitudesCountGet(@QueryParam("id")int id,@QueryParam("username")String username);
	
	/**
	 * 
	 * @param id
	 * @param username
	 */
	@POST 
    @Path(value = "/addAttitudesCounP")  
	public void addAttitudesCountPost(@QueryParam("id")int id,@QueryParam("username")String username);
	
}
