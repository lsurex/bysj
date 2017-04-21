package com.lsure.server.entity;

/**
 * Created by lsure on 2017/4/13.
 */
public class tbStructure {
    private String jlb_lm;
    private String jlb_bz;
    private String jlb_type;
    private String jlb_visibility;
    private String jlb_readonly;
    private String jlb_belonging;

    public String getJlb_belonging() {
        return jlb_belonging;
    }

    public void setJlb_belonging(String jlb_belonging) {
        this.jlb_belonging = jlb_belonging;
    }

    @Override
    public String toString() {
        return "tbStructure{" +
                "jlb_lm='" + jlb_lm + '\'' +
                ", jlb_bz='" + jlb_bz + '\'' +
                ", jlb_type='" + jlb_type + '\'' +
                ", jlb_visibility='" + jlb_visibility + '\'' +
                ", jlb_readonly='" + jlb_readonly + '\'' +
                ", jlb_belonging='" + jlb_belonging + '\'' +
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

    public String getJlb_visibility() {
        return jlb_visibility;
    }

    public void setJlb_visibility(String jlb_visibility) {
        this.jlb_visibility = jlb_visibility;
    }

    public String getJlb_readonly() {
        return jlb_readonly;
    }

    public void setJlb_readonly(String jlb_readonly) {
        this.jlb_readonly = jlb_readonly;
    }
}
