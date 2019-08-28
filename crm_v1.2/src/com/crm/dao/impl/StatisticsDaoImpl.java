package com.crm.dao.impl;

import com.crm.dao.StatisticsDao;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;


public class StatisticsDaoImpl extends HibernateDaoSupport implements StatisticsDao {
    public List findAllSource() {
        String sql = "select dict_item_name from base_dict where dict_type_code = 002 order by dict_item_name DESC";
        Session session = this.getSessionFactory().openSession();
        List list = session.createSQLQuery(sql).list();
        session.close();
        return list;
    }

    public List findAllIndustry() {
        String sql = "select dict_item_name from base_dict where dict_type_code = 001 order by dict_item_name DESC";
        Session session = this.getSessionFactory().openSession();
        List list = session.createSQLQuery(sql).list();
        session.close();
        return list;
    }

    public List<Object[]>findSourceCount() {
        String sql = "select dict.dict_item_name ,count(*) as count " +
                "from cst_customer cust JOIN  " +
                "(SELECT dict_id,dict_item_name from base_dict where dict_type_code =002) dict " +
                "on cust.cust_source = dict.dict_id " +
                "GROUP BY dict.dict_item_name " +
                "order by dict.dict_item_name DESC";
        Session session = this.getSessionFactory().openSession();
        //List list = session.createSQLQuery(sql).list();
        List<Object[]> list=session.createSQLQuery(sql).list();
        session.close();
        return list;
    }

    public List<Object[]> findIndustryCount() {
        String sql = "select dict.dict_item_name ,count(*) as count " +
                "from cst_customer cust JOIN  " +
                "(SELECT dict_id,dict_item_name from base_dict where dict_type_code =001) dict " +
                "on cust.cust_industry = dict.dict_id " +
                "GROUP BY dict.dict_item_name " +
                "order by dict.dict_item_name DESC";
        Session session = this.getSessionFactory().openSession();
        //List list = session.createSQLQuery(sql).list();
        List<Object[]> list=session.createSQLQuery(sql).list();
        session.close();
        return list;
    }
}
