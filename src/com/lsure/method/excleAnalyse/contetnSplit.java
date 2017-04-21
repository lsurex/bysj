package com.lsure.method.excleAnalyse;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * Created by lsure on 2017/3/26.
 */
public class contetnSplit {
    private Sheet targetSheet = null;
    private int rows = 0;
    private int columns = 0;
    private  InputStream inputStream;

    /*构造函数，获取目标sheet流*/
    public contetnSplit(String path) throws IOException, BiffException {
         inputStream= new FileInputStream(path);
        Workbook workbook = Workbook.getWorkbook(inputStream);
        workbook.getNumberOfSheets();
        this.targetSheet = workbook.getSheet(0);
        this.rows = this.targetSheet.getRows();
        this.columns = this.targetSheet.getColumns();
    }

    /**
     * 获取Item分类
     */
    /*
    * rule：
    * 第一行:标题
    * 第二行：Item
    * 第三行：正文
    * 第一列：编号
    * 第二列：正文
    *
    * */
    public List<String> getItems() {
        //获取第二行，第二列
        List<String> items = new LinkedList<>();
        String item = "";
        Cell itemCell = null;
        for (int i = 1; i < columns; i++) {
            itemCell = targetSheet.getCell(i, 0);
            item = itemCell.getContents();
            items.add(item);
        }
        return items;
    }

    public List<List<String>> getContent() {
        Cell infoCell = null;
        List<String> items = getItems();
        List<List<String>> content = new LinkedList<>();
        for (int j = 2; j < rows; j++) {
            List<String> info = new LinkedList<>();
            for (int i = 1; i < columns; i++) {

                infoCell = targetSheet.getCell(i, j);
                info.add(infoCell.getContents());

            }
            content.add(info);
        }
        return content;
    }
    public void excleclose() throws IOException {
     inputStream.close();

    }
}
