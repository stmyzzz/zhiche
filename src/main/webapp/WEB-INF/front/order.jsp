<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <link rel="icon" href="images/2.png" type="image/x-icon">
    <title>知车 - 订单</title>
	<jsp:include page="../static/head.jsp"/>
	   <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
	<script src="js/cityselect.js"></script>
	<link href="js/cityLayout.css" type="text/css" rel="stylesheet">

	<script>
		$(function(){
			init_city_select($("#selectArea"));
		});

	</script>
</head>
<body style="background-color: #f6f6f6;">

 <div class="container">
  <form action="addCarOrder.do" id="orderForm" method="post">
     <br>  <br> 
     
     <h1 style="text-align: center;">确认你的信息。</h1>
     <input id="uid" name="uid" type="hidden" value="${sessionScope.user.uid}" />
     
     <div class="layui-form-item">
      <label class="layui-form-label">收货人</label>
      <div class="layui-input-block">
        <input type="text" id="oname" name="oname" value="${sessionScope.user.uname }" required  lay-verify="required" placeholder="请输入收货人" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">手机号</label>
      <div class="layui-input-block">
        <input type="text" id="omobile" name="omobile" value="${sessionScope.user.phone }" required  lay-verify="required" placeholder="请输入手机号码" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">地址</label>
      <div class="layui-input-block">
       <input name="ocity" id="selectArea"  type="text" value="广东省-深圳市-龙岗区" class="city_input" readonly="readonly">
							<br>
							<textarea placeholder="输入详细地址" class="form-control" style="width:200px;height:100px;" id="oaddress" name="oaddress" value="${sessionScope.user.adress }" /></textarea>
      </div>
    </div>
  <h1  style="text-align: center;">你选购的车型如下</h1> 

	<c:if test="${sessionScope.cart.totalPrice!=0}">
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
          
          </tr> 
        </thead>
        <tbody>
          <c:forEach var="good" items="${sessionScope.cart.goods}">  
           <input id="bid" name="bid" type="hidden" value="${good.key.bid}" /> 
          <tr>
            <td>
                <img src="images/product/${good.key.image}" alt="" width="100%" height="100px" >   <a href="CarView.do?bid=${good.key.bid}">${good.key.bname}</a>
            </td>
            <td><span>￥${good.key.pirce}</span>
              <input id="price${good.key.bid}" type="hidden" value="${good.key.pirce}" /></td>
            <td>
              <a id="number${good.key.bid}" name="number">${good.value}</a>
        </td>
            <td><span >￥</span>
              <span id="goodSum${good.key.bid}">${good.key.pirce*good.value}</span></td>
          
          </tr>
         </c:forEach>
        
        </tbody>

        <tbody>
            <tr>
                <td>总额</td>  
                 <td>RMB </td>
                 <td></td>
               
              
    
       <td>	<span>￥</span>
        <span id="sum">${sessionScope.cart.totalPrice }</span>
        <input id="hiddenSum" type="hidden" value="${sessionScope.cart.totalPrice}" /></td>
        
        
        
            </tr>
         
             
         
        </tbody>
           
     
    
          
      </table>    </c:if> <div class="fl" style="float: right;">
       <a href="cartPage.do">返回购物车 &nbsp; &nbsp;</a> 
      <button type="submit" id="submit" class="layui-btn">提交订单</button>      
      </div>
        
  </form>
  
    
 </div>
<style>




    .layui-table img{
        max-width: 200px;
    }
</style>
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

    
          layui.use('element', function(){
      var element = layui.element;
    });
    </script>
     <jsp:include page="../static/footer.jsp"/>
</body>
</html>

