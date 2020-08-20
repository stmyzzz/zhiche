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
    <script src="https://www.layuicdn.com/layui/layui.js"></script> 
    <link href="https://cdn.bootcss.com/mdui/0.4.3/css/mdui.min.css" rel="stylesheet">  
      <script src="https://cdn.bootcss.com/mdui/0.4.3/js/mdui.min.js"></script>
</head>
<body class="mdui-drawer-body-left mdui-appbar-with-toolbar  mdui-theme-primary-blue mdui-theme-accent-orange">

 	<jsp:include page="../static/manahead.jsp"/>

  <div class="mdui-container doc-container">
    <h1 class="doc-title mdui-text-color-theme">上传用户信息。</h1>
    <form action="orderModify.do" method="post"> 
  <table class="layui-table" lay-skin="row" lay-size="lg">
  
  
    <thead>
      <tr>
   
      <th>订单ID</th>
     
      <th>订购人姓名</th>
      </tr>
      <tr>
    
            
              <td>     
               <input type="text"  id="oid" name="oid" value="${CarOrder.oid }"  placeholder="请输入" style="border:none;"  autocomplete="off" class="layui-input">
              </td>
             
              <td>  
                <input type="text"  id="oname" name="oname"  value="${CarOrder.oid }"  placeholder="请输入" style="border:none;"  autocomplete="off" class="layui-input">   
             
              </td>
         </tr>
         <tr>
         <th>状态</th>
        
         <th>送货地址</th>
    
      </tr>
      <tr>
        <td>     
          <select id="status" name="status" class="mdui-select"name="type"mdui-select>
            <option value="未确认">未确认</option>
            <option value="未发货">未发货</option>
            <option value="已发货">已发货</option>
            <option value="已签收">已签收</option>
          </select>  
      
         </td>
             
              <td>     
              <input type="text"  id="address" name="address" value="${CarOrder.adress }"  placeholder="请输入" style="border:none;"  autocomplete="off" class="layui-input">
              </td>
          
         </tr>
         </thead> 
  </table>
  

         <style>
             .layui-input, .layui-select, .layui-textarea{
               background-color: rgba(90,90,90,0.008);
             }
         </style>
              
    <div class="bu1"style="text-align:center;margin-top:20px;">
  
  
  <button  type="submit" name="submit"   class="mdui-btn mdui-color-blue mdui-ripple" style="color:#fff">更新</button>
  
    </div> 
   </form>
  </div>
  
<script>
  layui.use('form', function(){
  var form = layui.form;
  
  //监听提交
  form.on('submit(formDemo)', function(data){
    layer.msg(JSON.stringify(data.field));
    return false;
  });
});
</script>


    

             
</body>
</html>