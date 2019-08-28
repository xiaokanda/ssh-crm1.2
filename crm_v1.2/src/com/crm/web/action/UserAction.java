package com.crm.web.action;

import com.crm.entity.Customer;
import com.crm.entity.User;
import com.crm.service.CustomerService;
import com.crm.service.LinkManService;
import com.crm.service.SaleVisitService;
import com.crm.service.UserService;
import com.crm.utils.PageBean;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.util.List;

@Controller
@ParentPackage("struts-default")
@Namespace("/")
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User> {

    @Autowired
    private UserService userService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private LinkManService linkManService;

    @Autowired
    private SaleVisitService saleVisitService;

    private User user = new User();

    @Override
    public User getModel() {
        return user;
    }

    private Integer currPage = 1;

    private Integer pageSize = 5;

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

    private String repassword;

    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }

    @Action(value = "doRegist", results = {@Result(name = "login", location = "/login.jsp"), @Result(name = "error", location = "/regist.jsp")})
    public String regist() {
        if (user.getUser_password() == null || "".equals(user.getUser_password())) {
            this.addActionError("密码不能为空！");
            return ERROR;
        }
        if (repassword == null || !user.getUser_password().equals(repassword)) {
            this.addActionError("两次密码不一致！");
            return ERROR;
        }
       // System.out.println(user.getUser_name()+user.getUser_password());
        userService.regist(user);
        return LOGIN;
    }

    @Action(value = "doLogin", results = {@Result(name = "success",type ="redirect",location = "/index.jsp"), @Result(name = "error", location = "/login.jsp")})
    public String login() {
        User ifuser = userService.login(user);
        if (ifuser == null) {
            this.addActionError("用户名或密码错误！");
            return ERROR;
        } else {
            ActionContext.getContext().getSession().put("ifuser", ifuser);
        }
        return SUCCESS;
    }

    @Action(value = "user_findAllUser")
    public String user_findAllUser() throws IOException {
        List<User> users = userService.findAll();
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"userRoles"});
        JSONArray jsonArray = JSONArray.fromObject(users, jsonConfig);
        ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
        ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
        return NONE;
    }

    @Action(value = "user_getAll", results = {@Result(name = "success", location = "/jsp/user/list.jsp")})
    public String findAll() {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(User.class);
        PageBean<User> userPageBean = userService.findByPage(detachedCriteria, currPage, pageSize);
        ActionContext.getContext().getValueStack().push(userPageBean);
        return SUCCESS;
    }

    @Action(value = "homeUI", results = {@Result(name = "success", location = "/home.jsp")})
    public String homeUI() {
        List<Customer> customerList = customerService.findAll();
        int size = customerList.size();
        String s = String.valueOf(size);
        ActionContext.getContext().getValueStack().set("s", s);

        int count = linkManService.findCount();
        String ss = String.valueOf(count);
        ActionContext.getContext().getValueStack().set("ss", ss);

        int a = saleVisitService.findCount();
        String sss = String.valueOf(a);
        ActionContext.getContext().getValueStack().set("sss", sss);
        return SUCCESS;
    }

    public String doStop() {
        return SUCCESS;
    }
}
