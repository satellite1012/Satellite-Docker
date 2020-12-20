package main.java.Database.ChangeLogModel;
//Author: Doan Duc Tin

import java.io.Serializable;

public class ChangeLog implements Serializable {

    private static final long serialVersionUID = -6500665823330706018L;
    private int id;
    private String lTitle;
    private String lDescription;
    private String lDatecreated;

    public ChangeLog(int id, String lTitle, String lDescription, String lDatecreated) {
        this.id = id;
        this.lTitle = lTitle;
        this.lDescription = lDescription;
        this.lDatecreated = lDatecreated;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getlTitle() {
        return lTitle;
    }

    public void setlTitle(String lTitle) {
        this.lTitle = lTitle;
    }

    public String getlDescription() {
        return lDescription;
    }

    public void setlDescription(String lDescription) {
        this.lDescription = lDescription;
    }

    public String getlDatecreated() {
        return lDatecreated;
    }

    public void setlDatecreated(String lDatecreated) {
        this.lDatecreated = lDatecreated;
    }

}
