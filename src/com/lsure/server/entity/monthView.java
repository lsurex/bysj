package com.lsure.server.entity;

/**
 * Created by lsure on 2017/4/17.
 */
public class monthView {
    private String stu_id;
    private String stu_name;
    private Long late_count;
    private Long ontime_count;
    private Long absent_count;

    private Integer period;

    @Override
    public String toString() {
        return "monthView{" +
                "stu_id='" + stu_id + '\'' +
                ", stu_name='" + stu_name + '\'' +
                ", late_count=" + late_count +
                ", ontime_count=" + ontime_count +
                ", absent_count=" + absent_count +
                ", period=" + period +
                '}';
    }

    public String getStu_id() {
        return stu_id;
    }

    public void setStu_id(String stu_id) {
        this.stu_id = stu_id;
    }

    public String getStu_name() {
        return stu_name;
    }

    public void setStu_name(String stu_name) {
        this.stu_name = stu_name;
    }

    public Long getLate_count() {
        return late_count;
    }

    public void setLate_count(Long late_count) {
        this.late_count = late_count;
    }

    public Long getOntime_count() {
        return ontime_count;
    }

    public void setOntime_count(Long ontime_count) {
        this.ontime_count = ontime_count;
    }

    public Long getAbsent_count() {
        return absent_count;
    }

    public void setAbsent_count(Long absent_count) {
        this.absent_count = absent_count;
    }

    public Integer getPeriod() {
        return period;
    }

    public void setPeriod(Integer period) {
        this.period = period;
    }
}
