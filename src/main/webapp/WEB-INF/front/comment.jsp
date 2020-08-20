<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <link rel="icon" href="images/2.png" type="image/x-icon">
    <title>知车 - 评价</title>
    <jsp:include page="../static/head.jsp"/>
</head>
<body style="background-color: #f6f6f6;">
   
 <div class="container" style="margin-top:100px;text-align: center;">
     <br>  <br> 
     <h1 style="margin-bottom: 50px;"> 请为我们做出评价：）</h1>
     
    
     <form action="addComment.do" method="post">
        <table>
            <input type="hidden" name="uid" value="${sessionScope.user.uid}"/>
            <input type="hidden" name="odid" value="${odid}"/>
            <input type="hidden" name="bid" value="${Car.bid }"/>
            <input type="hidden" name="uname" value="${sessionScope.user.uname }"/>
            <tr>
               
                <div class="mdui-textfield" style="padding-top:0px">
          
                    <textarea placeholder="输入评价内容" class="mdui-textfield-input" id="content" name="content" type="text" rows="8"/></textarea>
                    
                  </div>
            </tr>
            <button class=" btn btn-primary" style="background-color:#009688;margin-top: 30px;"   >提交评价</button>

        </table>
    </form>
   
 </div>     <jsp:include page="../static/footer.jsp"/>
<style>
    .layui-table img{
        max-width: 200px;
    }
</style>
    <script>
          layui.use('element', function(){
      var element = layui.element;
    });
    </script>
</body>
</html>
