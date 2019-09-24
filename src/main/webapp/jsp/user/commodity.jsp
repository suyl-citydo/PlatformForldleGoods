<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/26
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>全部商品</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/static/css/main.css">
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
            <h1 class="mallLogo">
                <a href="#" title="二手交易">
                    <img src="${pageContext.request.contextPath}/res/static/img/logo.png">
                </a>
            </h1>
            <div class="mallSearch">
                <form action="${pageContext.request.contextPath}/searchCommodity.do" class="layui-form" novalidate method="post">
                    <input type="text" name="title" value="${requestScope.title}" required lay-verify="required" autocomplete="off"
                           class="layui-input" placeholder="请输入需要的商品">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <input type="hidden" value="0" name="flag">
                </form>
            </div>
        </div>
    </div>
</div>

<div class="content content-nav-base commodity-content">
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
    <div class="commod-cont-wrap">
        <div class="commod-cont w1200 layui-clear">
            <div class="left-nav">
                <div class="title"><a href="${pageContext.request.contextPath}/commodity.do" class="title">所有分类</a>
                </div>
                <div class="list-box">
                    <dl>
                        <dt><a href="${pageContext.request.contextPath}/findBigCommodity.do?bigType=美食酒水">美食酒水</a></dt>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=坚果蜜饯">坚果蜜饯</a>
                        </dd>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=休闲零食">休闲零食</a>
                        </dd>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=酒水饮料">酒水饮料</a>
                        </dd>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=生鲜特色">生鲜特色</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><a href="${pageContext.request.contextPath}/findBigCommodity.do?bigType=居家生活">居家生活</a></dt>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=家纺床品">家纺床品</a>
                        </dd>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=收纳日用">收纳日用</a>
                        </dd>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=厨房用品">厨房用品</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><a href="${pageContext.request.contextPath}/findBigCommodity.do?bigType=鞋包服饰">鞋包服饰</a></dt>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=男装">男装</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=女装">女装</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=鞋靴">鞋靴</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=箱包">箱包</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=首饰配件">首饰配件</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><a href="${pageContext.request.contextPath}/findBigCommodity.do?bigType=个护清洁">个护清洁</a></dt>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=彩妆香氛">彩妆香氛</a>
                        </dd>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=日常护理">日常护理</a>
                        </dd>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=家清卫浴">家清卫浴</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><a href="${pageContext.request.contextPath}/findBigCommodity.do?bigType=运动旅行">运动旅行</a></dt>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=运动服饰">运动服饰</a>
                        </dd>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=运动鞋">运动鞋</a>
                        </dd>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=户外出行">户外出行</a>
                        </dd>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=运动健身">运动健身</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><a href="${pageContext.request.contextPath}/findBigCommodity.do?bigType=数码家电">数码家电</a></dt>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=生活电器">生活电器</a>
                        </dd>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=厨房电器">厨房电器</a>
                        </dd>
                        <dd><a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=影音娱乐">影音娱乐</a>
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="right-cont-wrap">
            <div class="right-cont">
                <br>
                <h3 style="margin-top: -20px;">
                    <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
                    <c:if test="${empty requestScope.Type}">
                        <span style="color: black;font-size: 18px"><strong>当前位置->所有商品:</strong></span>
                    </c:if>
                    <c:if test="${not empty requestScope.Type}">
                        <span style="color: black;font-size: 18px"><strong>当前位置->${requestScope.Type}:</strong></span>
                    </c:if>
                </h3><br>
                <hr style="margin-top: 0;"/>
                <form action="${pageContext.request.contextPath}/findByConPage.do" class="layui-form" role="form" method="post">
                    <div class="layui-form-item">
                        <input type="hidden" value="${requestScope.Type}" name="type">
                        <label class="layui-form-label" style="width:8%;"><strong>价格:</strong></label>
                        <div class="layui-input-inline" style="width: 100px;">
                            <select name="cprice">
                                <option value=""></option>
                                <c:if test="${requestScope.cStatus==0}">
                                    <option value="0" selected>从低到高</option>
                                    <option value="1">从高到低</option>
                                </c:if>
                                <c:if test="${requestScope.cStatus==1}">
                                    <option value="0">从低到高</option>
                                    <option value="1" selected>从高到低</option>
                                </c:if>
                                <c:if test="${empty requestScope.cStatus}">
                                    <option value="0">从低到高</option>
                                    <option value="1">从高到低</option>
                                </c:if>
                            </select>
                        </div>
                        <label class="layui-form-label" style="width:8%;"><strong>收藏:</strong></label>
                        <div class="layui-input-inline" style="width: 100px;">
                            <select name="isCollection">
                                <option value=""></option>
                                <c:if test="${requestScope.iStatus==0}">
                                    <option value="0" selected>从低到高</option>
                                    <option value="1">从高到低</option>
                                </c:if>
                                <c:if test="${requestScope.iStatus==1}">
                                    <option value="0">从低到高</option>
                                    <option value="1" selected>从高到低</option>
                                </c:if>
                                <c:if test="${empty requestScope.iStatus}">
                                    <option value="0">从低到高</option>
                                    <option value="1">从高到低</option>
                                </c:if>
                            </select>
                        </div>
                        <label class="layui-form-label" style="width:8%;"><strong>日期范围:</strong></label>
                        <div class="layui-inline" style="width: 100px;">
                            <div class="layui-input-inline">
                                <input type="text" value="${requestScope.time}" name="time" class="layui-input" id="test6" placeholder=" - ">
                            </div>
                        </div>
                        <div class="layui-input-inline" style="float: right">
                            <button class="layui-btn" type="submit">查找</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
                <br>
                <div class="cont-list layui-clear" id="list-cont">
                    <c:forEach items="${requestScope.page.beanList}" var="c">
                        <div class="item" style="border-radius:2%;height:375px">
                            <a href="${pageContext.request.contextPath}/details.do?id=${c.id}"><img src="${pageContext.request.contextPath}${c.url}" style="width: 260px;height: 250px;margin:10px;" alt="无法显示"></a>
                            <c:if test="${c.isNew==1}">
                                <span style="position: relative;float: right;margin-top: -277px;margin-right: -4px;transform: rotate(-20deg)"><i class="layui-icon" style="color: #ff5500;font-size:20px" title="新品">&#xe67a;</i></span>
                            </c:if>
                            <div class="text">
                                <p class="title">${c.cname}</p>
                                <p class="price">
                                    <c:if test="${c.cprice!=c.remarks&&c.remarks!=null}">
                                        <span class="reference"><del>￥${c.cprice}</del></span>
                                        <span style="font-size:16px;color: red">￥${c.remarks}</span>
                                    </c:if>
                                    <c:if test="${c.cprice==c.remarks||c.remarks==null}">
                                        <span class="reference">￥${c.cprice}</span>
                                    </c:if>
                                    <span class="nub">${c.isCollection}收藏</span>
                                </p>
                                <p>
                                    <br>
                                    <span style="color: lightgrey;font-size:12px;">剩余:${c.cnum}件</span>
                                    <span style="color: lightgrey;font-size:12px;float: right;">${c.time}&nbsp;</span>
                                </p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <c:if test="${requestScope.page.totalCount!=0&&requestScope.flag==null&&requestScope.Num!=0}">
                    <center>
                        <form class="listForm" name="listForm" method="post" action="${pageContext.request.contextPath}/commodity.do">
                            <div class="row">
                                <div class="form-inline" style="margin-left: 15px;">
                                    <label style="font-size:14px;margin-top:22px;">
                                        <strong>共<b>${requestScope.page.totalCount}</b>条记录，共<b>${requestScope.page.totalPage}</b>页</strong>
                                        &nbsp;
                                        &nbsp;
                                        <strong>每页显示</strong>
                                        <select style="display: inline-block;width:70px;height: 34px;padding: 6px 12px;font-size: 14px;line-height: 1.42857143;color: #555;background-color: #fff;background-image: none;border: 1px solid #ccc;border-radius: 4px;" name="pageSize">
                                            <option value="6"
                                                    <c:if test="${requestScope.page.pageSize == 6}">selected</c:if> >6
                                            </option>
                                            <option value="12"
                                                    <c:if test="${requestScope.page.pageSize == 12}">selected</c:if> >12
                                            </option>
                                            <option value="18"
                                                    <c:if test="${requestScope.page.pageSize == 18}">selected</c:if> >18
                                            </option>
                                            <option value="24"
                                                    <c:if test="${requestScope.page.pageSize == 24}">selected</c:if> >24
                                            </option>
                                        </select>
                                        <strong>条</strong>
                                        &nbsp;
                                        &nbsp;
                                        <c:if test="${requestScope.page.pageCode >= 2}">
                                            <a href="${pageContext.request.contextPath}/commodity.do?pageCode=${requestScope.page.pageCode - 1}"><i class="layui-icon layui-icon-prev"></i></a>
                                        </c:if>
                                        <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
                                                                        class="form-control input-sm"
                                                                        style="display: inline-block;width:50px;height: 34px;padding: 6px 12px;font-size: 14px;line-height: 1.42857143;color: #555;background-color: #fff;background-image: none;border: 1px solid #ccc;border-radius: 4px;"/>&nbsp;<strong>页</strong>
                                        &nbsp;
                                        <c:if test="${requestScope.page.pageCode < requestScope.page.totalPage}">
                                            <a href="${pageContext.request.contextPath}/commodity.do?pageCode=${requestScope.page.pageCode + 1}"><i class="layui-icon layui-icon-next"></i></a>
                                        </c:if>
                                        <button type="submit" class="layui-btn layui-btn-normal" style="width: 60px;height:34px">GO!</button>
                                    </label>
                                </div>
                            </div>
                        </form>
                    </center>
                </c:if>
                <c:if test="${requestScope.page.totalCount!=0&&requestScope.flag=='big'&&requestScope.Num!=0}">
                    <center>
                        <form class="listForm" name="listForm" method="post" action="${pageContext.request.contextPath}/findBigCommodity.do?bigType=${requestScope.Type}">
                            <div class="row">
                                <div class="form-inline" style="margin-left: 15px;">
                                    <label style="font-size:14px;margin-top:22px;">
                                        <strong>共<b>${requestScope.page.totalCount}</b>条记录，共<b>${requestScope.page.totalPage}</b>页</strong>
                                        &nbsp;
                                        &nbsp;
                                        <strong>每页显示</strong>
                                        <select style="display: inline-block;width:70px;height: 34px;padding: 6px 12px;font-size: 14px;line-height: 1.42857143;color: #555;background-color: #fff;background-image: none;border: 1px solid #ccc;border-radius: 4px;" name="pageSize">
                                            <option value="6"
                                                    <c:if test="${requestScope.page.pageSize == 6}">selected</c:if> >6
                                            </option>
                                            <option value="12"
                                                    <c:if test="${requestScope.page.pageSize == 12}">selected</c:if> >12
                                            </option>
                                            <option value="18"
                                                    <c:if test="${requestScope.page.pageSize == 18}">selected</c:if> >18
                                            </option>
                                            <option value="24"
                                                    <c:if test="${requestScope.page.pageSize == 24}">selected</c:if> >24
                                            </option>
                                        </select>
                                        <strong>条</strong>
                                        &nbsp;
                                        &nbsp;
                                        <c:if test="${requestScope.page.pageCode >= 2}">
                                            <a href="${pageContext.request.contextPath}/findBigCommodity.do?bigType=${requestScope.Type}&pageCode=${requestScope.page.pageCode - 1}"><i class="layui-icon layui-icon-prev"></i></a>
                                        </c:if>
                                        <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
                                                                        class="form-control input-sm"
                                                                        style="display: inline-block;width:50px;height: 34px;padding: 6px 12px;font-size: 14px;line-height: 1.42857143;color: #555;background-color: #fff;background-image: none;border: 1px solid #ccc;border-radius: 4px;"/>&nbsp;<strong>页</strong>
                                        &nbsp;
                                        <c:if test="${requestScope.page.pageCode < requestScope.page.totalPage}">
                                            <a href="${pageContext.request.contextPath}/findBigCommodity.do?bigType=${requestScope.Type}&pageCode=${requestScope.page.pageCode + 1}"><i class="layui-icon layui-icon-next"></i></a>
                                        </c:if>
                                        <button type="submit" class="layui-btn layui-btn-normal" style="width: 60px;height:34px">GO!</button>
                                    </label>
                                </div>
                            </div>
                        </form>
                    </center>
                </c:if>
                <c:if test="${requestScope.page.totalCount!=0&&requestScope.flag=='small'&&requestScope.Num!=0}">
                    <center>
                        <form class="listForm" name="listForm" method="post" action="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=${requestScope.Type}">
                            <div class="row">
                                <div class="form-inline" style="margin-left: 15px;">
                                    <label style="font-size:14px;margin-top:22px;">
                                        <strong>共<b>${requestScope.page.totalCount}</b>条记录，共<b>${requestScope.page.totalPage}</b>页</strong>
                                        &nbsp;
                                        &nbsp;
                                        <strong>每页显示</strong>
                                        <select style="display: inline-block;width:70px;height: 34px;padding: 6px 12px;font-size: 14px;line-height: 1.42857143;color: #555;background-color: #fff;background-image: none;border: 1px solid #ccc;border-radius: 4px;" name="pageSize">
                                            <option value="6"
                                                    <c:if test="${requestScope.page.pageSize == 6}">selected</c:if> >6
                                            </option>
                                            <option value="12"
                                                    <c:if test="${requestScope.page.pageSize == 12}">selected</c:if> >12
                                            </option>
                                            <option value="18"
                                                    <c:if test="${requestScope.page.pageSize == 18}">selected</c:if> >18
                                            </option>
                                            <option value="24"
                                                    <c:if test="${requestScope.page.pageSize == 24}">selected</c:if> >24
                                            </option>
                                        </select>
                                        <strong>条</strong>
                                        &nbsp;
                                        &nbsp;
                                        <c:if test="${requestScope.page.pageCode >= 2}">
                                            <a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=${requestScope.Type}&pageCode=${requestScope.page.pageCode - 1}"><i class="layui-icon layui-icon-prev"></i></a>
                                        </c:if>
                                        <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
                                                                        class="form-control input-sm"
                                                                        style="display: inline-block;width:50px;height: 34px;padding: 6px 12px;font-size: 14px;line-height: 1.42857143;color: #555;background-color: #fff;background-image: none;border: 1px solid #ccc;border-radius: 4px;"/>&nbsp;<strong>页</strong>
                                        &nbsp;
                                        <c:if test="${requestScope.page.pageCode < requestScope.page.totalPage}">
                                            <a href="${pageContext.request.contextPath}/findSmallCommodity.do?smallType=${requestScope.Type}&pageCode=${requestScope.page.pageCode + 1}"><i class="layui-icon layui-icon-next"></i></a>
                                        </c:if>
                                        <button type="submit" class="layui-btn layui-btn-normal" style="width: 60px;height:34px">GO!</button>
                                    </label>
                                </div>
                            </div>
                        </form>
                    </center>
                </c:if>
                <c:if test="${requestScope.page.totalCount==0&&(requestScope.Num==0||requestScope.Num==null)}">
                    <br><br><br>
                    <span style="font-size: 60px; color: #888888;margin-left: 300px">无商品</span>
                </c:if>
            </>
        </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['laydate','jquery','form','element'], function () {
        var laydate = layui.laydate;
        var $=layui.$;
        // var form = layui.form();
        // form.render('select');

        //日期范围
        laydate.render({
            elem: '#test6',
            range: true,
        });

        //树状图折叠展开
        $('.list-box dt').on('click',function() {
            if ($(this).attr('off')) {
                $(this).removeClass('active').siblings('dd').show();
                $(this).attr('off', '');
            } else {
                $(this).addClass('active').siblings('dd').hide();
                $(this).attr('off', true);
            }
        });
    })
</script>
</body>
</html>
