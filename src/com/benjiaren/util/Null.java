package com.benjiaren.util;

public class Null {
	public static String toNull(Object ob){
		if(ob == null){
			return "";
		}else{
			return ob.toString();
		}
	}
}
