package com.crm.service.impl;

import com.crm.dao.StatisticsDao;
import com.crm.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatisticsServiceImpl implements StatisticsService {
    @Autowired
    public StatisticsDao statisticsDao;

    @Override
    public List findAllSource() {
        return statisticsDao.findAllSource();
    }

    @Override
    public List findAllIndustry() {
        return statisticsDao.findAllIndustry();
    }

    @Override
    public List<Object[]> findSourceCount() {
        return statisticsDao.findSourceCount();
    }

    @Override
    public List<Object[]> findIndustryCount() {
        return statisticsDao.findIndustryCount();
    }
}
