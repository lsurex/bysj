package com.lsure.server.service.info.infoService;

import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/4/20.
 */
public interface treeviewService {
    public List<Map<String, Object>> getTree();

    public List<Map<String, String>> getNodes(String id);
}
