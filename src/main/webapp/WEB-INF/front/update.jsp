<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="icon" href="images/2.png" type="image/x-icon">
    <title>知车 - 更新</title>
	<jsp:include page="../static/head.jsp"/>
	    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>


<style>
    .img{
        position: relative;
        top:-30px;
        

}
  .container{
      padding-left: 0;
      padding-right: 0;
  }
  .bk button{
    margin: 0 auto;
    position:relative;
    top:50px;
    left: 80px;
    z-index: 999;
  }
  .layui-input, .layui-textarea{
  display:unset;
  width:50%;
    	}
</style>

<div class="container" style="background-color:#fff;margin-top: 100px;" >

    <div class="bk" style="height: 150px; ">

 
    <img src="images/1.jpg" alt="" height="100%" width="100%">
    
   </div> 
   <form action="updateUser.do" method="post"  enctype="multipart/form-data">


   <div class="row">
   
    <div class="col-md-12" style="text-align:center;"> 

     <p>    <input type="file" name="file" id="file" value="null"> </p> 
        <p class="uname"  > <strong style="font-size: 30px;"> <label>名称：</label> <input type="text" class="layui-input"  name="uname"  id="uname" value="${user.uname }"> </strong>
        	
           
        </p> 
       <p>  喜好：<input class="layui-input" type="text" name="ulike" id="ulike"  value="${user.ulike }" value="" id=""> </p>
       <input type="hidden" class="text" name="uid" id="uid" value="${user.uid }" />
        <p>
          
          性别：
          <input type="radio" name="gender" id="gender"  value="男" <c:if test="${user.gender=='男' }"> checked="checked"</c:if>/>男
          <input type="radio" name="gender" id="gender" value="女" <c:if test="${user.gender=='女' }"> checked="checked"</c:if>/>女
        
        
        </p>
        <p class="email">邮箱：<input class="layui-input" type="text" name="email" id="email" value="${user.email}" id=""></p>
        <p class="uaddress">手机号：<input class="layui-input" type="text" name="phone" id="phone" value="${user.phone}" id=""></p>
  <p class="address">地址：<input class="layui-input" type="text" name="address" id="address" value="${user.adress}" id=""></p>

  <p class="intro" style="height: 100px;">个人介绍：<input class="layui-input" type="text" name="intro" id="intro" value="${user.intro }" id="">      </p>

  <button type="submit"  id="submit" class="layui-btn" style="margin-left:300px">保存修改</button>
  <br><br> 
    </div>
    </div> 
 </form>
</div>




<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
      var element = layui.element;
      
      //…
    });

   
   
        </script>



</body>
</html>

