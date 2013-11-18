package com.benjiaren.bean;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "jiongshiUpload")
public class JiongShiUpload {
	private String text;
	private String source;
	private String username;
	private String longitude;
	private String latitude;
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
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
}
