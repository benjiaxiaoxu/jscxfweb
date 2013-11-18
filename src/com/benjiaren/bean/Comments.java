package com.benjiaren.bean;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "comments")
public class Comments {
	
	private Date created_at;
	private long id;
	private String text;
	private String source;
	private String username;
	private int jiongshiId;
	private String reply_comment;
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date createdAt) {
		created_at = createdAt;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getJiongshiId() {
		return jiongshiId;
	}
	public void setJiongshiId(int jiongshiId) {
		this.jiongshiId = jiongshiId;
	}
	public String getReply_comment() {
		return reply_comment;
	}
	public void setReply_comment(String replyComment) {
		reply_comment = replyComment;
	}
	
}
