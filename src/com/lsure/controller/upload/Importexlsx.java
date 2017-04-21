package com.lsure.controller.upload;

import com.lsure.method.excleAnalyse.contetnSplit;
import com.lsure.method.excleAnalyse.poiMethod;
import jxl.read.biff.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.io.File;
import java.util.*;

/**
 * Created by lsure on 2017/3/25.
 */
@Controller
@RequestMapping("/excle")
public class Importexlsx {
    private String Ext_name = "xls,xlsx";

    @RequestMapping("/upload")
    public
    @ResponseBody
    String uploadexcle(HttpServletRequest request) throws IOException {
        String message = "";
        String savePath = request.getServletContext().getRealPath("WEB_INF/upload");//保存路径
        File saveFiledir = new File(savePath);
        if (!saveFiledir.exists()) {
            saveFiledir.mkdirs();
        }
        String tempPath = request.getServletContext().getRealPath("WEB_INF/temp");//临时文件保存路径
        File tempFiledir = new File(tempPath);
        if (!tempFiledir.exists()) {

            tempFiledir.mkdirs();
        }
        try {
            DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
            diskFileItemFactory.setSizeThreshold(1024 * 10);//创建缓冲区临界值
            diskFileItemFactory.setRepository(tempFiledir);
            ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);//创建文件上传解析器
            servletFileUpload.setProgressListener(new ProgressListener() {//设置上传监听
                @Override
                public void update(long readbyte, long total, int currentItem) {
                    System.out.println("已读:" + readbyte + "总共" + total + "---" + currentItem);
                }
            });
            servletFileUpload.setHeaderEncoding("UTF-8");//解决中文
            if (!ServletFileUpload.isMultipartContent(request)) {
                return message;
            }
            servletFileUpload.setFileSizeMax(1024 * 1024 * 10);//设置单次最大上传文件为10M
            servletFileUpload.setSizeMax(1024 * 1024 * 30);//本次上传最大为30M

            List<FileItem> items = servletFileUpload.parseRequest(new ServletRequestContext(request));
            Iterator iter = items.iterator();//获取迭代器
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString("utf-8");
                    System.out.println(name + value);
                } else {
                    String filename = item.getName(); /*item.getFieldName();*/
                    System.out.println("上传文件名为：" + filename.toString());
                    if (filename == null && filename.trim().length() == 0) {
                        continue;
                    }
                    filename = filename.substring((filename.lastIndexOf("\\") + 1));
                    String fileExt = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();//获取文件后缀，并转换为小写
                    System.out.println("文件的后缀为" + fileExt.toString());
                    //文件类型错误
                    if (!Ext_name.contains(fileExt)) {
                        message = "文件不被允许";
                        break;
                    }
                    //文件大小错误
                    if (item.getSize() == 0 || item.getSize() > 1024 * 1024 * 10) {
                        message = "文件大小错误";
                        break;
                    }
                    String saveFilename = UUID.randomUUID().toString().replaceAll("-", "") + "_" + filename;//新的文件名
                    InputStream inputStream = item.getInputStream();
                    String path = savePath + "\\" + saveFilename;
                    System.out.println("文件已经上传到" + path);
                    FileOutputStream fileOutputStream = new FileOutputStream(path);
                    request.getSession().setAttribute("path", path);
                    byte buffer[] = new byte[1024];
                    int len = 0;
                    while ((len = inputStream.read(buffer)) > 0) {
                        fileOutputStream.write(buffer, 0, len);
                    }
                    fileOutputStream.close();
                    inputStream.close();
                    item.delete();
                    message = "success";

                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        } finally {
            System.out.print(message);
            String error = "error123";
            return error;
        }

    }

    @RequestMapping(value = "/upload2")
    public
    @ResponseBody
    String multiupdate(HttpServletRequest request) {
        MultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        if (commonsMultipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multipartHttpServletRequest = commonsMultipartResolver.resolveMultipart(request);
            Iterator<String> files = multipartHttpServletRequest.getFileNames();
            while (files.hasNext()) {
                String message;
                MultipartFile file = multipartHttpServletRequest.getFile(files.next());
                if (file != null) {
                    String filename = file.getOriginalFilename();
                    if (filename.trim() != "") {
                        System.out.print("文件名：" + filename.trim());
                        String savePath = request.getServletContext().getRealPath("WEB_INF/upload");//保存路径
                        File saveFiledir = new File(savePath);
                        if (!saveFiledir.exists()) {
                            saveFiledir.mkdirs();
                        }
                        try {
                            String newname = UUID.randomUUID().toString().replaceAll("-", "") + filename;
                            savePath = savePath + "\\" + newname;
                            File localfile = new File(savePath);
                            request.getSession().setAttribute("path", savePath);//path 加入sessiion
                            file.transferTo(localfile);
                            System.out.println("上传成功");
                            return "上传成功";
                        } catch (IOException e) {
                            e.printStackTrace();
                            return "上传失败";
                        }

                    }
                }

            }
            return null;
        }


        return null;


    }

    @RequestMapping("/getItems")
    public
    @ResponseBody
    List<String> getItems(HttpServletRequest request) {
        String path = (String) request.getSession().getAttribute("path");
        if (path == null || path.isEmpty()) {
            return null;
        }
        List<String> Items = poiMethod.getItems(path);
        System.out.println(Items);
        return Items;
    }

    @RequestMapping("/getcontent")
    public
    @ResponseBody
    List<List<String>> getContent(HttpServletRequest request) {
        String path = (String) request.getSession().getAttribute("path");
        if (path == null || path.isEmpty()) {
            return null;
        }

        List<List<String>> content = poiMethod.getContent(path);
        return content;


    }

    @RequestMapping("/analyse")
    public
    @ResponseBody
    List<List<String>> analysexlsx(String path) throws IOException, BiffException {
        contetnSplit contetnsplit = new contetnSplit(path);
        List<String> Items = contetnsplit.getItems();
        List<List<String>> content = contetnsplit.getContent();
        System.out.print(content);
        return content;
    }

    @RequestMapping("/items")
    public
    @ResponseBody
    List<String> getitems(HttpServletRequest request) {
        String path = (String) request.getSession().getAttribute("path");
        System.out.println("session:" + path);
        contetnSplit contetnsplit = null;
        try {
            contetnsplit = new contetnSplit(path);
            List<String> Items = contetnsplit.getItems();
            contetnsplit.excleclose();
            System.out.print(Items);
            return Items;
        } catch (IOException e) {
            e.printStackTrace();
            return null;//返回错误
        } catch (BiffException e) {
            e.printStackTrace();
            return null;//返回错误
        }

    }
}
