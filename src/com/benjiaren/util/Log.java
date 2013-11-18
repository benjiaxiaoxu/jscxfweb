package com.benjiaren.util;

import org.apache.log4j.Logger;

public class Log {

	public static void log(String  logStr){
		//读取配置文件信息
		org.apache.log4j.BasicConfigurator.configure();
		org.apache.log4j.Logger log=Logger.getLogger(Log.class);
		log.debug(logStr);
	}
}
