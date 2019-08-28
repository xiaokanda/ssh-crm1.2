package com.crm.web.action;

import com.crm.entity.BaseDict;
import com.crm.service.BaseDictService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.util.List;

@Controller
@ParentPackage("struts-default")
@Namespace("/")
@Scope("prototype")
public class BaseDictAction extends ActionSupport implements ModelDriven<BaseDict> {

    private BaseDict baseDict=new BaseDict();

	@Autowired
	private BaseDictService baseDictService;

	@Override
	public BaseDict getModel() {
		return baseDict;
	}

	@Action(value="findBaseDictByTypeCode")
      public String findBaseDictByTypeCode() throws IOException {
	  List<BaseDict> baseDicts=baseDictService.findBaseDictByTypeCode(baseDict.getDict_type_code());
	  JsonConfig config=new JsonConfig();
	  config.setExcludes(new String[] {"dict_enable","dict_sort","dict_memo"});
	  JSONArray jsonArray = JSONArray.fromObject(baseDicts,config);
	 // System.out.println(jsonArray.toString());
	  ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
	  ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
	  return NONE;
  }
}
