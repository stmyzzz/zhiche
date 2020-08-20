<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcdn.net/ajax/libs/animate.css/3.7.2/animate.css" rel="stylesheet" >
</head>
<body>
 
    <style>
        .container1{
            height: 100%;
            
        }
        .kb{
            display: block;
        }
        .btn{
            text-align: center;
            height: 60px;
            width: 200px;
        }
   .button{
      text-align: center;
      -webkit-animate-duration: 2s;   
      -webkit-animate-delay: 1s;   
      -webkit-animate-iteration-count: 2;  
   }
    </style>

    <div class="container1">
   <img class="animated bounceInDown" id="dd"  src="images/2.JPG" alt="" width="33%">
   <img class="animated bounceInLeft"  id="dd" src="images/2.JPG"  alt="" width="33%">
   <img class="animated bounceInRight" id="dd" src="images/2.JPG" alt="" width="33%">
   <img class="animated bounceInUp" id="dd" src="images/2.JPG"  alt="" width="33%">
   <img src="images/welcome.jpg" alt="" width="33%">
   <img class="animated bounceInLeft" id="dd"src="images/2.JPG"  alt="" width="33%">
   <img class="animated bounceInRight" id="dd" src="images/2.JPG"  alt="" width="33%">
   <img class="animated bounceInUp" id="dd" src="images/2.JPG"  alt="" width="33%">
   <img class="animated bounceInDown" id="dd"  src="images/2.JPG"  alt="" width="33%">
 <div class="button" id="button">
   <a href="index.do">
   <button class="animated tada btn btn-primary" type="button" id="dd"  >  点击进入</button></a>
   </div>
    </div>

 
</body>
</html>