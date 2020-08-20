<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images/2.png" type="image/x-icon">
    <title>知车 - 购物车</title>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css"/>
    <script src="https://www.layuicdn.com/layui/layui.js"></script>  
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>
<body style="background-color: #f6f6f6;">
   	<jsp:include page="../static/head.jsp"/>
   

 <div class="container">
     <br>  <br> 
     <h1 style="text-align: center;"> 购物车。</h1>
     <c:if test="${sessionScope.cart.totalPrice!=0&&sessionScope.cart!=null}">
     <table class="layui-table" >
        <colgroup>
          <col width="300">
          <col width="100">
          <col width="100">
          <col width="100">
          <col width="100">
        </colgroup>
        <thead>
          <tr>
            <th>车型</th>
            <th>单价</th>
            <th>数量</th>
            <th>金额</th>
            <th>操作</th>
          </tr> 
        </thead>
        <tbody>
          <c:forEach var="good" items="${sessionScope.cart.goods}">
          <tr>
            <td>
                <img src="images/product/${good.key.image}" alt="" >   <a href="CarView.do?bid=${good.key.bid}">${good.key.bname}</a>
            </td>
            <td>
              ${good.key.pirce}
              <input id="price${good.key.bid}" type="hidden" value="${good.key.pirce}"/>
            </td>
            <td>
         
    
                                <input style="height: 25px; width:25px;" type="text" id="number${good.key.bid}" name="number" value="${good.value}" size="2" readonly/>
                            
        </td>
            <td>	
              <span>￥</span>
              <span id="goodSum${good.key.bid}">${good.key.pirce*good.value}</span>
            </td>
            <td><a href="removeGoodsFromCart.do?bid=${good.key.bid}">删除</a></td>
          </tr>
       </c:forEach>
        </tbody>

        <tbody>
            <tr>
                <td>总额</td>  
                 <td>RMB </td>
                 <td></td>
                 <td></td>
                 <td> <span id="sum">${sessionScope.cart.totalPrice }</span>
                  <input id="hiddenSum" type="hidden" value="${sessionScope.cart.totalPrice}"/>
                      <input type="hidden" id="store" value="${Car.store}"  /></td>
            </tr>

            </tr>
         
             
         
        </tbody>
      </table>
      <div class="fl" style="float: right;">
     
      <a href="cleanCart.do">清空购物车 &nbsp; &nbsp;</a> 
      <c:if test="${sessionScope.user!=null}"><a id="submit2" href="#">     <button type="button" class="layui-btn">结算</button> </a></c:if>
<c:if test="${sessionScope.user==null}"><a  id="login12" href="#">     <button type="button" class="layui-btn">结算</button> </a></c:if>
   </c:if>
   <c:if test="${sessionScope.cart.totalPrice==0||sessionScope.cart==null}">
    <h1 style="text-align:center;margin-top:100px;color:#009688;font-weight:500;">买点跑车开回家！</h1>
</c:if>
      
    
 </div>
<style>
    .layui-table img{
        max-width: 200px;
    }
</style>
<script>
    layui.use('element', function(){
      var element = layui.element;
      
      //…
    });
    $(document).ready(function () {
        $("#submit2").click(function () {
            $.get("checkStore.do", "utf-8",
                function (data) {
                    if (data == 'success') {
                        window.location.href = "oderPage.do";
                    } else {
                        alert(data);
                    }
                });
        });
    });
    
    $(document).ready(function () {
        $("#login12").click(function () {
        	window.location.href = "login.do";
        });
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
        	mdui.snackbar('总不能让你买了个寂寞', {position: 'top', timeout: 1500});
        }
    }

</script>
   
</body>
</html>