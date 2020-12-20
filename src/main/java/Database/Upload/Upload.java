package main.java.Database.Upload;
//Author: Doan Duc Tin

import java.io.Serializable;

public class Upload implements Serializable {

    private static final long serialVersionUID = -6500665823330706018L;
    private int id;
    private String dHash;
    private String dName;
    private String dLink;
    private int dStoneget;
    private String dDatecreated;

    public Upload() {
    }

    public Upload(String dHash, String dName, String dLink, int dStoneget) {
        this.dHash = dHash;
        this.dName = dName;
        this.dLink = dLink;
        this.dStoneget = dStoneget;
    }

    public Upload(int id, String dHash, String dName, String dLink, int dStoneget, String dDatecreated) {
        this.id = id;
        this.dHash = dHash;
        this.dName = dName;
        this.dLink = dLink;
        this.dStoneget = dStoneget;
        this.dDatecreated = dDatecreated;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getdHash() {
        return dHash;
    }

    public void setdHash(String dHash) {
        this.dHash = dHash;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName;
    }

    public String getdLink() {
        return dLink;
    }

    public void setdLink(String dLink) {
        this.dLink = dLink;
    }

    public int getdStoneget() {
        return dStoneget;
    }

    public void setdStoneget(int dStoneget) {
        this.dStoneget = dStoneget;
    }

    public String getdDatecreated() {
        return dDatecreated;
    }

    public void setdDatecreated(String dDatecreated) {
        this.dDatecreated = dDatecreated;
    }

}
