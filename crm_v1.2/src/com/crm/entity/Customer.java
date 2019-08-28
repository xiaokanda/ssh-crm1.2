package com.crm.entity;

import java.util.Set;

public class Customer {
private Long cust_id;
private String cust_name;
private BaseDict baseDictSource;
private BaseDict baseDictIndustry;
private BaseDict baseDictLevel;
private String cust_phone;
private String cust_mobile;
private Set<LinkMan> linkMans;
public Set<LinkMan> getLinkMans() {
	return linkMans;
}
public void setLinkMans(Set<LinkMan> linkMans) {
	this.linkMans = linkMans;
}
public Long getCust_id() {
	return cust_id;
}
public void setCust_id(Long cust_id) {
	this.cust_id = cust_id;
}
public String getCust_name() {
	return cust_name;
}
public void setCust_name(String cust_name) {
	this.cust_name = cust_name;
}
public BaseDict getBaseDictSource() {
	return baseDictSource;
}
public void setBaseDictSource(BaseDict baseDictSource) {
	this.baseDictSource = baseDictSource;
}
public BaseDict getBaseDictIndustry() {
	return baseDictIndustry;
}
public void setBaseDictIndustry(BaseDict baseDictIndustry) {
	this.baseDictIndustry = baseDictIndustry;
}
public BaseDict getBaseDictLevel() {
	return baseDictLevel;
}
public void setBaseDictLevel(BaseDict baseDictLevel) {
	this.baseDictLevel = baseDictLevel;
}
public String getCust_phone() {
	return cust_phone;
}
public void setCust_phone(String cust_phone) {
	this.cust_phone = cust_phone;
}
public String getCust_mobile() {
	return cust_mobile;
}
public void setCust_mobile(String cust_mobile) {
	this.cust_mobile = cust_mobile;
}

}
