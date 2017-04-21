package com.lsure.server.service.info.infoServiceImpl;

import com.lsure.server.dao.info.treeviewDao;
import com.lsure.server.entity.js_po;
import com.lsure.server.entity.stuInfo;
import com.lsure.server.service.info.infoService.treeviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/4/20.
 */
@Service("treeviewService")
public class treeviewServiceImpl implements treeviewService {
    @Autowired
    private treeviewDao treeviewdao;

    public List<Map<String, Object>> transefer2Tree(List<js_po> treenode, String pid) {
        if (treenode != null && treenode.size() > 0) {
            List<Map<String, Object>> treelist = new LinkedList<>();
            Map<String, Object> tmp_map = null;
            for (js_po tmp : treenode) {
                tmp_map = new HashMap<>();
                tmp_map.put("id", tmp.getJs_name());
                tmp_map.put("pid", pid);
                tmp_map.put("name", tmp.getJs_name() + "/" + tmp.getQuantityOfstu());
                tmp_map.put("isParent", true);
                treelist.add(tmp_map);
            }
            return treelist;
        }

        return null;
    }

    public List<Map<String, String>> Transfer2Node(List<stuInfo> nodeitem, String pid) {
        if (nodeitem != null && nodeitem.size() > 0) {
            List<Map<String, String>> nodes = new LinkedList<>();
            Map<String, String> tmp_map = null;
            for (stuInfo tmp : nodeitem) {
                tmp_map = new HashMap<>();
                tmp_map.put("id", tmp.getYjs_id());
                tmp_map.put("pid", pid);
                tmp_map.put("name", tmp.getYjs_name());
                nodes.add(tmp_map);
            }
            return nodes;
        }
        return null;

    }

    @Override
    public List<Map<String, Object>> getTree() {
        List<js_po> treenode = treeviewdao.getTreeNode();
        return transefer2Tree(treenode, "root");
    }

    @Override
    public List<Map<String, String>> getNodes(String id) {
        return Transfer2Node(treeviewdao.getNodes(id), id);
    }
}
