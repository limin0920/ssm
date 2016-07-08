package com.icss.bean;

public class User_info {
    private Integer uid;

    private String uname;

    private String uschool;

    private String umajor;

    private Integer uclass;

    private String utel;

    private String uremark;

    private Integer pid;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getUschool() {
        return uschool;
    }

    public void setUschool(String uschool) {
        this.uschool = uschool == null ? null : uschool.trim();
    }

    public String getUmajor() {
        return umajor;
    }

    public void setUmajor(String umajor) {
        this.umajor = umajor == null ? null : umajor.trim();
    }

    public Integer getUclass() {
        return uclass;
    }

    public void setUclass(Integer uclass) {
        this.uclass = uclass;
    }

    public String getUtel() {
        return utel;
    }

    public void setUtel(String utel) {
        this.utel = utel == null ? null : utel.trim();
    }

    public String getUremark() {
        return uremark;
    }

    public void setUremark(String uremark) {
        this.uremark = uremark == null ? null : uremark.trim();
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }
}