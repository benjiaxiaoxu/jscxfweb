package com.benjiaren.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.benjiaren.bean.Pic;
import com.benjiaren.dao.PicDAO;
import com.benjiaren.util.Log;


@Controller
public class UploadFormController {
	
	@RequestMapping("upload.do")
    public String upload(String jiongshiid,HttpServletRequest request,HttpServletResponse response){
        MultipartHttpServletRequest multipartHttpservletRequest=(MultipartHttpServletRequest) request;
        MultipartFile multipartFile = multipartHttpservletRequest.getFile("uploadFile");
        String jsid = multipartHttpservletRequest.getParameter("jiongshiid");
        int ijsid = 0;
        try{
        	ijsid = Integer.parseInt(jiongshiid);
        }catch(Exception e){
        	ijsid = Integer.parseInt(jsid);
        }
        String originalFileName=multipartFile.getOriginalFilename();
		String path  = request.getSession().getServletContext().getRealPath(File.separator);
        File file=new File(path+File.separator+"upload");
        if(!file.exists()){
            file.mkdir();
        }
        Log.log("upload"+file.getName());
        try {
        	String uuid = UUID.randomUUID().toString();
        	String type = originalFileName.substring(originalFileName.lastIndexOf("."));
        	String fileName = uuid+type;
            FileOutputStream fileOutputStream=new FileOutputStream(file+File.separator+fileName);
            fileOutputStream.write(multipartFile.getBytes());
            fileOutputStream.flush();
            fileOutputStream.close();
            
            
            Pic pic = new Pic();
            pic.setJiongshiid(ijsid);
            pic.setPicAdd("http://127.0.0.1:8080/jscxfweb/upload/"+fileName);
            pic.setPicName(originalFileName);
            pic.setPicNameNew(fileName);
            pic.setUuid(uuid);
            new PicDAO().insertPic(pic);
            request.setAttribute("pic", pic);
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
			this.getLog(e.getMessage());
            return "error";
        } catch (IOException e) {
            // TODO Auto-generated catch block
			this.getLog(e.getMessage());
            return "error";
        }
        
        return "uploadSuccess";
    }
	private void getLog(String log){
		org.apache.log4j.BasicConfigurator.configure();
		org.apache.log4j.Logger logger=Logger.getLogger(this.getClass());
		logger.error(log);
	}

}
