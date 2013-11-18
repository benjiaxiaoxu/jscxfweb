<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传</title>
</head>
<body>
    <div>
        <form  enctype='multipart/form-data'  method="post" action="upload.do">
        	<input type="text" name="jiongshiid"/>"
            <input type="file" name="uploadFile" />
            <button>提交</button>
        </form>
    </div>
</body>
</html>