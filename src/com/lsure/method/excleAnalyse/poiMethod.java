package com.lsure.method.excleAnalyse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.NumberToTextConverter;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.xml.crypto.Data;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.SimpleFormatter;

/**
 * Created by lsure on 2017/4/1.
 */
public class poiMethod {
    private static final int Data_Start_Column = 1;//数据开始列
    private static final int Data_start_Row = 1;//数据开始行
    private static final int Iteams_location = 0;//列名所在行的位置

    /**
     * @input:String
     * @output null:解析失败
     */
    public static List<String> getItems(String path) {
        String suffix = path.substring(path.lastIndexOf(".") + 1, path.length());
        Workbook workbook = null;
        List<String> items = new LinkedList<>();
        InputStream inputStream = null;
        try {
            inputStream = new FileInputStream(path);
            //xls格式

            if (suffix.equals("xls")) {
                workbook = new HSSFWorkbook(inputStream);
            } else if (suffix.equals("xlsx")) {
                //xlsx格式
                workbook = new XSSFWorkbook(inputStream);
            } else {
                System.out.println("error:非xlsx、xls文件\n");
                return null;
            }
            int counts = workbook.getNumberOfSheets();
            if (counts > 0) {
                //只读取第一个sheets
                Sheet sheet = workbook.getSheetAt(0);
                //读取item所在行
                Row itemsRow = sheet.getRow(Iteams_location);
                for (int i = Data_Start_Column; i < itemsRow.getLastCellNum(); i++) {
                    items.add(itemsRow.getCell(i).getStringCellValue());
                }
                inputStream.close();
                return items;
            } else {
                System.out.println("error:没有找到sheet\n");
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error:未知异常\n");
            return null;
        } finally {
            try {
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static List<List<String>> getContent(String path) {
        String suffix = path.substring(path.lastIndexOf(".") + 1, path.length());
        Workbook workbook = null;
        List<List<String>> content = new LinkedList<>();
        InputStream inputStream = null;
        try {
            inputStream = new FileInputStream(path);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日");
            //xls格式
            if (suffix.equals("xls")) {
                workbook = new HSSFWorkbook(inputStream);
            } else if (suffix.equals("xlsx")) {
                //xlsx格式
                workbook = new XSSFWorkbook(inputStream);

                //读取item所在行

            } else {
                return null;
            }
            int counts = workbook.getNumberOfSheets();
            if (counts > 0) {
                //只读取第一个sheets
                Sheet sheet = workbook.getSheetAt(0);
                for (int i = Data_start_Row; i <= sheet.getLastRowNum(); i++) {
                    List<String> piece = new LinkedList<>();
                    for (int j = Data_Start_Column; j < sheet.getRow(Iteams_location).getLastCellNum(); j++) {
                        Cell cell = sheet.getRow(i).getCell(j);
                        /*所有格式全转换为String格式*/
                        switch (cell.getCellTypeEnum()) {
                            case BLANK: {
                                piece.add("");/*单元格为空转换为“”*/
                            }
                            break;
                            case NUMERIC: {
                                if (DateUtil.isCellDateFormatted(cell)) {
                                    Date date = cell.getDateCellValue();
                                    piece.add(simpleDateFormat.format(date));/*转换成String类型*/

                                } else {
                                    piece.add(NumberToTextConverter.toText(cell.getNumericCellValue()));
                                }
                            }
                            break;
                            case BOOLEAN: {
                                piece.add(String.valueOf(cell.getBooleanCellValue()));
                            }
                            break;
                            default:
                                piece.add(cell.getStringCellValue());
                                break;
                        }

                    /*    piece.add(sheet.getRow(i).getCell(j).getStringCellValue());*/
                    }
                    content.add(piece);
                }

                return content;
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("解析失败");
            return null;
        } finally {
            try {
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }
}