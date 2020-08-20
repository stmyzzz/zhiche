<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
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
  <h1 class="doc-title mdui-text-color-theme">用户管理。</h1>

 
<table class="layui-table" lay-skin="row" lay-size="lg">
<style>
    .layui-table th,td{
        text-align: center;
    }
</style>
<thead>
    <tr>
      
        <th>ID</th>
        <th>姓名</th>
        <th>送货地址</th>
        <th>Email</th>
        <th>手机号</th>
        <th> 操作</th>
    </tr>
</thead>
<tbody id="aaa">

  
        <c:forEach var="user" items="${users}">
          <tr>
            <td>${user.uid}</td>
            <td >${user.uname}</td>
            <td >${user.adress}</td>
            <td>${user.email}</td>
            <td >${user.phone}</td>
            <td ><a href="modifyUserPage.do?uid=${user.uid}">修改</a> <a
              href="delUser.do?uid=${user.uid}">删除</a></td>
          </tr>
        </c:forEach>
</tbody>

</table>
<nav aria-label="..." style="margin-left: 25%;margin-top: 30px;" >
  <ul class="pagination">
    <c:choose>
      <c:when test="${pageInfo.hasPreviousPage}">
        <li class="page-item"><a  class="page-link"  href="manaUser.do?pageNum=1">首页</a></li>
        <li class="page-item"><a  class="page-link" href="manaUser.do?pageNum=${pageInfo.prePage }">上一页</a></li>
      </c:when>
      <c:otherwise>
        <li class="page-item"><span  class="page-link">首页</span></li>
        <li class="page-item"><span  class="page-link">上一页</span></li>
      </c:otherwise>
    </c:choose>

    <c:forEach var="index" begin="1" end="${pageInfo.pages }">

      <li
        <c:if test="${index==pageInfo.pageNum}">class="page-item active"</c:if>><a
       class="page-link"  href="manaUser.do?pageNum=${index }">${index }</a></li>
    </c:forEach>

    <c:choose>
      <c:when test="${pageInfo.hasNextPage}">
        <li class="page-item" ><a  class="page-link" href="manaUser.do?pageNum=${pageInfo.nextPage }">下一页</a></li>
        <li class="page-item"><a  class="page-link" href="manaUser.do?pageNum=${pageInfo.pages }">尾页</a></li>
      </c:when>
      <c:otherwise>
        <li class="page-item"><span  class="page-link">下一页</span></li>
        <li class="page-item"><span  class="page-link">尾页</span></li>
      </c:otherwise>
    </c:choose>
  </ul>
</nav>


</div>



    

             
</body>
</html>
