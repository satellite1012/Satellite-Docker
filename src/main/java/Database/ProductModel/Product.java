package main.java.Database.ProductModel;

import java.io.Serializable;

public class Product implements Serializable {

    private static final long serialVersionUID = -6500665823330706018L;
    private int id;
    private String pName;
    private String pType;
    private String pImage;
    private String pDetails;
    private String pLink;
    private String pDatecreated;
    private String pDateupdate;
    private String pVersion;

    //Build-in
    private String pLink_ANDROID=null;
    private String pLink_PC=null;
    private String pLink_IOS=null;
    private String pLink_LINUX=null;
    private String pLink_MT5=null;
    private String pLink_SOURCE=null;
    private String pLink_WEB=null;

    private void praseProductLink(String s) {
        String[] temp1 = s.split("\\|");
        for (int i = 0; i < temp1.length; i++) {
            String[] temp2 = temp1[i].split(" : ");
            switch (temp2[0]) {
                case "ANDROID":
                    pLink_ANDROID = temp2[1];
                    break;
                case "PC":
                    pLink_PC = temp2[1];
                    break;
                case "IOS":
                    pLink_IOS = temp2[1];
                    break;
                case "LINUX":
                    pLink_LINUX = temp2[1];
                    break;
                case "MT5":
                    pLink_MT5 = temp2[1];
                    break;
                case "SOURCE":
                    pLink_SOURCE = temp2[1];
                    break;
                case "WEB":
                    pLink_WEB = temp2[1];
                    break;
            }
        }
    }

    public Product() {
    }

    public Product(String pName, String pType, String pImage, String pDetails, String pLink, String pVersion) {
        this.pName = pName;
        this.pType = pType;
        this.pImage = pImage;
        this.pDetails = pDetails;
        this.pLink = pLink;
        this.pVersion = pVersion;

        praseProductLink(pLink);
    }

    public Product(int id, String pName, String pType, String pImage, String pDetails, String pLink, String pDatecreated, String pDateupdate, String pVersion) {
        this.id = id;
        this.pName = pName;
        this.pType = pType;
        this.pImage = pImage;
        this.pDetails = pDetails;
        this.pLink = pLink;
        this.pDatecreated = pDatecreated;
        this.pDateupdate = pDateupdate;
        this.pVersion = pVersion;

        praseProductLink(pLink);
    }

    public String getpLink_WEB() {
        return pLink_WEB;
    }

    public void setpLink_WEB(String pLink_WEB) {
        this.pLink_WEB = pLink_WEB;
    }

    public String getpLink_ANDROID() {
        return pLink_ANDROID;
    }

    public void setpLink_ANDROID(String pLink_ANDROID) {
        this.pLink_ANDROID = pLink_ANDROID;
    }

    public String getpLink_PC() {
        return pLink_PC;
    }

    public void setpLink_PC(String pLink_PC) {
        this.pLink_PC = pLink_PC;
    }

    public String getpLink_IOS() {
        return pLink_IOS;
    }

    public void setpLink_IOS(String pLink_IOS) {
        this.pLink_IOS = pLink_IOS;
    }

    public String getpLink_LINUX() {
        return pLink_LINUX;
    }

    public void setpLink_LINUX(String pLink_LINUX) {
        this.pLink_LINUX = pLink_LINUX;
    }

    public String getpLink_MT5() {
        return pLink_MT5;
    }

    public void setpLink_MT5(String pLink_MT5) {
        this.pLink_MT5 = pLink_MT5;
    }

    public String getpLink_SOURCE() {
        return pLink_SOURCE;
    }

    public void setpLink_SOURCE(String pLink_SOURCE) {
        this.pLink_SOURCE = pLink_SOURCE;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpType() {
        return pType;
    }

    public void setpType(String pType) {
        this.pType = pType;
    }

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
    }

    public String getpDetails() {
        return pDetails;
    }

    public void setpDetails(String pDetails) {
        this.pDetails = pDetails;
    }

    public String getpLink() {
        return pLink;
    }

    public void setpLink(String pLink) {
        this.pLink = pLink;
    }

    public String getpDatecreated() {
        return pDatecreated;
    }

    public void setpDatecreated(String pDatecreated) {
        this.pDatecreated = pDatecreated;
    }

    public String getpDateupdate() {
        return pDateupdate;
    }

    public void setpDateupdate(String pDateupdate) {
        this.pDateupdate = pDateupdate;
    }

    public String getpVersion() {
        return pVersion;
    }

    public void setpVersion(String pVersion) {
        this.pVersion = pVersion;
    }
}
