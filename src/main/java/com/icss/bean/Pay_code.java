package com.icss.bean;

import java.util.Date;

public class Pay_code {
	
    private Integer cid;

    private Integer uid;

    private String ctype;

    private Date cstime;

    private Date cctime;

    private String cdepartment;

    private String conesale;

    private String ctwosale;

    private Integer cpay;

    private String cif;

    private Integer chostel;

    private String carea;

    private String cremark;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getCtype() {
        return ctype;
    }

    public void setCtype(String ctype) {
        this.ctype = ctype == null ? null : ctype.trim();
    }

    public Date getCstime() {
        return cstime;
    }

    public void setCstime(Date cstime) {
        this.cstime = cstime;
    }

    public Date getCctime() {
        return cctime;
    }

    public void setCctime(Date cctime) {
        this.cctime = cctime;
    }

    public String getCdepartment() {
        return cdepartment;
    }

    public void setCdepartment(String cdepartment) {
        this.cdepartment = cdepartment == null ? null : cdepartment.trim();
    }

    public String getConesale() {
        return conesale;
    }

    public void setConesale(String conesale) {
        this.conesale = conesale == null ? null : conesale.trim();
    }

    public String getCtwosale() {
        return ctwosale;
    }

    public void setCtwosale(String ctwosale) {
        this.ctwosale = ctwosale == null ? null : ctwosale.trim();
    }

    public Integer getCpay() {
        return cpay;
    }

    public void setCpay(Integer cpay) {
        this.cpay = cpay;
    }

    public String getCif() {
        return cif;
    }

    public void setCif(String cif) {
        this.cif = cif == null ? null : cif.trim();
    }

    public Integer getChostel() {
        return chostel;
    }

    public void setChostel(Integer chostel) {
        this.chostel = chostel;
    }

    public String getCarea() {
        return carea;
    }

    public void setCarea(String carea) {
        this.carea = carea == null ? null : carea.trim();
    }

    public String getCremark() {
        return cremark;
    }

    public void setCremark(String cremark) {
        this.cremark = cremark == null ? null : cremark.trim();
    }
}