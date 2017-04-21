package com.lsure.server.dao.info;

import com.lsure.server.entity.individual;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/4/19.
 */
public interface infoDao {
    public List<individual> getstudents(@Param("tutorid") String tutorid);

    public Map<String, Object> getIndividual(@Param("yjs_id") String yjs_id, @Param("yjs_tutor") String yjs_tutor,@Param("role")String role);

    public int deleteBatch(@Param("list") List<String> list_id, @Param("tutorid") String tutorid,@Param("role")String role);

    public int updateindividual(@Param("sql") String sql);

    public int insertindividual(@Param("sql") String sql);
}
