<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/2.png" type="image/x-icon">
    <title>知车 - 回到未来跑车中心</title>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/mdui/0.4.3/css/mdui.min.css" rel="stylesheet">  
   <script src="https://cdn.bootcss.com/mdui/0.4.3/js/mdui.min.js"></script>
     <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
  <script src="https://www.layuicdn.com/layui/layui.js"></script>
   <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #f6f6f6;">
<jsp:include page="../static/head.jsp"/>
   
      <div class="container2">
        <div class="layui-carousel" id="test1">
            <div carousel-item>
     
     	<c:forEach items="${Cars}" var="Car" end="5">
                        <a href="CarView.do?bid=${Car.bid}">
          <img src="images/product/${Car.image}" width="100%" height="100%" alt=""> </a>
				</c:forEach>
            </div>
      </div>

          

          
      </div>
      <div class="container" style="margin-top: 50px;">
        <div class="row">
          
               	<c:forEach items="${Cars}" var="Car" end="5">
                  <div class="col-md-6" style="margin-bottom: 30px;">
                    <div class="mdui-card">
                      <div class="mdui-card-media">
                        <img src="images/product/${Car.image}" width="100%" height="220px"/> 
                      </div>
                      <div class="mdui-card-actions">
                        <span class="mdui-btn ">${Car.bname}</span>
                        <a href="CarView.do?bid=${Car.bid}" target="_blank" class="mdui-btn mdui-ripple">了解更多</a>
                      </div>
                    </div>
                  </div>
				</c:forEach>
           
          </div>
      </div>
      
     <jsp:include page="../static/footer.jsp"/>
<script>
layui.use('carousel', function(){
  var carousel = layui.carousel;
  //建造实例
  carousel.render({
    elem: '#test1'
    ,width: '100%' //设置容器宽度
    ,arrow: 'false'
    ,height:'100%'//始终显示箭头
    //,anim: 'updown' //切换动画方式
  });
});



</script>

</body>
</html>

