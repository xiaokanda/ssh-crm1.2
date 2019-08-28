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


    <SCRIPT language=javascript>


        function to_page(page) {
            if (page) {
                $("#page").val(page);
            }
            document.customerForm.submit();
        }
    </SCRIPT>
    <title>拜访记录列表</title>

    <!-- 日期插件，使用jquery -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-1.4.2.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/jquery/jquery.datepick.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery.datepick.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery.datepick-zh-CN.js"></script>

    <script type="text/javascript">
        $(function () {
            $('#visit_time').datepick({dateFormat: 'yy-mm-dd'});
            $('#visit_nexttime').datepick({dateFormat: 'yy-mm-dd'});
        });
    </script>

</head>

<body>

<script type="text/javascript">
    $(function () {
        $('#visit_time').datepick({dateFormat: 'yy-mm-dd'});
        $('#visit_end_time').datepick({dateFormat: 'yy-mm-dd'});
    });
</script>


<FORM id="customerForm" name="customerForm"
      action="saleVisit_findAll.action"
      method=post>
    <s:hidden name="" value=""/>
    <div class="page-content clearfix">
        <div id="Member_Ratings">
            <div class="d_Confirm_Order_style">
                <div class="search_style">
                    <div class="title_names">搜索查询</div>

                    <ul class="search_content clearfix">
                        <li>
                            <label class="l_f">拜访时间从：</label>
                            <input type="text" id="visit_time" name="visit_time" class="text_add" style=" width:200px"
                                   readonly="readonly" value="<s:date name="visit_time" format="yyyy-MM-dd"/>"/>
                        </li>
                        <li>
                            <label class="l_f">到：</label>&nbsp;&nbsp;
                            <input type="text" id="visit_end_time" name="visit_end_time" style=" width:200px"
                                   readonly="readonly" value="<s:date name="visit_end_time" format="yyyy-MM-dd"/>"/>
                        </li>
                        <li style="width:90px;">
                            <button type="submit" class="btn_search"><i class="icon-search"></i>查询</button>
                        </li>
                    </ul>
                </div>


                <div class="table_menu_list">
                    <table class="table table-striped table-bordered table-hover" id="sample-table">
                        <thead>
                        <tr>
                            <th width="200">业务员名称</th>
                            <th width="200">客户名称</th>
                            <th width="200">拜访时间</th>
                            <th width="200">拜访地点</th>
                            <th width="200">拜访详情</th>
                            <th width="200">下次拜访时间</th>
                            <th width="200">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="list">
                            <TR>
                                <TD><s:property value="user.user_name"/></TD>
                                <TD><s:property value="customer.cust_name"/></TD>
                                <TD><s:date name="visit_time" format="yyyy-MM-dd"/></TD>
                                <TD><s:property value="visit_addr"/></TD>
                                <TD><s:property value="visit_detail"/></TD>
                                <TD><s:date name="visit_nexttime" format="yyyy-MM-dd"/></TD>
                                <TD>
                                    <a href="saleVisit_delete.action?visit_id=<s:property value="visit_id"/>"
                                       class="btn btn-xs btn-warning">删除</a>
                                </TD>
                            </TR>
                        </s:iterator>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="dataTables_info" id="sample-table_info" role="status" aria-live="polite">共
                                <s:property value="totalSize"/> 条记录
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="dataTables_paginate paging_bootstrap" id="sample-table_paginate">

                                <input type="hidden" id="page" name="currPage"/>

                                <ul class="pagination">

                                    <s:if test="currPage!=1">
                                        <li><A href="javascript:to_page(<s:property value="currPage-1"/>)">&laquo;</A>
                                        </li>
                                    </s:if>

                                    <s:iterator var="i" begin="1" end="totalPage">
                                        <s:if test="#i==currPage">
                                            <li class="active"><a href="javascript:void (0)"> <s:property
                                                    value="#i"/></a></li>
                                        </s:if>
                                        <s:else>
                                            <li><a href="javascript:to_page(<s:property value="#i"/>)"> <s:property
                                                    value="#i"/></a></li>
                                        </s:else>
                                    </s:iterator>


                                    <s:if test="currPage!=totalPage">
                                        <li><A href="javascript:to_page(<s:property value="currPage+1"/>)">&raquo;</A>
                                        </li>
                                    </s:if>


                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</FORM>
</body>

</HTML>


