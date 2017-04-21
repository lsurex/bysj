package com.lsure.controller.record;

import com.lsure.server.entity.monthView;
import com.lsure.server.entity.stuInfo;
import com.lsure.server.general.contextxml;
import com.lsure.server.service.attendence.attendence.attendence;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.print.DocFlavor;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/4/11.
 */
@Controller
@RequestMapping("/dailyRecord")
public class record {
    private ApplicationContext applicationcontext = null;
    attendence attendenceService = null;

    {
        applicationcontext = contextxml.getApplicationContext();
        attendenceService = applicationcontext.getBean(attendence.class);
    }

    @RequestMapping("/attendance")
    public
    @ResponseBody
    Map<String, List<stuInfo>> attendence(HttpServletRequest req, String specific) {

        Map<String, List<stuInfo>> content = null;
        try {
            /*req.getSession().getAttribute()*/
            content = attendenceService.getSpecificDateAttendence(specific, "admin");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return content;
        }
    }

    @RequestMapping("/getstus")
    public
    @ResponseBody
    List<Map<String, String>> getOwnstudents() {
        return attendenceService.getOwnstudent("admin");
    }

    @RequestMapping("/getRecord")
    public
    @ResponseBody
    List<Map<String, Object>> getspecificRecord(String id) {
        return attendenceService.getSpecificRecord(id);
    }


    @RequestMapping("/getAttendance")
    public
    @ResponseBody
    List<Map<String, Object>> getspecificAttendance(String id) {
        return attendenceService.getSpecificAttendance(id);
    }


    @RequestMapping("/getMonthView")
    public
    @ResponseBody
    List<monthView> getMonthview(HttpServletRequest request, String startdate, String enddate, String tutorid) {
        String role = (String) request.getSession().getAttribute("userRole");
        String username = (String) request.getSession().getAttribute("userName");
        if (role.equals("admin"))
            return attendenceService.getMonthview(tutorid, startdate, enddate);
        else if (role.equals("teacher"))
            return attendenceService.getMonthview(username, startdate, enddate);
        else return null;
    }
}
