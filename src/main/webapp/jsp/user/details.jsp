<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/27
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品详页</title>
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
            <h1 class="mallLogo">
                <a href="#" title="二手商城">
                    <img src="${pageContext.request.contextPath}/res/static/img/logo.png">
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


<div class="content content-nav-base datails-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2" style="margin-left: 320px;position: absolute">
                    <a href="${pageContext.request.contextPath}/index.do">首页</a>
                    <a href="${pageContext.request.contextPath}/commodity.do" class="active">所有商品</a>
                    <a href="${pageContext.request.contextPath}/discount.do">优惠活动</a>
                    <a href="${pageContext.request.contextPath}/information.do?email=${sessionScope.user.email}">我的商品</a>
                    <a href="${pageContext.request.contextPath}/jsp/user/about.jsp">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="data-cont-wrap w1200">
        <div class="crumb">
            <a href="${pageContext.request.contextPath}/jsp/user/index.jsp">首页</a>
            <span>></span>
            <a href="${pageContext.request.contextPath}/commodity.do">所有商品</a>
            <span>></span>
            <a href="javascript:;">产品详情</a>
        </div>
        <form method="post" class="layui-form">
            <div class="product-intro layui-clear">
                <div class="preview-wrap">
                    <a href="javascript:"><img src="${pageContext.request.contextPath}${requestScope.details.url}" style="width: 380px;height:430px;padding:7px;border:1px solid #eaeaea;border-radius:2%" alt="商品详情"></a>
                    <c:if test="${requestScope.details.isNew==1}">
                        <span style="position: relative;float: right;margin-top: -456px;margin-right: 30px;transform: rotate(-20deg)"><i class="layui-icon" style="color: #ff5500;font-size:25px" title="新品">&#xe67a;</i></span>
                    </c:if>
                </div>
                <div class="itemInfo-wrap">
                    <div class="itemInfo">
                        <div class="title">
                            <h4>${requestScope.details.cname}
                                <input type="hidden" id="email" value="${requestScope.details.email}">
                                <input type="hidden" id="buyemail" value="${sessionScope.user.email}">
                                <input type="hidden" name="cid" value="${requestScope.details.id}">
                                <input type="hidden" name="cname" value="${requestScope.details.cname}">
                                <input type="hidden" name="sellemail" value="${requestScope.details.email}">
                                <a href="javascript:;" id="collection">
                                    <c:if test="${requestScope.isCollection==0}">
                                <span>
                                    <i id="CollectionId1" class="layui-icon layui-icon-rate" style="font-size:28px">
                                        <label style="font-size: 20px;color: black;">收藏</label>
                                    </i>
                                    <i id="CollectionId2" class="layui-icon layui-icon-star-fill" style="color:orange;font-size:28px;display: none">
                                        <label style="font-size: 20px;color: black">收藏</label>
                                    </i>
                                </span>
                                    </c:if>
                                    <c:if test="${requestScope.isCollection!=0}">
                                <span>
                                    <i id="CollectionId3" class="layui-icon layui-icon-rate" style="font-size:28px;display:none;">
                                        <label style="font-size: 20px;color: black;">收藏</label>
                                    </i>
                                    <i id="CollectionId4" class="layui-icon layui-icon-star-fill" style="color:orange;font-size:28px">
                                        <label style="font-size: 20px;color: black">收藏</label>
                                    </i>
                                </span>
                                    </c:if>
                                </a>
                            </h4>

                        </div>
                        <div class="summary" style="height: 300px">
                            <p class="reference"><span>参考价</span> <del>￥${requestScope.details.cprice}</del></p>
                            <input name="cprice" id="cprice" type="hidden" value="${requestScope.details.cprice}">
                            <p class="activity"><span>活动价</span><strong class="price"><i>￥</i>${requestScope.details.remarks}</strong></p>
                            <p class="address-box"><span>描&nbsp;&nbsp;&nbsp;&nbsp;述</span>${requestScope.details.describes}</p>
                            <div class="choose-attrs" style="margin-top: 15px">
                                <div class="number layui-clear"><span class="title">数&nbsp;&nbsp;&nbsp;&nbsp;量</span><div class="number-cont"><span class="cut btn" id="Reduce">-</span><input onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" maxlength="4" id="Cnum" name="cnum" style="height: 32px;border-radius:1%" value="1"><span class="add btn" id="Add">+</span></div></div>
                            </div>
                            <p class="address-box" style="margin-top: 15px">
                                <label class="layui-form-label"><span style="position: absolute;left:0px">送&nbsp;&nbsp;&nbsp;&nbsp;至</span></label>
                            <div class="layui-input-inline" style="width: 120px;position:relative;left:-30px">
                                <select name="Province" id="Province" lay-filter="Province">
                                    <option value="" selected="">请选择省份</option>
                                </select>
                            </div>
                            <div class="layui-input-inline" style="width: 120px;position:relative;left:-25px">
                                <select name="City" id="City" lay-filter="City">
                                    <option value="">请选择城市</option>
                                </select>
                            </div>
                            <div class="layui-input-inline" style="width: 120px;position:relative;left:-20px">
                                <select name="County" id="County">
                                    <option value="">请选择县/区</option>
                                </select>
                            </div>
                            <div class="layui-input-inline" style="width: 120px;position:relative;left:-15px">
                                <input type="text" id="village" name="village" required lay-verify="required" placeholder="请输入小区" autocomplete="off" class="layui-input" style="width: 120px">
                            </div>
                            </p>
                            <p class="address-box" style="margin-top: 15px">
                                <label class="layui-form-label"><span style="position: absolute;left:0px">收&nbsp;货&nbsp;人</span></label>
                                <input type="text" id="Buyname" name="buyname" required lay-verify="required" placeholder="姓名" autocomplete="off" class="layui-input layui-input-inline" style="width: 120px;position:relative;left:-30px">
                                <input type="text" name="buynumber" id="Number" required lay-verify="required" placeholder="手机号码" autocomplete="off" class="layui-input layui-input-inline" style="width: 120px;position:relative;left:-20px">
                            </p>
                        </div>
                        <div class="choose-btns">
                            <button class="layui-btn layui-btn-primary purchase-btn" id="Settlement" type="button">立刻购买</button>
                            <a class="layui-btn  layui-btn-danger car-btn" href="javascript:;" id="addShopCart">
                                <i class="layui-icon layui-icon-cart-simple"></i>
                                加入购物车</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="layui-clear cont-list">
            <div class="aside">
                <h4>收藏推荐</h4>
                <div class="item-list">
                    <c:forEach items="${requestScope.topFive}" var="c">
                        <div class="item">
                            <a href="${pageContext.request.contextPath}/details.do?id=${c.id}"><img src="${pageContext.request.contextPath}${c.url}" style="width: 250px;height:260px"></a>
                            <p><span>${c.cname}</span><span class="pric">￥${c.cprice}</span></p>
                            <span style="color: lightgrey">${c.isCollection}人收藏</span>
                        </div>
                        <hr>
                    </c:forEach>
                </div>
            </div>
            <div class="detail">
                <h4>详情</h4>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/res/static/img/details_imgbig.jpg">
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/static/js/util/city.js">
</script>
<script type="text/javascript">
    layui.use(['layer','jquery','form','jquery', 'element',],function(){
        var $ = layui.jquery;
        var layer=layui.layer;
        var form=layui.form;
        var cur = $('.number-cont input').val();
        var areaData=Area;

        //验证手机号码
        $("#Number").blur(function () {
            var phone=$("#Number").val();
            if(!(/^1[34578]\d{9}$/.test(phone))){
                layer.msg("<span style='font-size: 17px'>"+"请输入正确的手机号!"+"</span>",{
                    icon: 2,
                    anim: 6,
                    time:1500,
                    offset: '300px',
                });
                $("#Number").val("");
            }
        });

        //判断商品数量
        $("#Add,#Reduce").click(function () {
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/findDetailsNum.do?id=${requestScope.details.id}",
                contentType: "application/text;charset=utf-8",
                dataType: "text",
                success:function (data) {
                    if(data>=parseInt($("#Cnum").val())){

                    }else {
                        layer.msg("<span style='font-size: 17px'>"+"库存不足!"+"</span>",{
                            icon: 2,
                            anim: 6,
                            time:1500,
                            offset: '300px',
                        });
                        $("#Cnum").val(data);
                    }
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
        $("#Cnum").blur(function () {
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/findDetailsNum.do?id=${requestScope.details.id}",
                contentType: "application/text;charset=utf-8",
                dataType: "text",
                success:function (data) {
                    if(data>=parseInt($("#Cnum").val())){

                    }else {
                        layer.msg("<span style='font-size: 17px'>"+"库存不足!"+"</span>",{
                            icon: 2,
                            anim: 6,
                            time:1500,
                            offset: '300px',
                        });
                        $("#Cnum").val(data);
                    }
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
            var buyemail=$("#email").val();
            var email=$("#buyemail").val();
            if($("#Number").val()!=""&&$("#Buyname").val()!=""&&$("#village").val()!=""&&buyemail!=email){
                var cnum=$("#Cnum").val();
                var priceTotal=($("#cprice").val()*cnum).toFixed(2);
                var surplus=(${sessionScope.user.balance}-priceTotal).toFixed(2);
                var address=$("#Province").val()+$("#City").val()+$("#County").val()+$("#village").val();
                var buyname=$("#Buyname").val();
                var buynumber=$("#Number").val();
                if(surplus<0||surplus=='NaN'){
                    layer.msg("<span style='font-size: 17px'>"+"余额不足，请充值!"+"</span>",{
                        icon: 2,
                        anim: 6,
                        time:1500,
                        offset: '300px',
                    });
                }else {
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
                                href: '${pageContext.request.contextPath}/ImmedPur.do?cid=${requestScope.details.id}&buyName='+buyname+"&buyPhone="+buynumber+"&cname=${requestScope.details.cname}&cprice=${requestScope.details.remarks}&cnum="+cnum+"&address="+address+"&balance="+surplus+"#tabId=44",
                                target: '_blank'
                            });
                        }
                    });
                }
            }if($("#Number").val()==""||$("#Buyname").val()==""||$("#village").val()==""){
                layer.msg("<span style='font-size: 17px'>"+"请将信息填写完整!"+"</span>",{
                    icon: 2,
                    anim: 6,
                    time:1500,
                    offset: '300px',
                });
            } if(email==buyemail){
                layer.msg("<span style='font-size: 17px'>"+"无法购买本人商品!"+"</span>",{
                    icon: 2,
                    anim: 6,
                    time:1500,
                    offset: '300px',
                });
            }
        });

        //加入购物车，会判断该商品是否已经存在或者是否是自己的商品
        $("#addShopCart").click(function () {
            var cnum=$("#Cnum").val();
            var address=$("#Province").val()+$("#City").val()+$("#County").val()+$("#village").val();
            $.ajax({
                type: "get",
                url: " ${pageContext.request.contextPath}/addShopCart.do?cid=${requestScope.details.id}&email=${requestScope.details.email}&cname=${requestScope.details.cname}&cdescribes=${requestScope.details.describes}&cprice=${requestScope.details.remarks}&curl=${requestScope.details.url}&cnum="+cnum+"&address="+address,
                contentType: "application/text;charset=utf-8",
                dataType: "text",
                success:function (data) {
                    if(data=="加入成功"){
                        layer.msg("<span style='font-size: 17px'>"+"添加成功!"+"</span>",{
                            icon: 1,
                            anim: 4,
                            time:1500,
                            offset: '300px',
                        });
                        setTimeout(function () {
                            window.location.href="${pageContext.request.contextPath}/shopcart.do?email=${requestScope.details.email}"
                        },1500);

                    }else if(data=="不能加入自己的商品"){
                        layer.msg("<span style='font-size: 17px'>"+"请勿添加自己的商品!"+"</span>",{
                            icon: 2,
                            anim: 6,
                            time:1500,
                            offset: '300px',
                        });
                    }else if(data=="已经加入购物车"){
                        layer.msg("<span style='font-size: 17px'>"+"已存在，数量+1!"+"</span>",{
                            icon: 1,
                            anim: 4,
                            time:1500,
                            offset: '300px',
                        });
                        setTimeout(function () {
                            window.location.href="${pageContext.request.contextPath}/shopcart.do?email=${requestScope.details.email}"
                        },1500);
                    } else {
                        layer.msg("<span style='font-size: 17px'>"+"添加失败!"+"</span>",{
                            icon: 2,
                            anim: 6,
                            time:1500,
                            offset: '300px',
                        });
                    }
                },
                error:function (data) {
                    layer.msg("<span style='font-size: 17px'>"+"添加失败!"+"</span>",{
                        icon: 2,
                        anim: 6,
                        time:1500,
                        offset: '300px',
                    });
                }
            });
        });

        //默认先加载省份
        var obj = $("#Province");
        obj.html("");
        for (var i = 0; i < areaData.length; i++) {
            obj.append("<option name='' value=" + areaData[i].name + ">" + areaData[i].name + "</option>")
        }
        form.render('select');
        //联动加载市
        form.on('select(Province)',function () {
            var obj = $("#City");
            obj.html("");
            for (var i = 0; i < areaData.length; i++) {
                    if($("#Province").val()==areaData[i].name){
                        for(var j=0;j<areaData[i].city.length;j++){
                            obj.append("<option name='' value=" + areaData[i].city[j].name + ">" + areaData[i].city[j].name + "</option>");
                        }
                    }
                }
            form.render('select');
            });
        //联动加载县区
        form.on('select(City)',function () {
            var obj = $("#County");
            obj.html("");
            for (var i = 0; i < areaData.length; i++) {
                if($("#Province").val()==areaData[i].name){
                    for(var j=0;j<areaData[i].city.length;j++){
                        if($("#City").val()==areaData[i].city[j].name){
                            for(var m=0;m<areaData[i].city[j].districtAndCounty.length;m++){
                                obj.append("<option name='' value=" + areaData[i].city[j].districtAndCounty[m] + ">" + areaData[i].city[j].districtAndCounty[m] + "</option>");
                            }
                        }
                    }
                }
            }
            form.render('select');
        });

        //收藏商品
        $("#collection").click(function () {
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/addCollection.do?id=${requestScope.details.id}&email=${requestScope.details.email}",
                contentType: "application/text;charset=utf-8",
                dataType: "text",
                success:function (data) {
                    if (data=="不能收藏自己的商品"){
                        layer.msg("<span style='font-size: 17px'>"+"不能收藏自己的商品!"+"</span>",{
                            icon: 2,
                            anim: 6,
                            time:1500,
                            offset: '300px',
                        });
                    }else if(data=="收藏成功"){
                        layer.msg("<span style='font-size: 17px'>"+"收藏成功!"+"</span>",{
                            icon: 1,
                            anim: 4,
                            time:1500,
                            offset: '300px',
                        });
                        $("#CollectionId1").css("display","none");
                        $("#CollectionId2").css("display","inline");
                        $("#CollectionId3").css("display","none");
                        $("#CollectionId4").css("display","inline");
                    }else if(data=="收藏失败"){
                        layer.msg("<span style='font-size: 17px'>"+"收藏失败!"+"</span>",{
                            icon: 1,
                            anim: 4,
                            time:1500,
                            offset: '300px',
                        });
                    }else if(data=="取消收藏"){
                        layer.msg("<span style='font-size: 17px'>"+"取消收藏!"+"</span>",{
                            icon: 1,
                            anim: 4,
                            time:1500,
                            offset: '300px',
                        });
                        $("#CollectionId1").css("display","inline");
                        $("#CollectionId2").css("display","none");
                        $("#CollectionId3").css("display","inline");
                        $("#CollectionId4").css("display","none");
                    }else if(data=="取消收藏失败"){
                        layer.msg("<span style='font-size: 17px'>"+"取消收藏失败!"+"</span>",{
                            icon: 1,
                            anim: 4,
                            time:1500,
                            offset: '300px',
                        });
                    } else {
                        layer.msg("<span style='font-size: 17px'>"+"系统错误!"+"</span>",{
                            icon: 1,
                            anim: 4,
                            time:1500,
                            offset: '300px',
                        });
                    }
                },
                error:function (data) {
                    layer.msg("<span style='font-size: 17px'>"+"请求异常!"+"</span>",{
                        icon: 2,
                        anim: 6,
                        time:1500,
                        offset: '300px',
                    });
                }
            })
        });

        //商品数量选择
        $('.number-cont .btn').on('click',function(){
            if($(this).hasClass('add')){
                cur++;
            }else{
                if(cur > 1){
                    cur--;
                }
            }
            $('.number-cont input').val(cur)
        });
    });
</script>
</body>
</html>
