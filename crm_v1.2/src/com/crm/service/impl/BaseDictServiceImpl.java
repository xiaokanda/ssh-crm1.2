package com.crm.service.impl;

import com.crm.dao.BaseDictDao;
import com.crm.entity.BaseDict;
import com.crm.service.BaseDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BaseDictServiceImpl implements BaseDictService {
    @Autowired
    private BaseDictDao baseDictDao;

    @Override
    public List<BaseDict> findBaseDictByTypeCode(String dict_type_code) {
        return baseDictDao.findBaseDictByTypeCode(dict_type_code);
    }

}
