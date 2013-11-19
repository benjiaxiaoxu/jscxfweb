package com.benjiaren.service.impl;

import java.util.Date;
import java.util.List;

import com.benjiaren.bean.Comments;
import com.benjiaren.dao.CommentsDAO;
import com.benjiaren.service.CommentsService;

public class CommentServiceImpl implements CommentsService{

	/**
	 * 
	 */
	public List<Comments> findCommentByName(String name, int jiongshiid) {
		// TODO Auto-generated method stub
		//Comments comm = new CommentsDAO().getCommentsByUsernameANDJiongshiId(name, jiongshiid);
		return new CommentsDAO().getCommentsByUsernameANDJiongshiId(name, jiongshiid);
	}

	/**
	 * 
	 */
	public void inseartCommentget(String text, String source,
			String username, int jiongshiid, String replyComment) {
		// TODO Auto-generated method stub
		Comments comm = new Comments();
		comm.setCreated_at(new Date());
		comm.setText(text);
		comm.setSource(source);
		comm.setUsername(username);
		comm.setJiongshiId(jiongshiid);
		comm.setReply_comment(replyComment);
		new CommentsDAO().insertComment(comm);
	}

	public void inseartCommentpost(String text, String source, String username,
			int jiongshiid, String replyComment) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Comments comm = new Comments();
		comm.setCreated_at(new Date());
		comm.setText(text);
		comm.setSource(source);
		comm.setUsername(username);
		comm.setJiongshiId(jiongshiid);
		comm.setReply_comment(replyComment);
		new CommentsDAO().insertComment(comm);
	}

	
	
}
