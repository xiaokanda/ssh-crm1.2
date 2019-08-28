<%--
  Created by IntelliJ IDEA.
  User: ShenChong
  Date: 2018/12/27
  Time: 8:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link href="assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/ace.min.css"/>
    <link rel="stylesheet" href="font/css/font-awesome.min.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="assets/js/typeahead-bs2.min.js"></script>
    <script src="js/lrtk.js" type="text/javascript"></script>
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="assets/layer/layer.js" type="text/javascript"></script>
    <script src="assets/dist/echarts.js"></script>

    <title>来源统计分析</title>
</head>

<body>
<div class="grading_style">
    <div id="category">
        <div id="scrollsidebar" class="left_Treeview">

        </div>
    </div>
    <!--右侧样式-->
    <div class="page_right_style right_grading Widescreen">
        <div class="Statistics_style" id="Statistic_pie">
            <div class="type_title">来源统计分析
            </div>
            <div id="Statistics" class="Statistics"></div>
        </div>
    </div>
</div>
</body>

</html>
<script type="text/javascript">
    var data2 = null;
    var data22 = null;
    $(function () {
        var data1 = '${requestScope.str1}';
        var data11 = '${requestScope.str2}';
        data2 = eval("(" + data1 + ")");
        data22 = eval("(" + data11 + ")");
        $("#category").fix({
            float: 'left',
            //minStatue : true,
            skin: 'green',
            durationTime: false,
            spacingw: 20,
            spacingh: 240,
            set_scrollsidebar: '.right_grading',
        });
    });
    $(function () {
        $("#Statistic_pie").fix({
            float: 'top',
            //minStatue : true,
            skin: 'green',
            durationTime: false,
            spacingw: 0,
            spacingh: 0,
            close_btn: '.top_close_btn',
            show_btn: '.top_show_btn',
            side_list: '.Statistics',
            close_btn_width: 80,
            side_title: '.Statistic_title',
        });
    });
</script>
<script type="text/javascript">
    //初始化宽度、高度
    $(".widget-box").height($(window).height());
    $(".page_right_style").width($(window).width() - 220);
    //$(".table_menu_list").width($(window).width()-240);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".widget-box").height($(window).height());
        $(".page_right_style").width($(window).width() - 220);
        //$(".table_menu_list").width($(window).width()-240);
    })
    /**************/
    require.config({
        paths: {
            echarts: './assets/dist'
        }
    });
    require(
        [
            'echarts',
            'echarts/theme/macarons',
            'echarts/chart/pie', // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
            'echarts/chart/funnel'
        ],
        function (ec, theme) {
            var myChart = ec.init(document.getElementById('Statistics'), theme);

            option = {
                title: {
                    text: '来源统计分析',
                    subtext: '实时更新最新统计',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {

                    x: 'center',
                    y: 'bottom',
                    data: data2//['普通用户', '铁牌用户', '铜牌用户', '银牌用户', '金牌用户', '钻石用户', '蓝钻用户', '红钻用户']
                },
                toolbox: {
                    show: true,
                    feature: {
                        mark: {
                            show: false
                        },
                        dataView: {
                            show: false,
                            readOnly: true
                        },
                        magicType: {
                            show: true,
                            type: ['pie', 'funnel'],
                            option: {
                                funnel: {
                                    x: '25%',
                                    width: '50%',
                                    funnelAlign: 'left',
                                    max: 6200
                                }
                            }
                        },
                        restore: {
                            show: true
                        },
                        saveAsImage: {
                            show: true
                        }
                    }
                },
                calculable: true,
                series: [{
                    name: '来源',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '60%'],
                    data: data22 /*[{
                        value: 1200,
                        name: '普通用户'
                    },
                        {
                            value: 1100,
                            name: '铁牌用户'
                        },
                        {
                            value: 1300,
                            name: '铜牌用户'
                        },
                        {
                            value: 1000,
                            name: '银牌用户'
                        },
                        {
                            value: 980,
                            name: '金牌用户'
                        },
                        {
                            value: 850,
                            name: '钻石用户'
                        },
                        {
                            value: 550,
                            name: '蓝钻用户'
                        },
                        {
                            value: 220,
                            name: '红钻用户'
                        },

                    ]*/
                }]
            };
            myChart.setOption(option);
        }
    );
</script>
<script type="text/javascript">
    $(function ($) {
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [
                [1, "desc"]
            ], //默认第几个排序
            "bStateSave": true, //状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {
                    "orderable": false,
                    "aTargets": [0, 2, 3, 4, 5, 6, 7, 9]
                } // 制定列不参与排序
            ]
        });

        $('table th input:checkbox').on('click', function () {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function () {
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

        });

        $('[data-rel="tooltip"]').tooltip({
            placement: tooltip_placement
        });

        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
            return 'left';
        }
    });
</script>