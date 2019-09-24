<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/26
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <meta charset="UTF-8">
    <title>我的商品</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
    <style type="text/css">
        table{
            table-layout:fixed;/* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */
        }
        td{
            width:100%;
            word-break:keep-all;/* 不换行 */
            white-space:nowrap;/* 不换行 */
            overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */
            text-overflow:ellipsis;/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/
        }
    </style>
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
                <a href="${pageContext.request.contextPath}/shopcart.do?email=${sessionScope.user.email}">购物车</a>&nbsp;<span
                        style="color: #ee0000">${sessionScope.shopCartNum}</span> &nbsp;&nbsp;<span>余额:${sessionScope.user.balance}</span>&nbsp;&nbsp;
            </div>
            <div><a href="${pageContext.request.contextPath}/outLogin.do?flag=0"
                    style="text-decoration: none;;"><strong>退出登录</strong></a></div>
        </div>
    </div>
</div>


<div class="header">
    <div class="headerLayout w1200">
        <div class="headerCon">
            <h1 class="mallLogo" style="margin-left: -53px">
                <a href="#" title="二手商城">
                    <img src="${pageContext.request.contextPath}/res/static/img/logo.png">
                </a>
            </h1>
            <div class="mallSearch">
                <form action="#" class="layui-form" novalidate method="post">
                    <input type="text" name="searchName" required lay-verify="required" autocomplete="off"
                           class="layui-input" placeholder="请输入需要的商品">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <input type="hidden" value="1" name="flag">
                </form>
            </div>
        </div>
    </div>
</div>


<div class="content content-nav-base information-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2" style="margin-left: 312px;position: absolute">
                    <a href="${pageContext.request.contextPath}/index.do">首页</a>
                    <a href="${pageContext.request.contextPath}/commodity.do">所有商品</a>
                    <a href="${pageContext.request.contextPath}/discount.do">优惠活动</a>
                    <a href="${pageContext.request.contextPath}/information.do?email=${sessionScope.user.email}"
                       class="active">我的商品</a>
                    <a href="${pageContext.request.contextPath}/jsp/user/about.jsp">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="info-list-box">
        <div class="info-list w1200">
            <div class="layui-tab" lay-filter="tabId">
                <input type="hidden" id="msgid" value="${requestScope.msg}">
                <ul class="layui-tab-title">
                    <li class="layui-this" lay-id="11">已售出</li>
                    <li lay-id="22">正在售卖</li>
                    <li lay-id="55">我的收藏</li>
                    <li lay-id="33">已删除商品</li>
                    <li lay-id="44">订单管理</li>
                    <li lay-id="66">添加商品</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                            <legend>已售商品</legend>
                        </fieldset>
                        <div class="item-box layui-clear" id="list-cont1">
                            <c:forEach items="${requestScope.SaleCommodity}" var="c">
                                <div class="item">
                                    <img src="${pageContext.request.contextPath}${c.url}"
                                         style="width: 260px;height: 250px" alt="">
                                    <div class="text">
                                        <h4>${c.cname}</h4>
                                        <p class="info-cont" style="color: red;font-size: large">￥ ${c.cprice}</p>
                                        <p class="info-cont">${c.describes}</p>
                                        <div style="float: right">
                                            <span class="data">${c.time}</span>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <a href="${pageContext.request.contextPath}/delSaleCommodity.do?id=${c.id}#tabId=11"
                                               class="layui-btn layui-btn-danger layui-btn-sm"><i
                                                    class="layui-icon"></i></a>
                                            <a id="Title" class="layui-btn layui-btn-normal layui-btn-sm"><i
                                                    class="layui-icon"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <c:if test="${requestScope.SaleNum==0}">
                            <br><br><br>
                            <span style="font-size: 40px; color: #888888;margin-left: 500px">无商品</span>
                        </c:if>
                    </div>
                    <div class="layui-tab-item">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                            <legend>在售商品</legend>
                        </fieldset>
                        <div class="item-box layui-clear" id="list-cont">
                            <c:forEach items="${requestScope.inSaleCommodity}" var="c">
                                <div class="item">
                                    <img src="${pageContext.request.contextPath}${c.url}"
                                         style="width: 260px;height: 250px" alt="">
                                    <div class="text">
                                        <h4>${c.cname}</h4>
                                        <p class="info-cont" style="color: red;font-size: large">￥ ${c.cprice}</p>
                                        <p class="info-cont">${c.describes}</p>
                                        <div style="float: right;">
                                            <span class="data">${c.time}</span>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <a href="${pageContext.request.contextPath}/delSaleCommodity.do?id=${c.id}#tabId=22"
                                               class="layui-btn layui-btn-danger layui-btn-sm"><i
                                                    class="layui-icon"></i></a>
                                            <a href="${pageContext.request.contextPath}/findUpdatePage.do?id=${c.id}#tabId=66"
                                               class="layui-btn layui-btn-normal layui-btn-sm"><i
                                                    class="layui-icon"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <c:if test="${requestScope.inSaleNum==0}">
                            <br><br><br>
                            <span style="font-size: 40px; color: #888888;margin-left: 500px">无商品</span>
                        </c:if>
                    </div>
                    <div class="layui-tab-item">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                            <legend>我的收藏</legend>
                        </fieldset>
                        <div class="item-box layui-clear" id="list-cont5">
                            <c:forEach items="${requestScope.inCollection}" var="c">
                                <div class="item">
                                    <a href="${pageContext.request.contextPath}/details.do?id=${c.id}"><img src="${pageContext.request.contextPath}${c.url}"
                                                                                                            style="width: 260px;height: 250px" alt=""></a>
                                    <div class="text">
                                        <h4>${c.cname}</h4>
                                        <p class="info-cont" style="color: red;font-size: large">￥ ${c.cprice}</p>
                                        <p class="info-cont">${c.describes}</p>
                                        <div style="float: left">
                                            <span class="data">${c.time}</span>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a href="${pageContext.request.contextPath}/delCollection.do?id=${c.id}#tabId=55"
                                               id="tab1" class="layui-btn layui-btn-danger layui-btn-sm"><i
                                                    class="layui-icon"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <c:if test="${requestScope.collectionNum==0}">
                            <br><br><br>
                            <span style="font-size: 40px; color: #888888;margin-left: 500px">无商品</span>
                        </c:if>
                    </div>
                    <div class="layui-tab-item">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                            <legend>已删除商品</legend>
                        </fieldset>
                        <div class="item-box layui-clear" id="list-cont3">
                            <c:forEach items="${requestScope.delCommodity}" var="c">
                                <div class="item">
                                    <img src="${pageContext.request.contextPath}${c.url}"
                                         style="width: 260px;height: 250px" alt="">
                                    <div class="text">
                                        <h4>${c.cname}</h4>
                                        <p class="info-cont" style="color: red;font-size: large">￥ ${c.cprice}</p>
                                        <p class="info-cont">${c.describes}</p>
                                        <div style="float: right;">
                                            <span class="data">${c.time}</span>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <a class="layui-btn layui-btn-danger layui-btn-sm"
                                               href="${pageContext.request.contextPath}/realDelCommodity.do?id=${c.id}#tabId=33"><i
                                                    class="layui-icon"></i></a>
                                            <a class="layui-btn layui-btn-normal layui-btn-sm" title="恢复"
                                               href="${pageContext.request.contextPath}/recoveryCommodity.do?id=${c.id}#tabId=33"><i
                                                    class="layui-icon">&nbsp;&#x1002;</i></a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <c:if test="${requestScope.delNum==0}">
                            <br><br><br>
                            <span style="font-size: 40px; color: #888888;margin-left: 500px">无商品</span>
                        </c:if>
                    </div>
                    <div class="layui-tab-item">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                            <legend>收货订单</legend>
                        </fieldset>
                        <div class="table-responsive" style="margin-top: 20px">
                            <table class="layui-table table-striped table-hover" style="width:1200px">
                                <colgroup>
                                    <col width="120">
                                    <col width="100">
                                    <col width="120">
                                    <col width="100">
                                    <col width="80">
                                    <col width="230">
                                    <col width="100">
                                    <col width="170">
                                    <col width="170">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>订单编号</th>
                                    <th>收货人</th>
                                    <th>联系电话</th>
                                    <th>金额</th>
                                    <th>数量</th>
                                    <th>收货地址</th>
                                    <th>订单状态</th>
                                    <th>下单时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${requestScope.orderList}" var="c">
                                    <tr>
                                        <td title="${c.id}">${c.id}</td>
                                        <td>${c.buyName}</td>
                                        <td>${c.buyPhone}</td>
                                        <td>${c.totalPrice}</td>
                                        <td>${c.totalNum}</td>
                                        <td>${c.address}</td>
                                        <c:if test="${c.status==0}">
                                            <td>未发货</td>
                                        </c:if>
                                        <c:if test="${c.status==1}">
                                            <td>运输中</td>
                                        </c:if>
                                        <c:if test="${c.status==2||c.status==4}">
                                            <td>已签收</td>
                                        </c:if>
                                        <td>${c.time}</td>
                                        <td>
                                            <a class="layui-btn layui-btn-xs layui-btn-primary" href="${pageContext.request.contextPath}/seeDetails.do?id=${c.id}#tabId=44">查看</a>
                                            <c:if test="${c.status==2||c.status==4}">
                                                <a class="layui-btn layui-btn-xs layui-btn-normal" name="confirm">收货</a>
                                                <a class="layui-btn layui-btn-xs layui-btn-danger" href="${pageContext.request.contextPath}/delOrders.do?id=${c.id}#tabId=44">删除</a>
                                            </c:if>
                                            <c:if test="${c.status==1}">
                                                <a class="layui-btn layui-btn-xs layui-btn-normal" href="${pageContext.request.contextPath}/confirmReceipt.do?id=${c.id}#tabId=44">收货</a>
                                                <a class="layui-btn layui-btn-xs layui-btn-danger" href="javascript:;" name="Del">删除</a>
                                            </c:if>
                                            <c:if test="${c.status==0}">
                                                <a class="layui-btn layui-btn-xs layui-btn-normal" name="send">收货</a>
                                                <a class="layui-btn layui-btn-xs layui-btn-danger" href="javascript:;" name="Del">删除</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        <c:if test="${requestScope.orderNum==0}">
                            <br><br><br>
                            <span style="font-size: 40px; color: #888888;margin-left: 500px">无收货订单</span>
                        </c:if>
                        </div>


                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                            <legend>发货订单</legend>
                        </fieldset>
                        <div class="table-responsive" style="margin-top: 20px">
                            <table class="layui-table table-striped table-hover" style="width:1200px">
                                <colgroup>
                                    <col width="120">
                                    <col width="100">
                                    <col width="120">
                                    <col width="100">
                                    <col width="80">
                                    <col width="230">
                                    <col width="100">
                                    <col width="170">
                                    <col width="170">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>订单编号</th>
                                    <th>收货人</th>
                                    <th>联系电话</th>
                                    <th>金额</th>
                                    <th>数量</th>
                                    <th>收货地址</th>
                                    <th>订单状态</th>
                                    <th>下单时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${requestScope.sendOrder}" var="c">
                                    <tr>
                                        <td title="${c.id}">${c.id}</td>
                                        <td>${c.buyName}</td>
                                        <td>${c.buyPhone}</td>
                                        <td>${c.totalPrice}</td>
                                        <td>${c.totalNum}</td>
                                        <td>${c.address}</td>
                                        <c:if test="${c.status==0}">
                                            <td>未发货</td>
                                        </c:if>
                                        <c:if test="${c.status==1}">
                                            <td>运输中</td>
                                        </c:if>
                                        <c:if test="${c.status==2||c.status==3}">
                                            <td>已签收</td>
                                        </c:if>
                                        <td>${c.time}</td>
                                        <td>
                                            <c:if test="${c.status==0}">
                                                <a class="layui-btn layui-btn-xs layui-btn-normal" href="${pageContext.request.contextPath}/sendCommodity.do?id=${c.id}#tabId=44">发货</a>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a class="layui-btn layui-btn-xs layui-btn-danger" name="Del">删除</a>
                                            </c:if>
                                            <c:if test="${c.status==1}">
                                                <a class="layui-btn layui-btn-xs layui-btn-normal" name="sended">发货</a>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a class="layui-btn layui-btn-xs layui-btn-danger" name="Del">删除</a>
                                            </c:if>
                                            <c:if test="${c.status==2||c.status==3}">
                                                <a class="layui-btn layui-btn-xs layui-btn-normal" name="sended">发货</a>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a class="layui-btn layui-btn-xs layui-btn-danger" href="${pageContext.request.contextPath}/delSend.do?id=${c.id}#tabId=44">删除</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <c:if test="${requestScope.sendNum==0}">
                                <br><br><br>
                                <span style="font-size: 40px; color: #888888;margin-left: 500px">无发货订单</span>
                            </c:if>
                        </div>

                        <div>
                            <c:if test="${requestScope.orderDetails!=null}">
                                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                                    <legend>订单明细</legend>
                                </fieldset>
                                <div style="margin-top: 20px">
                                    <table class="layui-table" style="width:1200px">
                                        <thead>
                                        <tr>
                                            <th>商品</th>
                                            <th>商品名称</th>
                                            <th>单价</th>
                                            <th>数量</th>
                                            <th>小计</th>
                                            <th>商品描述</th>
                                            <th>下单时间</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${requestScope.orderDetails}" var="c">
                                            <tr>
                                                <td><img src="${pageContext.request.contextPath}${c.curl}" alt="商品图片" style="width: 50px;height: 50px"></td>
                                                <td>${c.cname}</td>
                                                <td>${c.cprice}</td>
                                                <td>${c.cnum}</td>
                                                <td>${c.ctotalPrice}</td>
                                                <td>${c.cdesc}</td>
                                                <td>${c.time}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                            <legend>添加商品</legend>
                        </fieldset>
                        <div style="padding: 20px; background-color: #F2F2F2;width: 60%">
                            <div class="layui-row layui-col-space15">
                                <div class="layui-col-md12">
                                    <div class="layui-card">
                                        <div class="layui-card-header">商品属性</div>
                                        <div class="layui-card-body">
                                            <form method="post" class="layui-form" action="${pageContext.request.contextPath}/addCommodity.do#tabId=22" enctype="multipart/form-data">
                                                <input name="email" type="hidden" value="${sessionScope.user.email}">
                                                <input name="isSellOut" type="hidden" value="0">
                                                <input name="flag" type="hidden" value="0">
                                                <input name="isNew" type="hidden" value="1">
                                                <input name="isCollection" type="hidden" value="0">
                                                <input name="salesVolume" type="hidden" value="0">
                                                <input id="cid" name="cid" type="hidden" value="${requestScope.commodity.id}">
                                                <div class="layui-form-item">
                                                    <label class="layui-form-label">商品名称：</label>
                                                    <div class="layui-input-inline">
                                                        <input type="text" value="${requestScope.commodity.cname}" name="cname" id="cname" required lay-verify="required" lay-verify="pass"
                                                               autocomplete="off" class="layui-input">
                                                    </div>
                                                    <div class="layui-inline" style="margin-top: 15px">
                                                        <label class="layui-form-label">商品价格：</label>
                                                        <div class="layui-input-inline" style="width: 100px;">
                                                            <input type="text" id="Cprice" name="cprice" required lay-verify="required" placeholder="￥" value="${requestScope.commodity.cprice}" autocomplete="off" class="layui-input">
                                                        </div>
                                                        <button type="button" class="layui-btn layui-btn-primary" id="Activity" style="border: none;margin-left:-125px">
                                                            <i class="layui-icon">&#xe608;</i>参加活动
                                                        </button>
                                                        <label class="layui-form-label" style="visibility:hidden" id="Text">活动价格：</label>
                                                        <div class="layui-input-inline" style="width: 100px;">
                                                            <input type="text" id="Remarks" name="remarks" required lay-verify="required" value="${requestScope.commodity.remarks}" placeholder="￥" autocomplete="off" class="layui-input" style="display: none">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="layui-form-item">
                                                    <label class="layui-form-label">商品分类：</label>
                                                    <div class="layui-input-inline">
                                                        <select name="bigType" id="bigType" lay-filter="bigType">
                                                            <option value="${requestScope.commodity.bigType}" selected="">请选择大类</option>
                                                            <option value="美食酒水">美食酒水</option>
                                                            <option value="居家生活">居家生活</option>
                                                            <option value="鞋包服饰">鞋包服饰</option>
                                                            <option value="个护清洁">个护清洁</option>
                                                            <option value="运动旅行">运动旅行</option>
                                                            <option value="数码家电">数码家电</option>
                                                        </select>
                                                    </div>
                                                    <div class="layui-input-inline">
                                                        <select name="smallType" id="smallType">
                                                            <option value="${requestScope.commodity.smallType}">请选择小类</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="layui-inline">
                                                    <label class="layui-form-label">商品数量：</label>
                                                    <div class="layui-input-inline" style="width: 100px;">
                                                        <input type="text" id="Cnum" name="cnum" value="${requestScope.commodity.cnum}" required lay-verify="required" autocomplete="off" class="layui-input">
                                                    </div>
                                                </div><br><br>
                                                <div class="layui-form-item layui-form-text">
                                                    <label class="layui-form-label">商品描述：</label>
                                                    <div class="layui-input-block">
                                                        <c:if test="${requestScope.commodity.describes==null}">
                                                            <textarea placeholder="不超过60个字" required lay-verify="required" maxlength="60" name="describes" id="describes" class="layui-textarea"></textarea>
                                                        </c:if>
                                                        <c:if test="${requestScope.commodity.describes!=null}">
                                                            <textarea  required lay-verify="required" id="describes" maxlength="60" name="describes" class="layui-textarea">${requestScope.commodity.describes}</textarea>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <div class="layui-upload">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;
                                                    <c:if test="${requestScope.commodity!=null}">
                                                        <button type="button" class="layui-btn layui-btn-primary" disabled="disabled" id="upload">
                                                            <i class="layui-icon">&#xe61f;</i>上传图片
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${requestScope.commodity==null}">
                                                        <button type="button" class="layui-btn layui-btn-primary" id="upload">
                                                            <i class="layui-icon">&#xe61f;</i>上传图片
                                                        </button>
                                                    </c:if>
                                                </div><br>
                                                <div class="layui-form-item">
                                                    <div class="layui-input-block">
                                                        <c:if test="${requestScope.commodity!=null}">
                                                            <a href="javascript:;" class="layui-btn" lay-submit lay-filter="formDemo" id="update">立即更改</a>
                                                        </c:if>
                                                        <c:if test="${requestScope.commodity==null}">
                                                            <button class="layui-btn" lay-submit lay-filter="formDemo" id="add">立即添加</button>
                                                        </c:if>
                                                        <button type="reset" class="layui-btn layui-btn-warm">重置</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script type="text/javascript">

    layui.config({
        base: '${pageContext.request.contextPath}/res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['table','upload', 'form', 'jquery', 'element', 'layer'], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var upload = layui.upload;
        var layer = layui.layer;
        var element = layui.element;

        //更新操作,不支持图片更新
        $("#update").click(function () {
            var cname=$("#cname").val();
            var cprice=$("#Cprice").val();
            var remarks=$("#Remarks").val();
            var cnum=$("#Cnum").val();
            var describes=$("#describes").val();
            var bigType=$("#bigType").val();
            var smallType=$("#smallType").val();
            var id=$("#cid").val();
            $.ajax({
                type:'get',
                url:'${pageContext.request.contextPath}/updateCommodity.do?id='+id+"&cname="+cname+"&cprice="+cprice+"&cnum="+cnum+"&remarks="+remarks+"&bigType="+bigType+"&smallType="+smallType+"&describes="+describes,
                contentType: "application/text;charset=utf-8",
                success:function (data) {
                    if(data=="更新成功"){
                        layer.msg("<span style='font-size: 17px'>"+"更新成功!"+"</span>",{
                            icon: 2,
                            anim: 6,
                            time:1500,
                            offset: '300px',
                        });
                    }else {
                        layer.msg("<span style='font-size: 17px'>"+"更新失败!"+"</span>",{
                            icon: 2,
                            anim: 6,
                            time:1500,
                            offset: '300px',
                        });
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

        //显示活动价格
        $("#Activity").click(function () {
            $("#Activity").css("display","none");
            $("#Text").css("visibility","visible");
            $("#Remarks").css("display","inline");
            $("#Remarks").val("");
        });

        //提交时确认活动价格的值
        $("#add").click(function () {
            if($("#Remarks").css('display')=='none'){
                var Cprice=$("#Cprice").val();
                $("#Remarks").val(Cprice);
            }
        });

        //删除订单前判断是否收货，没收货无法删除
        $("a[name='Del']").click(function () {
            layer.msg("<span style='font-size: 17px'>"+"订单还未发货或签收!"+"</span>",{
                icon: 2,
                anim: 6,
                time:1500,
                offset: '300px',
            });
        });

        //删除订单前判断是否收货，没收货无法删除
        $("a[name='sended']").click(function () {
            layer.msg("<span style='font-size: 17px'>"+"订单已发货!"+"</span>",{
                icon: 2,
                anim: 6,
                time:1500,
                offset: '300px',
            });
        });

        $("a[name='send']").click(function () {
            layer.msg("<span style='font-size: 17px'>"+"订单还未发货!"+"</span>",{
                icon: 2,
                anim: 6,
                time:1500,
                offset: '300px',
            });
        });


        //提示已确认
        $("a[name='confirm']").click(function () {
            layer.msg("<span style='font-size: 17px'>"+"已确认签收!"+"</span>",{
                icon: 2,
                anim: 6,
                time:1500,
                offset: '300px',
            });
        });

        //hash定位
        var layid = location.hash.replace(/^#tabId=/, '');
        element.tabChange('tabId', layid);
        element.on('tab(tabId)', function () {
            location.hash = 'tabId=' + $(this).attr('lay-id');
        });

        //验证输入是否为数字
        $("#Cprice,#Remarks").blur(function () {
            var Cprice=$("#Cprice").val();
            var Remarks=$("#Remarks").val();
            var re = /^-?\d*\.?\d*$/;
            if (!re.test(Cprice)) {
                layer.msg("<span style='font-size: 17px'>" + "请输入数字!" + "</span>", {
                    icon: 2,
                    anim: 6,
                    time: 1500,
                    offset: '300px',
                });
                $("#Cprice").val("");
            }
            if (!re.test(Remarks)) {
                layer.msg("<span style='font-size: 17px'>" + "请输入数字!" + "</span>", {
                    icon: 2,
                    anim: 6,
                    time: 1500,
                    offset: '300px',
                });
                $("#Remarks").val("");
            }
        });
        $("#Cnum").blur(function () {
            var Cnum=$("#Cnum").val();
            var re = /^[0-9]*$/;
            if (!re.test(Cnum)) {
                layer.msg("<span style='font-size: 17px'>"+"请输入数字!"+"</span>",{
                    icon: 2,
                    anim: 6,
                    time:1500,
                    offset: '300px',
                });
                $("#Cnum").val("");
            }
        });

        $("#Title").click(function () {
            layer.msg("<span style='font-size: 17px'>"+"已售出，无法修改!"+"</span>",{
                icon: 2,
                anim: 6,
                time:1500,
                offset: '300px',
            });
        });

        //上传图片
        var uploadInst = upload.render({
            elem: '#upload',
            url: '${pageContext.request.contextPath}/uploadImg.do',
            multiple: true,
            auto: false,
            //上传的单个图片大小
            size: 10240,
            //最多上传的数量
            number: 20,
            //MultipartFile file 对应，layui默认就是file,要改动则相应改动
            field: 'file',
            bindAction: '#add',
            before: function (obj) {
                obj.preview(function (index, file, result) {
                    $('#imgid').attr('src', result); //图片链接（base64）
                });
            },
            done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
            },
            error: function () {
            }
        });

        //获取商品小类
        form.on('select(bigType)', function (data) {
            var bigType = data.value;
            $.ajax({
                type: "get",
                url: "${pageContext.request.contextPath}/getSmallType.do?bigType=" + bigType,
                contentType: "application/text;charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var obj = $("#smallType");
                    obj.html("");
                    for (var i = 0; i < data.length; i++) {
                        obj.append("<option name='' value=" + data[i] + ">" + data[i] + "</option>");
                    }
                    form.render('select');
                },
                error:function (data) {
                    layer.msg("<span style='font-size: 17px'>"+"请求异常!"+"</span>",{
                        icon: 2,
                        anim: 6,
                        time:1500,
                        offset: '300px',
                    });
                }
            });
        });

        //提示错误信息
        if ($("#msgid").val() == "删除成功！") {
            layer.msg("<span style='font-size: 17px'>"+"删除成功!"+"</span>",{
                icon: 1,
                anim: 4,
                time:1500,
                offset: '300px',
            });
        }
        if ($("#msgid").val() == "删除失败！") {
            layer.msg("<span style='font-size: 17px'>"+"删除失败!"+"</span>",{
                icon: 2,
                anim: 6,
                time:1500,
                offset: '300px',
            });
        }
        if ($("#msgid").val() == "恢复成功！") {
            layer.msg("<span style='font-size: 17px'>"+"恢复成功!"+"</span>",{
                icon: 1,
                anim: 4,
                time:1500,
                offset: '300px',
            });
        }
        if ($("#msgid").val() == "恢复失败！") {
            layer.msg("<span style='font-size: 17px'>"+"恢复失败!"+"</span>",{
                icon: 2,
                anim: 6,
                time:1500,
                offset: '300px',
            });
        }
        if ($("#msgid").val() == "添加成功") {
            layer.msg("<span style='font-size: 17px'>"+"添加成功!"+"</span>",{
                icon: 1,
                anim: 4,
                time:1500,
                offset: '300px',
            });
        }
        if ($("#msgid").val() == "添加失败") {
            layer.msg("<span style='font-size: 17px'>"+"添加失败!"+"</span>",{
                icon: 2,
                anim: 6,
                time:1500,
                offset: '300px',
            });
        }
        if ($("#msgid").val() == "添加失败，请重试") {
            layer.msg("<span style='font-size: 17px'>"+"添加失败，请重试!"+"</span>",{
                icon: 2,
                anim: 6,
                time:1500,
                offset: '300px',
            });
        }
        if ($("#msgid").val() == "确认收货") {
            layer.msg("<span style='font-size: 17px'>"+"收货成功!"+"</span>",{
                icon: 1,
                anim: 4,
                time:1500,
                offset: '300px',
            });
        }
        if ($("#msgid").val() == "操作失败") {
            layer.msg("<span style='font-size: 17px'>"+"操作失败!"+"</span>",{
                icon: 2,
                anim: 6,
                time:1500,
                offset: '300px',
            });
        }
    });
</script>
</body>
</html>
