package com.lsure.server.service.modify.serviceImpl;

import com.lsure.server.dao.modify.mdfPswd;
import com.lsure.server.service.modify.service.mdfpswd;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by lsure on 2017/3/28.
 */
@Service("mdfpswd")
public class mdfpswdImpl implements mdfpswd {
    @Autowired
    private mdfPswd mdfpswd;

    @Override
    public boolean checkPswd(String recPswd, HttpServletRequest request) {
        String currentID = (String) request.getSession().getAttribute("userID");
        String getPswd = mdfpswd.getCurrentPswd(currentID);
        if (getPswd == null) return false;
        if (getPswd.equals(recPswd))
            return true;
        else
            return false;
    }

    @Override
    public boolean updatePswd(String pswd, String name) {
        int result = mdfpswd.updatePswd(pswd, name);
        if (result != 1)
            return false;
        else
            return true;
    }
}
