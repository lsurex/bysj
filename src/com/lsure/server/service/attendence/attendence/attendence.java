package com.lsure.server.service.attendence.attendence;

import com.lsure.server.entity.monthView;
import com.lsure.server.entity.stuInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/4/11.
 */
public interface attendence {
    public Map<String, List<stuInfo>> getSpecificDateAttendence(String date, String tutor);

    public List<Map<String, String>> getOwnstudent(String tutorid);

    public List<Map<String, Object>> getSpecificRecord(String studentid);

    public List<Map<String, Object>> getSpecificAttendance(String studentid);

    public List<monthView> getMonthview(String studentid, String startdate, String enddate);

}
