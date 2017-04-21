package com.lsure.method.excleAnalyse;

import jxl.read.biff.BiffException;
import org.junit.Test;

import java.io.IOException;

/**
 * Created by lsure on 2017/3/26.
 */

public class test {
    @Test
    public void test2() throws IOException, BiffException {
        contetnSplit contetnSplitc=new contetnSplit("C:/Users/lsure/Desktop/3.xlsx");
       System.out.print( contetnSplitc.getContent());
    }
    @Test
    public  void test4() throws Exception {
      System.out.print( poiMethod.getItems("C:/Users/lsure/Desktop/3.xlsx"));
    }
}
