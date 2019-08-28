package com.crm.web.interceptor;

import com.crm.entity.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class PrivilegeInterceptor extends MethodFilterInterceptor {

    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
        User ifuser = (User) ActionContext.getContext().getSession().get("ifuser");
        if (ifuser == null) {
            ActionSupport actionSupport = (ActionSupport) actionInvocation.getAction();
            actionSupport.addActionError("请先登录！");
            return actionSupport.LOGIN;
        } else {
            return actionInvocation.invoke();
        }
    }

}
