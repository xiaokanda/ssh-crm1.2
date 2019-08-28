package com.crm.web.action;

import com.crm.utils.PageBean;
import com.crm.entity.SaleVisit;
import com.crm.service.SaleVisitService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Date;


@Controller
@ParentPackage("struts-default")
@Namespace("/")
@Scope("prototype")
public class SaleVisitAction extends ActionSupport implements ModelDriven<SaleVisit> {
    private SaleVisit saleVisit = new SaleVisit();
    @Autowired
    private SaleVisitService saleVisitService;

    //当前页数
    private Integer currPage = 1;

    private Date visit_end_time;

    public Date getVisit_end_time() {
        return visit_end_time;
    }

    public void setVisit_end_time(Date visit_end_time) {
        this.visit_end_time = visit_end_time;
    }

    public void setCurrPage(Integer currPage) {
        if (currPage == null) {
            currPage = 1;
        }
        this.currPage = currPage;
    }

    public void setPageSize(Integer pageSize) {
        if (pageSize == null) {
            pageSize = 5;
        }
        this.pageSize = pageSize;
    }

    private Integer pageSize = 5;

    @Override
    public SaleVisit getModel() {
        return saleVisit;
    }

    @Action(value = "saleVisit_findAll", results = {@Result(name = "success", location = "/jsp/salevisit/list.jsp")})
    public String saleVisit_findAll() {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(SaleVisit.class);
        if (saleVisit.getVisit_time() != null) {
            detachedCriteria.add(Restrictions.ge("visit_time", saleVisit.getVisit_time()));
        }
        if (visit_end_time != null) {
            detachedCriteria.add(Restrictions.le("visit_time", visit_end_time));
        }
        PageBean<SaleVisit> saPageBean = saleVisitService.findByPage(detachedCriteria, currPage, pageSize);
        ActionContext.getContext().getValueStack().push(saPageBean);
        return SUCCESS;
    }

    @Action(value = "saleVisit_saveUI", results = {@Result(name = "success", location = "/jsp/salevisit/add.jsp")})
    public String saleVisit_saveUI() {

        return SUCCESS;
    }

    @Action(value = "saleVisit_save", results = {@Result(name = "success", type = "redirectAction", location = "saleVisit_findAll")})
    public String saleVisit_save() {
        saleVisitService.save(saleVisit);
        return SUCCESS;
    }

    @Action(value = "saleVisit_delete", results = {@Result(name = "success", type = "redirectAction", location = "saleVisit_findAll")})
    public String visit_delete() {
        saleVisit = saleVisitService.findById(saleVisit.getVisit_id());
        saleVisitService.delete(saleVisit);
        return SUCCESS;
    }

}
