package trash.pagingQuery.serviceImpl;

import com.lsure.server.dao.query.info_admin;
import com.lsure.server.entity.js_po;
import com.lsure.server.entity.stuInfo;
import com.lsure.server.entity.tbStructure;
import trash.pagingQuery.service.info_adminServce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/4/12.
 */
@Service("info_adminServce")
public class info_adminServiceImpl implements info_adminServce {
    @Autowired
    private info_admin infodao;

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
    @Transactional
    public List<Map<String, Object>> getTree() {
        List<js_po> treenode = infodao.getTreeNode();
        return transefer2Tree(treenode, "root");
    }

    @Override
    @Transactional
    public List<Map<String, String>> getNodes(String id) {
        return Transfer2Node(infodao.getNodes(id), id);
    }

    @Override
    @Transactional
    public List<Map<String, String>> specificStuInfo(String id) {
        List<tbStructure> tbStructures = infodao.getTableStructure();
        Map<String, String> stuinfoMap = infodao.getSpecificStuInfo(id);
        Map<String, String> resultMap = null;
        List<Map<String, String>> resultList = new LinkedList<>();
        if (tbStructures != null && tbStructures.size() > 0 && stuinfoMap != null) {

            for (tbStructure tmptb : tbStructures) {
                resultMap = new HashMap<>();
                if (tmptb.getJlb_visibility().equals("hidden"))
                    continue;
                resultMap.put("belonging", tmptb.getJlb_belonging());
                resultMap.put("bz", tmptb.getJlb_bz());
                resultMap.put("data", stuinfoMap.get(tmptb.getJlb_lm()));
                resultMap.put("lm", tmptb.getJlb_lm());
                resultList.add(resultMap);
            }


        }
        return resultList;
    }

    @Override
    @Transactional
    public List<tbStructure> getTableStructure() {
        return infodao.getTableStructure();
    }

    @Override
    public Integer alterSpecific(String sql) {
        infodao.alterSpecificStuInfo(sql);
        return null;
    }
}
