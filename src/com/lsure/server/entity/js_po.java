package com.lsure.server.entity;

/**
 * Created by lsure on 2017/4/12.
 */
/*教师信息表*/
public class js_po {
    private String js_id;
    private String js_name;
    private Integer quantityOfstu;

    @Override
    public String toString() {
        return "js_po{" +
                "js_id='" + js_id + '\'' +
                ", js_name='" + js_name + '\'' +
                ", quantityOfstu=" + quantityOfstu +
                '}';
    }

    public String getJs_id() {
        return js_id;
    }

    public void setJs_id(String js_id) {
        this.js_id = js_id;
    }

    public String getJs_name() {
        return js_name;
    }

    public void setJs_name(String js_name) {
        this.js_name = js_name;
    }

    public Integer getQuantityOfstu() {
        return quantityOfstu;
    }

    public void setQuantityOfstu(Integer quantityOfstu) {
        this.quantityOfstu = quantityOfstu;
    }
}
