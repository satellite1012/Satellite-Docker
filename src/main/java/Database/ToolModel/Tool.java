package main.java.Database.ToolModel;
//Author: Doan Duc Tin

import java.io.Serializable;

public class Tool implements Serializable {

    private static final long serialVersionUID = -6500665823330706018L;
    private int id;
    private String tTitle;
    private String tDescription;
    private String tLink;
    private String tImage;
    private String tWarning;
    private String tDanger;
    private String tDateupdate;

    public Tool() {
    }

    public Tool(String tTitle, String tDescription, String tLink, String tImage, String tWarning, String tDanger) {
        this.tTitle = tTitle;
        this.tDescription = tDescription;
        this.tLink = tLink;
        this.tImage = tImage;
        this.tWarning = tWarning;
        this.tDanger = tDanger;
    }

    public Tool(int id, String tTitle, String tDescription, String tLink, String tImage, String tWarning, String tDanger, String tDateupdate) {
        this.id = id;
        this.tTitle = tTitle;
        this.tDescription = tDescription;
        this.tLink = tLink;
        this.tImage = tImage;
        this.tWarning = tWarning;
        this.tDanger = tDanger;
        this.tDateupdate = tDateupdate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String gettTitle() {
        return tTitle;
    }

    public void settTitle(String tTitle) {
        this.tTitle = tTitle;
    }

    public String gettDescription() {
        return tDescription;
    }

    public void settDescription(String tDescription) {
        this.tDescription = tDescription;
    }

    public String gettLink() {
        return tLink;
    }

    public void settLink(String tLink) {
        this.tLink = tLink;
    }

    public String gettImage() {
        return tImage;
    }

    public void settImage(String tImage) {
        this.tImage = tImage;
    }

    public String gettWarning() {
        return tWarning;
    }

    public void settWarning(String tWarning) {
        this.tWarning = tWarning;
    }

    public String gettDanger() {
        return tDanger;
    }

    public void settDanger(String tDanger) {
        this.tDanger = tDanger;
    }

    public String gettDateupdate() {
        return tDateupdate;
    }

    public void settDateupdate(String tDateupdate) {
        this.tDateupdate = tDateupdate;
    }
}
