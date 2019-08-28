package com.crm.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * @Author: GuanZH
 * @Mood: Pumped Up
 * @Date: 2018/12/24 20:53
 **/

public class Role {
    private long roleId;
    private String roleName;
    private String roleMemo;
    private Set<UserRole> userRoles = new HashSet<UserRole>();

    public Set<UserRole> getUserRoles() {
        return userRoles;
    }

    public void setUserRoles(Set<UserRole> userRoles) {
        this.userRoles = userRoles;
    }

    public long getRoleId() {
        return roleId;
    }

    public void setRoleId(long roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleMemo() {
        return roleMemo;
    }

    public void setRoleMemo(String roleMemo) {
        this.roleMemo = roleMemo;
    }

}
