package com.lsure.server.service.modify.service;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by lsure on 2017/3/28.
 */
public interface mdfpswd {
    public boolean checkPswd(String recPswd , HttpServletRequest request);
    public boolean updatePswd(String pswd,String name);
}
