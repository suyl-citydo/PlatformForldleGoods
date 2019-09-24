<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/04/21
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/bootstrap.min.css"/>
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
<div class="container" style="width: 90%;">
    <br/>
    <br/>
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 170px;border-bottom: none;"><strong>商品信息列表</strong></legend>
        </fieldset>
        <br/>
        <h5 style="margin-top: -20px;">
            <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
            <span style="color: #299A74;"><strong>输入查询信息</strong></span>
        </h5>
        <hr style="margin-top: 0;"/>
        <div class="form table">
            <div>
                <form class="layui-form form-inline" action="${pageContext.request.contextPath}/findCommodityByCon.do" role="form" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="margin-left: -10px;padding-left:0;"><strong>搜索商品</strong></label>
                        <div class="layui-input-inline">
                            <input name="name" value="${requestScope.name}" placeholder="请输入商品名称查询" class="layui-input" type="text">
                        </div>
                        <div class="layui-input-inline" style="float: right">
                            <button class="layui-btn" type="submit">查询</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    <h5>
        <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
        <span style="color: #299A74;"><strong>查询结果展示</strong></span>
    </h5>
    <hr style="margin-top: 0;"/>
    <br/>
    <br/>
    <div class="table-responsive">
        <table class="table table-striped table-hover" id="countTable">
            <thead>
            <tr>
                <th style="text-align: left;">商品ID</th>
                <th style="text-align: left">图片</th>
                <th style="text-align: left">卖家</th>
                <th style="text-align: left">名称</th>
                <th style="text-align: left">价格</th>
                <th style="text-align: left">数量</th>
                <th style="text-align: left">收藏</th>
                <th style="text-align: left">大类</th>
                <th style="text-align: left">小类</th>
                <th style="text-align: left;">描述</th>
                <th style="text-align: left;">上架时间</th>
                <th style="text-align: left;width:120px">操作</th>
            </tr>
            </thead>
            <tbody style="text-align: left">
            <c:forEach items="${requestScope.page.beanList}" var="commodity">
                <tr>
                    <td style="vertical-align: middle;">${commodity.id}</td>
                    <td style="vertical-align: middle;"><img src="${pageContext.request.contextPath}${commodity.url}" style="width: 50px;height: 50px"></td>
                    <td style="vertical-align: middle;">${commodity.email}</td>
                    <td style="vertical-align: middle;">${commodity.cname}</td>
                    <td style="vertical-align: middle;">${commodity.remarks}</td>
                    <td style="vertical-align: middle;">${commodity.cnum}</td>
                    <td style="vertical-align: middle;">${commodity.isCollection}</td>
                    <td style="vertical-align: middle;">${commodity.bigType}</td>
                    <td style="vertical-align: middle;">${commodity.smallType}</td>
                    <td style="vertical-align: middle;">${commodity.describes}</td>
                    <td style="vertical-align: middle;">${commodity.time}</td>
                    <td style="vertical-align: middle;">
                        <button type="button" onclick="return edit('${commodity.id}');" class="layui-btn layui-btn-sm layui-btn-primary">编辑</button>
                        <button type="button" onclick="return clean('${commodity.id}');" class="layui-btn layui-btn-sm layui-btn-danger">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <c:if test="${requestScope.name==null||requestScope.name==''}">
        <center>
            <form class="listForm" name="listForm" method="post" action="${pageContext.request.contextPath}/toCommodityManage.do">
                <div class="row">
                    <div class="form-inline" style="margin-left: 15px;">
                        <label style="font-size:14px;margin-top:22px;">
                            <strong>共<b>${requestScope.page.totalCount}</b>条记录，共<b>${requestScope.page.totalPage}</b>页</strong>
                            &nbsp;
                            &nbsp;
                            <strong>每页显示</strong>
                            <select class="form-control" name="pageSize">
                                <option value="5"
                                        <c:if test="${requestScope.page.pageSize == 5}">selected</c:if> >5
                                </option>
                                <option value="10"
                                        <c:if test="${requestScope.page.pageSize == 10}">selected</c:if> >10
                                </option>
                                <option value="15"
                                        <c:if test="${requestScope.page.pageSize == 15}">selected</c:if> >15
                                </option>
                                <option value="20"
                                        <c:if test="${requestScope.page.pageSize == 20}">selected</c:if> >20
                                </option>
                            </select>
                            <strong>条</strong>
                            &nbsp;
                            &nbsp;
                            <c:if test="${requestScope.page.pageCode >= 2}">
                                <a href="${pageContext.request.contextPath}/toCommodityManage.do?pageCode=${requestScope.page.pageCode - 1}"><i class="layui-icon layui-icon-prev"></i></a>
                            </c:if>
                            <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
                                                            class="form-control input-sm"
                                                            style="width:11%"/>&nbsp;<strong>页</strong>
                            &nbsp;
                            <c:if test="${requestScope.page.pageCode < requestScope.page.totalPage}">
                                <a href="${pageContext.request.contextPath}/toCommodityManage.do?pageCode=${requestScope.page.pageCode + 1}"><i class="layui-icon layui-icon-next"></i></a>
                            </c:if>
                            <button type="submit" class="btn btn-sm btn-info">GO!</button>
                        </label>
                    </div>
                </div>
            </form>
        </center>
    </c:if>
    <c:if test="${requestScope.name!=null&&requestScope.name!=''}">
        <center>
            <form class="listForm" name="listForm" method="post" action="${pageContext.request.contextPath}/findCommodityByCon.do">
                <div class="row">
                    <div class="form-inline" style="margin-left: 15px;">
                        <label style="font-size:14px;margin-top:22px;">
                            <strong>共<b>${requestScope.page.totalCount}</b>条记录，共<b>${requestScope.page.totalPage}</b>页</strong>
                            &nbsp;
                            &nbsp;
                            <strong>每页显示</strong>
                            <select class="form-control" name="pageSize">
                                <option value="5"
                                        <c:if test="${requestScope.page.pageSize == 5}">selected</c:if> >5
                                </option>
                                <option value="10"
                                        <c:if test="${requestScope.page.pageSize == 10}">selected</c:if> >10
                                </option>
                                <option value="15"
                                        <c:if test="${requestScope.page.pageSize == 15}">selected</c:if> >15
                                </option>
                                <option value="20"
                                        <c:if test="${requestScope.page.pageSize == 20}">selected</c:if> >20
                                </option>
                            </select>
                            <strong>条</strong>
                            &nbsp;
                            &nbsp;
                            <c:if test="${requestScope.page.pageCode >= 2}">
                                <a href="${pageContext.request.contextPath}/findCommodityByCon.do?pageCode=${requestScope.page.pageCode - 1}"><i class="layui-icon layui-icon-prev"></i></a>
                            </c:if>
                            <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
                                                            class="form-control input-sm"
                                                            style="width:11%"/>&nbsp;<strong>页</strong>
                            &nbsp;
                            <c:if test="${requestScope.page.pageCode < requestScope.page.totalPage}">
                                <a href="${pageContext.request.contextPath}/findCommodityByCon.do?pageCode=${requestScope.page.pageCode + 1}"><i class="layui-icon layui-icon-next"></i></a>
                            </c:if>
                            <button type="submit" class="btn btn-sm btn-info">GO!</button>
                        </label>
                    </div>
                </div>
            </form>
        </center>
    </c:if>



</div>
</body>
<script src="${pageContext.request.contextPath}/res/layui/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/res/layui/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/res/layui/bootstrap.min.js"></script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<script type="text/javascript">
    //删除
    function clean(id){
        layer.open({
            title: '警告信息',
            content: '你确定要删除？',
            btn: ['确定','取消'],
            offset:'250px',
            btn1: function(index,layero){
                $.ajax({
                    url: '${pageContext.request.contextPath}/delCommodity.do',
                    type: 'POST',
                    data: {id: id},
                    success: function(data) {
                        layer.open({
                            title: '提示信息',
                            content: '删除成功',
                            time: 2000,
                        });
                        $("body").html(data);
                    },
                    error:function () {
                        layer.open({
                            title: '提示信息',
                            content: '连接失败'
                        });
                    }
                });
                layer.close(index);
            }
        });
    }

    $(function () {
        $("td").on("mouseenter",function() {
            if (this.offsetWidth < this.scrollWidth) {
                var that = this;
                var text = $(this).text();
                layer.tips(text, that,{
                    tips: 1,
                    time: 2000         //设置显示时间
                });
            }
        });
    });

    //编辑
    function edit(id){
        $.ajax({
            url: '${pageContext.request.contextPath}toEditPage.do',
            type: 'POST',
            data: {id: id},
            success: function(data){
                $("body").html(data);
            },
            error: function(){
                layer.open({
                    title: '提示信息',
                    content: '发生错误'
                });
            }
        });
    }
</script>
</html>