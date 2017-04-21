package com.lsure.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by lsure on 2017/3/13.
 */
@WebFilter(filterName = "loginFilter")
public class loginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request=(HttpServletRequest)req;
        HttpServletResponse response=(HttpServletResponse)resp;
        String uri=request.getRequestURI();
            if(uri.endsWith(".jsdada")) {
                System.out.println("无效的请求,已经重定向到登录界面");
                response.sendRedirect("/loginService");
                return;
            }
            chain.doFilter(request,response);
        }




    public void init(FilterConfig config) throws ServletException {

    }

}
