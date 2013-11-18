<%@ page language="java" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    
    <title>My JSP 'jiongshitest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
  </head>
  
  <body>
  <div class="main">

    <div class="ginfo" id="ginfo">   

        <h1></h1>

        <p></p>

        <p></p>

   </div>

   <ul>      

   </ul>

</div> 

  </body>
  <script type="text/javascript">
  $(function(){
        var url="http://127.0.0.1:8080/jscxfweb/cxf/service/jiongshi/search"
		 //使用getJSON方法取得JSON数据
        $.getJSON(　　　　
        url,
		//处理数据 data指向的是返回来的JSON数据
        function(data){ 
				//生成标题和标题连接
                
            
                var lis="";　　　
                
                 $(data.jsList.jiongshi).each(function(i,ite){ 
                 
                 lis+="<li>";
                    lis+="created_at:  "+ite.created_at+"  ";
                    lis+="attitudes_count:  "+ite.attitudes_count+"  ";
                    lis+="comments_count:  "+ite.comments_count+"  ";
                    lis+="mievel:  "+ite.mievel+"  "; 
                         $(ite.user).each(function(j,user){ 
                         	lis+="username:  "+user.name+"  "; 
                         }); 
                         $(ite.pic_urls).each(function(j,pic){ 
                         	lis+="<a href='http://127.0.0.1:8080/jscxfweb/upload/"+pic.picNameNew+"'>"+pic.picName+"</a>    "; 
                         });     
                    lis+="<\/li>";                
                    })
                $("ul").html(lis);   　　　
				//将遍历出来的数据呈现在所需位置
                $("li").hover(function(){$(this).addClass("hov")}, function(){$(this).removeClass("hov")});    
        }
        )
  })        
	
  </script>
</html>
