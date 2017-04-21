package com.lsure.server.dao.login;

import com.lsure.server.entity.userInfo;
import org.apache.ibatis.annotations.Param;

/**
 * Created by lsure on 2017/3/15.
 */
public interface logindao {
    public userInfo js_getPassword(@Param("userid") String userid);

    public userInfo yjs_getPassword(@Param("userid") String userid);
}
