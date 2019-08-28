package com.crm.web.action;

import com.crm.entity.Customer;
import com.crm.entity.LinkMan;
import com.crm.utils.PageBean;
import com.crm.service.CustomerService;
import com.crm.service.LinkManService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;
@Controller
@ParentPackage("struts-default")
@Namespace("/")
@Scope("prototype")
public class LinkManAction extends ActionSupport implements ModelDriven<LinkMan> {
	@Autowired
    private LinkManService linkManService;
	@Autowired
    private CustomerService customerService;

   private Integer currPage=1;
   private Integer pageSize=5;
	public void setCurrPage(Integer currPage) {
		if (currPage==null) {
			currPage=1;
		}
		this.currPage = currPage;
	}
	public void setPageSize(Integer pageSize) {
		if (pageSize==null) {
			pageSize=5;
		}
		this.pageSize = pageSize;
	}

    private LinkMan linkMan =new LinkMan();
	@Override
	public LinkMan getModel() {
		return linkMan;
	}
	@Action(value="linkMan_findAll",results= {@Result(name="success",location="/jsp/linkman/list.jsp")})
		public String findAll() {
			DetachedCriteria detachedCriteria =DetachedCriteria.forClass(LinkMan.class);
			if (StringUtils.isNotBlank(linkMan.getLkm_name())){
				detachedCriteria.add(Restrictions.like("lkm_name","%"+linkMan.getLkm_name()+"%"));
			}
			PageBean<LinkMan> pageBean=linkManService.findAll(detachedCriteria,currPage,pageSize);
			ActionContext.getContext().getValueStack().push(pageBean);
			return SUCCESS;
		}

	@Action(value="linkMan_saveUI",results= {@Result(name="success",location="/jsp/linkman/add.jsp")})
		public String saveUI() {
			 List<Customer> customers=customerService.findAll();
			 ActionContext.getContext().getValueStack().set("aaa", customers);
			return SUCCESS;
		}

	@Action(value="linkman_updateUI",results= {@Result(name="success",location="/jsp/linkman/edit.jsp")})
		public String updateUI() {
			List<Customer> lists=customerService.findAll();
			linkMan=linkManService.findById(linkMan.getLkm_id());
			ActionContext.getContext().getValueStack().set("lists", lists);
			ActionContext.getContext().getValueStack().push(linkMan);
			return SUCCESS;
		}

	@Action(value="saveLinkMan",  results= {@Result(name="success",type = "redirectAction",location="linkMan_findAll")})
		public String saveLinkMan() {
			linkManService.save(linkMan);
			return SUCCESS;
		}

	@Action(value="updateLinkMan",results= {@Result(name="success",type = "redirectAction",location="linkMan_findAll")})
		public String updateLinkMan() {
			linkManService.update(linkMan);
			return SUCCESS;
		}

	@Action(value="deleteLinkMan",results= {@Result(name="success",type = "redirectAction",location="linkMan_findAll")})
		public String deleteLinkMan() {
			linkMan=linkManService.findById(linkMan.getLkm_id());
			linkManService.delete(linkMan);
			return SUCCESS;
		}
}
