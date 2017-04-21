package com.lsure.server.dao.advance;

import com.lsure.server.entity.tbStructure;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/4/18.
 */
public interface advanceDao {
    public List<tbStructure> getInputTableItems();

    public List<Map<String, String>> getDeletableItems();

    public int insertStudents(@Param("sql") String sql);

    public int deleteTableItem(@Param("jlb_lm") String jlb_lm);

    public int syncjlb(@Param("jlb_lm") String jlb_lm);

    public int addTableItem(@Param("jlb_lm") String jlb_lm, @Param("comment") String comment, @Param("type") String type);

    public int syncAddjlb(@Param("jlb_lm") String jlb_lm, @Param("comment") String comment, @Param("type") String type);

}
