package com.lsure.server.entity;

/**
 * Created by lsure on 2017/3/15.
 */
public class userInfo {
    private String userName;
    private String userPswd;
    private String userRole;
    private String userID;
    private int userLevel;

    public int getUserLevel() {
        return userLevel;
    }

    public void setUserLevel(int userLevel) {
        this.userLevel = userLevel;
    }


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPswd() {
        return userPswd;
    }

    public void setUserPswd(String userPswd) {
        this.userPswd = userPswd;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    @Override
    public String toString() {
        return "userInfo{" +
                "userName='" + userName + '\'' +
                ", userPswd='" + userPswd + '\'' +
                ", userRole='" + userRole + '\'' +
                ", userID='" + userID + '\'' +
                ", userLevel='" + userLevel + '\'' +
                '}';
    }
}
