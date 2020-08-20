<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="icon" href="images/2.png" type="image/x-icon">
    <title>知车 - 我的主页</title>

	<jsp:include page="../static/head.jsp"/>
</head>
<body  style="background-color: #f6f6f6;">

<style>
    .img{
        position: relative;
        top:-30px
        

}
  .container{
      padding-left: 0;
      padding-right: 0;
  }
</style>

<div class="container" style="background-color:#fff;margin-top: 100px;" >

    <div class="bk" style="height: 150px; ">

 
    <img src="images/1.jpg" alt="" height="100%" width="100%">

  
   </div> 
   <div class="row">
    <div class="col-md-3"> <div class="img" style="margin-left: 50px;" >

  
    <img src="images/product/${user.uimg}" alt="" height="180px;" width="180px" style="z-index: 4;
    border: 4px solid #fff;
    border-radius: 8px;" >  </div> </div>
    <div class="col-md-9"> 

        <p class="uname"  > <strong style="font-size: 30px;">${user.uname} &nbsp;</strong>
        
            <span> <i class="mdui-icon material-icons">&#xe87e;</i>${user.ulike}</span>
        
        </p> 
    
        <p>${user.gender} &nbsp;&nbsp;联系方式：${user.phone} </p>
  <p class="uaddress">地址：${user.adress}</p>
  <p class="email">邮箱：${user.email}</p>
  
  <p class="intro" style="height: 100px;">${user.intro} <a href="updateUserPage.do"> <button type="button" class="layui-btn" style="float: right;margin-right:30px">点击编辑资料</button></a>   </p>
    </div>
</div>

</div>

</body>
</html>