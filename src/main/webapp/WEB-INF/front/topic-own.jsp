<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/2.png" type="image/x-icon">
    <title>知车 - 话题</title>
  <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/mdui/0.4.3/css/mdui.min.css" rel="stylesheet">  
  <script src="https://cdn.bootcss.com/mdui/0.4.3/js/mdui.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
  <script src="https://www.layuicdn.com/layui/layui.js"></script>
<link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body  onload="zhaohuifu(this)" style="background-color: #f6f6f6;">
   	<jsp:include page="../static/head.jsp"/>

    <div class="container">
      

        <!--左边-->
        <div style="float: left; width: 19%;">
        
          <c:forEach items="${acar}" var="acar" begin="1" end="3">
           <div class="card" style="width: 211px;margin-top: 20px;" >
                <img src="images/product/${acar.image}" class="card-img-top" alt="...">
                <div class="card-body">
                  <p class="card-text">广告位招商</p>
            </div>
            </div>
             </c:forEach>
            <div>
            <h5>都在看： </h5>
            <div>
               	
             <c:forEach items="${atopic}" var="atopics"  begin="1" end="3">
                
                <blockquote class="layui-elem-quote"> <a href="TopicView.do?tid=${atopics.tid}"> ${atopics.tname} </a> </blockquote>
               
              </c:forEach>
            </div>
     

            
        </div>
        </div>

        <div class="card" style="width: 80%;float: right;">
            <h4 class="card-header" style="height: 80px;text-indent: 2em;line-height: 55px;">${Topic.tname}</h4>
            <div class="card-body">
              <!-- <h5 class="card-title">Special title treatment</h5> -->
               
                <div>
                    <p class="card-text card-body" style="padding: 0px 40px 0px 50px;">
             ${Topic.tcontent}</p>
                </div>
                <div class="card-body" style="padding: 20px 20px 20px 5px;margin-right: 15px;">
                    <div class="anniu">
                    <c:if test="${sessionScope.user!=null}">
                      <button class="animated tada btn btn-primary" id="openn"  style="  background-color:#009688;">评论</button>    
                    </c:if>
                         <c:if test="${sessionScope.user==null}">
                         <a href="login.do">
                      <button class="animated tada btn btn-primary"  style="  background-color:#009688;">评论</button> </a>   
                    </c:if>
                    
                    
                     
                    </div>
                </div>
            </div>   
        </div>

   

        <div class="answers" style="width: 80%;float: right;margin: 25px 0px;">
            <div class="site-title" style="margin-left: 40px;">
                <fieldset><legend><a name="fieldset">共${pageInfo.total}个评论</a></legend></fieldset>
            </div>
        <!--回答框-->
        <div id="aaa">
    <c:forEach items="${tcomments}" var="tcomment">
          <div class="card">
              <div class="card-body" >
                   <div class="row no-gutters">
                     <div class="col-md-6" >
                        <img src="images/product/${tcomment.tcimg}" class="card-img mdui-img-circle" alt="用户LOGO" style="width: 60px;height: 60px;display:block;float: left;margin-top: 10px;margin-left: 50px;">
                         
            

                        <span style="margin-top:10px;margin-bottom: 10px;float: left;">${tcomment.tcname}</span>

                     
                     </div>
                     <div class="col-md-6" >
                         <p class="card-body" style="font-size: 14px;color: rgb(151, 151, 151);float: right;margin-right: 25px;">${tcomment.tcdate}</p>
                     </div>
                     </div>
                  <div class="answercontent" style="padding: 5px 40px 5px 50px;">${tcomment.tccontent}</div>  
                         <button type="button" class="btn btn-outline-danger btn-sm" style="float: right;height: 31px;">
                                        <i class="layui-icon layui-icon-praise"></i><span class="znum">Beta</span>
                                  </button>       
               </div>
        </div>

       </c:forEach>
        </div>

    
<div class="mdui-container">

<div class="mdui-dialog" id="commentlogin">
  <div class="mdui-dialog-title">Are you sure?</div>
  <div class="mdui-dialog-content">You'll lose all photos and media!</div>
  <div class="mdui-dialog-actions">
    <button class="mdui-btn mdui-ripple">cancel</button>
    <button class="mdui-btn mdui-ripple">erase</button>
  </div>
</div>

  <div class="mdui-dialog" id="dialog1">
<div class="mdui-dialog-title">
<div class="mdui-textfield mdui-textfield-floating-label">
  <style text/css>
    .mdui-textfield-focus .mdui-textfield-input,
    .mdui-textfield-focus .mdui-textfield-input:hover{
      border-bottom-color: black;
      box-shadow: 0 1px 0 0 black;
    }
  </style>
    <label class="mdui-textfield-label" style="color:teal">点击输入评论内容</label>

    <textarea class="mdui-textfield-input" id="tccontent"  type="text" rows="8"/></textarea>
  </div>
  </div>
 <input type="hidden" name="tid" id="tid" value="${Topic.tid}"/>
  <input type="hidden" name="uid" id="uid" value="${sessionScope.user.uid}"/>
  <input type="hidden" name="tcname" id="tcname" value="${sessionScope.user.uname}"/>
   <input type="hidden" name="tcimg" id="tcimg" value="${sessionScope.user.uimg}"/>
    <input type="hidden" name="tcintro" id="tcintro" value="${sessionScope.user.intro}"/>

<div class="mdui-dialog-actions">
<button class="mdui-btn mdui-ripple" mdui-dialog-cancel style="color:teal">下次再发</button>
<button class="mdui-btn mdui-ripple" id="submit" style="color:teal">现在就发</button>
</div>
</div>


</div>
<div class="pager" style="margin-left:35%;margin-top:10%;">
  <ul class="pagination">
    <c:choose>
      <c:when test="${pageInfo.hasPreviousPage}">
        <li class="page-item"><a class="page-link" href="TopicView.do?pageNum=1&tid=${Topic.tid}">首页</a></li>
        <li class="page-item"><a class="page-link" href="TopicView.do?pageNum=${pageInfo.prePage }&tid=${Topic.tid}">上一页</a></li>
      </c:when>
      <c:otherwise>
        <li class="page-item"><span class="page-link">首页</span></li>
        <li class="page-item"><span class="page-link">上一页</span></li>
      </c:otherwise>
    </c:choose>

    <c:forEach var="index" begin="1" end="${pageInfo.pages }">

      <li
        <c:if test="${index==pageInfo.pageNum}">class="page-item active"</c:if>><a class="page-link"
        href="TopicView.do?pageNum=${index }&tid=${Topic.tid}">${index }</a></li>
    </c:forEach>

    <c:choose>
      <c:when test="${pageInfo.hasNextPage}">
        <li class="page-item"><a class="page-link" href="TopicView.do?pageNum=${pageInfo.nextPage }&tid=${Topic.tid}">下一页</a></li>
        <li class="page-item"><a class="page-link" href="TopicView.do?pageNum=${pageInfo.pages }&tid=${Topic.tid}">尾页</a></li>
      </c:when>
      <c:otherwise>
        <li class="page-item"><span class="page-link">下一页</span></li>
        <li class="page-item"><span class="page-link">尾页</span></li>
      </c:otherwise>
    </c:choose>
  </ul>
</div>
</div>
</div>
<script>
                 



                 var instd = new mdui.Dialog('#dialog1');
	document.getElementById('openn').addEventListener('click', function () {
	  instd.open();
	});
	

	
	$(document).ready(function(){
	    $("#submit").click(function(){
	        $.ajax({
	            type: "post",
	            url: "addTcomment.do",
	            data: {
	                uid:$("#uid").val(),
	               tcname:$("#tcname").val(),
	                 tcimg:$("#tcimg").val(),
	                   tcintro:$("#tcintro").val(),
	                     tid:$("#tid").val(),
	                     tccontent:$("#tccontent").val(),
	                    
	            },
	            dataType: "text",
	            success: function(result){
	                if(result=='success'){
	                   	mdui.snackbar({
	                		  message: '评论成功！',
	                		  position: 'top', 
	                		  timeout: '800',
	                		  onClose: function(){
	                			  window.location.reload();
	                		  }
	                		});
	                }
	                if(result=='false'){
	                    alert("账号或密码不正确");
	                }
	                if(result=='nameEmpty'){
	                    alert("账号不能为空");
	                }
	                if(result=='pwdEmpty'){
	                    alert("密码不能为空");
	                }
	            },
	            error: function() {
	                alert("登陆失败");
	            }
	        });
	    });
	});
	
</script>


</body>
</html>