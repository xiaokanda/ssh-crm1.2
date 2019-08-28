package com.crm.web.action;

import com.crm.entity.Customer;
import com.crm.utils.PageBean;
import com.crm.service.CustomerService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@ParentPackage("struts-default")
@Namespace("/")
@Scope("prototype")
public class CustomerAction extends ActionSupport implements ModelDriven<Customer> {

    private Customer customer = new Customer();
    private Integer currPage = 1;

    private Integer pageSize = 5;
    private String uploadFileName;
    private File upload;
    private String uploadContentType;


    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
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

    @Override
    public Customer getModel() {
        return customer;
    }

    @Autowired
    private CustomerService customerService;


    @Action(value = "doSaveUI", results = {@Result(name = "saveUI", location = "/jsp/customer/add.jsp")})
    public String saveUI() {
        return "saveUI";
    }

    @Action(value = "saveCustomer", results = {@Result(name = "success", type = "redirectAction", location = "customerFind")})
    public String saveCustomer() {
        customerService.save(customer);
        return SUCCESS;
    }

    @Action(value = "customerFind", results = {@Result(name = "success", location = "/jsp/customer/list.jsp")})
    public String customerFind() {

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Customer.class);
        if (customer.getCust_name() != null) {
            detachedCriteria.add(Restrictions.like("cust_name", "%" + customer.getCust_name() + "%"));
        }
        if (customer.getBaseDictSource() != null) {
            if (customer.getBaseDictSource().getDict_id() != null && !"".equals(customer.getBaseDictSource().getDict_id())) {
                detachedCriteria.add(Restrictions.eq("baseDictSource.dict_id", customer.getBaseDictSource().getDict_id()));
            }
        }
        if (customer.getBaseDictIndustry() != null) {
            if (customer.getBaseDictIndustry().getDict_id() != null && !"".equals(customer.getBaseDictIndustry().getDict_id())) {
                detachedCriteria.add(Restrictions.eq("baseDictIndustry.dict_id", customer.getBaseDictIndustry().getDict_id()));
            }
        }
        if (customer.getBaseDictLevel() != null) {
            if (customer.getBaseDictLevel().getDict_id() != null && !"".equals(customer.getBaseDictLevel().getDict_id())) {
                detachedCriteria.add(Restrictions.eq("baseDictLevel.dict_id", customer.getBaseDictLevel().getDict_id()));
            }
        }

        PageBean<Customer> pageBean = customerService.findByPage(detachedCriteria, currPage, pageSize);
        ActionContext.getContext().getValueStack().push(pageBean);
        return SUCCESS;
    }

    @Action(value = "deleteCustomer", results = {@Result(name = "success", type = "redirectAction", location = "customerFind")})
    public String deleteCustomer() {
        customer = customerService.findById(customer.getCust_id());
        customerService.delete(customer);
        return SUCCESS;
    }

    @Action(value = "updateCustomer", results = {@Result(name = "success", type = "redirectAction", location = "customerFind")})
    public String updateCustomer() {
        customerService.update(customer);
        return SUCCESS;
    }

    @Action(value = "editCustomer", results = {@Result(name = "success", location = "/jsp/customer/edit.jsp")})
    public String editCustomer() {
        customer = customerService.findById(customer.getCust_id());
        ActionContext.getContext().getValueStack().push(customer);
        return SUCCESS;
    }

    @Action(value = "customer_findAllCustomer")
    public String customer_findAllCustomer() throws IOException {
        List<Customer> customers = customerService.findAll();
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"linkMans", "baseDictLevel", "baseDictIndustry", "baseDictSource"});
        JSONArray jsonArray = JSONArray.fromObject(customers, jsonConfig);
        ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
        ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
        return NONE;
    }
}
