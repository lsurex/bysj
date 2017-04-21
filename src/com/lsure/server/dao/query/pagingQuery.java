package com.lsure.server.dao.query;

import com.lsure.server.entity.stuInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.plugin.Interceptor;

import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/3/19.
 */
public interface pagingQuery {
    public List<stuInfo> queryforStuinfo(@Param("startRow") Integer startRow, @Param("pageSize") Integer pageSize, @Param("priority") String priority);

    public Integer queryCounts();

    public List<stuInfo> fuzzyQueryStuinfobyName(@Param("token") String furrytokenName);

    public List<stuInfo> fuzzyQueryStuinfobyID(@Param("token") String furrytokenID);

    public stuInfo queryforfixed(@Param("keyword") String keyword);

    public Map<String, String> queryforextensive(@Param("keyword") String keyword);

    public List<Map<String, String>> getextensiveItems();

    public Integer updatefixed(stuInfo stuinfo);

    public Integer updateextensive(@Param("sql") String sql, @Param("yjs_id") String yjs_id);

    public Integer deletebatch(List<String> stuid);
}
