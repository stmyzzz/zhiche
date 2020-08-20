<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <header class="mdui-appbar mdui-appbar-fixed">
      <div class="mdui-toolbar mdui-color-theme">
        <span class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white" mdui-drawer="{target: '#main-drawer', swipe: true}"><i class="mdui-icon material-icons">menu</i></span> 
        <img src="images/2.png" alt="" style="width:80px;height:45.15px;" >
           <a href="index.do">首页</a>
      </div>
    </header>

    <div class="mdui-drawer" id="main-drawer">
      <div class="mdui-list" mdui-collapse="{accordion: true}" style="margin-bottom: 76px;">
         <div class="mdui-collapse-item ">
          <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-deep-orange">layers</i>
            <div class="mdui-list-item-content">用户</div>
            <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
          </div>
          <div class="mdui-collapse-item-body mdui-list">
            <a href="manaUser.do" class="mdui-list-item mdui-ripple ">用户管理</a>
            <a href="addUserPage.do" class="mdui-list-item mdui-ripple ">用户添加</a>
          </div>
        </div>
        <div class="mdui-collapse-item ">
          <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-deep-orange">layers</i>
            <div class="mdui-list-item-content">商品</div>
            <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
          </div>
          <div class="mdui-collapse-item-body mdui-list">
            <a href="manaCar.do" class="mdui-list-item mdui-ripple ">商品管理</a>
            <a href="addproductPage.do" class="mdui-list-item mdui-ripple ">商品添加</a>
          </div>
        </div>


        <div class="mdui-collapse-item ">  <a href="CarOrder.do"> 
          <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-blue">near_me</i>
            <div class="mdui-list-item-content"> 订单管理</div>
          </div> </a>
        </div> 
       
                   

       
      </div>
</div>
   
    