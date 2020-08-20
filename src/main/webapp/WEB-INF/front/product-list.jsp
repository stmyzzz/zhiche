<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

  <link rel="icon" href="images/2.png" type="image/x-icon">
    <title>知车 - 探索</title>
  <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/mdui/0.4.3/css/mdui.min.css" rel="stylesheet">  
  <script src="https://cdn.bootcss.com/mdui/0.4.3/js/mdui.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
  <script src="https://www.layuicdn.com/layui/layui.js"></script>
<link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
	<jsp:include page="../static/head.jsp"/>

</head>
<body>

<div class="container" style="margin-top: 100px;background-color: #fff;margin-top:50px;padding: 40 30 ;" >
    <h1 style="text-align: center;">探索。</h1> 
    <span style="font-size: 13px;color: #888;">共找到${pageInfo.total}款跑车</span>
    <br><br>
    <c:choose> 
    <c:when test="${empty Cars}"> 
        <h2 style="font-weight: 600;text-align:center;margin-top:50px;">正在装填中...</h2>
    </c:when>
     <c:otherwise>
    <c:forEach items="${Cars}" var="Car" varStatus="vs">
      <div class="row" style="margin-bottom: 30px;">

<div class="col-md-3"> <img src="images/product/${Car.image}" alt="" width="100%" height="100%"> </div>
<div class="col-md-9" style="padding-left: 50px;"> 	

<h2 style="font-weight: 600;">${Car.bname}</h2>

<h4 > $ ${Car.pirce}</h4>
<h5 style="color: #06c;font-weight: 100;font-size: 15px;" > <a href="CarView.do?bid=${Car.bid}">进一步了解></a>   </h5>


</div>
</div>
  
     </c:forEach>
     </c:otherwise>
</c:choose>
    <nav aria-label="..." style="margin-left: 35%;margin-top: 100px;" >
  <ul class="pagination">
    <c:choose>
      <c:when test="${tpageInfo.hasPreviousPage}">
        <li class="page-item"><a class="page-link" href="productList.do?pageNum=1" >首页</a></li>
        <li class="page-item"><a class="page-link" href="productList.do?pageNum=${pageInfo.prePage}">上一页</a></li>
      </c:when>
      <c:otherwise>
        <li class="page-item disabled"><a class="page-link" >首页</a></li>
        <li class="page-item disabled"><a class="page-link">上一页</a></li>
      </c:otherwise>
    </c:choose>
    
    <c:forEach var="index" begin="1" end="${pageInfo.pages }">

      <li
        <c:if test="${index==tpageInfo.pageNum}">class="page-item active"</c:if>><a
        href="productList.do?pageNum=${index}" class="page-link">${index }</a></li>
    </c:forEach>
 

    <c:choose>
      <c:when test="${tpageInfo.hasNextPage}">
        <li class="page-item" ><a href="productList.do?pageNum=${pageInfo.nextPage }" class="page-link">下一页</a></li>
        <li class="page-item" ><a href="productList.do?pageNum=${pageInfo.pages }" class="page-link" >尾页</a></li>
      </c:when>
      <c:otherwise>
        <li class="page-item disabled"><a class="page-link" >下一页</a></li>
        <li class="page-item disabled"><a class="page-link">尾页</a></li>
      </c:otherwise>
    </c:choose>

  </ul>
</nav> 

</div>

<style>
  .container a{
    text-decoration: none;
  }
  .container{
    width: 70%;
  }
</style>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
      var element = layui.element;
      
      //…
    });

        </script>
     <jsp:include page="../static/footer.jsp"/>
	
</body>
</html>
