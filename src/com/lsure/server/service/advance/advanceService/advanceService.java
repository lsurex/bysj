package com.lsure.server.service.advance.advanceService;

import com.lsure.server.entity.tbStructure;

import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/4/18.
 */
public interface advanceService {
    public List<Map<String, String>> getInputTableItems();

    public List<Map<String, String>> getDeletableItems();

    public int batchInsertinfo(List<List<String>> content);

    public int deleteTableItem(String jlb_lm);

    public int addTableItem(String newcol, String type, String comment);
}
