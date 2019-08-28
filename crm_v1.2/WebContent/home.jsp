<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <link href="assets/css/codemirror.css" rel="stylesheet">
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="assets/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="assets/js/jquery.min.js"></script>
    <!-- <![endif]-->
    <script src="assets/dist/echarts.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>


    <title>无标题文档</title>
</head>

<body>

<div class="page-content clearfix">
    <div class="alert alert-block alert-success">
        <button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
        <i class="icon-ok green"></i>欢迎使用<strong class="green">客户关系管理系统<small>(v1.2)</small></strong>
    </div>
    <div class="state-overview clearfix">
        <div class="col-lg-4 col-sm-6">
            <section class="panel">
                <a href="#" title="顾客数量">
                    <div class="symbol terques">
                        <i class="icon-user"></i>
                    </div>
                    <div class="value">
                        <h1><s:property value="s"/></h1>
                        <p>顾客数量</p>
                    </div>
                </a>
            </section>
        </div>
        <div class="col-lg-4 col-sm-6">
            <section class="panel">
                <div class="symbol red">
                    <i class="icon-tags"></i>
                </div>
                <div class="value">
                    <h1><s:property value="ss"/></h1>
                    <p>联系人数量</p>
                </div>
            </section>
        </div>
        <div class="col-lg-4 col-sm-6">
            <section class="panel">
                <div class="symbol yellow">
                    <i class="icon-shopping-cart"></i>
                </div>
                <div class="value">
                    <h1><s:property value="sss"/></h1>
                    <p>拜访记录</p>
                </div>
            </section>
        </div>
    </div>
   <!--实时拜访记录-->
<%--    <div class="clearfix">
        <div class="t_Record">
            <div id="main" style="height:300px; overflow:hidden; width:100%; overflow:auto" ></div>
        </div>
        <div class="news_style">
            <div class="title_name">动态记录</div>
            <ul class="list">
                <li><i class="icon-bell red"></i><a href="#">张三12月12号拜访了李四。</a></li>
                <li><i class="icon-bell red"></i><a href="#">王五注册了账户</a></li>
                <li><i class="icon-bell red"></i><a href="#">李四预约了1月23号去拜访王二麻</a></li>
            </ul>
        </div>
    </div>--%>
    </script>
</div>
</body>
</html>
