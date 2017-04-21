package com.lsure.filter;

import javax.servlet.*;
import java.io.IOException;

/**
 * Created by lsure on 2017/4/20.
 */
public class encodingFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletRequest.setCharacterEncoding("utf-8");
        filterChain.doFilter(servletRequest, servletResponse);
    }
}
