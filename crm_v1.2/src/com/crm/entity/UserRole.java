package com.crm.entity;

import java.io.Serializable;

/**
 * @Author: GuanZH
 * @Mood: Pumped Up
 * @Date: 2018/12/24 20:53
 **/

public class UserRole implements Serializable {
    private long roleId;
    private long userId;

    private Role role;
    private User user;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public long getRoleId() {
        return roleId;
    }

    public void setRoleId(long roleId) {
        this.roleId = roleId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

}
