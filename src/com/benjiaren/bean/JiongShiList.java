package com.benjiaren.bean;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "jsList")
public class JiongShiList {
	private List<JiongShi> jiongshi;

	public List<JiongShi> getJiongshi() {
		return jiongshi;
	}

	public void setJiongshi(List<JiongShi> jiongshi) {
		this.jiongshi = jiongshi;
	}

	
	
}
