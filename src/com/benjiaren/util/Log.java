package com.benjiaren.util;

import org.apache.log4j.Logger;

public class Log {

	public static void log(String  logStr){
		//��ȡ�����ļ���Ϣ
		org.apache.log4j.BasicConfigurator.configure();
		org.apache.log4j.Logger log=Logger.getLogger(Log.class);
		log.debug(logStr);
	}
}
