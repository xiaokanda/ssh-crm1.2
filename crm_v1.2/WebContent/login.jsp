<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/frameset.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <link rel="stylesheet" href="assets/css/ace.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="assets/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="assets/layer/layer.js" type="text/javascript"></script>
    <title>登陆</title>
</head>

<body class="login-layout">
<div class="logintop">
    <span>欢迎客户关系管理平台</span>
    <ul>
        <li>
            <a href="#">返回首页</a>
        </li>
        <li>
            <a href="#">帮助</a>
        </li>
        <li>
            <a href="#">关于</a>
        </li>
    </ul>
</div>
<div class="loginbody">
    <div class="login-container">
        <div class="center">
            <h1>
                <i class="icon-leaf green"></i>
                <span class="orange">PDSU</span>
                <span class="white">客户关系管理系统</span>
            </h1>
            <h4 class="white">CRM Management System</h4>
        </div>

        <div class="space-6"></div>

        <div class="position-relative">
            <div id="login-box" class="login-box widget-box no-border visible">
                <div class="widget-body">
                    <div class="widget-main">
                        <h4 class="header blue lighter bigger">
                            <i class="icon-coffee green"></i> 登陆 &nbsp;&nbsp;&nbsp;&nbsp;

                        </h4>

                        <div class="login_icon"><img src="images/login.png"/></div>

                        <form action="doLogin.action" method="post">
                            <fieldset>
                                <label class="block clearfix">
											<span class="block input-icon input-icon-right">
												<input type="text" class="form-control" placeholder="登录名"
                                                       name="user_code">
												<i class="icon-user"></i>
											</span>
                                </label>

                                <label class="block clearfix">
											<span class="block input-icon input-icon-right">
												<input type="password" class="form-control" placeholder="密码"
                                                       name="user_password">
												<i class="icon-lock"></i>
											</span>
                                </label>

                                <div class="space">


                                </div>
                                <span style="color: red;size: A3"><s:actionerror/></span>
                                <div class="clearfix">
                                    <%-- <label class="inline">
                                       <input type="checkbox" class="ace">
                                       <span class="lbl">保存密码</span>
                                     </label>--%>
                                    <a href="regist.jsp" style="color: #2a91d8;">还没有账号？去注册</a>
                                    <button type="submit" class="width-35 pull-right btn btn-sm btn-primary"
                                            id="login_btn">
                                        <i class="icon-key"></i> 登陆
                                    </button>
                                </div>

                                <div class="space-4"></div>
                            </fieldset>
                        </form>

                        <div class="social-login center">
                        </div>
                    </div>
                    <!-- /widget-main -->
                    <div class="toolbar clearfix">

                    </div>
                </div>
                <!-- /widget-body -->
            </div>
            <!-- /login-box -->
        </div>
        <!-- /position-relative -->
    </div>
</div>
<div class="loginbm">版权所有 2018
    <a href="www.vist.top">Gzh</a>
</div>
<strong></strong>
</body>
</HTML>
