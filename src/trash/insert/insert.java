package trash.insert;

import com.lsure.method.excleAnalyse.poiMethod;
import com.lsure.server.entity.cfg_po;
import com.lsure.server.entity.jlb_po;
import com.lsure.server.general.contextxml;
import com.lsure.server.general.infinity.powerofNature.globals;
import trash.yjs_xx.service.kzxxService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by lsure on 2017/4/3.
 */
@Controller
@RequestMapping("/insert")
public class insert {
    private kzxxService kzxxservice = contextxml.getApplicationContext().getBean(kzxxService.class);
    private List<jlb_po> extensiveTable;
    private List<jlb_po> fixedTable;
   /* private HashMap<String, Integer> extensiveMap = new HashMap<>();*//*用于匹配*//*
    private HashMap<String, Integer> fixedMap = new HashMap<>();*//*用于匹配*/

    @RequestMapping("/getFixed")/*获取固定表结构*/
    public
    @ResponseBody
    List<jlb_po> get_fixed_jlb() {
        fixedTable = kzxxservice.fixed_query();
        /*int count = 0;
        for (jlb_po it : fixedTable) {
           *//* fixedMap.put(it.getJlb_lm(), count);*//**//*将列名进行记录*//*
            count++;
        }*/
        return fixedTable;
    }

    @RequestMapping("/getExtensible")/*获取扩展表结构*/
    public
    @ResponseBody
    List<jlb_po> get_extensible_jlb() {
       /* extensiveTable = kzxxservice.extensible_query();
        int count = 0;
        for (jlb_po it : extensiveTable) {
          *//*  extensiveMap.put(it.getJlb_lm(), count);*//**//*将列名进行记录*//*
            count++;
        }*/
        return extensiveTable;
    }

    @RequestMapping("addkzxxb")/*添加列*/
    public
    @ResponseBody
    String add_kzxxb(String newcol, String type, String comment) {
        try {
            kzxxservice.kzxx_add(newcol, type, comment);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "failed";
        }

    }

    @RequestMapping("/deltekzxxb")/*删除列*/

    public
    @ResponseBody
    String delete_kzxxb(String colname) {
        try {
            kzxxservice.kzxx_delete(colname);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "failed";
        }
    }


    /*错误代码
    * error0x01 文件路径不存在
    * error0x02 无法解析文件内容
    * error0x03 映射配置为空
    * error0x04 重复配置映射
    * error0x05 主键未被映射
     *
    *
    *
    * */
    @RequestMapping("/configure")
    public
    @ResponseBody
    String getMappingConfig(@RequestBody cfg_po[] mapper, HttpServletRequest request) {
        if (mapper.length == 0)
            return "error0x03";
        String path = (String) request.getSession().getAttribute("path");//获取excle存储路径
        if (path != null || !path.isEmpty()) {
            List<List<String>> xlsxContent = poiMethod.getContent(path);//获取excle内容
            if (xlsxContent == null || xlsxContent.size() == 0)
                return "error0x02";/*无法解析文件内容*/

            Map<String, Integer> mapReverse = new HashMap<>();/*反响映射表*/

            /*反转映射关系*/
            for (int i = 0; i < mapper.length; i++) {
                //     System.out.print(mapper[i].getMap());
                if (mapper[i].getMap().equals("null"))
                    continue;

                Integer cmd = mapReverse.get(mapper[i].getMap()) == null ? mapReverse.put(mapper[i].getMap(), i) : -1;
                if (cmd != null) return "error0x04";
            }
            List<Integer> fixd_index = new ArrayList<>();/*存放固定表对应excle映射关系*/
            List<Integer> extensive_index = new ArrayList<>();
            /*获取主信息表反响关系映射*/
            for (jlb_po iterator : fixedTable) {
                fixd_index.add(mapReverse.get(iterator.getJlb_lm()));
            }
            /*获取扩展信息表外键，主信息表主键*/
            Integer foreignerkey = mapReverse.get(globals.TABLE_EXTENSIBLE_YJSXXB_FOREIGNER_KEY);
            if (foreignerkey == null)
                return "error05";/*主键未被映射*/
            /*获取扩展信息表反向关系映射*/
            extensive_index.add(foreignerkey);/*添加外键*/
            for (jlb_po iterator : extensiveTable) {
                extensive_index.add(mapReverse.get(iterator.getJlb_lm()));
            }
           /* List<Map<String, String>> fixed = new LinkedList<>();
            List<Map<String, String>> extensive = new LinkedList<>();*/
            List<String> fixed_list = null;
            List<String> extensive_list = null;
            List<List<String>> fixedinfo = new LinkedList<>();
            List<List<String>> extensiveinfo = new LinkedList<>();
          /*  Map<String, String> fixed_map = null;
            Map<String, String> extensive_map = null;
            int count = 0;
            int count2 = 0;*/
            for (List<String> iterator : xlsxContent) {
               /* fixed_map = new HashMap<>();*/
                fixed_list = new LinkedList<>();
                for (Integer i : fixd_index) {
                    if (i == null) {
                        /*数据库字段未被映射*/
                        fixed_list.add(null);
                      /*  fixed_map.put(fixedTable.get(count++).getJlb_lm(), null);*/
                    } else {
                        /*映射*/
                        fixed_list.add(iterator.get(i));
                       /* fixed_map.put(fixedTable.get(count++).getJlb_lm(), iterator.get(i));*/
                    }
                }
                fixedinfo.add(fixed_list);
              /*  fixed.add(fixed_map);*/
               /* count = 0;*//*复原*/
                extensive_list = new LinkedList<>();
                for (Integer i : extensive_index) {
                   /* extensive_map = new HashMap<>();*/

                    if (i == null) {
                        extensive_list.add(null);
                    }
                       /* extensive_map.put(extensiveTable.get(count2++).getJlb_lm(), null);*/
                    else {
                        extensive_list.add(iterator.get(i));
                    }
                      /*  extensive_map.put(extensiveTable.get(count2++).getJlb_lm(), iterator.get(i));*/
                }
                extensiveinfo.add(extensive_list);
               /* extensive.add(extensive_map);
                count2 = 0;*/
            }
            kzxxservice.info_insert(fixedinfo, extensiveinfo, globals.TABLE_FIXED_YJSXXB, globals.TABLE_EXTENSIBLE_YJSXXB);
            return "success";
        } else {
            /*该文件路径不存在*/
            return "error0x01";
        }


    }


}
