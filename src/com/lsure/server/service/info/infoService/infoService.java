package com.lsure.server.service.info.infoService;

import com.lsure.server.entity.individual;
import com.lsure.server.entity.stuInfo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/4/19.
 */
public interface infoService {
    public List<individual> getstudents(String tutorid);

    public Map<String, Object> getIndividual(String yjs_id, String tutor_id, HttpServletRequest request);

    public int deleteBatch(List<String> list_id, String tutorid,String role);

    public int updateindividual(Map<String, String> info);

    public int insertindividual(Map<String, String> info);
}
