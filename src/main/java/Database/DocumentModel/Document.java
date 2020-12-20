package main.java.Database.DocumentModel;
//Author: Doan Duc Tin

import java.io.Serializable;

public class Document implements Serializable {

    private static final long serialVersionUID = -6500665823330706018L;
    private int id;
    private String dTitle;
    private String dDescription;
    private String dLink;
    private String dCourse;
    private String dSubject;
    private String dImage;
    private String dDatecreated;
    private String dDateupdate;
    private int dStoneReq;
    private int dView;
    private String dCourseTitle;
    private String dCourseDescription;

    public Document() {
    }

    public Document(int id, String dTitle, String dDescription, String dLink, String dCourse, String dSubject, String dImage, String dDatecreated, String dDateupdate, int stoneReq, int view,String dCourseTitle, String dCourseDescription) {
        this.id = id;
        this.dTitle = dTitle;
        this.dDescription = dDescription;
        this.dLink = dLink;
        this.dCourse = dCourse;
        this.dSubject = dSubject;
        this.dImage = dImage;
        this.dDatecreated = dDatecreated.split(" ")[0];
        this.dDateupdate = dDateupdate.split(" ")[0];
        this.dStoneReq = stoneReq;
        this.dCourseTitle = dCourseTitle;
        this.dCourseDescription = dCourseDescription;
        this.dView=view;
    }

    public int getdView() {
        return dView;
    }

    public void setdView(int dView) {
        this.dView = dView;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getdTitle() {
        return dTitle;
    }

    public void setdTitle(String dTitle) {
        this.dTitle = dTitle;
    }

    public String getdDescription() {
        return dDescription;
    }

    public void setdDescription(String dDescription) {
        this.dDescription = dDescription;
    }

    public String getdLink() {
        return dLink;
    }

    public void setdLink(String dLink) {
        this.dLink = dLink;
    }

    public String getdCourse() {
        return dCourse;
    }

    public void setdCourse(String dCourse) {
        this.dCourse = dCourse;
    }

    public String getdSubject() {
        return dSubject;
    }

    public void setdSubject(String dSubject) {
        this.dSubject = dSubject;
    }

    public String getdImage() {
        return dImage;
    }

    public void setdImage(String dImage) {
        this.dImage = dImage;
    }

    public String getdDatecreated() {
        return dDatecreated;
    }

    public void setdDatecreated(String dDatecreated) {
        this.dDatecreated = dDatecreated;
    }

    public String getdDateupdate() {
        return dDateupdate;
    }

    public void setdDateupdate(String dDateupdate) {
        this.dDateupdate = dDateupdate;
    }

    public int getdStoneReq() {
        return dStoneReq;
    }

    public void setdStoneReq(int stoneReq) {
        this.dStoneReq = stoneReq;
    }

    public String getdCourseTitle() {
        return dCourseTitle;
    }

    public void setdCourseTitle(String dCourseTitle) {
        this.dCourseTitle = dCourseTitle;
    }

    public String getdCourseDescription() {
        return dCourseDescription;
    }

    public void setdCourseDescription(String dCourseDescription) {
        this.dCourseDescription = dCourseDescription;
    }
}
