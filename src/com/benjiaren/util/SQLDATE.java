package com.benjiaren.util;

import java.sql.Date;

public class SQLDATE {
	public static java.util.Date sqlto(Date date){
		return new java.util.Date(date.getTime());
	}
	public static Date tosql(java.util.Date date){
		return new Date(date.getTime());
	}
}
