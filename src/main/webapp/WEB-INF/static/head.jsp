<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/mdui/0.4.3/css/mdui.min.css" rel="stylesheet">  
  <script src="https://cdn.bootcss.com/mdui/0.4.3/js/mdui.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
  <script src="https://www.layuicdn.com/layui/layui.js"></script>
<link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>

<style >
    .layui-nav{
        background-color: #fff;
        font-weight: 500;
        font-size: 15px;
    }
    .layui-nav .layui-nav-item a{
          color: #8590a6;
          text-decoration: none;
    }
    .layui-nav .layui-nav-item a:hover{
          color: #444;
    }
    .layui-nav-img{
        border-radius:0%;
    }
    .container2{
        background-color: #f6f6f6;
        height: 600px;
    }
    .layui-nav .layui-this:after, .layui-nav-bar, .layui-nav-tree .layui-nav-itemed:after{
        background-color:#009688;
        height: 3px;
    }
    .container1{
        width:100%;
        
    }
    .layui-nav{
       padding: 0 11%;
    }
   
  
    input,button{
        line-height: normal;
    }
    ul{
        margin-bottom:0;
    }
</style>

<div class="container1" >
  
<ul class="layui-nav" id="add" >
    <li class="layui-nav-item">
        <a href=""> <span style="font-size: 30px;color: #009688;">知车</span> </a>
      </li>
    <li class="layui-nav-item  ">
      <a href="index.do">首页</a>
    </li>
    <li class="layui-nav-item">
      <a href="manaTopic.do">发现</a>
    </li>
    <li class="layui-nav-item">
        <a href="allcar.do">所有车型</a>
        <dl class="layui-nav-child">
            <dd><a href="productList.do?type=porsche">保时捷</a></dd>
            <dd><a href="productList.do?type=Lamborghini">兰博基尼</a></dd>
            <dd><a href="productList.do?type=GTR">GTR</a></dd>
            <dd><a href="productList.do?type=McLaren">迈凯伦</a></dd>
            <dd><a href="productList.do?type=Ferrari">法拉利</a></dd>
            <dd><a href="productList.do?type=Koenigsegg">柯尼塞格</a></dd>
            <dd><a href="productList.do?type=Pagani">帕加尼</a></dd>
            <dd><a href="productList.do?type=AstonMartin">阿斯顿马丁</a></dd>
                                                       
         
          </dl>
      </li>
      
      <li class="layui-nav-item">
      <form method="post" action="productList.do">
				查找书籍：<input  type="text" class="layui-input" style="display:unset;width:50%" name="key" placeholder="请输入跑车关键字"  /> <input class="btn btn-primary " style="background-color:#009688;margin-top:-5px;"  type="submit" name="submit" value="搜索" />
			</form>
      </li>
  
      <li class="layui-nav-item" style="padding-left: 20px;margin-top:-2px">
       
       
         <c:if test="${sessionScope.user!=null}">
            <button class="animated tada btn btn-primary" id="open" style="  background-color:#009688;"   >提问</button>
        </c:if>
       
        
    </li>
  <c:if test="${sessionScope.user!=null}">
              <li class="layui-nav-item"  style="float:right" >
      <a href=""><img src="images/product/${sessionScope.user.uimg}" class="layui-nav-img">${sessionScope.user.uname}</a>
      <dl class="layui-nav-child">
          <dd><a href="findinfor.do">我的主页</a></dd>
            <dd><a href="userOrder.do?uid=${sessionScope.user.uid}">我的订单</a></dd>
            <dd> <a href="updatePwdPage.do">修改密码</a> </dd>
            <dd><a href="logout.do">退出</a></dd>
      </dl>
    </li>
        </c:if>
        <c:if test="${sessionScope.user==null}">
        <li class="layui-nav-item"  style="float:right" >
        <a href="login.do">
        <button class="animated tada btn btn-primary"  style="  background-color:#009688;"   >  登录/注册</button></a>
    </li>
        </c:if>
    
    <li class="layui-nav-item" style="float:right">
        <a href="cartPage.do" class="layui-nav-item"  ><i class="layui-icon" style="font-size: 22px;">&#xe657;</i>   </a></li>
    
   
  </ul>
</div>

  <style >
   .mdui-col-md-3{
          padding-top: 39px;
      }
    a{
      color: black;
    }
    a:hover{
      color: #009688;
      text-decoration: none;
    }
    .active{
      color: #009688;
    }
    .fl {
      float: left;
    }
    .clearfix {
      zoom: 1;
    }
    .clearfix:after {
      content: "";
      display: block;
      clear: both;
      height: 0;
      font-size: 0;
      line-height: 0;
      visibility: hidden;
    }
    .shixitype-box{
      margin-top: 10px;
      /* margin-left:166px; */
      margin-bottom: 20px;
     
      width: 75%;
      margin: 0 auto;
    }
    .shixitype-column-box .item-con {
      font-size: 14px;
      margin-left: 7px;
      width: 93%;
    }
    .shixitype-column-box .item-link.active, 
    .shixitype-column-box .item-link:hover {
      color: #009688;
      font-weight: 600;
    }
    .shixitype-column-box {
        margin: 25px 0 20px;
    }
    .shixitype-column-box .item-box {
        padding-bottom: 10px;
    }
    .shixitype-column-box .item-head-title {
      font-weight: 600;
      padding-top: 3px;
      font-size: 14px;
      padding-bottom: 0px;
    }
    .shixitype-column-box .item-link {
        margin-left: 15px;
    }
    .shixitype-column-box .item-title {
        font-weight: 600;
    }

  </style> 
  
  <div class="mdui-container" style="margin-top:30px">

    <div class="mdui-dialog" id="dialog">
      <div class="mdui-dialog-title row">
        <input type="hidden" class="text" name="uid" id="uid"  value="${sessionScope.user.uid}" />
        <div class="col-md-12 mdui-textfield" >
        	<label class="mdui-textfield-label" style="color:teal"><strong>标题</strong></label>
            <input placeholder="请输入标题" class="mdui-textfield-input" id="tname" name="tname" type="text"/>
        </div>
   
      </div>

      
      <div class="mdui-dialog-content">

        <div class="mdui-textfield" style="padding-top:0px">
          
            <textarea placeholder="正文" class="mdui-textfield-input" id="tcontent" name="tcontent" type="text" rows="8"/></textarea>
            
          </div>
      </div>
      <div class="mdui-dialog-actions">
      	
        <button class="mdui-btn mdui-ripple" mdui-dialog-cancel style="color:teal">下次再发</button>
      
        <button class="mdui-btn mdui-ripple" id="submit1" style="color:teal">现在就发</button>
        	<br>
      </div>
    </div>
    </div>
    
  
  
  

  <script>
  
 
     //注意：导航 依赖 element 模块，否则无法进行功能性操作
  layui.use('element', function(){
    var element = layui.element;
  });
  var inst = new mdui.Dialog('#dialog');


  document.getElementById('open').addEventListener('click', function () {
    inst.open();
  });


     
  $(document).ready(function(){
	    $("#submit1").click(function(){
	        $.ajax({
	            type: "post",
	            url: "addTopic.do",
	            data: {
	                uid:$("#uid").val(),
	                tname:$("#tname").val(),
	                tcontent:$("#tcontent").val()
	            },
	            dataType: "text",
	            success: function(result){
	                if(result=='success'){
	                  window.location.href="manaTopic.do";
	                }else{
	                  
	                }
	             
	                
	            },
	            error: function() {
	                alert("登陆失败");
	            }
	        });
	    });
	  });
 
 
  
  </script>
  