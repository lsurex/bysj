package com.lsure.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by lsure on 2017/3/13.
 */
public class loginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        System.out.println("拦截器已经启动");
        String url = httpServletRequest.getRequestURI();
        System.out.print(url.toString());
        if (url.toString().equals("/loginValidate") || url.toString().equals("/validate/code") || url.toString().equals("/doValidate") || url.toString().equals("/login")) {
            System.out.println("此次申请为登陆验证，验证给予通过");
            return true;
        }

        String userRole = (String) httpServletRequest.getSession().getAttribute("userRole");
        /*未经登录访问*/
        if (userRole == null || userRole.isEmpty()) {
            httpServletRequest.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(httpServletRequest, httpServletResponse);
            return false;
        } else {
            return true;
        }
       /* if(user!=null)
            return  true;
        System.out.println("请求已被拦截，转发倒登陆界面");

         *//*httpServletResponse.sendRedirect("/login");*/
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }

}
