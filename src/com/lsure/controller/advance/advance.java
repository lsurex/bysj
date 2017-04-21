package com.lsure.controller.advance;

import com.lsure.method.excleAnalyse.poiMethod;
import com.lsure.server.entity.cfg_po;
import com.lsure.server.entity.jlb_po;
import com.lsure.server.general.contextxml;
import com.lsure.server.general.infinity.powerofNature.globals;
import com.lsure.server.service.advance.advanceService.advanceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by lsure on 2017/4/18.
 */
@Controller
@RequestMapping("/advance")
public class advance {
    private advanceService advanceservice = contextxml.getApplicationContext().getBean(advanceService.class);
    private List<Map<String, String>> inputTableItems;

    @RequestMapping("/getInputItems")
    public
    @ResponseBody
    List<Map<String, String>> getInputItems() {
        this.inputTableItems = advanceservice.getInputTableItems();
        return this.inputTableItems;

    }

    @RequestMapping("/getDeletableItems")
    public
    @ResponseBody
    List<Map<String, String>> getdeletableItems() {
        return advanceservice.getDeletableItems();
    }

    @RequestMapping("/uploadConfigure")
    public
    @ResponseBody
    String getMappingConfig(@RequestBody cfg_po[] mapper, HttpServletRequest request) {
        if (mapper.length == 0)
            return "error0x03：无效的映射";
        String path = (String) request.getSession().getAttribute("path");//获取excle存储路径
        if (path != null || !path.isEmpty()) {
            List<List<String>> xlsxContent = poiMethod.getContent(path);//获取excle内容
            if (xlsxContent == null || xlsxContent.size() == 0)
                return "error0x02：无法解析文件内容";/*无法解析文件内容*/

            Map<String, Integer> mapReverse = new HashMap<>();/*反转映射表*/

            /*反转映射关系*/
            for (int i = 0; i < mapper.length; i++) {
                if (mapper[i].getMap().equals("null"))/*配置为空的跳过*/
                    continue;

                Integer cmd = mapReverse.get(mapper[i].getMap()) == null ? mapReverse.put(mapper[i].getMap(), i) : -1;
                if (cmd != null) return "error0x04：重复配置映射";
            }

            List<Integer> mapping_index = new ArrayList<>();
            for (Map<String, String> iterator : inputTableItems) {
                mapping_index.add(mapReverse.get(iterator.get("jlb_lm")));/*转换为lm-----编号*/
            }
            Integer foreignerkey = mapReverse.get(globals.TABLE_EXTENSIBLE_YJSXXB_FOREIGNER_KEY);/*判断主键是否存在*/

            if (foreignerkey == null)
                return "error05";
            List<String> info_item = null;
            List<List<String>> info_content = new LinkedList<>();
            for (List<String> iterator : xlsxContent) {
                info_item = new LinkedList<>();
                for (Integer i : mapping_index) {
                    if (i == null) {
                        info_item.add(null);
                    } else {
                        info_item.add(iterator.get(i));
                    }
                }
                info_content.add(info_item);
            }
            advanceservice.batchInsertinfo(info_content);
            return "success";
        } else {
            /*该文件路径不存在*/
            return "error0x01:文件路径不存在";
        }


    }


    @RequestMapping("/deleteTableItem")
    public
    @ResponseBody
    String deleteTableItem(String colname) {
        try {
            advanceservice.deleteTableItem(colname);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping("/addTableItem")
    public
    @ResponseBody
    String addTableItem(String newcol, String type, String comment) {
        try {
            advanceservice.addTableItem(newcol, type, comment);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

}
