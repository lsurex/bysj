package com.lsure.controller.redirect;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lsure.server.general.contextxml;
import com.lsure.server.service.info.infoService.treeviewService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by lsure on 2017/3/24.
 */
@Controller
public class sendRedirect {
    @RequestMapping(value = "/home")
    public String redirect2Home(HttpServletRequest request) {
        String userRole = (String) request.getSession().getAttribute("userRole");
        if (userRole.equals("admin"))
            return "home_admin";
        else if (userRole.equals("teacher"))
            return "home";
        else
            return "";
    }

    @RequestMapping(value = "/login")
    public String redirect2Login() {
        // System.out.println("login");
        return "login";
    }

    @RequestMapping(value = "/info")
    public String redirect2Stuinfo(HttpServletRequest request) {
        String userRole = (String) request.getSession().getAttribute("userRole");
        if (userRole.equals("teacher"))
            return "info";
        else if (userRole.equals("admin")) {

            treeviewService treeviewservice = contextxml.getApplicationContext().getBean(treeviewService.class);
            List<Map<String, Object>> tree = treeviewservice.getTree();
       /* List<tbStructure> structure = adminServce.getTableStructure();*/
            if (tree != null || tree.size() > 0) {
                ObjectMapper mapper = new ObjectMapper();
                try {
                    String jsontreeString = mapper.writeValueAsString(tree);
                    System.out.print(jsontreeString);
                    request.setAttribute("treeJsonString", jsontreeString);
              /*  request.setAttribute("tableStructure", structure);*/
                } catch (JsonProcessingException e) {
                    e.printStackTrace();
                }
            }
            return "info_admin";

        } else
            return "";
    }

    @RequestMapping(value = "/advance")
    public String redirect2Importexcle(HttpServletRequest request) {
        String userRole = (String) request.getSession().getAttribute("userRole");
        if (userRole.equals("admin"))
            return "advance";
        return "";
    }

    @RequestMapping(value = "/individual")
    public String redirect2Individual() {
        return "individual";

    }

    @RequestMapping(value = "/attendance")
    public String redirect2attendence(HttpServletRequest request) {
        String userRole = (String) request.getSession().getAttribute("userRole");
        if (userRole.equals("teacher"))
            return "attendance";
        return "";
    }

    @RequestMapping(value = "/record")
    public String redirect2record_admin(HttpServletRequest request) {

        String userRole = (String) request.getSession().getAttribute("userRole");
        if (userRole.equals("admin")) {
            treeviewService treeviewservice = contextxml.getApplicationContext().getBean(treeviewService.class);
            List<Map<String, Object>> tree = treeviewservice.getTree();
            if (tree != null || tree.size() > 0) {
                ObjectMapper mapper = new ObjectMapper();
                try {
                    String jsontreeString = mapper.writeValueAsString(tree);

                    System.out.print(jsontreeString);
                    request.setAttribute("treeJsonString", jsontreeString);
              /*  request.setAttribute("tableStructure", structure);*/
                } catch (JsonProcessingException e) {
                    e.printStackTrace();
                }
            }
            return "record_admin";
        } else if (userRole.equals("teacher"))
            return "record";
        else return "";
    }

   /* @RequestMapping(value = "/record_admin")
    public String redirect2monthview(HttpServletRequest request) {
        treeviewService treeviewservice = contextxml.getApplicationContext().getBean(treeviewService.class);
        List<Map<String, Object>> tree = treeviewservice.getTree();
        if (tree != null || tree.size() > 0) {
            ObjectMapper mapper = new ObjectMapper();
            try {
                String jsontreeString = mapper.writeValueAsString(tree);

                System.out.print(jsontreeString);
                request.setAttribute("treeJsonString", jsontreeString);
              *//*  request.setAttribute("tableStructure", structure);*//*
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        }
        return "monthview_admin";
    }

    @RequestMapping("/stuinfo_admin")
    public String redirect2stuinfo_admin(HttpServletRequest request) {
        treeviewService treeviewservice = contextxml.getApplicationContext().getBean(treeviewService.class);
        List<Map<String, Object>> tree = treeviewservice.getTree();
       *//* List<tbStructure> structure = adminServce.getTableStructure();*//*
        if (tree != null || tree.size() > 0) {
            ObjectMapper mapper = new ObjectMapper();
            try {
                String jsontreeString = mapper.writeValueAsString(tree);
                System.out.print(jsontreeString);
                request.setAttribute("treeJsonString", jsontreeString);
              *//*  request.setAttribute("tableStructure", structure);*//*
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        }
        return "stuinfo_admin";
    }*/
}
