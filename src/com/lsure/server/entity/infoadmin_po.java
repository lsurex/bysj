package com.lsure.server.entity;

import java.util.List;

/**
 * Created by lsure on 2017/4/12.
 */
/*管理员信息管理返回数据格式*/
public class infoadmin_po {
    public String tutorName;/*导师姓名*/
    public List<stuInfo> studentsList;/*所带学生列表*/

    public String getTutorName() {
        return tutorName;
    }

    public void setTutorName(String tutorName) {
        this.tutorName = tutorName;
    }

    public List<stuInfo> getStudentsList() {
        return studentsList;
    }

    public void setStudentsList(List<stuInfo> studentsList) {
        this.studentsList = studentsList;
    }

    @Override
    public String toString() {
        return "infoadmin_po{" +
                "tutorName='" + tutorName + '\'' +
                ", studentsList=" + studentsList +
                '}';
    }

    public String toTreeNode() {
        StringBuilder formatNode = new StringBuilder();
        /*开始大括号*/
        formatNode.append("{");
        /*node节点，导师姓名*/
        formatNode.append(" text:\"");
        formatNode.append(this.getTutorName().toString());
        formatNode.append("\"");
        /*逗号*/
        formatNode.append(",");

        if (studentsList != null && studentsList.size() > 0) {
            formatNode.append("nodes:[");
            for (stuInfo tmp : studentsList) {
                formatNode.append("{");
                formatNode.append("text:\"");
                formatNode.append(tmp.getYjs_name().toString());
                formatNode.append("\"}");
        /*逗号*/
                formatNode.append(",");

            }
        }
        /*结束大括号*/
        formatNode.append("},");
        return formatNode.toString();
    }

}
