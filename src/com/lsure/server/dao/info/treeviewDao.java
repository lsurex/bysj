package com.lsure.server.dao.info;

import com.lsure.server.entity.js_po;
import com.lsure.server.entity.stuInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by lsure on 2017/4/20.
 */
public interface treeviewDao {
    public List<js_po> getTreeNode();

    public List<stuInfo> getNodes(@Param("tutor") String yjs_tutor);
}
