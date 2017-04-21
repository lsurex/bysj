package com.lsure.server.service.login.service;

import com.lsure.server.entity.userInfo;

/**
 * Created by lsure on 2017/3/15.
 */
public interface loginService {
    public userInfo validateAccount(String userName, String userPswd, String userRole);
}
