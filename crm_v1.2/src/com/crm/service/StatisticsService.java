package com.crm.service;

import java.util.List;

public interface StatisticsService {
    public List findAllSource();
    public List findAllIndustry();
    public List<Object[]> findSourceCount();
    public List<Object[]> findIndustryCount();
}
