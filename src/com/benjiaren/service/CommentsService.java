package com.benjiaren.service;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
//import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import com.benjiaren.bean.Comments;
/**
 * ���۷���
 * @author xuzhiguang
 * path = /comment
 * application/json
 *
 */
@Path(value = "/comment")   
//@Produces("application/json") 

public interface CommentsService {
	/**
	 * �����û���������id����
	 * @param name
	 * @param jiongshiid
	 * @return
	 */
	@GET  
    @Path(value = "/searchbyNameId")  
	public List<Comments> findCommentByName(@QueryParam("name")String name,@QueryParam("jiongshiid")int jiongshiid);
	/**
	 * ��������get��ʽ
	 * @param text
	 * @param source
	 * @param username
	 * @param jiongshiid
	 * @param reply_comment
	 */
	@GET  
    @Path(value = "/add")  
	public void inseartCommentget(@QueryParam("text")String text,@QueryParam("source")String source,@QueryParam("username")String username,@QueryParam("jiongshiid")int jiongshiid,@QueryParam("reply_comment")String reply_comment);
	/**
	 * ��������post��ʽ
	 * @param text
	 * @param source
	 * @param username
	 * @param jiongshiid
	 * @param reply_comment
	 */
	@POST  
    @Path(value = "/add")  
	public void inseartCommentpost(@QueryParam("text")String text,@QueryParam("source")String source,@QueryParam("username")String username,@QueryParam("jiongshiid")int jiongshiid,@QueryParam("reply_comment")String reply_comment);
}
