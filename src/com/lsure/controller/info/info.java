package com.lsure.controller.info;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lsure.server.entity.individual;
import com.lsure.server.general.contextxml;
import com.lsure.server.service.info.infoService.infoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/4/19.
 */
@Controller
@RequestMapping("/info")
public class info {
    private infoService infoservice = contextxml.getApplicationContext().getBean(infoService.class);

    @RequestMapping("/getstudents")
    public
    @ResponseBody
    List<individual> getStuInfo(HttpServletRequest request) {
        String tutorid = (String) request.getSession().getAttribute("userName");

        return infoservice.getstudents(tutorid);
    }

    @RequestMapping("/getIndividual")
    public
    @ResponseBody
    Map<String, Object> getentireStudent(String yjs_id, HttpServletRequest request) {
        String tutorid = (String) request.getSession().getAttribute("userName");
        String role = (String) request.getSession().getAttribute("userRole");
        if (tutorid != null && role != null && !tutorid.isEmpty() && !role.isEmpty())
            return infoservice.getIndividual(yjs_id, tutorid, request);
        return null;
    }

    @RequestMapping("/delete")
    public
    @ResponseBody
    String deleteinfo(String delete_list, HttpServletRequest request) {
        System.out.print(delete_list);
        String[] del_array = delete_list.split(",");
        String tutorid = (String) request.getSession().getAttribute("userName");

        String role = (String) request.getSession().getAttribute("userRole");
        if (tutorid == null || tutorid.isEmpty() || role == null || role.isEmpty())
            return "未验证的身份";
        if (del_array.length > 0) {
            List<String> del_list = new LinkedList<>();
            for (String item : del_array) {
                del_list.add(item);
            }
            try {
                infoservice.deleteBatch(del_list, tutorid, role);
                return "success";
            } catch (Exception e) {
                e.printStackTrace();
                return "error";
            }

        }
        return "error";
    }

    @RequestMapping("/update")
    public
    @ResponseBody
    String updateinfo(String json, HttpServletRequest request) {
        String result = "error";
        try {
            if (json == null || json.isEmpty())
                return "无效";
            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, String> content = objectMapper.readValue(json, Map.class);
            infoservice.updateindividual(content);
            result = "success";

        } catch (Exception e) {
            e.printStackTrace();
            result = "error";
        } finally {
            return result;
        }
    }

    @RequestMapping("/insert")
    public
    @ResponseBody
    String insertstudent(String json, HttpServletRequest request) {
        String result = "error";
        try {
            if (!(json == null || json.isEmpty())) {
                ObjectMapper objectMapper = new ObjectMapper();
                Map<String, String> content = objectMapper.readValue(json, Map.class);
                infoservice.insertindividual(content);
                result = "success";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return result;
        }
    }
}
