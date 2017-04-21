package com.lsure.server.service.advance.advanceServiceImpl;

import com.lsure.server.dao.advance.advanceDao;
import com.lsure.server.entity.tbStructure;
import com.lsure.server.service.advance.advanceService.advanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Created by lsure on 2017/4/18.
 */
@Service("advanceService")
public class advanceServiceImpl implements advanceService {
    @Autowired
    private advanceDao advancedao;
    private List<tbStructure> currentTabstructure;/*当前总表结构*/
    private List<Map<String, String>> inputTableItems;/*存储需要输入的列名*/

    @Override

    public List<Map<String, String>> getInputTableItems() {
        currentTabstructure = advancedao.getInputTableItems();
        if (currentTabstructure == null || currentTabstructure.size() <= 0)
            return null;
        Map<String, String> itemMap = null;
        inputTableItems = new LinkedList<>();
        for (tbStructure tmp : currentTabstructure) {
            itemMap = new HashMap<>();
            itemMap.put("jlb_bz", tmp.getJlb_bz());
            itemMap.put("jlb_lm", tmp.getJlb_lm());
            itemMap.put("jlb_type", tmp.getJlb_type());
            inputTableItems.add(itemMap);
        }
        return inputTableItems;
    }

    @Override
    public List<Map<String, String>> getDeletableItems() {
        return advancedao.getDeletableItems();
    }

    public String List2SQL(List<List<String>> content) {
        StringBuilder sql = new StringBuilder("insert into yjs_xxb (");
        for (Map<String, String> tmp : inputTableItems) {
            sql.append(tmp.get("jlb_lm") + ",");
        }
        sql.deleteCharAt(sql.length() - 1);
        sql.append(" ) values ");
        System.out.print(sql.toString());
        for (List<String> tmp : content) {
            sql.append("(");
            Iterator iterator = tmp.iterator();
            while (iterator.hasNext()) {
                sql.append("\"" + iterator.next() + "\"" + ",");
            }

            sql.deleteCharAt(sql.length() - 1);
            //result = result.substring(0, result.length() - 1);/*去除最后一个，*/
            sql.append(")");
            sql.append(",");
        }
        sql.deleteCharAt(sql.length() - 1);
        return sql.toString();

    }

    @Override
    public int batchInsertinfo(List<List<String>> content) {
        String sql = List2SQL(content);
        advancedao.insertStudents(sql);
        return 0;
    }

    @Override
    public int deleteTableItem(String jlb_lm) {
        advancedao.syncjlb(jlb_lm);
        advancedao.deleteTableItem(jlb_lm);
        return 0;
    }

    @Override
    public int addTableItem(String newcol, String type, String comment) {
        advancedao.addTableItem(newcol, comment, type);
        advancedao.syncAddjlb(newcol, comment, type);
        return 0;
    }
}
