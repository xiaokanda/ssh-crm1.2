package com.crm.service;

import com.crm.entity.BaseDict;

import java.util.List;


public interface BaseDictService {

	List<BaseDict> findBaseDictByTypeCode(String dict_item_code);

}
