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
    <script src="https://www.layuicdn.com/layui/layui.all.js"></script> 
    <link href="https://cdn.bootcss.com/mdui/0.4.3/css/mdui.min.css" rel="stylesheet">  
      <script src="https://cdn.bootcss.com/mdui/0.4.3/js/mdui.min.js"></script>
</head>
<body class="mdui-drawer-body-left mdui-appbar-with-toolbar  mdui-theme-primary-blue mdui-theme-accent-orange">

     <jsp:include page="../static/manahead.jsp"/>


  <div class="mdui-container doc-container">
    <h1 class="doc-title mdui-text-color-theme">添加商品信息。</h1>
    <form action="addCar.do" method="post"enctype="multipart/form-data"> 
  <table class="layui-table" lay-skin="row" lay-size="lg">
  
  
    <thead>
      <tr>
      <th>图片</th>
      <th>型号</th> 
      <th>价格</th>
      <th>车型类别</th>
    
      </tr>
      <tr>
    
              <td>     
              <input type="file"class="layui-input" style="border:none;"  name="file" id="pic" >
              </td>
              <td>     
               <input type="text"name="bname"   placeholder="请输入" style="border:none;" required  autocomplete="off" class="layui-input">
              </td>
              <td>     
            <input type="text" name="pirce"  placeholder="请输入" style="border:none;"  autocomplete="off" class="layui-input"> 
              </td>
              <td>     
              <select class="mdui-select"name="type"mdui-select>
                <option value="porsche">保时捷</option>
                <option value="Lamborghini">兰博基尼</option>
                  <option value="Ferrari">法拉利</option>
                    <option value="Koenigsegg">柯尼塞格</option>
                      <option value="McLaren">迈凯伦</option>
                        <option value="GTR">GTR</option>
                          <option value="Pagani">帕加尼</option>
                            <option value="AstonMartin">阿斯顿马丁</option>
               
              </select>  
              </td>       
         </tr>
         <tr>
         <th>最高时速</th>
        <th>0-100km加速时间</th>
      <th>生产日期</th>
      <th>库存</th>
      </tr>
      <tr>
              <td>     
               <input type="text"  name="maxspeed"  placeholder="请输入" style="border:none;"  autocomplete="off" class="layui-input">
              </td>
             
              <td>     
               <input type="text"  name="speedtime"  placeholder="请输入" style="border:none;"  autocomplete="off" class="layui-input">
              </td>
              <td>     
              <input type="text"name="dateString" onClick="WdatePicker()"  placeholder="请输入" style="border:none;"  autocomplete="off" class="layui-input">
              </td>
              <td>     
                <input type="text" name="store"   placeholder="请输入" style="border:none;"  autocomplete="off" class="layui-input">
                </td>
         </tr>
         </thead> 
  </table>
  
  <table  class="layui-table" lay-skin="row" lay-size="lg">
    <thead>
         <tr>
         <th>车型详情</th>
      </tr>
      <tr>
         <td>     
   
        <input name="detail" placeholder="请输入内容" class="layui-textarea">
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
  
  
  <button type="submit"   class="mdui-btn mdui-color-pink mdui-ripple" ">添加车辆</button>
  
    </div> 
  </form>
  </div>         
</body>
</html>