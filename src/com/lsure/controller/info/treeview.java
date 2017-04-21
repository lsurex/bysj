package com.lsure.controller.info;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lsure.server.general.contextxml;
import com.lsure.server.service.info.infoService.treeviewService;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by lsure on 2017/4/20.
 */
@Controller
@RequestMapping("/tree")
public class treeview {
    ApplicationContext applicationContext = null;

    treeviewService treeviewservice = null;

    {
        applicationContext = contextxml.getApplicationContext();
        treeviewservice = applicationContext.getBean(treeviewService.class);
    }

    @RequestMapping("/getTree")
    public
    @ResponseBody
    String getTree(String id) {

        ObjectMapper mapper = new ObjectMapper();
        try {
            String jsontreeString = mapper.writeValueAsString(treeviewservice.getNodes(id));
            return jsontreeString;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

}
