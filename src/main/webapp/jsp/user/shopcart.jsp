<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/27
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
</head>
<body>

<div class="site-nav-bg">
    <div class="site-nav w1200">
        <p class="sn-back-home">
            <i class="layui-icon layui-icon-home"></i>
            <a href="${pageContext.request.contextPath}/index.do">首页</a>
        </p>
        <div class="sn-quick-menu">
            <div><a href="${pageContext.request.contextPath}/findUserInfo.do"><img class="img-circle" title="${sessionScope.user.email}" alt="20x20" src="${pageContext.request.contextPath}${sessionScope.user.head}" style="width:22px;heigh:22px;border-radius: 50%;margin-top:-2px"/></a>
                &nbsp;&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/shopcart.do?email=${sessionScope.user.email}">购物车</a>&nbsp;<span style="color: #ee0000">${sessionScope.shopCartNum}</span> &nbsp;&nbsp;<span>余额:${sessionScope.user.balance}</span>&nbsp;&nbsp;</div>
            <div><a href="${pageContext.request.contextPath}/outLogin.do?flag=0" style="text-decoration: none;;"><strong>退出登录</strong></a></div>
        </div>
    </div>
</div>



<div class="header">
    <div class="headerLayout w1200">
        <div class="headerCon">
            <h1 class="mallLogo" style="margin-left: -53px">
                <a href="#" title="二手商城">
                    <img src="${pageContext.request.contextPath}/res/static/img/logo.png">
                    <input type="hidden" id="msgId" value="${requestScope.msg}">
                </a>
            </h1>
            <div class="mallSearch">
                <form action="" class="layui-form" novalidate>
                    <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <input type="hidden" name="" value="">
                </form>
            </div>
        </div>
    </div>
</div>


<div class="content content-nav-base shopcart-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2" style="margin-left: 321px;position: absolute">
                    <a href="${pageContext.request.contextPath}/index.do">首页</a>
                    <a href="${pageContext.request.contextPath}/commodity.do">所有商品</a>
                    <a href="${pageContext.request.contextPath}/discount.do">优惠活动</a>
                    <a href="${pageContext.request.contextPath}/information.do?email=${sessionScope.user.email}">我的商品</a>
                    <a href="${pageContext.request.contextPath}/jsp/user/about.jsp">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="banner-bg w1200">
        <h3>二手平台</h3>
        <p>让你的闲置流动起来</p>
    </div>
    <div class="cart w1200">
        <div class="cart-table-th">
            <div class="th th-chk">
                <div class="select-all">
                    <div class="cart-checkbox">
                        <input class="check-all check" id="allCheckked" type="checkbox" value="true">
                    </div>
                    <label>&nbsp;&nbsp;全选</label>
                </div>
            </div>
            <div class="th th-item">
                <div class="th-inner">
                    商品
                </div>
            </div>
            <div class="th th-price">
                <div class="th-inner">
                    单价
                </div>
            </div>
            <div class="th th-amount">
                <div class="th-inner">
                    数量
                </div>
            </div>
            <div class="th th-sum">
                <div class="th-inner">
                    小计
                </div>
            </div>
            <div class="th th-op">
                <div class="th-inner">
                    操作
                </div>
            </div>
        </div>
        <div class="OrderList">
            <div class="order-content" id="list-cont">
                <c:forEach items="${requestScope.myShopcart}" var="c">
                    <ul class="item-content layui-clear">
                        <li class="th th-chk">
                            <div class="select-all">
                                <div class="cart-checkbox" id="select">
                                    <input class="CheckBoxShop check" type="checkbox"  name="select" value="${c.cid}">
                                </div>
                            </div>
                        </li>
                        <li class="th th-item">
                            <div class="item-cont">
                                <a href="javascript:;"><img src="${pageContext.request.contextPath}${c.curl}" alt=""></a>
                                <div class="th text" style="margin-top: 20px">
                                    <div class="title">${c.cname}</div>
                                    <span>${c.cdescribes}</span>
                                </div>
                            </div>
                        </li>
                        <li class="th th-price" style="margin-top: 35px">
                            <span class="th-su">${c.cprice}</span>
                        </li>
                        <li class="th th-amount" style="margin-top: 25px;margin-left: 80px">
                            <div class="layui-clear">
                                <input class="Quantity-input" disabled="disabled" id="Cnum" name="cnum" value="${c.cnum}" style="height: 38px;border: none;">
                            </div>
                        </li>
                        <li class="th th-sum" style="margin-top: 29px;margin-left:-80px">
                            <span class="sum">${c.cprice*c.cnum}</span>
                        </li>
                        <li class="th th-op" style="margin-top: 29px">
                            <span class="dele-btn" id="delOne"><a href="${pageContext.request.contextPath}/delOne.do?id=${c.cid}">删除</a></span>
                        </li>
                    </ul>
                </c:forEach>
            </div>
        </div>

        <div class="FloatBarHolder layui-clear">
            <div class="th th-chk">
                <div class="select-all">
                    <div class="cart-checkbox">
                        <input class="check-all check" id="checkbox" name="" type="checkbox"  value="true">
                    </div>
                    <label>&nbsp;&nbsp;已选<span class="Selected-pieces">0</span>件</label>
                </div>
            </div>
            <div class="th batch-deletion">
                <span class="batch-dele-btn" id="delMore">批量删除</span>
            </div>
            <div class="th Settlement">
                <button class="layui-btn" data-method="notice" id="Settlement">结算</button>
            </div>
            <div class="th total">
                <p>应付：<span class="pieces-total" id="total">0</span></p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/static/js/util/car.js"></script>
<script type="text/javascript">
    layui.config({
        base: '${pageContext.request.contextPath}/res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['jquery','element','car'],function(){
        var $ = layui.$,element = layui.element,car = layui.car;
        car.init();

        //提示消息
        if($("#msgId").val()=="删除成功"){
            layer.msg("<span style='font-size: 17px'>"+"删除成功!"+"</span>",{
                icon: 1,
                anim: 4,
                time:1500,
                offset: '300px',
            });
        }
        if($("#msgId").val()=="删除失败"){
            layer.msg("<span style='font-size: 17px'>"+"删除失败!"+"</span>",{
                icon: 2,
                anim: 6,
                time:1500,
                offset: '300px',
            });
        }

        //批量删除
        $("#delMore").click(function () {
            var ids= new Array();
            $("input[name='select']:checkbox").each(function(){
                var isChecked = $(this).is(":checked");
                if(isChecked){
                    ids.push($(this).val());
                }
            });
            $.ajax({
                url:'${pageContext.request.contextPath}/delMore.do?ids='+ids,
                type: 'get',
                success:function (data) {
                    $("body").html(data);
                },
                error:function (data) {
                    layer.msg("<span style='font-size: 17px'>"+"无法连接服务器!"+"</span>",{
                        icon: 2,
                        anim: 6,
                        time:1500,
                        offset: '300px',
                    });
                }
            });
        });

        //结算
        $("#Settlement").click(function () {
            //将选中的id放入数组传进后台
            var ids= new Array();
            $("input[name='select']:checkbox").each(function(){
                var isChecked = $(this).is(":checked");
                if(isChecked){
                    ids.push($(this).val());
                }
            });
            var uls = document.getElementById('list-cont').getElementsByTagName('ul');//每一行
            var SelectedPieces = document.getElementsByClassName('Selected-pieces')[0];//总件数
            var piecesTotal = document.getElementsByClassName('pieces-total')[0];//总价
            //计算
            var seleted = 0, price =0;
            function getTotal() {
                for (var i = 0; i < uls.length; i++) {
                    if (uls[i].getElementsByTagName('input')[0].checked) {
                        seleted += parseInt(uls[i].getElementsByClassName('Quantity-input')[0].value);
                        price += parseFloat(uls[i].getElementsByClassName('sum')[0].innerHTML);
                    }
                }
                SelectedPieces.innerHTML = seleted;
                piecesTotal.innerHTML = '￥' + price.toFixed(2);
            }
            var priceTotal=piecesTotal.innerHTML.replace("￥","");
            var surplus=(${sessionScope.user.balance}-priceTotal).toFixed(2);
            var totalCnum=SelectedPieces.innerHTML;
            if(surplus<0){
                layer.msg("<span style='font-size: 17px'>"+"余额不足，请充值!"+"</span>",{
                    icon: 2,
                    anim: 6,
                    time:1500,
                    offset: '300px',
                });
            }if(totalCnum<=0){
                layer.msg("<span style='font-size: 17px'>"+"请选择商品!"+"</span>",{
                    icon: 2,
                    anim: 6,
                    time:1500,
                    offset: '300px',
                });
            } else {
                layer.open({
                    type: 1,
                    title:"<b style='font-size: larger'>付款</b>",
                    closeBtn: false,
                    area: '300px;',
                    shade: 0.5,
                    offset: '150px',
                    id: 'LAY_layuipro', //设定一个id，防止重复弹出
                    btn: ['结算','取消'],
                    btnAlign: 'c',
                    anim: 2,
                    moveType: 1, //拖拽模式，0或者1
                    content: '<br><br>&nbsp;&nbsp;&nbsp;&nbsp;余&nbsp;&nbsp;&nbsp;额:<span style=\'margin-left:140px;\'>￥：'+(${sessionScope.user.balance}).toFixed(2)+'</span><br><span style=\'margin-left:145px\'>-</span><br>&nbsp;&nbsp;&nbsp;&nbsp;应付款:<span style=\'margin-left:137px;color:red\'>￥：'+priceTotal+'</span><br><br>&nbsp;&nbsp;&nbsp;&nbsp;剩&nbsp;&nbsp;&nbsp;余:<span style=\'margin-left:140px;\'>￥：'+surplus+'</span><br><br><hr>',
                    success: function(layero){
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').attr({
                            href: '${pageContext.request.contextPath}/payment.do?balance='+surplus+"&totalCnum="+totalCnum+"&priceTotal="+priceTotal+'&ids='+ids+"#tabId=44",
                            target: '_blank',
                        });
                    }
                });
            }
        });
    });
</script>
</body>
</html>
