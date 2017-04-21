package com.lsure.server.entity;

/**
 * Created by lsure on 2017/3/19.
 */
public class stuInfo {
    private String yjs_name;
    private String yjs_id;
    private String yjs_sex;
    private String yjs_age;
    private String yjs_pswd;
    private String yjs_nj;
    private String yjs_tutor;

    public String getYjs_tutor() {
        return yjs_tutor;
    }

    public void setYjs_tutor(String yjs_tutor) {
        this.yjs_tutor = yjs_tutor;
    }

    @Override
    public String toString() {
        return "stuInfo{" +
                "yjs_name='" + yjs_name + '\'' +
                ", yjs_id='" + yjs_id + '\'' +
                ", yjs_sex='" + yjs_sex + '\'' +
                ", yjs_age='" + yjs_age + '\'' +
                ", yjs_pswd='" + yjs_pswd + '\'' +
                ", yjs_nj='" + yjs_nj + '\'' +
                ", yjs_tutor='" + yjs_tutor + '\'' +
                '}';
    }

    public String getYjs_name() {
        return yjs_name;
    }

    public void setYjs_name(String yjs_name) {
        this.yjs_name = yjs_name;
    }

    public String getYjs_id() {
        return yjs_id;
    }

    public void setYjs_id(String yjs_id) {
        this.yjs_id = yjs_id;
    }

    public String getYjs_sex() {
        return yjs_sex;
    }

    public void setYjs_sex(String yjs_sex) {
        this.yjs_sex = yjs_sex;
    }

    public String getYjs_age() {
        return yjs_age;
    }

    public void setYjs_age(String yjs_age) {
        this.yjs_age = yjs_age;
    }

    public String getYjs_pswd() {
        return yjs_pswd;
    }

    public void setYjs_pswd(String yjs_pswd) {
        this.yjs_pswd = yjs_pswd;
    }

    public String getYjs_nj() {
        return yjs_nj;
    }

    public void setYjs_nj(String yjs_nj) {
        this.yjs_nj = yjs_nj;
    }
}
