<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="images/2.png" type="image/x-icon">
    <title>知车管理系统</title>

  
    <style>
        body {
            background-color: #B8E5F8;
            background-image: url("1.jpg");
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
            height: 312px;
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
    <img src="img/1.png" alt="">
</div>
<div id="content">
    <div id="content_login_select">
       
        <span class="chick" style="text-align: center;">管理员登录</span>
    </div>
    <img src="img/二维码.png" alt="" id="ewm">
    <div id="img_div"></div>
    <div id="content_login_form">
        <form method="post" action="backLogin.do">
            <input type="text" id="username" name="username" placeholder="账号">
            <input type="password"id="password" name="password" placeholder="密码"><br>
          
            <input id="submit" type="submit" alue="登录">
        </form>
    </div>
</div>



</body>
</html>
