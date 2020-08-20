<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="images/2.png" type="image/x-icon">
    <title>知车 - 注册</title>
       <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
        <link href="https://cdn.bootcss.com/mdui/0.4.3/css/mdui.min.css" rel="stylesheet">  
  <script src="https://cdn.bootcss.com/mdui/0.4.3/js/mdui.min.js"></script>
    <style>
        body {
            background-color: #B8E5F8;
            background-image: url("images/1.jpg");
            background-size: 100%;
            background-attachment: fixed;
        }

        #logo > img {
            width: 128px;
            height: 81px;
        }

        #logo {
            text-align: center;
            margin-top: 115px;
            margin-bottom: 24px;
        }

      #content {
            width: 350px;
            height: 372px;
            background-color: white;
            margin: auto;
            padding: 0px 24px;
            border-radius: 4px 4px 0px 0px;
            position: relative;
        }
        #content_login_select {
            font-size: 16px;
        }

        #content_login_select > span {
            height: 18px;
            padding: 0px 24px;
            display: inline-block;
        }

        #content_login_select > span:first-child {
            margin-right: 20px;
        }

        .chick {
            padding: 20px 0px 18px 0px !important;
            font-weight: 700;
            border-bottom: #0084FF solid;
        }

        #ewm {
            position: absolute;
            width: 52px;
            top: 0px;
            right: 0px;
            border-radius: 0px 4px 0px 0px;
        }

        #img_div {
            position: absolute;
            border: 26px #fff solid;
            border-top: 26px rgba(0, 0, 0, 0) solid;
            border-right: 26px rgba(0, 0, 0, 0) solid;
            top: 0px;
            right: 0px;
            border-radius: 0px 2px 0px 0px;
        }

        #content_login_form input:not([type=submit]) {
            width: 100%;
            height: 42px;
            border: none;
            border-bottom: 1px rgba(0, 0, 0, .1) solid;
            outline: none;
            margin: 7px 0px;
            font-size: 14px;
        }

        #content_login_form {
            position: relative;
            padding-top: 20px;
        }

        #content_login_form > form > div {
            padding: 5px 0px;
        }

        #content_login_form > form > div > a {
            font-size: 0.9em;
            color: #175199;
        }

        #content_login_form > form > div > a:last-of-type {
            float: right;
            color: #8792a8;
        }

        #content a:hover {
            color: #677288 !important;
        }

        #content_login_form input[type=submit] {
            width: 100%;
            height: 36px;
            border: none;
            background-color: #0084FF;
            color: white;
            margin-top: 30px;
            font-size: 14px;
            border-radius: 3px;
        }

        #content_login_form input[type=submit]:hover {
            background-color: #0074dd;
        }

        #content_login_form img {
            position: absolute;
            right: 0px;
            top: 100px;
        }

        #content_login_bottom {
            width: 356px;
            height: 26px;
            background-color: #F6F6F6;
            border-radius: 0px 0px 4px 4px;
            margin: auto;
            font-size: 13px;
            padding: 17px 21px;
            color: #8792a8;
        }

        #content_login_bottom > div:first-of-type {
            float: left;
        }

        #content_login_bottom > div:last-of-type {
            padding: 6px 0px;
            float: right;
        }

        #content_login_bottom > div:last-of-type > a {
            color: #8792a8;
        }

        #content_login_bottom a {
            color: #8792A8;
        }

        #content_login_bottom > div:last-of-type > a:hover {
            color: #1751a5;
        }

        #social_contact_login {
            width: 350px;
            height: 16px;
            border-radius: 3px;
            background-color: #fff;
            padding: 22px 24px;
            margin: auto;
            margin-top: 24px;
            color: #8A95AA;
            text-decoration: none;
        }

        #social_contact_login a {
            display: inline-block;
            margin: 0px 6px;
            color: #8A95AA;
        }

        #social_contact_login > div {
            float: right;
        }

        #social_contact_login > span {
            float: left;
        }

        #btn_dow_app {
            text-align: center;
        }

        #btn_dow_app > a {
            width: 400px;
            height: 22px;
            display: inline-block;
            border-radius: 3px;
            background-color: #fff;
            margin-top: 24px;
            padding: 10px 0px;
            color: #0E8BFF;
        }

        #btn_dow_app > a > img {
            width: 22px;
        }

        #btn_dow_app span {
            position: relative;
            bottom: 5px;
            left: 7px;
        }
        #content_bottom{
            text-align: center;
            margin-top: 150px;
            font-size: 13px;
            color: #fff;
        }
        #content_bottom a:hover{
            text-decoration: underline;
        }
        #content_bottom img{
            width: 16px;
        }
        #content_bottom a{
            color: #fff;
        }
        #content_bottom>div{
            margin: 8px;
        }
   
    </style>
</head>
<body>
<div id="logo">
    <img src="images/2.png" alt="">
</div>
<div id="content">
    <div id="content_login_select">
       
        <span class="chick" style="text-align: center;">注册</span>
    </div>
  
    <div id="img_div"></div>
    <div id="content_login_form">
      
            <input type="text" name="userName" id="userName" placeholder="账号">
            <input type="password" name="passWord" id="passWord" placeholder="密码"><br>
            <input type="password" id="repassWord"  name="repassWord" placeholder="请重复输入密码"><br>
            <div style="float:right;color:black;">
               
                <a href="login.do">已经有账号？</a><br>
            </div>
            <input type="submit" id="submit" value="注册">
        
    </div>
</div>


<div id="btn_dow_app">
    <a href="#">
      
        <span>下载知车App</span>
    </a>
</div>
<div id="content_bottom">
    <div>
        <a href="#">关于知车</a>
        <a href="#">联系我们</a>
        <a href="#">来知车工作</a>

    </div>
    <div>
        <span >© 2020 知车</span>
        <a href="#">深 ICP 证 18124100234 号</a>
        <img src="img/ga.png" alt="">
        <a href="#">粤公网安备 18124100234号</a>
   
    </div>

</div>

<script>
$(document).ready(function(){
    $("#submit").click(function(){

    	  var userName = $("#userName").val();
    	  var passWord = $("#passWord").val();
    	  var repassWord = $("#repassWord").val();
    	
    	  if (userName== '') {
              mdui.snackbar('请输入账号哟', {position: 'top', timeout: 1500});
              return false;
          }
    	  if (passWord== '') {
              mdui.snackbar('请输入密码哟', {position: 'top', timeout: 1500});
              return false;
          }
    	  if (repassWord== '') {
              mdui.snackbar('请重复输入密码哟', {position: 'top', timeout: 1500});
              return false;
          } 
    	  if (repassWord!=passWord) {
              mdui.snackbar('两次输入的密码不一致哟', {position: 'top', timeout: 1500});
              return false;
          } 
    	
        $.ajax({
            type: "post",
            url: "userReg.do",
            data: {
            userName:userName,passWord:passWord
            }, 
            dataType: "text",
            success: function(result){
                if(result=='success'){
                    window.location.href="login.do";
                }
                if(result=='false'){
                	mdui.snackbar('注册失败', {position: 'top', timeout: 1500});
                }
            
            },
            error: function() {
            	mdui.snackbar('接口连接失败，请连接网络或联系管理员', {position: 'top', timeout: 1500});
            }
        });
});
    });
</script>
</body>
</html>
