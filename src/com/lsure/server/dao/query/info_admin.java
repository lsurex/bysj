package com.lsure.server.dao.query;

import com.lsure.server.entity.jlb_po;
import com.lsure.server.entity.js_po;
import com.lsure.server.entity.stuInfo;
import com.lsure.server.entity.tbStructure;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/4/12.
 */
public interface info_admin {
    /*获取Tree的节点*/
    public List<js_po> getTreeNode();

    public List<stuInfo> getNodes(@Param("tutor") String yjs_tutor);

    /*获取用户信息存储到map中*/
    public Map<String, String> getSpecificStuInfo(@Param("yjs_id") String yjs_id);

    /*获取可见表结构*/
    public List<tbStructure> getTableStructure();

    /*删除指定学生*/
    public Integer delSpecifucStuInfo(@Param("yjs_id") String yjs_id);

    /*修改指定学生信息*/
    public Integer alterSpecificStuInfo(@Param("sql") String sql);


}
