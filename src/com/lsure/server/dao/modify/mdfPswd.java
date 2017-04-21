package com.lsure.server.dao.modify;

import org.apache.ibatis.annotations.Param;

/**
 * Created by lsure on 2017/3/28.
 */
public interface mdfPswd {
    public String getCurrentPswd(@Param("currentid") String currentid);

    public int updatePswd(@Param("newPswd") String newPswd, @Param("currentid") String currentid);
}
