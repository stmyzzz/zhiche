<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <link rel="icon" href="images/2.png" type="image/x-icon">
    <title>知车 - ${Car.bname}</title>
	<jsp:include page="../static/head.jsp"/>

    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
  
</head>
<body style="background-color: #f6f6f6;">
  

<div class="container" style="background-color: #fff;margin-top:30px" >
    <br> <br>
 <h1 style="text-align: center;">${Car.bname}</h1>
 <br>
 <div class="row">
 <div class="col-md-6"> <img src="images/product/${Car.image}" alt="" width="100%">
   </div>
   <div class="col-md-6" style="font-size: 15px ; font-weight: 500;">
<p>  单价：${Car.pirce}元</p>
<p>最高时速 ${Car.maxspeed}</p>
<p>0~100加速时长 ${Car.speedtime} </p>
<p>库存 ${Car.store}  / 销量 ${soldNum}</p>
<p>生产日期 ${dateStr}</p>
<p>购买数量：
  <span id="sub" onclick="subNum();"><span class="layui-icon">&#xe67e;</span></span>&nbsp;
    <input style="height: 25px; width:25px;"  id="number" name="number"  value="1" size="2" readonly/>&nbsp;
    <span id="add" onclick="addNum();"><span class="layui-icon">&#xe624;</span></span></p>
    <input type="hidden" id="store" value="${Car.store}"  />
   <div class="fl" style="text-align: center;">
    <c:if test="${Car.store>0}">

    <button type="button" id="buy" class="layui-btn">立即购买</button>   

        <input type="hidden" id="bid" value="${Car.bid}"  />
    <button type="button" id="submit"  class="layui-btn">添加到购物车</button>     
    </c:if>
    <c:if test="${Car.store==0}">
   <button type="button" class="layui-btn">已售完</button>
    </c:if>
    </div>

  

   </div>

   <div class="productview" style="margin-left: 30px;">
      <h5>关于${Car.bname}</h5>
      <p>	${Car.detail}</p>
   </div>
    
   <div class="comment" style="margin-left: 30px;width: 100%;">
    <h5>${Car.bname}的${pageInfo.total}条评价：</h5>
<c:if test="${comments.size()==0}">
					<div class="introduce">
						<h4 style="text-align:center;margin-top:30px;"> 还没有人评价。 </h4>
					</div>
				</c:if>
    <c:forEach items="${comments}" var="comment">
      <div class="row"style="margin-left:0px;margin-bottom:20px;" >    
        <div style="width: 10%;text-align: center;"> <img src="images/1.jpg" alt="" width="60%" height="60px"> </div>
        <div style="width: 80%;"> 
           <a target="_blank" href="1" target="_blank" style="color: #009688;">${comment.content}</a>   <p class="card-text pshixi"><span class="badge badge-info badge-pill" style="font-size: 12px;">
             ${comment.uname}</span>
           
          <strong style="float: right;">&nbsp;&nbsp; ${comment.date}</strong>       
       
                  </p> 
   
           
       
       </div>
      </div>
      </c:forEach>

   
   <!-- <div class="row"style="margin-left:0px;margin-bottom:20px;" >    
    <div style="width: 10%;text-align: center;"> <img src="1.JPG" alt="" width="60%" height="60px"> </div>
    <div style="width: 80%;"> 
       <a target="_blank" href="1" target="_blank" style="color: #009688;">很好的车啊</a>   <p class="card-text pshixi"><span class="badge badge-info badge-pill" style="font-size: 12px;">
       Stmy</span>
       
      <strong style="float: right;">&nbsp;&nbsp;  2020-1-2</strong>       
   
              </p> 

       
   
   </div>
  </div>
  <div class="row"style="margin-left:0px;margin-bottom:20px;" >    
    <div style="width: 10%;text-align: center;"> <img src="1.JPG" alt="" width="60%" height="60px"> </div>
    <div style="width: 80%;"> 
       <a target="_blank" href="1" target="_blank" style="color: #009688;">很好的车啊</a>   <p class="card-text pshixi"><span class="badge badge-info badge-pill" style="font-size: 12px;">
       Stmy</span>
       
      <strong style="float: right;">&nbsp;&nbsp;  2020-1-2</strong>       
   
              </p> 

       
   
   </div>
  </div> -->


  <nav aria-label="..." style="margin-left: 30%;margin-top:100px;" >
    <c:if test="${comments.size()!=0}">
    <ul class="pagination">
    
      <c:choose>
        <c:when test="${pageInfo.hasPreviousPage}">
          <li class="page-item"><a class="page-link"  href="CarView.do?pageNum=1&bid=${Car.bid}">首页</a></li>
          <li class="page-item"><a class="page-link"  href="CarView.do?pageNum=${pageInfo.prePage }&bid=${Car.bid}">上一页</a></li>
        </c:when>

      <c:otherwise>
      <li class="page-item disabled">
        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">首页</a>
      </li>
      <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">上一页</a>
      </li>
      </c:otherwise>
        </c:choose>

  

      <c:forEach var="index" begin="1" end="${pageInfo.pages }">

        <li 
          <c:if test="${index==pageInfo.pageNum}">class="page-item active"</c:if>><a class="page-link"
          href="CarView.do?pageNum=${index }&bid=${Car.bid}">${index }</a></li>
      </c:forEach>

      <c:choose>
        <c:when test="${pageInfo.hasNextPage}">
          <li class="page-item"><a class="page-link"  href="CarView.do?pageNum=${pageInfo.nextPage }&bid=${Car.bid}">下一页</a></li>
          <li class="page-item"><a class="page-link"  href="CarView.do?pageNum=${pageInfo.pages }&bid=${Car.bid}">尾页</a></li>
        </c:when>

      <c:otherwise>
      <li class="page-item disabled">
        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">下一页</a>
      </li>
      <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">尾页</a>
      </li>
      </c:otherwise>
</c:choose>

    
    </ul></c:if>
  </nav>


    

</div>   
</div>

 
<script>
    layui.use('element', function(){
      var element = layui.element;
      
      //…
    });
      
    $(function(){
        $("#submit").click(function(){
            var number = $("#number").val();
            var bid = $("#bid").val();
            /* addGoodsInCart?bid=${Car.bid}&number=" */
            $.post("addGoodsInCart.do",{"number":number,"bid":bid},function(){
            	mdui.snackbar('成功加入购物车！', {position: 'top', timeout: 1500});
            });
        })
    })
    $(function(){
        $("#buy").click(function(){
            var number = $("#number").val();
            var bid = $("#bid").val();
            /* addGoodsInCart?bid=${Car.bid}&number=" */
            $.post("addGoodsInCart.do",{"number":number,"bid":bid},function(){
                window.location.href="cartPage.do";
            });
        })
    })

    function addNum() {
    	var store = $("#store").val();
        var num = parseInt(document.getElementById("number").value);
        if (num < store) {
            document.getElementById("number").value = ++num;
        }else{
        	mdui.snackbar('购买数量超过库存上限了哟', {position: 'top', timeout: 1500});
        }
    }
    function subNum() {
        var num = parseInt(document.getElementById("number").value);
        if (num > 1) {
            document.getElementById("number").value = --num;
        }else{
        	mdui.snackbar('总不能让你买个寂寞', {position: 'top', timeout: 1500});
        }
    }

</script>    
 <jsp:include page="../static/footer.jsp"/>
</body>
</html>

