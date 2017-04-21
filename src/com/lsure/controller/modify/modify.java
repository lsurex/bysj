package com.lsure.controller.modify;

import com.lsure.server.general.contextxml;
import com.lsure.server.service.modify.service.mdfpswd;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by lsure on 2017/3/28.
 */
@Controller
@RequestMapping("/modify")
public class modify {
    @RequestMapping("/pswd")
    public
    @ResponseBody
    boolean modifyPswd(String recPswd, HttpServletRequest request) {
        mdfpswd mdfPswd = (mdfpswd) contextxml.getApplicationContext().getBean("mdfpswd");
        return mdfPswd.checkPswd(recPswd, request);

    }

    @RequestMapping("/update")
    public
    @ResponseBody
    boolean updatePswd(String newPswd, HttpServletRequest request) {
        mdfpswd mdfPswd = (mdfpswd) contextxml.getApplicationContext().getBean("mdfpswd");
        return mdfPswd.updatePswd(newPswd, (String) request.getSession().getAttribute("userID"));
    }
}
