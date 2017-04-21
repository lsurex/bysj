package com.lsure.server.general;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by lsure on 2017/3/15.
 */
public class contextxml {
    private static ApplicationContext applicationContext = null;

    private contextxml() {
    }

    static {
        applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    }

    public static ApplicationContext getApplicationContext() {
        return applicationContext;//返回
    }


}
