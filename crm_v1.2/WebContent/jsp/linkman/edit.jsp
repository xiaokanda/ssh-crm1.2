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
	<title>添加联系人</title>
</head>

<body>
<form action="${pageContext.request.contextPath }/updateLinkMan.action" method="post">
	<s:hidden  name="lkm_id"/>
	<div class="layui-layer layui-anim layui-layer-page " id="layui-layer1" type="page" times="1" showtime="0" contype="object" style="z-index: 19891015; width: 1920px; top: 0px; left: 0px; height: 957px;" area="800,400,278.5,560">
		<div class="layui-layer-title" style="cursor: move;" move="ok">修改联系人</div>
		<div id="" class="layui-layer-content" style="width: 900px">
			<div class="add_menber layui-layer-wrap" id="add_menber_style" style="">

				<ul class=" page-content">
					<li>
						<label class="label_name">所属客户：</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="add_name">&nbsp;
								<s:select list="lists" name="customer.cust_id" headerKey="" headerValue="-请选择-" listKey="cust_id" listValue="cust_name"></s:select>
							</span>
					</li>

					<li>
						<label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
						<span class="add_name">
     							<label>
     								 <s:radio list="#{'1':'男','0':'女'}" name="lkm_gender"/>
							</label>&nbsp;&nbsp;&nbsp;
					</span>
					</li>

					<li>
						<label class="label_name">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
						<span class="add_name">
								 <s:textfield cssClass="textbox" id="sChannel2" cssStyle="WIDTH: 180px"  name="lkm_name"></s:textfield>
							</span>
					</li>

					<li>
						<label class="label_name">办公电话：</label>
						<span class="add_name">
								<s:textfield cssClass="textbox" id="sChannel2" cssStyle="WIDTH: 180px" name="lkm_phone"></s:textfield>
							</span>
					</li>
					<li>
						<label class="label_name">移动电话：</label>
						<span class="add_name">
								<s:textfield cssClass="textbox" id="sChannel2" cssStyle="WIDTH: 180px" name="lkm_mobile"></s:textfield>
							</span>
					</li>
					<li>
						<label class="label_name">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
						<span class="add_name">
								<s:textfield cssClass="textbox" id="sChannel2" cssStyle="WIDTH: 180px"  name="lkm_email"></s:textfield>
							</span>
					</li>
					<li>
						<label class="label_name">&nbsp;&nbsp;&nbsp;QQ&nbsp;&nbsp;&nbsp;&nbsp;：</label>
						<span class="add_name">
								<s:textfield cssClass="textbox" id="sChannel2" cssStyle="WIDTH: 180px"  name="lkm_qq"></s:textfield>
							</span>
					</li>
					<li>
						<label class="label_name">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</label>
						<span class="add_name">
								<s:textfield cssClass="textbox" id="sChannel2" cssStyle="WIDTH: 180px"  name="lkm_position"></s:textfield>
							</span>
					</li>
					<li>
						<label class="label_name">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label>
						<span class="add_name">
								<s:textarea name="lkm_memo" cols="24" rows="3"></s:textarea>
							</span>
					</li>
				</ul>
			</div>
			<div class="layui-layer-btn" style="margin-left: 0px;margin-right:200px;margin-top:350px">
				<input type="submit" class="btn btn-xs btn-info" style="width: 58px;height: 36px;margin-right: 200px" value="提交">
				<input type="reset" class="btn btn-xs btn-warning" style="width: 58px;height: 36px" value="取消">
			</div>
		</div>
</form>
</body>


</HTML>
