package com.lsure.server.entity;

/**
 * Created by lsure on 2017/4/3.
 */
public class jlb_po {
    private String jlb_lm;/*列名*/
    private String jlb_bz;/*备注*/
    private String jlb_type;/*数据类型*/

    @Override
    public String toString() {
        return "jlb_po{" +
                "jlb_lm='" + jlb_lm + '\'' +
                ", jlb_bz='" + jlb_bz + '\'' +
                ", jlb_type='" + jlb_type + '\'' +
                '}';
    }

    public String getJlb_lm() {
        return jlb_lm;
    }

    public void setJlb_lm(String jlb_lm) {
        this.jlb_lm = jlb_lm;
    }

    public String getJlb_bz() {
        return jlb_bz;
    }

    public void setJlb_bz(String jlb_bz) {
        this.jlb_bz = jlb_bz;
    }

    public String getJlb_type() {
        return jlb_type;
    }

    public void setJlb_type(String jlb_type) {
        this.jlb_type = jlb_type;
    }
}
