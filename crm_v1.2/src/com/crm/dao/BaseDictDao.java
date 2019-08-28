package com.crm.dao;

import com.crm.entity.BaseDict;

import java.util.List;

public interface BaseDictDao extends BaseDao<BaseDict>{

	List<BaseDict> findBaseDictByTypeCode(String dict_item_code);

}
