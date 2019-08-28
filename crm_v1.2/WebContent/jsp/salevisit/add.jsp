<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link href="assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/ace.min.css"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js"></script>


    <script type="text/javascript" src="js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.min.js"></script>

    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/typeahead-bs2.min.js"></script>
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
    <script src="assets/layer/layer.js" type="text/javascript"></script>
    <script src="assets/laydate/laydate.js" type="text/javascript"></script>

    <script type="text/javascript">
        window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
    </script>

    <script type="text/javascript">
        if ("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
    </script>


    <title>拜访记录列表</title>

    <!-- 日期插件，使用jquery -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-1.4.2.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/jquery/jquery.datepick.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery.datepick.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery.datepick-zh-CN.js"></script>


</head>

<body>

<script type="text/javascript">
    $(function () {
        // 异步加载客户信息
        $.post("${pageContext.request.contextPath }/customer_findAllCustomer.action", {}, function (data) {
            $(data).each(function (i, n) {
                $("#customer").append("<option value='" + n.cust_id + "'>" + n.cust_name + "</option>");
            });
        }, "json");
        // 异步加载用户信息
        $.post("${pageContext.request.contextPath }/user_findAllUser.action", {}, function (data) {
            $(data).each(function (i, n) {
                $("#user").append("<option value='" + n.user_id + "'>" + n.user_name + "</option>");
            });
        }, "json");
    });

    $(function () {
        $('#visit_time').datepick({dateFormat: 'yy-mm-dd'});
        $('#visit_next_time').datepick({dateFormat: 'yy-mm-dd'});
    });
</script>


<form action="${pageContext.request.contextPath }/saleVisit_save.action" method="post">

    <div id="layui-layer1" type="page" times="1" showtime="0" contype="object"
         style="z-index: 19891015; width: 1920px; top: 0px; left: 0px; height: 957px;" area="800,400,278.5,560">
        <div class="layui-layer-title" style="cursor: move;" move="ok">添加拜访信息</div>
        <div id="" class="layui-layer-content" style="width: 900px">
            <div class="add_menber layui-layer-wrap" id="add_menber_style">
                <ul class="page-content">
                    <li>
                        <label>拜访客户：</label>&nbsp;&nbsp;&nbsp;
                        <select name="customer.cust_id" id="customer">
                            <option value="">-请选择-</option>
                        </select>
                    </li>
                    <li>
                        <label>业务员名称：</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <select name="user.user_id" id="user" style="width:180px">
                            <option value="">-请选择-</option>
                        </select>
                    </li>
                    <li>
                        <label>拜访详情：</label>
                        <s:textfield cssClass="textbox" id="sChannel2" cssStyle="WIDTH: 180px" name="visit_detail"/>
                    </li>

                    <li>
                        <label>拜访地点 ：</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <s:textfield cssClass="textbox" id="sChannel2" cssStyle="WIDTH: 180px" name="visit_addr"/>
                    </li>
                    <li>
                        <label>拜访时间：</label>
                        <s:textfield readonly="true" id="visit_time" cssClass="textbox" cssStyle="WIDTH: 180px"
                                     name="visit_time"/>
                    </li>
                    <li>
                        <label>下次拜访时间 ：</label>
                        <s:textfield readonly="true" id="visit_next_time" cssClass="textbox" cssStyle="WIDTH: 180px"
                                     name="visit_nexttime"/>
                    </li>
                </ul>
            </div>
            <div class="layui-layer-btn" style="margin-left: 0px;margin-right:200px">
                <input type="submit" class="btn btn-xs btn-info" style="width: 58px;height: 36px;margin-right: 200px"
                       value="保存">
                <input type="reset" class="btn btn-xs btn-warning" style="width: 58px;height: 36px" value="取消">
            </div>
        </div>
    </div>
</form>


</body>

</HTML>


