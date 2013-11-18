package com.benjiaren.service;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import com.benjiaren.bean.Comments;

@Path(value = "/comment")   
@Produces("application/json") 
public interface CommentsService {
	@GET  
    @Path(value = "/searchbyNameId")  
	public List<Comments> findCommentByName(@QueryParam("name")String name,@QueryParam("jiongshiid")int jiongshiid);
	@GET  
    @Path(value = "/add")  
	public void inseartCommentget(@QueryParam("text")String text,@QueryParam("source")String source,@QueryParam("username")String username,@QueryParam("jiongshiid")int jiongshiid,@QueryParam("reply_comment")String reply_comment);
	
	@POST  
    @Path(value = "/add")  
	public void inseartCommentpost(@QueryParam("text")String text,@QueryParam("source")String source,@QueryParam("username")String username,@QueryParam("jiongshiid")int jiongshiid,@QueryParam("reply_comment")String reply_comment);
}
