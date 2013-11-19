package com.benjiaren.service;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
//import javax.ws.rs.PathParam;
//import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import com.benjiaren.bean.User;
/**
 * 用户服务类
 * @author Administrator
 *
 */
@Path(value = "/user")   
//@Produces("application/json")  
public interface UserService {
	
//	@GET  
//    @Path(value = "/{id}/info")  
//    public User getCategory(@PathParam("id") String id);
	
	/**
	 * 根据用户名得到用户
	 */
	@GET  
    @Path(value = "/search")  
	User findUserByName(@QueryParam("name")String name);
}
