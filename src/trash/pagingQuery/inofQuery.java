package trash.pagingQuery;

import com.lsure.server.entity.stuInfo;
import com.lsure.server.general.contextxml;
import trash.pagingQuery.service.pagingService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/3/19.
 */
@Controller
@RequestMapping(value = "/pageQuery")
public class inofQuery {
    private stuInfo currentStu = null;
    private Map<String, String> currentExtensiveMap = null;
    private List<Map<String, String>> currentExtensiveRecord = null;

    @RequestMapping(value = "/stuInfo")
    public
    @ResponseBody
    List<stuInfo> queryforStuInfo(Integer startRow, Integer pageSize, String priority, HttpServletRequest request) {//stratRow :起始页数
        //Service 注入
      /*  System.out.println("It's me");*/
        pagingService pageService = (pagingService) contextxml.getApplicationContext().getBean("pagingService");
        List<stuInfo> stuInfos = pageService.queryStuInfo((startRow - 1) * pageSize, pageSize, priority, request);
        System.out.print(stuInfos);
        return stuInfos;
    }

    /*计算页数*/
    @RequestMapping(value = "/counts")
    public
    @ResponseBody
    Integer queryforCounts() {
        pagingService pageService = (pagingService) contextxml.getApplicationContext().getBean("pagingService");
        return pageService.queryCounts();
    }

    /*模糊查询*/
    @RequestMapping(value = "/fuzzyQuery")
    public
    @ResponseBody
    List<stuInfo> fuzzyQuery(String token, String method) {
        pagingService pageService = (pagingService) contextxml.getApplicationContext().getBean("pagingService");
        List<stuInfo> temp = pageService.fuzzyQuery(token, method);
      /*  System.out.println( temp+"123123123");*/
        return temp;
    }

    /*固定数据返回*/
    @RequestMapping(value = "/fixedQuery")
    public
    @ResponseBody
    stuInfo fixedquery(String keyword) {
        pagingService pageService = (pagingService) contextxml.getApplicationContext().getBean("pagingService");
        currentStu = pageService.fixedquery(keyword);
        return currentStu;
    }

    /*扩展信息*/
    @RequestMapping(value = "/extensiveQuery")
    public
    @ResponseBody
    Map<String, String> extensiveQuery(String keyword) {
        pagingService pageService = (pagingService) contextxml.getApplicationContext().getBean("pagingService");
        currentExtensiveMap = pageService.extensivequery(keyword);
        return currentExtensiveMap;
    }

    /*扩展信息表结构*/
    @RequestMapping("/getextensiveItems")
    public
    @ResponseBody
    List<Map<String, String>> getextensiveitems() {
        pagingService pageService = (pagingService) contextxml.getApplicationContext().getBean("pagingService");
        currentExtensiveRecord = pageService.getextensiveItems();
        return currentExtensiveRecord;
    }

    /*详细信息更新*/
    @RequestMapping(value = "/fixedUpdate")
    public
    @ResponseBody
    String fixedUpdate(stuInfo stuinfo) {
        stuinfo.setYjs_id(currentStu.getYjs_id());/*防止id被恶意篡改*/
        pagingService pageService = (pagingService) contextxml.getApplicationContext().getBean("pagingService");
        int result = pageService.updatefixed(stuinfo);
        if (result == 1)
            return "success";
        else
            return "failed";
    }

    @RequestMapping(value = "/extensiveUpdate")
    public
    @ResponseBody
    String extensiveUpdate(String data) {

        if (currentExtensiveRecord.size() < 1)
            return "success";
        String[] content = data.split(",");
        if (content.length < 1)
            return "error";
        /*检测改动*/
        String sql = "set ";
        String temp = null;
        for (int i = 0; i < content.length; i++) {
            temp = currentExtensiveMap.get(currentExtensiveRecord.get(i).get("jlb_lm"));
            if (content[i] != temp && !content[i].equals(temp)) {
                sql = sql + currentExtensiveRecord.get(i).get("jlb_lm") + "=" + "\"" + content[i] + "\"" + ",";
            }
        }
        /*没有修改项*/
        if (sql.length() == ("set ".length())) {
            return "success";
        }
        /*去除最后一个多余的逗号*/
        sql = sql.substring(0, sql.length() - 1);
        pagingService pageService = (pagingService) contextxml.getApplicationContext().getBean("pagingService");
        try {
            int result = pageService.updateextensive(sql, currentStu.getYjs_id());
            if (result == 1)
                return "success";
            return "error";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping("/deletebatch")
    public
    @ResponseBody
    String deletebatch(String delete_list) {
        System.out.print(delete_list);
        String[] del_array = delete_list.split(",");
        pagingService pageService = (pagingService) contextxml.getApplicationContext().getBean("pagingService");
        if (del_array.length > 0) {
            List<String> del_list = new LinkedList<>();
            for (String item : del_array) {
                del_list.add(item);
            }
            try {
                pageService.deletebatch(del_list);
                return "success";
            } catch (Exception e) {
                e.printStackTrace();
                return "error";
            }

        }
        return "error";
    }
}
