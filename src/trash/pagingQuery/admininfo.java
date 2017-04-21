package trash.pagingQuery;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lsure.server.entity.tbStructure;
import com.lsure.server.general.contextxml;
import trash.pagingQuery.service.info_adminServce;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/4/12.
 */
@Controller
@RequestMapping("/admin")
public class admininfo {
    ApplicationContext applicationContext = null;
    info_adminServce admininfoService = null;

    {
        applicationContext = contextxml.getApplicationContext();
        admininfoService = applicationContext.getBean(info_adminServce.class);
    }

    @RequestMapping("/getTree")
    public
    @ResponseBody
    String getTree(String id) {

        ObjectMapper mapper = new ObjectMapper();
        try {
            String jsontreeString = mapper.writeValueAsString(admininfoService.getNodes(id));
            return jsontreeString;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    private String currentid = "";

    @RequestMapping("/getstuinfo")
    public
    @ResponseBody
    List<Map<String, String>> getSpecificStuInfo(String id) {
        List<Map<String, String>> result = null;
        try {
            currentid = id;
            result = admininfoService.specificStuInfo(id);
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            return result;
        }
    }

    @RequestMapping("/alterinfo")
    public
    @ResponseBody
    String alterSpecificStuInfo(@RequestBody List<Map<String, String>> stuinfo) {
        System.out.print(stuinfo);
        StringBuilder fixedsql = new StringBuilder("update yjs_xxb  set");
        StringBuilder extensivesql = new StringBuilder("update yjs_kzxxb  set");
        for (Map<String, String> tmp_map : stuinfo) {
            if ((tmp_map.get("belonging") == null))
                return "failed";
            if (tmp_map.get("belonging").equals("yjs_xxb")) {
                /*应添加学好校验*/
                fixedsql.append(" " + tmp_map.get("lm") + "='" + tmp_map.get("data") + "',");
            } else if (tmp_map.get("belonging").equals("yjs_kzxxb")) {
                extensivesql.append(" " + tmp_map.get("lm") + "='" + tmp_map.get("data") + "',");
            } else {
/*实验室简介无法修改*/
            }

        }
        fixedsql.deleteCharAt(fixedsql.length() - 1);/*去除最后一个标点*/
        extensivesql.deleteCharAt(extensivesql.length() - 1);/*去除最后一个标点*/
        fixedsql.append(" where yjs_id=" + "'" + currentid + "'");
        extensivesql.append(" where yjs_id=" + "'" + currentid + "'");
        System.out.println(fixedsql.toString());
        System.out.println(extensivesql.toString());
        try {
            admininfoService.alterSpecific(fixedsql.toString());
            admininfoService.alterSpecific(extensivesql.toString());
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "信息更新失败";
        }

    }

    @RequestMapping("/getTbstructure")

    public
    @ResponseBody
    List<tbStructure> getStructure() {
        List<tbStructure> tbstructures = null;
        try {
            tbstructures = admininfoService.getTableStructure();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return tbstructures;
        }
    }
}
