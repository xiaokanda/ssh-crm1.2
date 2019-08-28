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
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="assets/js/jquery.min.js"></script>

    <!-- <![endif]-->

    <!--[if IE]>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <![endif]-->

    <!--[if !IE]> -->

    <script type="text/javascript">
        window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
    </script>

    <!-- <![endif]-->

    <!--[if IE]>
    <script type="text/javascript">
        window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
    </script>
    <![endif]-->

    <script type="text/javascript">
        if ("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
    </script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/typeahead-bs2.min.js"></script>
    <!-- page specific plugin scripts -->
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
    <script src="assets/layer/layer.js" type="text/javascript"></script>
    <script src="assets/laydate/laydate.js" type="text/javascript"></script>

    <SCRIPT language=javascript>
        function to_page(page) {
            if (page) {
                $("#page").val(page);
            }
            document.customerForm.submit();

        }
    </SCRIPT>
    <title>用户列表</title>
</head>

<body>
<FORM id="customerForm" name="customerForm"
      action="linkMan_findAll.action"
      method=post>
    <div class="page-content clearfix">
        <div id="Member_Ratings">
            <div class="d_Confirm_Order_style">
                <div class="search_style">
                    <div class="title_names">搜索查询</div>
                    <ul class="search_content clearfix">
                        <li>
                            <label class="l_f">联系人名称</label>
                            <input name="lkm_name" type="text" class="text_add" placeholder="输入联系人名称"
                                   style=" width:270px"/>
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
                            <th width="200">联系人名称</th>
                            <th width="50">性别</th>
                            <th width="200">办公电话</th>
                            <th width="200">手机</th>
                            <th width="200">邮箱</th>
                            <th width="200">QQ</th>
                            <th width="200">职位</th>
                            <th width="200">所属客户</th>
                            <th width="200">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="list">
                            <TR>
                                <TD><s:property value="lkm_name"/></TD>
                                <TD><s:if test='lkm_gender=="1"'>男</s:if>
                                    <s:if test='lkm_gender=="0"'>女</s:if></TD>
                                <TD><s:property value="lkm_phone"/></TD>
                                <TD><s:property value="lkm_mobile"/></TD>
                                <TD><s:property value="lkm_email"/></TD>
                                <TD><s:property value="lkm_qq"/></TD>
                                <TD><s:property value="lkm_position"/></TD>
                                <TD><s:property value="customer.cust_name"/></TD>
                                <TD>
                                    <a class="btn btn-xs btn-info"
                                       href="${pageContext.request.contextPath }/linkman_updateUI.action?lkm_id=<s:property value="lkm_id"/>">修改</a>
                                    &nbsp;&nbsp;
                                    <a class="btn btn-xs btn-warning"
                                       href="${pageContext.request.contextPath }/deleteLinkMan.action?lkm_id=<s:property value="lkm_id"/>">删除</a>
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
