package com.lsure.controller.validate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by lsure on 2017/3/14.
 */
@Controller
public class dovalidate {
    @RequestMapping("/doValidate")
    public @ResponseBody boolean judge(String validatecode, HttpServletRequest request)
    {
        String codeShould= (String) request.getSession().getAttribute("validateCode");
        System.out.print("get:"+validatecode+"should"+codeShould+"\n");
       if(codeShould.toLowerCase().equals(validatecode.toLowerCase()))
           return  true;
        else
            return false;
    }

}
