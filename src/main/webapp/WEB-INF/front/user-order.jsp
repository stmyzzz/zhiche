<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="icon" href="images/2.png" type="image/x-icon">
    <title>知车 - 我的订单</title>
	<jsp:include page="../static/head.jsp"/>

</head>
<body>
 <div class="container">
     <br>  <br> 
     <h1 style="text-align: center;"> 我的订单。</h1>
	<c:forEach items="${CarOrders}" var="CarOrder">
     <table class="layui-table" >
        <colgroup>
          <col width="150">
          <col width="100">
          <col width="100">
          <col width="400">
          <col width="100">
          <col width="100">
        </colgroup>
        <thead>
          <tr>
            <th>订单号：${CarOrder.oid}</th>
            <th>${CarOrder.date}</th>
            <th>收货人:${CarOrder.oname}</th>
            <th>收货地址：${CarOrder.adress}</th>
            <th>订单状态</th>
            <th>评价状态</th>
          </tr> 
        </thead>
        <tbody>
          <c:forEach items="${orderDetails }" var="orderDetail">
            <c:if test="${CarOrder.oid==orderDetail.orderId}">
              <c:forEach items="${Cars }" var="Car">
              <c:if test="${Car.bid==orderDetail.carId }">
                  <tr>
                    <td class="first w4 c"><a href="CarView.do?bid=${Car.bid }">${Car.bname }<a/></td>
                    <td ><img height="80" width="80" src="images/product/${Car.image}"></td>
                    <td >数量：${orderDetail.carNum }</td>
                    <td>￥${Car.pirce*orderDetail.carNum }</td>
                    <td >${CarOrder.status }</td>
                    <c:if test="${orderDetail.status=='待评价' }">
                    <td>
                      <c:choose>
                        <c:when test="${CarOrder.status=='已签收'}">
                          <a href="commentPage.do?bid=${Car.bid }&odid=${orderDetail.id }">待评价</a>
                        </c:when>
                        <c:otherwise>
                          <span >待评价</span>
                        </c:otherwise>

                      </c:choose>
                    </td>
                    </c:if>
                    <c:if test="${orderDetail.status=='已评价' }">
                    <td>已评价</td>
                    </c:if>
                  </tr> 
              </c:if>
              </c:forEach>
            </c:if>
            </c:forEach>
          </c:forEach>
       
        </tbody>
      </table>


<nav aria-label="..." style="margin-left: 25%;margin-top: 30px;">

  <ul class="pagination">
    <c:choose>
      <c:when test="${pageInfo.hasPreviousPage}">
        <li class="page-item"><a class="page-link" href="userOrder.do?pageNum=1&uid=${sessionScope.user.uid }">首页</a></li>
        <li class="page-item"><a class="page-link" href="userOrder.do?pageNum=${pageInfo.prePage }&uid=${sessionScope.user.uid }">上一页</a></li>
      </c:when>
      <c:otherwise>
        <li class="page-item"><span class="page-link">首页</span></li>
        <li class="page-item"><span class="page-link">上一页</span></li>
      </c:otherwise>
    </c:choose>

    <c:forEach var="index" begin="1" end="${pageInfo.pages }">

      <li
        <c:if  test="${index==pageInfo.pageNum}">class="page-item active"</c:if>><a class="page-link"
        href="userOrder.do?pageNum=${index }&uid=${sessionScope.user.uid }">${index }</a></li>
    </c:forEach>

    <c:choose>
      <c:when test="${pageInfo.hasNextPage}">
        <li class="page-item"><a class="page-link" href="userOrder.do?pageNum=${pageInfo.nextPage }&uid=${sessionScope.user.uid }">下一页</a></li>
        <li class="page-item"><a class="page-link" href="userOrder.do?pageNum=${pageInfo.pages }&uid=${sessionScope.user.uid }">尾页</a></li>
      </c:when>
      <c:otherwise>
        <li class="page-item"><span class="page-link">下一页</span></li>
        <li class="page-item"><span class="page-link">尾页</span></li>
      </c:otherwise>
    </c:choose>
  </ul>

</nav>

      

 </div>

</body>
</html>
