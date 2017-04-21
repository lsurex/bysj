package trash.pagingQuery.serviceImpl;

import com.lsure.server.dao.query.pagingQuery;
import com.lsure.server.entity.stuInfo;
import trash.pagingQuery.service.pagingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/3/19.
 */
@Service("pagingService")
public class pagingServiceImpl implements pagingService {
    @Autowired
    private pagingQuery pagingquery;


    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public List<stuInfo> queryStuInfo(int startRow, int pageSize, String priority, HttpServletRequest request) {
        System.out.println("排序方式" + priority);
        return pagingquery.queryforStuinfo(startRow, pageSize, priority);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public int queryCounts() {
        return pagingquery.queryCounts();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public List<stuInfo> fuzzyQuery(String token, String method) {
        if (method.equals("byName"))
            return pagingquery.fuzzyQueryStuinfobyName(token);
        else if (method.equals("byID"))
            return pagingquery.fuzzyQueryStuinfobyID(token);
        else//预留字段
            return null;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public stuInfo fixedquery(String keyword) {
        return pagingquery.queryforfixed(keyword);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public Map<String, String> extensivequery(String keyword) {
        return pagingquery.queryforextensive(keyword);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public List<Map<String, String>> getextensiveItems() {
        return pagingquery.getextensiveItems();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public Integer updatefixed(stuInfo stuinfo) {
        return pagingquery.updatefixed(stuinfo);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public Integer updateextensive(String sql, String yjs_id) {
        return pagingquery.updateextensive(sql, yjs_id);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public Integer deletebatch(List<String> del_list) {

        return pagingquery.deletebatch(del_list);
    }


}
