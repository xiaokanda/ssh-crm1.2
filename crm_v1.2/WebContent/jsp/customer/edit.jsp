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
	<!-- page specific plugin scripts -->
	<script src="assets/js/jquery.dataTables.min.js"></script>
	<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
	<script type="text/javascript" src="js/H-ui.js"></script>
	<script type="text/javascript" src="js/H-ui.admin.js"></script>
	<script src="assets/layer/layer.js" type="text/javascript"></script>
	<script src="assets/laydate/laydate.js" type="text/javascript"></script>
	<title>修改用户</title>

	<script type="text/javascript">
        $(function(){

            $.post("${pageContext.request.contextPath }/findBaseDictByTypeCode",{"dict_type_code":"002"},function(data){
                $(data).each(function(i,n){
                    $("#cust_source").append("<option value='"+n.dict_id+"'>"+n.dict_item_name+"</option>");
                });

                $("#cust_source option[value='${baseDictSource.dict_id}']").prop("selected","selected");
            },"json");
            $.post("${pageContext.request.contextPath }/findBaseDictByTypeCode",{"dict_type_code":"006"},function(data){
                $(data).each(function(i,n){
                    $("#cust_level").append("<option value='"+n.dict_id+"'>"+n.dict_item_name+"</option>");
                });

                $("#cust_level option[value='${baseDictLevel.dict_id}']").prop("selected","selected");
            },"json");
            $.post("${pageContext.request.contextPath }/findBaseDictByTypeCode",{"dict_type_code":"001"},function(data){
                $(data).each(function(i,n){
                    $("#cust_industry").append("<option value='"+n.dict_id+"'>"+n.dict_item_name+"</option>");
                });

                $("#cust_industry option[value='${baseDictIndustry.dict_id}']").prop("selected","selected");
            },"json");
        });


	</script>

</head>

<body>
<form action="${pageContext.request.contextPath }/updateCustomer.action" method="post">
	<s:hidden name="cust_id" value="%{cust_id}"/>
<div class="layui-layer layui-anim layui-layer-page " id="layui-layer1" type="page" times="1" showtime="0" contype="object" style="z-index: 19891015; width: 1920px; top: 0px; left: 0px; height: 957px;" area="800,400,278.5,560">
	<div class="layui-layer-title" style="cursor: move;" move="ok">修改客户</div>
	<div id="" class="layui-layer-content" style="width: 900px">
		<div class="add_menber layui-layer-wrap" id="add_menber_style" style="">

			<ul class=" page-content">
				<li>
					<label class="label_name">客户名称：</label>
					<span class="add_name">
								 <s:textfield cssClass="textbox"  cssStyle="WIDTH: 180px" name="cust_name"/>
							</span>
				</li>
				<li>
					<label class="label_name">客户级别：</label>
					<span class="add_name">
								<!--<input name="真实姓名" type="text" class="text_add">-->
								 <select id="cust_level" name="baseDictLevel.dict_id">
								           <option value="">-请选择-</option>
								    </select>
							</span>
					<!--<div class="prompt r_f"></div>-->
				</li>
				<li>
					<label class="label_name">移动电话：</label>
					<span class="add_name">
								 <s:textfield cssClass="textbox"  cssStyle="WIDTH: 180px"  name="cust_phone"/>
							</span>
					<div class="prompt r_f"></div>
				</li>

				<li>
					<label class="label_name">所属行业：</label>
					<span class="add_name">
								  <select id="cust_industry" name="baseDictIndustry.dict_id">
								           <option value="">-请选择-</option>
								    </select>
							</span>
					<!--<div class="prompt r_f"></div>-->
				</li>
				<li><label class="label_name">固定电话：</label>
					<span class="add_name">
								<s:textfield cssClass="textbox"  cssStyle="WIDTH: 180px"  name="cust_mobile"/>
							</span>
					<!--<div class="prompt r_f"></div>-->
				</li>

				<li>
					<label class="label_name">信息来源：</label>
					<span class="add_name">
     							<select id="cust_source" name="baseDictSource.dict_id">
								           <option value="">-请选择-</option>
								    </select>
							</span>
					<!--<div class="prompt r_f"></div>-->
				</li>

			<%--	<li class="adderss">
					<label class="label_name">客户资质：</label>
					<span class="add_name">
								<input type="file" name = "upload" accept="image/*"/>
							</span>
					<div class="prompt r_f"></div>
				</li>--%>


			</ul>
		</div>

		<div class="layui-layer-btn" style="margin-left: 0px;margin-right:200px">
			<input type="submit" class="btn btn-xs btn-info" style="width: 58px;height: 36px;margin-right: 200px" value="提交">
			<input type="reset" class="btn btn-xs btn-warning" style="width: 58px;height: 36px" value="取消">
		</div>
	</div>
	</form>
</body>
</HTML>
