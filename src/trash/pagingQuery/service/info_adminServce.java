package trash.pagingQuery.service;

import com.lsure.server.entity.tbStructure;

import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/4/12.
 */
public interface info_adminServce {
    public List<Map<String, Object>> getTree();

    public List<Map<String, String>> getNodes(String id);

    public List<Map<String, String>> specificStuInfo(String id);

    public List<tbStructure> getTableStructure();

    public Integer alterSpecific(String sql);
}
