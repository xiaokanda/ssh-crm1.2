package com.crm.web.action;

import com.crm.service.StatisticsService;
import com.crm.utils.Statistics;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@ParentPackage("struts-default")
@Namespace("/")
@Scope("prototype")
public class StatisticsAction extends ActionSupport implements RequestAware {
    @Autowired
    StatisticsService statisticsService;

    private Map<String, Object> requestMap;

    @Action(value = "sourceStatistics", results = {@Result(name = "sourceStatistics", location = "/jsp/statistics/source.jsp")})
    public String sourceStatisticsAction() {
        List list1 = statisticsService.findAllSource();
        List<Object[]> list2 = statisticsService.findSourceCount();
        JSONArray jsonArray = JSONArray.fromObject(list1);
        String str1 = jsonArray.toString();
       // System.out.println(str1);
        List<Statistics> list = new ArrayList<>();
        for (Object[] o : list2) {
            Statistics s = new Statistics();
            s.setValue(Integer.valueOf(o[1].toString()));
            s.setName((String) o[0]);
            list.add(s);
        }
        jsonArray = JSONArray.fromObject(list);
        String str2 = jsonArray.toString();
        requestMap.put("str1", str1);
        requestMap.put("str2", str2);
        //System.out.println(str2);
        return "sourceStatistics";
    }

    @Action(value = "industryStatistics", results = {@Result(name = "industryStatistics", location = "/jsp/statistics/trade.jsp")})
    public String industryStatisticsAction() {
        List list1 = statisticsService.findAllIndustry();
        List<Object[]> list2 = statisticsService.findIndustryCount();
        JSONArray jsonArray = JSONArray.fromObject(list1);
        String str1 = jsonArray.toString();
        //System.out.println(str1);
        ActionContext.getContext().getValueStack().set("str1", str1);
        List<Statistics> list = new ArrayList<>();
        for (Object[] o : list2) {
            Statistics s = new Statistics();
            s.setValue(Integer.valueOf(o[1].toString()));
            s.setName((String) o[0]);
            list.add(s);
        }
        jsonArray = JSONArray.fromObject(list);
        String str2 = jsonArray.toString();
        ActionContext.getContext().getValueStack().set("str2", str2);

        requestMap.put("str1", str1);
        requestMap.put("str2", str2);
       // System.out.println(str2);
        return "industryStatistics";
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.requestMap = map;
    }
}
