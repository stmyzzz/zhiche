<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/2.png" type="image/x-icon">
    <title>知车管理系统</title>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
    <script src="https://www.layuicdn.com/layui/layui.all.js"></script> 
    <link href="https://cdn.bootcss.com/mdui/0.4.3/css/mdui.min.css" rel="stylesheet">  
      <script src="https://cdn.bootcss.com/mdui/0.4.3/js/mdui.min.js"></script>
      <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="mdui-drawer-body-left mdui-appbar-with-toolbar  mdui-theme-primary-blue mdui-theme-accent-orange">
<jsp:include page="../static/manahead.jsp"/>

 <div class="mdui-container doc-container">
  <h1 class="doc-title mdui-text-color-theme">商品管理。</h1>

 
<table class="layui-table" lay-skin="row" lay-size="lg">
<style>
    .layui-table th,td{
        text-align: center;
    }
    .layui-table img{
      max-width: 100%;
    }
</style>
<thead>
    <tr>
      
        <th>ID</th>
        <th>商品名称</th>
     
        <th> 操作</th>
    </tr>
</thead>
<tbody>
<c:forEach var="Car" items="${Cars}">     
    <tr>
            
        <td>${Car.bid }</td>
        <td >
         <img src="images/product/${Car.image }" height="100px" style="float: left;">
         <span style="font-weight: 600;font-size: 20px;float  :left;margin-top:40px">${Car.bname }</span>

        </td>
     
        <td> <a href="modifyCarPage.do?bid=${Car.bid}">修改</a>  <a href="delCar.do?bid=${Car.bid}" >删除</a>   </td>
  
      
        </tr></c:forEach> 
</tbody> 

</table>
<div id="test1" style="margin-left:40%;">

  <ul class="pagination">
    <c:choose>
      <c:when test="${pageInfo.hasPreviousPage}">
        <li class="page-item"><a class="page-link" href="manaCar.do?pageNum=1">首页</a></li>
        <li class="page-item"><a class="page-link" href="manaCar.do?pageNum=${pageInfo.prePage }">上一页</a></li>
      </c:when>
      <c:otherwise>
        <li class="page-item"><span class="page-link">首页</span></li>
        <li class="page-item"><span class="page-link">上一页</span></li>
      </c:otherwise>
    </c:choose>

    <c:forEach var="index" begin="1" end="${pageInfo.pages }">

      <li
        <c:if test="${index==pageInfo.pageNum}">class="page-item active"</c:if>><a class="page-link" 
        href="manaCar.do?pageNum=${index }">${index }</a></li>
    </c:forEach>

    <c:choose>
      <c:when test="${pageInfo.hasNextPage}">
        <li class="page-item"><a class="page-link" href="manaCar.do?pageNum=${pageInfo.nextPage }">下一页</a></li>
        <li class="page-item"><a class="page-link" href="manaCar.do?pageNum=${pageInfo.pages }">尾页</a></li>
      </c:when>
      <c:otherwise>
        <li class="page-item"><span class="page-link">下一页</span></li>
        <li class="page-item"><span class="page-link">尾页</span></li>
      </c:otherwise>
    </c:choose>
  </ul>

</div>
</div>         
</body>
</html>
