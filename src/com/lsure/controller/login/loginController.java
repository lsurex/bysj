package com.lsure.controller.login;

import com.lsure.server.entity.userInfo;
import com.lsure.server.general.contextxml;
import com.lsure.server.service.login.service.loginService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by lsure on 2017/3/13.
 */
@Controller
public class loginController {
   /* @RequestMapping("/ls")
    public
    @ResponseBody
    String ls(String ls) {
        System.out.print(ls);
        return "123";
    }*/

    @RequestMapping("/loginValidate")
    public
    @ResponseBody
    String loginjudge(String userID, String userPswd, String userRole, HttpServletRequest request) {
        loginService loginservice = contextxml.getApplicationContext().getBean(loginService.class);//注入服务
        userInfo currentUser = loginservice.validateAccount(userID, userPswd, userRole);
        System.out.print(userID);
        System.out.println(currentUser);
        if (currentUser == null)
            return "failed";
        else {
            /*用户验证通过*/
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("userName", currentUser.getUserName());//注入用户名
            httpSession.setAttribute("userRole", currentUser.getUserRole() == null ? "学生" : currentUser.getUserRole());//注入角色
            httpSession.setAttribute("userID", userID);//注入学号
            //httpSession.setAttribute("userLevel", currentUser.getUserLevel());//权限级别
       /* model.addAttribute("username",userAccount);*/
            return "success";
        }

    }

}
