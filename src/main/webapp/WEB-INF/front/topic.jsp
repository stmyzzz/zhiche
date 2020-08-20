<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/2.png" type="image/x-icon">
    <title>知车 - 发现</title>
  <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/mdui/0.4.3/css/mdui.min.css" rel="stylesheet">  
  <script src="https://cdn.bootcss.com/mdui/0.4.3/js/mdui.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
  <script src="https://www.layuicdn.com/layui/layui.js"></script>
<link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #f6f6f6;">

   	<jsp:include page="../static/head.jsp"/>



 <div class="container">
  
    <div class="youyou" style="width: 65%;float:left;">
    
    
      <div class="mdui-appbar" style="margin: 0 auto;">
        <div class="mdui-tab mdui-color-teal" mdui-tab>
        <a href="#" class="mdui-ripple mdui-ripple-white" >最新</a>
        
          
         
        </div>
      </div>
    <style>
    
    .mdui-card-media-covered{
    top:0;
    }
    </style>
      <div class="tiezilist" id="aaa">
        <c:forEach var="topic" items="${topics}">
        <div class="tieziitem" style="margin-bottom: -17px;">
            <div class="card mb-3 mdui-hoverable">  
             <div class="row no-gutters">
             
               <div class="col-md-8">
               <div class="card-body" style="padding: 20px 20px 20px 15px;">
                 <div class="jobxinxi">
                
                                <h5 class="card-title" style="font-size:18px;margin-bottom: 10px;">
                                 <a target="_blank" href="TopicView.do?tid=${topic.tid}" target="_blank" style="color: #009688;font-size:20px;">${topic.tname}</a>
                               </h5>
                            
                               </div>
                              </div>
                            </div>
                             </div>
                            
                            </div>
                        
                        </div>
        </c:forEach>
                   


        <nav aria-label="..." style="margin-left: 25%;margin-top: 30px;" >
          <ul class="pagination">
            <c:choose>
              <c:when test="${tpageInfo.hasPreviousPage}">
                <li class="page-item"><a class="page-link" href="manaTopic.do?pageNum=1" >首页</a></li>
                <li class="page-item"><a class="page-link" href="manaTopic.do?pageNum=${tpageInfo.prePage }">上一页</a></li>
              </c:when>
              <c:otherwise>
                <li class="page-item disabled"><a class="page-link" >首页</a></li>
                <li class="page-item disabled"><a class="page-link">上一页</a></li>
              </c:otherwise>
            </c:choose>
            
            <c:forEach var="index" begin="1" end="5">
        
              <li
                <c:if test="${index==tpageInfo.pageNum}">class="page-item active"</c:if>><a
                href="manaTopic.do?pageNum=${index}" class="page-link">${index }</a></li>
            </c:forEach>
         
        
            <c:choose>
              <c:when test="${tpageInfo.hasNextPage}">
                <li class="page-item" ><a href="manaTopic.do?pageNum=${tpageInfo.nextPage }" class="page-link">下一页</a></li>
                <li class="page-item" ><a href="manaTopic.do?pageNum=${tpageInfo.pages }" class="page-link" >尾页</a></li>
              </c:when>
              <c:otherwise>
                <li class="page-item disabled"><a class="page-link" >下一页</a></li>
                <li class="page-item disabled"><a class="page-link">尾页</a></li>
              </c:otherwise>
            </c:choose>
        
          </ul>
        </nav> 



        </div>
    </div>

    <!--右边-->
   
     <div class="zuozuo" style="width: 32%;float: right;">
     
       	<c:forEach items="${Cars}" var="Car"  end="2">
    <div class="mdui-card">
    <div class="mdui-card-media">
    <img src="images/product/${Car.image}" width="100%"  />
    <div class="mdui-card-media-covered">
      <div class="mdui-card-primary">
        <div class="mdui-card-primary-title" >${Car.bname}</div>
        <div class="mdui-card-primary-subtitle">${Car.pirce}</div>
      </div>
      <div class="mdui-card-actions">
      <a href="CarView.do?bid=${Car.bid}">
        <button class="mdui-btn mdui-ripple mdui-ripple-white">了解更多</button></a>
      </div>
    </div>
  </div>
</div>

</c:forEach>

 
  </div>
  
  </div>

   <style>
        .pshixi{
          font-size: 12px;
          color: rgb(165, 165, 165);
        }
   
   
    .pshixi{
      font-size: 12px;
      color: rgb(165, 165, 165);
    }
   .mdui-card{
       margin-bottom: 30px;
   }
  </style>


  





</body>
</html>
