<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
</head>
<body class="mdui-drawer-body-left mdui-appbar-with-toolbar  mdui-theme-primary-blue mdui-theme-accent-orange">
<jsp:include page="../static/manahead.jsp"/>

  <div class="mdui-container doc-container">
    <h1 class="doc-title mdui-text-color-theme">上传用户信息。</h1>
    <form action="addUser.do" method="post">  
  <table class="layui-table" lay-skin="row" lay-size="lg">
  
  
    <thead>
      <tr>
   
      <th>用户名</th>
      <th>密码</th>
      <th>性别</th>
      </tr>
      <tr>
    
            
              <td>     
               <input type="text"name="userName"  placeholder="请输入" style="border:none;"  autocomplete="off" class="layui-input">
              </td>
              <td>     
            <input type="text"name="passWord" placeholder="请输入" style="border:none;"  autocomplete="off" class="layui-input"> 
              </td>
              <td>     
                <input type="radio" name="gender" value="男" checked="checked" />男 <input type="radio" name="gender" value="女" />女
              </td>
         </tr>
         <tr>
         <th>邮箱</th>
         <th>手机号码</th>
         <th>送货地址</th>
    
      </tr>
      <tr>
        <td>     
          <input type="text"  name="email"  placeholder="请输入" style="border:none;"  autocomplete="off" class="layui-input">
         </td>
              <td>     
               <input type="text"   name="phone"   placeholder="请输入" style="border:none;"  autocomplete="off" class="layui-input">
              </td>
              <td>     
              <input type="text" name="address"  placeholder="请输入" style="border:none;"  autocomplete="off" class="layui-input">
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
  
  
  <button  type="submit" name="submit"   class="mdui-btn mdui-color-blue mdui-ripple" style="color:#fff">添加</button>
  
    </div> 
   </form>
  </div>
  



    

             
</body>
</html>
