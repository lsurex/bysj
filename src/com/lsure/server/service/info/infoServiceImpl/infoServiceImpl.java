package com.lsure.server.service.info.infoServiceImpl;

import com.lsure.server.dao.info.infoDao;
import com.lsure.server.entity.individual;
import com.lsure.server.entity.stuInfo;
import com.lsure.server.service.info.infoService.infoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/4/19.
 */
@Service("infoService")
public class infoServiceImpl implements infoService {
    @Autowired
    private infoDao infodao;

    @Override
    public List<individual> getstudents(String tutorid) {
        return infodao.getstudents(tutorid);
    }

    @Override
    public Map<String, Object> getIndividual(String yjs_id, String tutor_id, HttpServletRequest request) {
        String role = (String) request.getSession().getAttribute("userRole");
        return infodao.getIndividual(yjs_id, tutor_id, role);
    }

    @Override
    public int deleteBatch(List<String> list_id, String tutorid,String role) {
        return infodao.deleteBatch(list_id, tutorid,role);
    }

    @Override
    public int updateindividual(Map<String, String> info) {
        String yjs_id = info.get("yjs_id");
        StringBuilder sb = new StringBuilder("update yjs_xxb set ");
        for (Map.Entry key : info.entrySet()) {
            sb.append((String) key.getKey() + "='" + (String) key.getValue() + "',");
        }
        sb.deleteCharAt(sb.length() - 1);
        sb.append(" where yjs_id='" + yjs_id + "'");
        infodao.updateindividual(sb.toString());

        return 0;
    }

    @Override
    public int insertindividual(Map<String, String> info) {
        StringBuilder sql1 = new StringBuilder("insert into yjs_xxb ( ");
        StringBuilder sql2 = new StringBuilder("values (");
        for (Map.Entry key : info.entrySet()) {
            sql1.append((String) key.getKey() + ",");
            sql2.append("'" + (String) key.getValue() + "'" + ",");
        }
        sql1.deleteCharAt(sql1.length() - 1);
        sql1.append(" ) ");
        sql2.deleteCharAt(sql2.length() - 1);
        sql2.append(" ) ");
        sql1.append(sql2);
        infodao.insertindividual(sql1.toString());
        return 0;
    }
}
