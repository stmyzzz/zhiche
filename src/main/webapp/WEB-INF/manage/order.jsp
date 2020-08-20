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
<style>
  .layui-input{
    display: unset;
  }
</style>

 <div class="mdui-container doc-container">
  <h1 class="doc-title mdui-text-color-theme">订单管理。</h1>


	<form id="searchInput" method="post" action="CarOrder.do" class="form-inline">
  <div class="row" style="text-align: center;">
   <input type="text" style="width: 30%;" id="oid" name="oid" value="${sessionScope.oid}" required  lay-verify="required" placeholder="请输入订单号" class="layui-input">
  <input type="text"  style="width: 30%;" id="oname" name="oname" value="${sessionScope.oname}" required  lay-verify="required" placeholder="请输入收货人" class="layui-input">
  <button class="layui-btn" onclick="submit()" >搜索</button>
 </div>
</form>
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
  <c:forEach items="${CarOrders}" var="CarOrder">
    <tr class="active ">
      <td >订单号:${CarOrder.oid}</td>
      <td>${CarOrder.date}</td>
      <td>收货人:${CarOrder.oname}</td>
      <td>收货地址：${CarOrder.adress}</td>
      <td><a href="orderModifyPage.do?oid=${CarOrder.oid}">修改</a> <a
        href="delserchCarOrder.do?oid=${CarOrder.oid}">删除</a></td>
    </tr>
      <c:forEach items="${CarOrder.orderDetails}" var="orderDetail">
        <c:forEach items="${Cars }" var="Car">
        <c:if test="${Car.bid==orderDetail.carId }">
        <tr>
        <td class="first w4 c">${Car.bname }</td>
        <td><img height="80" width="80" src="images/product/${Car.image}"></td>
        <td>数量：${orderDetail.carNum }</td>
        <td>￥${Car.pirce*orderDetail.carNum }</td>
        <td>${CarOrder.status }</td>
        </tr>
        </c:if>
        </c:forEach>
      </c:forEach>
         </c:forEach>
</thead>


</table>
<div id="test1">

	<nav aria-label="..." style="margin-left: 25%;margin-top: 30px;" >
    <ul class="pagination">
      <c:choose>
        <c:when test="${pageInfo.hasPreviousPage}">
          <li class="page-item"><a  class="page-link"  href="CarOrder.do?pageNum=1">首页</a></li>
          <li class="page-item"><a  class="page-link" href="CarOrder.do?pageNum=${pageInfo.prePage }">上一页</a></li>
        </c:when>
        <c:otherwise>
          <li class="page-item"><span  class="page-link">首页</span></li>
          <li class="page-item"><span  class="page-link">上一页</span></li>
        </c:otherwise>
      </c:choose>
  
      <c:forEach var="index" begin="1" end="${pageInfo.pages }">
  
        <li
          <c:if test="${index==pageInfo.pageNum}">class="page-item active"</c:if>><a
         class="page-link"  href="CarOrder.do?pageNum=${index }">${index }</a></li>
      </c:forEach>
  
      <c:choose>
        <c:when test="${pageInfo.hasNextPage}">
          <li class="page-item" ><a  class="page-link" href="CarOrder.do?pageNum=${pageInfo.nextPage }">下一页</a></li>
          <li class="page-item"><a  class="page-link" href="CarOrder.do?pageNum=${pageInfo.pages }">尾页</a></li>
        </c:when>
        <c:otherwise>
          <li class="page-item"><span  class="page-link">下一页</span></li>
          <li class="page-item"><span  class="page-link">尾页</span></li>
        </c:otherwise>
      </c:choose>
    </ul>
  </nav>


</div>



</div>



    

   <script>
   function submit() {
	    document.getElementById("searchInput").submit();
	}
	function changePage(page){
	    var oid = $("#oid").val();
	    var oname = $("#oname").val();
	    window.location.href="/CarOrder.do?pageNum="+page+"&oid="+oid+"&oname="+oname+"&area";
	}


	$(document).ready(function() {
	    $("#submit").click(function() {
	        alert($('#selectArea').val());
	        $("#orderForm").submit();
	    });
	});

   </script>          
</body>
</html>

