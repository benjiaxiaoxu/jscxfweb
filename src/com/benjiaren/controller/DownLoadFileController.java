package com.benjiaren.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.benjiaren.util.Log;

@Controller
public class DownLoadFileController {
	
	@RequestMapping("download.do")
	public void downloadFile(String fileName,HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition", "attachment;fileName="+fileName);
		try{
			File file = new File(request.getSession().getServletContext().getRealPath(File.separator)+File.separator+"upload"+File.separator+fileName);
			InputStream inputStream = new FileInputStream(file);
			OutputStream os = response.getOutputStream();
			byte[] b = new byte[1024];
			int length;
			while((length = inputStream.read(b))>0){
				os.write(b,0,length);
			}
			Log.log("down"+file.getName());
			inputStream.close();
		}catch(FileNotFoundException e){
			this.getLog(e.getMessage());

		}
		catch(IOException e){
			this.getLog(e.getMessage());

		}
		
	}
	
	private void getLog(String log){
		org.apache.log4j.BasicConfigurator.configure();
		org.apache.log4j.Logger logger=Logger.getLogger(this.getClass());
		logger.error(log);
	}
}
