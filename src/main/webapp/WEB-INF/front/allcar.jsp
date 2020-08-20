<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/2.png" type="image/x-icon">
    <title>知车 - 全部车型</title>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/mdui/0.4.3/css/mdui.min.css" rel="stylesheet">  
  <script src="https://cdn.bootcss.com/mdui/0.4.3/js/mdui.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
  <script src="https://www.layuicdn.com/layui/layui.js"></script>
<link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #f6f6f6;">
<jsp:include page="../static/head.jsp"/>
 
   

<div class="container" style="margin-top: 30px;">
     <h1 style="text-align: center;">所有车型。</h1>
<br> <br>
     <div class="row">
   
    <div class="col-md-3"> <a href="productList.do?type=porsche">  <button type="button" class="layui-btn " style="width: 100%;margin-bottom: 10px;">保时捷</button></a> </div>
    <div class="col-md-3"> <a href="productList.do?type=Lamborghini"> <button type="button" class="layui-btn" style="width: 100%;margin-bottom: 10px;">兰博基尼</button> </a> </div>
    <div class="col-md-3"> <a href="productList.do?type=GTR"> <button type="button" class="layui-btn" style="width: 100%;margin-bottom: 10px;">GTR</button></a> </div>
    <div class="col-md-3"> <a href="productList.do?type=McLaren"><button type="button" class="layui-btn" style="width: 100%;margin-bottom: 10px;">迈凯伦</button> </a></div>
    <div class="col-md-3"> <a href="productList.do?type=Ferrari"><button type="button" class="layui-btn" style="width: 100%;">法拉利</button></a> </div>
    <div class="col-md-3"> <a href="productList.do?type=Koenigsegg">  <button type="button" class="layui-btn" style="width: 100%;">柯尼塞格</button> </a></div>
    <div class="col-md-3"> <a href="productList.do?type=Pagani"><button type="button" class="layui-btn" style="width: 100%;">帕加尼</button></a> </div>
    <div class="col-md-3"> <a href="productList.do?type=AstonMartin"><button type="button" class="layui-btn" style="width: 100%;">阿斯顿马丁</button> </a></div>
   
</div>

<br>
<h1 style="text-align: center;">上新。</h1>
 <br>
 <style>
     .mdui-card-media-covered{
         top:0;
     }
 </style>
<div class="row">
  <c:forEach items="${Cars}" var="Car">
 <div class="col-md-6" style="margin-bottom: 30px;">
  <div class="mdui-card">
    <div class="mdui-card-media">
      <img src="images/product/${Car.image}" width="100%"/> 
    </div>
    <div class="mdui-card-actions">
      <span class="mdui-btn ">${Car.bname}</span>
      <a href="CarView.do?bid=${Car.bid}" class="mdui-btn mdui-ripple">了解更多</a>
    </div>
  </div>
</div>
   </c:forEach>
  
 </div>
 <nav aria-label="..." style="margin-left: 25%;margin-top: 30px;" >
  <ul class="pagination">
    <c:choose>
      <c:when test="${pageInfo.hasPreviousPage}">
        <li class="page-item"><a class="page-link" href="allcar.do?pageNum=1" >首页</a></li>
        <li class="page-item"><a class="page-link" href="allcar.do?pageNum=${pageInfo.prePage }">上一页</a></li>
      </c:when>
      <c:otherwise>
        <li class="page-item disabled"><a class="page-link" >首页</a></li>
        <li class="page-item disabled"><a class="page-link">上一页</a></li>
      </c:otherwise>
    </c:choose>
    
    <c:forEach var="index" begin="1" end="5">

      <li
        <c:if test="${index==pageInfo.pageNum}">class="page-item active"</c:if>><a
        href="allcar.do?pageNum=${index}" class="page-link">${index }</a></li>
    </c:forEach>
 

    <c:choose>
      <c:when test="${tpageInfo.hasNextPage}">
        <li class="page-item" ><a href="allcar.do?pageNum=${pageInfo.nextPage }" class="page-link">下一页</a></li>
        <li class="page-item" ><a href="allcar.do?pageNum=${pageInfo.pages }" class="page-link" >尾页</a></li>
      </c:when>
      <c:otherwise>
        <li class="page-item disabled"><a class="page-link" >下一页</a></li>
        <li class="page-item disabled"><a class="page-link">尾页</a></li>
      </c:otherwise>
    </c:choose>

  </ul>
</nav> 
    <div>

</div>
</div>

     <jsp:include page="../static/footer.jsp"/>
<script>
 layui.use('element', function(){
   var element = layui.element;
 });
 
 
   </script>
 
</body>
</html>