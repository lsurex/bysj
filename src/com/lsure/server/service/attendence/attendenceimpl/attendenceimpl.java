package com.lsure.server.service.attendence.attendenceimpl;

import com.lsure.server.dao.attendence.attendencedao;
import com.lsure.server.entity.monthView;
import com.lsure.server.entity.stuInfo;
import com.lsure.server.service.attendence.attendence.attendence;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/4/11.
 */
@Service("attendence")
public class attendenceimpl implements attendence {
    @Autowired
    private attendencedao attenddao;


    private List<Map<String, String>> ownsudents = null;


    @Override
    public Map<String, List<stuInfo>> getSpecificDateAttendence(String date, String tutor) {
        /*String 无法直接转换为sql.date*/
        /*先将其转换为util.date*/
        Map<String, List<stuInfo>> content = null;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            java.util.Date util_date = simpleDateFormat.parse(date);
            System.out.println(util_date.toString());
            if (util_date.compareTo(new java.util.Date()) > 0) {
                System.out.println("时间超前");
                return null;
            }
            Date sql_date = new Date(util_date.getTime());
            System.out.println("查询时间为" + sql_date.toString());
            content = new HashMap<>();
            content.put("absent", attenddao.getCurrentAbsent(sql_date, "admin"));
            content.put("late", attenddao.getArrivalLate(sql_date, "admin"));
            content.put("normal", attenddao.getTimeKeeping(sql_date, "admin"));
            System.out.print(content);
            return content;

        } catch (ParseException e) {
            e.printStackTrace();
            System.out.println("解析失败");
        } finally {
            return content;
        }

    }

    @Override
    public List<Map<String, String>> getOwnstudent(String tutorid) {
        ownsudents = attenddao.getAllstuinfo(tutorid);
        return ownsudents;
    }

    @Override
    public List<Map<String, Object>> getSpecificRecord(String studentid) {
        return attenddao.getSpecificRcord(studentid);

    }

    @Override
    public List<Map<String, Object>> getSpecificAttendance(String studentid) {

        return attenddao.getSpecificAttendence(studentid);

    }

    @Override
    public List<monthView> getMonthview(String js_id, String startdate, String enddate) {
        if (startdate == null || startdate.isEmpty() || enddate == null || enddate.isEmpty() || js_id == null || js_id.isEmpty())
            return null;
        try {
            getOwnstudent(js_id);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date datestart_util = simpleDateFormat.parse(startdate);
            java.util.Date dateend_util = simpleDateFormat.parse(enddate);
            Date datestart_sql = new Date(datestart_util.getTime());
            Date dateend_sql = new Date(dateend_util.getTime());
            List<Map<String, Object>> attendace_list = attenddao.getMonthAttendanceview(js_id, datestart_sql, dateend_sql);
            System.out.print(attendace_list);
            List<Map<String, Object>> ontime_list = attenddao.getMonthTimekeepingview(js_id, datestart_sql, dateend_sql);
            System.out.print(ontime_list);
            Map<String, Long> ontimer = new HashMap<>();
            Map<String, Long> allattendace = new HashMap<>();
            /*转换成Map视图*/
            for (Map<String, Object> tmp : ontime_list) {
                ontimer.put((String) tmp.get("yjs_id"), (Long) tmp.get("ontime_count"));
            }
            for (Map<String, Object> tmp : attendace_list) {
                allattendace.put((String) tmp.get("yjs_id"), (Long) tmp.get("arrival_count"));
            }
            List<monthView> monthViews = new LinkedList<>();
            for (Map<String, String> tmp : ownsudents) {
                monthView stu_recordentity = new monthView();
                String id = tmp.get("yjs_id");
                stu_recordentity.setStu_id(id);
                stu_recordentity.setStu_name(tmp.get("yjs_name"));
                stu_recordentity.setOntime_count(ontimer.get(id) == null ? new Long(0) : ontimer.get(id));/*按时到达的天数*/
                stu_recordentity.setLate_count((allattendace.get(id) == null ? new Long(0) : allattendace.get(id)) - stu_recordentity.getOntime_count());/*迟到的是所有出勤记录减去准时到达的*/
                Integer days = new Long((dateend_util.getTime() - datestart_util.getTime()) / (1000 * 60 * 60 * 24)).intValue();
                stu_recordentity.setAbsent_count(days - (allattendace.get(id) == null ? 0 : allattendace.get(id)));//天数-全部出勤记录
                stu_recordentity.setPeriod(days);
                monthViews.add(stu_recordentity);
            }
            System.out.print(monthViews);
            return monthViews;

        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
}
