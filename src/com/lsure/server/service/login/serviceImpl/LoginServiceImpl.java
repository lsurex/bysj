package com.lsure.server.service.login.serviceImpl;

import com.lsure.server.dao.login.logindao;
import com.lsure.server.entity.userInfo;
import com.lsure.server.service.login.service.loginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lsure on 2017/3/15.
 */
@Service("loginService")
public class LoginServiceImpl implements loginService {
    @Autowired
    private logindao loginDao;

  /*  @Override
    public userInfo validateAccount(String userName, String userPswd) {
        userInfo currentUser;
        System.out.println(userName+userPswd);
        currentUser = loginDao.getPassword(userName);
        if (currentUser == null) {
            System.out.println("查无此人！");
            return null;
        } else if (!currentUser.getUserPswd().equals(userPswd)) {
            System.out.println("密码匹配错误!");
            return null;
        } else {
            return currentUser;
        }
    }*/

    @Override
    public userInfo validateAccount(String userName, String userPswd, String userRole) {
        userInfo userinfo = null;
        if (userRole.equals("teacher")) {
            userinfo = loginDao.js_getPassword(userName);

        } else if (userRole.equals("student")) {
            userinfo = loginDao.yjs_getPassword(userName);
        } else {
            return null;
        }
        if (userinfo == null) {
            return null;
        } else if (!userinfo.getUserPswd().equals(userPswd)) {
            return null;
        } else {
            return userinfo;
        }

    }
}
