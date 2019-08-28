<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/frameset.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <title>网站后台管理系统 </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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
    <!--[if !IE]> -->
    <script src="js/jquery-1.9.1.min.js"></script>
    <!-- <![endif]-->
    <!--[if IE]>
    <script type="text/javascript">window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>" + "<" + "script>");</script>
    <![endif]-->
    <script type="text/javascript">
        if ("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "script>");
    </script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/typeahead-bs2.min.js"></script>
    <!--[if lte IE 8]>
    <script src="assets/js/excanvas.min.js"></script>
    <![endif]-->
    <script src="assets/js/ace-elements.min.js"></script>
    <script src="assets/js/ace.min.js"></script>
    <script src="assets/layer/layer.js" type="text/javascript"></script>
    <script src="assets/laydate/laydate.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            var cid = $('#nav_list> li>.submenu');
            cid.each(function (i) {
                $(this).attr('id', "Sort_link_" + i);

            })
        })
        jQuery(document).ready(function () {
            $.each($(".submenu"), function () {
                var $aobjs = $(this).children("li");
                var rowCount = $aobjs.size();
                var divHeigth = $(this).height();
                $aobjs.height(divHeigth / rowCount);
            });
            //初始化宽度、高度
            $("#main-container").height($(window).height() - 76);
            $("#iframe").height($(window).height() - 140);

            $(".sidebar").height($(window).height() - 99);
            var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
            $(".submenu").height();
            $("#nav_list").children(".submenu").css("height", thisHeight);

            //当文档窗口发生改变时 触发
            $(window).resize(function () {
                $("#main-container").height($(window).height() - 76);
                $("#iframe").height($(window).height() - 140);
                $(".sidebar").height($(window).height() - 99);

                var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
                $(".submenu").height();
                $("#nav_list").children(".submenu").css("height", thisHeight);
            });
            $(".iframeurl").click(function () {
                var cid = $(this).attr("name");
                var cname = $(this).attr("title");
                $("#iframe").attr("src", cid).ready();
                $("#Bcrumbs").attr("href", cid).ready();
                $(".Current_page a").attr('href', cid).ready();
                $(".Current_page").attr('name', cid);
                $(".Current_page").html(cname).css({
                    "color": "#333333",
                    "cursor": "default"
                }).ready();
                $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
                $("#parentIfour").html('').css("display", "none").ready();
            });

        });
        /*********************点击事件*********************/
        $(document).ready(function () {
            $('#nav_list').find('li.home').click(function () {
                $('#nav_list').find('li.home').removeClass('active');
                $(this).addClass('active');
            });

            //时间设置
            function currentTime() {
                var d = new Date(),
                    str = '';
                str += d.getFullYear() + '年';
                str += d.getMonth() + 1 + '月';
                str += d.getDate() + '日';
                str += d.getHours() + '时';
                str += d.getMinutes() + '分';
                str += d.getSeconds() + '秒';
                return str;
            }

            setInterval(function () {
                $('#time').html(currentTime)
            }, 1000);
            $('#Exit_system').on('click', function () {
                layer.confirm('是否确定退出系统？', {
                        btn: ['是', '否'], //按钮
                        icon: 2,
                    },
                    function () {
                        location.href = "login.jsp";
                    });
            });
        })
    </script>
</head>

<body>
<!--
    作者：1430605900@qq.com
    时间：2018-12-23
    描述：head
-->
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>
    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <img src="images/logo.png">
                </small>
            </a>
            <!-- /.brand -->
        </div>
        <!-- /.navbar-header -->
        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <span class="time"><em id="time"></em></span><span class="user-info"><small>欢迎光临！</small><s:property
                            value="#session.ifuser.user_name"/></span>
                        <i class="icon-caret-down"></i>
                    </a>
                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <%--<li>
                            <a href="javascript:ovid(0)" onclick="change_Password()"><i class="icon-user"></i>修改密码</a>
                        </li>--%>
                        <li class="divider"></li>
                        <li>
                            <a href="javascript:ovid(0)" id="Exit_system"><i class="icon-off"></i>退出</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>
    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>
        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'fixed')
                } catch (e) {
                }
            </script>
            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                    客户关系管理系统
                </div>
                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>
                    <span class="btn btn-info"></span>
                    <span class="btn btn-warning"></span>
                    <span class="btn btn-danger"></span>
                </div>
            </div>
            <!--
                描述：侧边栏
            -->
            <!-- #sidebar-shortcuts -->
            <ul class="nav nav-list" id="nav_list">
                <li class="home">
                    <a href="homeUI.action" target="iframe" class="iframeurl" title=""><i
                            class="icon-dashboard"></i><span class="menu-text"> 系统首页 </span></a>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle"><i class="icon-desktop"></i><span class="menu-text"> 客户管理</span><b
                            class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                        <li class="home">
                            <a href="doSaveUI.action" title="新增客户" target="iframe" class="iframeurl"><i
                                    class="icon-double-angle-right"></i>新增客户</a>
                        </li>
                        <li class="home">
                            <a href="customerFind.action" title="客户列表" target="iframe" class="iframeurl"><i
                                    class="icon-double-angle-right"></i>客户列表</a>
                        </li>

                    </ul>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle"><i class="icon-list"></i><span
                            class="menu-text"> 联系人管理 </span><b class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                        <li class="home">
                            <a href="linkMan_saveUI.action" title="新增联系人" target="iframe" class="iframeurl"><i
                                    class="icon-double-angle-right"></i>新增联系人</a>
                        </li>
                        <li class="home">
                            <a href="linkMan_findAll.action" title="联系人列表" target="iframe" class="iframeurl"><i
                                    class="icon-double-angle-right"></i>联系人列表</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle"><i class="icon-edit"></i><span class="menu-text"> 客户拜访管理 </span><b
                            class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                        <li class="home">
                            <a href="saleVisit_saveUI.action" title="新增客户拜访" target="iframe" class="iframeurl"><i
                                    class="icon-double-angle-right"></i>新增客户拜访</a>
                        </li>
                        <li class="home">
                            <a href="saleVisit_findAll.action" title="客户拜访列表" target="iframe" class="iframeurl"><i
                                    class="icon-double-angle-right"></i>客户拜访列表</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle"><i class="icon-picture "></i><span
                            class="menu-text"> 统计分析 </span><b class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                        <li class="home">
                            <a href="industryStatistics.action" title="客户行业统计分析" target="iframe"  class="iframeurl" ><i
                                    class="icon-double-angle-right"></i>客户行业统计分析</a>
                        </li>
                        <li class="home">
                            <a href="sourceStatistics.action"  title="客户来源统计分析" target="iframe"  class="iframeurl"><i
                                    class="icon-double-angle-right"></i>客户来源统计分析</a>
                        </li>
                    </ul>
                </li>
               <!-- <li>
                    <a href="#" class="dropdown-toggle"><i class="icon-cogs"></i><span class="menu-text"> 系统管理 </span><b
                            class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                        <li class="home">
                            <a href="#"  title="角色管理" class="iframeurl"><i
                                    class="icon-double-angle-right"></i>角色管理</a>
                        </li>
                        <li class="home">
                            <a href="user_getAll.action" title="用户管理" target="iframe" class="iframeurl"><i
                                    class="icon-double-angle-right"></i>用户管理</a>
                        </li>
                        <li class="home">
                            <a href="#" name="#" title="数据字典" ><i
                                    class="icon-double-angle-right"></i>数据字典</a>
                        </li>
                    </ul>
                </li>-->
            </ul>
            <!--
                作者：1430605900@qq.com
                时间：2018-12-23
                描述：
            -->
            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
                   data-icon2="icon-double-angle-right"></i>
            </div>
            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'collapsed')
                } catch (e) {
                }
            </script>
        </div>

        <div class="main-content">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>
            <div class="breadcrumbs" id="breadcrumbs" style="padding:10px">
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="index.html">首页</a>
                    </li>
                    <li class="active"><span class="Current_page iframeurl"></span></li>
                    <li class="active" id="parentIframe"><span class="parentIframe iframeurl"></span></li>
                    <li class="active" id="parentIfour"><span class="parentIfour iframeurl"></span></li>
                </ul>
            </div>
            <!--
                作者：1430605900@qq.com
                时间：2018-12-23
                描述：页面的引入
            -->
            <iframe id="iframe" style="border:0; width:100%; background-color:#FFF;" name="iframe" frameborder="0"
                    src="homeUI.action"></iframe>

            <!-- /.page-content -->
        </div>
        <!-- /.main-content -->
        <!--
            作者：1430605900@qq.com
            时间：2018-12-23
            描述：皮肤修改部分
        -->
        <div class="ace-settings-container" id="ace-settings-container">
            <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                <i class="icon-cog bigger-150"></i>
            </div>

            <div class="ace-settings-box" id="ace-settings-box">
                <div>
                    <div class="pull-left">
                        <select id="skin-colorpicker" class="hide">
                            <option data-skin="default" value="#438EB9">#438EB9</option>
                            <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                            <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                            <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                        </select>
                    </div>
                    <span>&nbsp; 选择皮肤</span>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar"/>
                    <label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"/>
                    <label class="lbl" for="ace-settings-rtl">切换到左边</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container"/>
                    <label class="lbl" for="ace-settings-add-container">
                        切换窄屏
                        <b></b>
                    </label>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</HTML>
