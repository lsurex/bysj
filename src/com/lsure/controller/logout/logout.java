package com.lsure.controller.logout;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by lsure on 2017/3/18.
 */
@Controller
public class logout {
    @RequestMapping("/logout")
    public String dologout(HttpServletRequest request)
    {
      HttpSession session= request.getSession();
        session.removeAttribute("userName");
        session.removeAttribute("userID");
        session.removeAttribute("userRole");
        System.out.println("remove success");
        return "/login";
    }
}
