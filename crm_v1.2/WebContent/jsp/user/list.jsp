<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />
    <link href="assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <script src="assets/js/jquery.min.js"></script>

    <script type="text/javascript">
        window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
    </script>

    <script type="text/javascript">
        if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
    </script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/typeahead-bs2.min.js"></script>
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
    <script src="assets/layer/layer.js" type="text/javascript"></script>
    <script src="assets/laydate/laydate.js" type="text/javascript"></script>

    <SCRIPT language=javascript>
        function to_page(page){
            if(page){
                $("#page").val(page);
            }
            document.customerForm.submit();
        }
    </SCRIPT>
    <title>用户列表</title>
</head>

<body>
<FORM id="customerForm" name="customerForm"
      action="user_getAll.action"
      method=post>
    <div class="page-content clearfix">
        <div id="Member_Ratings">
            <div class="d_Confirm_Order_style">

                <div class="table_menu_list">
                    <table class="table table-striped table-bordered table-hover" id="sample-table">
                        <thead>
                        <tr>
                            <th width="200">用户ID</th>
                            <th width="200">用户名</th>
                            <th width="200">用户姓名</th>
                            <th width="200">用户状态</th>
                            <th width="200">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="list">
                            <TR>
                                <TD><s:property value="user_id"/></TD>
                                <TD><s:property value="user_code"/></TD>
                                <TD><s:property value="user_name"/></TD>
                                <TD><s:property value="user_state"/></TD>
                                <TD>
                                    <a href="${pageContext.request.contextPath }/editCustomer?user_id=<s:property value="user_id"/>" class="btn btn-xs btn-info">禁用</a>
                                    &nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/deleteCustomer?user_id=<s:property value="user_id"/>" class="btn btn-xs btn-warning">删除</a>
                                </TD>
                            </TR>
                        </s:iterator>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="dataTables_info" id="sample-table_info" role="status" aria-live="polite">共 <s:property value="totalSize"/> 条记录</div>
                        </div>
                        <div class="col-sm-6">
                            <div class="dataTables_paginate paging_bootstrap" id="sample-table_paginate">

                                <input type="hidden" id="page" name="currPage" />

                                <ul class="pagination">

                                    <s:if test="currPage!=1">
                                        <li><A href="javascript:to_page(<s:property value="currPage-1"/>)">&laquo;</A></li>
                                    </s:if>

                                    <s:iterator var="i" begin="1" end="totalPage">
                                        <s:if test="#i==currPage">
                                            <li class="active"><a href="javascript:void (0)"> <s:property value="#i"/></a></li>
                                        </s:if>
                                        <s:else>
                                            <li ><a href="javascript:to_page(<s:property value="#i"/>)"> <s:property value="#i"/></a></li>
                                        </s:else>
                                    </s:iterator>


                                    <s:if test="currPage!=totalPage">
                                        <li> <A href="javascript:to_page(<s:property value="currPage+1"/>)">&raquo;</A></li>
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


