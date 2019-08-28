package com.crm.dao;

import java.util.List;

public interface StatisticsDao {
    public List findAllSource();
    public List findAllIndustry();
    public List<Object[]> findSourceCount();
    public List<Object[]> findIndustryCount();
}
