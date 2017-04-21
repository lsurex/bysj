package trash.pagingQuery.service;

import com.lsure.server.entity.stuInfo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/3/19.
 */
public interface pagingService {
    public List<stuInfo> queryStuInfo(int startRow, int pageSize, String priority, HttpServletRequest request);

    public int queryCounts();

    public List<stuInfo> fuzzyQuery(String token, String method);

    public stuInfo fixedquery(String keyword);

    public Map<String, String> extensivequery(String keyword);

    public List<Map<String, String>> getextensiveItems();

    public Integer updatefixed(stuInfo stuinfo);

    public Integer updateextensive(String sql, String yjs_id);

    public Integer deletebatch(List<String> del_list);
}
