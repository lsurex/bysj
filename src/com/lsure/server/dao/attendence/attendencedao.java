package com.lsure.server.dao.attendence;

import com.lsure.server.entity.stuInfo;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/4/10.
 */
public interface attendencedao {
    public List<stuInfo> getTimeKeeping(@Param("date") Date date, @Param("tutorid") String tutorid);/*获取正常出勤人数*/

    public List<stuInfo> getCurrentAbsent(@Param("date") Date date, @Param("tutorid") String tutorid);/*获取当前缺勤人数*/

    public List<stuInfo> getArrivalLate(@Param("date") Date date, @Param("tutorid") String tutorid);/*获取迟到*/

    public List<Map<String, String>> getAllstuinfo(@Param("tutorid") String tutorid);

    public List<Map<String, Object>> getSpecificRcord(@Param("studentid") String studentid);

    public List<Map<String, Object>> getSpecificAttendence(@Param("studentid") String studentid);

    public List<Map<String, Object>> getMonthTimekeepingview(@Param("yjs_tutor") String tutor, @Param("start_date") Date start_date, @Param("end_date") Date end_date);

    public List<Map<String, Object>> getMonthAttendanceview(@Param("yjs_tutor") String tutor, @Param("start_date") Date start_date, @Param("end_date") Date end_date);


}
