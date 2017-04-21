package com.lsure.server.test;

import com.lsure.server.dao.attendence.attendencedao;
import com.lsure.server.dao.query.info_admin;
import com.lsure.server.general.contextxml;
import com.lsure.server.general.infinity.powerofNature.globals;
import com.lsure.server.service.attendence.attendence.attendence;
import trash.pagingQuery.service.pagingService;
import trash.yjs_xx.service.kzxxService;
import org.junit.Test;
import trash.yjs_xx.tb_alter.tb_alter;

/**
 * Created by lsure on 2017/3/10.
 */
public class unittest {
    /*@Autowired
     private dao.userdao userdao1;
     @Test

     public void test1()
     {
       *//*  HttpServer.class.getResourceAsStream()*//*
        System.out.print(userdao1.getPswd("123"));
    }*/
   /* @Test
    public void test2() {
        loginService loginService = (loginService) contextxml.getApplicationContext().getBean("loginService");
        userInfo userInfo = loginService.validateAccount("20133744", "199639xls");
        System.out.print(userInfo);
    }*/

    @Test
    public void test4() {
        pagingService temp = (pagingService) contextxml.getApplicationContext().getBean("pagingService");
/*    System.out.print( temp.queryStuInfo(0,100));*/
    }

    @Test
    public void test6() {
        kzxxService kzxxService1 = (kzxxService) contextxml.getApplicationContext().getBean("kzxxService");
        kzxxService1.kzxx_add("test", "VARCHAR(20)", "123");

    }

    @Test
    public void test7() {
        tb_alter kzxxService1 = contextxml.getApplicationContext().getBean(tb_alter.class);
        System.out.println(kzxxService1.jlb_query(globals.TABLE_FIXED_YJSXXB_RECORD));
        System.out.println(kzxxService1.jlb_query(globals.TABLE_EXTENSIBLE_YJSXXB_RECORD));
    }

    @Test
    public void test8() {
        try {
            kzxxService kzxxService1 = (kzxxService) contextxml.getApplicationContext().getBean("kzxxService");
            kzxxService1.kzxx_add("test", "VARCHAR(20)", "123");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Test
    public void test9() {
        attendencedao ad = contextxml.getApplicationContext().getBean(attendencedao.class);
        /*System.out.println(ad.getTimeKeepingID("admin"));*/
    }

    @Test
    public void test10() {
        /*attendencedao ad = contextxml.getApplicationContext().getBean(attendencedao.class);
        System.out.println(ad.getCurrentAbsent("admin"));*/
    }

    @Test
    public void test11() {
        contextxml.getApplicationContext().getBean(attendence.class).getSpecificDateAttendence("2017-04-11", "admin");
    }

    @Test
    public void test12() {
  /*  *//*    List<js_po> pos = contextxml.getApplicationContext().getBean(info_admin.class).getSpecific();*//*
        System.out.print(pos);*/
    }

    @Test
    public void test13() {
        System.out.print(contextxml.getApplicationContext().getBean(info_admin.class).getNodes("123"));
    }

    @Test
    public void test14() {
        System.out.println(contextxml.getApplicationContext().getBean(info_admin.class).getSpecificStuInfo("20133744"));
    }

    @Test
    public void test15() {
        System.out.println(contextxml.getApplicationContext().getBean(info_admin.class).getTableStructure());
    }

    @Test
    public void test19() {
        // java.util.Date date = new java.util.Date("2017-04-01");

        ///  System.out.println(contextxml.getApplicationContext().getBean(attendencedao.class).getMonthTimekeepingview("123", "2017-04-01", "2017-05-01"));
    }

    @Test
    public void test21()

    {
        attendence x = contextxml.getApplicationContext().getBean(attendence.class);

        System.out.println(x.getMonthview("123", "2017-04-01", "2017-05-01"));

    }
}
